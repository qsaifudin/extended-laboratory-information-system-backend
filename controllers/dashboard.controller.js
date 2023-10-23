const db = require("../models")
const {
    transaksiPasien: Pasien,
    rumahsakit: Rumahsakit,
    vendor: Vendor,
} = db
const Sequelize = require('sequelize')
const {
    provinsi
} = require("../models")
const Op = Sequelize.Op

function dataPasienPerChart(data, filterName) {
    return occurences = data.reduce((total, row) => {
        let filter = `row.${filterName}`
        total[eval(filter)] = ++total[eval(filter)] || 1
        return total
    }, {})
}

function convertChartFormat(data) {
    return Object.keys(data).map(key => {
        return {
            x: key,
            y: data[key]
        }
    })
}

function setProperDate(req) {
    let dates = req.query.dates.split(",")
    dates[1] = dates[1] ? dates[1] : dates[0]
    dates.sort()
    const startDate2 = dates[0].split(/[- ]+/)
    const endDate = dates[1].split(/[- ]+/)

    dates[0] = new Date(startDate2[0], parseInt(startDate2[1]) - 1)
    dates[1] = new Date(endDate[0], parseInt(endDate[1]), 1, '', '', -1)
    return dates
}

function getLastDate(req) {
    let dates = req.query.dates.split(",")
    dates[1] = dates[1] ? dates[1] : dates[0]
    dates.sort()
    const startDate = dates[0].split(/[- ]+/)
    const endDate = dates[0].split(/[- ]+/)

    dates[0] = new Date(startDate[0], parseInt(startDate[1]) - 2)
    dates[1] = new Date(endDate[0], parseInt(endDate[1]) - 1)
    return dates
}

function getPasien(kode_rs, dates, provinsi, kota, kecamatan) {
    let orderBy = kecamatan == '' ? 'kecamatan' : 'id'
    orderBy = kota == '' ? 'kota' : orderBy
    orderBy = provinsi == '' ? 'provinsi' : orderBy

    return new Promise((resolve, reject) => {
        Pasien.findAll({
                where: {
                    'kode_rs': kode_rs == 'all' ? {
                        [Op.ne]: null
                    } : {
                        [Op.like]: {
                            [Op.any]: kode_rs
                        }
                    },
                    'waktu_terbit': {
                        [Op.between]: dates
                    },
                    'provinsi': provinsi || {
                        [Op.ne]: null
                    },
                    'kota': kota || {
                        [Op.ne]: null
                    },
                    'kecamatan': kecamatan || {
                        [Op.ne]: null
                    }
                },
                include: [{
                    model: db.transaksiPemeriksaan,
                    as: 'pemeriksaan',
                    on: {
                        registrasi_id: Sequelize.where(Sequelize.col("t_pasien.registrasi_id"), "=", Sequelize.col("pemeriksaan.registrasi_id")),
                        kode_rs: Sequelize.where(Sequelize.col("t_pasien.kode_rs"), "=", Sequelize.col("pemeriksaan.kode_rs")),
                        kode_lab: Sequelize.where(Sequelize.col("t_pasien.kode_lab"), "=", Sequelize.col("pemeriksaan.kode_lab")),
                    },
                    attributes: ['id', 'nama', 'kode_rs'],
                }],
                order: [
                    [`${orderBy}`, "ASC"]
                ]
            })
            .then(data => {
                resolve(data)
            })
            .catch(err => {
                reject(err)
            })
    })
}

function getPersentase(totalNow, totalLastMonth) {
    let persentase = Number((((totalNow - totalLastMonth) / totalLastMonth) * 100).toFixed(1))
    persentase = persentase != 'Infinity' ? persentase : 100
    persentase = totalNow == 0 && totalLastMonth == 0 ? 0 : persentase
    return persentase
}

module.exports = {
    setProperDate,
    getAll: async (req, res) => {
        let kode_rs = [req.query.kode_rs]
        let {
            provinsi,
            kota,
            kecamatan
        } = req.query

        const dates = setProperDate(req)

        let theDate = req.query.dates.split(",")
        theDate.sort()
        const cekEndDate = theDate[1]
        theDate[1] = theDate[1] ? theDate[1] : theDate[0]
        const startYear = theDate[0].substr(0, 4)
        endYear = theDate[1] != undefined ? theDate[1].substr(0, 4) : null
        const sameYear = startYear == endYear

        // Get all kode rs yang dinaungi vendor (saat login)
        if (req.user.role == 'vendor' && kode_rs == 'all') {
            await Rumahsakit.findAll({
                    where: {
                        vendor_id: req.user.vendor_id
                    }
                })
                .then(data => {
                    return kode_rs = Object.keys(data).map(key => {
                        return data[key].kode
                    })
                })
        }

        // Get nama vendor saat pilih RS tertentu
        let selectedVendor = '-'
        if (req.query.kode_rs !== 'all') {
            await Rumahsakit.findOne({
                where: {
                    kode: req.query.kode_rs
                }
            }).then(async res => {
                await Vendor.findByPk(res['vendor_id']).then(res => {
                    selectedVendor = res.nama
                })
            })
        }

        const startTime = new Date(dates[0]).toISOString()
        const endTime = new Date(dates[1]).toISOString()
        if (kode_rs == 'all') {
            if (cekEndDate != undefined) {
                if (sameYear == true) {
                    if (provinsi == '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' GROUP BY to_char(waktu_terbit, 'Month') ORDER BY to_date(to_char(waktu_terbit, 'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' GROUP BY to_char(waktu_terbit, 'Month') ORDER BY to_date(to_char(waktu_terbit, 'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota != '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' GROUP BY to_char(waktu_terbit, 'Month') ORDER BY to_date(to_char(waktu_terbit, 'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' AND kecamatan = '${kecamatan}' GROUP BY to_char(waktu_terbit, 'Month') ORDER BY to_date(to_char(waktu_terbit, 'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    }
                } else {
                    if (provinsi == '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota != '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' kecamatan = '${kecamatan}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    }
                }
            } else {
                if (provinsi == '' && kota == '' && kecamatan == '') {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                } else if (provinsi != '' && kota == '' && kecamatan == '') {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                } else if (provinsi != '' && kota != '' && kecamatan == '') {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                } else {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' AND kecamatan = '${kecamatan}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                }
            }
        } else {
            const eachKode = kode_rs.map(kode_rs => "'" + kode_rs + "'").join()
            if (cekEndDate != undefined) {
                if (sameYear == true) {
                    if (provinsi == '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit,'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' GROUP BY to_char(waktu_terbit ,'Month') ORDER BY to_date(to_char(waktu_terbit ,'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit,'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' GROUP BY to_char(waktu_terbit ,'Month') ORDER BY to_date(to_char(waktu_terbit ,'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota != '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit,'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' kota = '${kota}' GROUP BY to_char(waktu_terbit ,'Month') ORDER BY to_date(to_char(waktu_terbit ,'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit,'Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' kota = '${kota}' kecamatan = '${kecamatan}' GROUP BY to_char(waktu_terbit ,'Month') ORDER BY to_date(to_char(waktu_terbit ,'Month'), 'Month') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    }
                } else {
                    if (provinsi == '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota == '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else if (provinsi != '' && kota != '' && kecamatan == '') {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' kota = '${kota}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    } else {
                        await db.sequelize.query(
                                `SELECT trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' kota = '${kota}' kecamatan = '${kecamatan}' GROUP BY trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY') ORDER BY to_date(trim(to_char(waktu_terbit, 'Month '))||to_char(waktu_terbit, ' YYYY'), 'Month YYYY') ASC;`
                            )
                            .then(data => {
                                totalPasienPerPeriode = data[0]
                            })
                    }
                }
            } else {
                if (provinsi == '' && kota == '' && kecamatan == '') {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                } else if (provinsi != '' && kota == '' && kecamatan == '') {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                } else if (provinsi != '' && kota != '' && kecamatan == '') {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                } else {
                    await db.sequelize.query(
                            `SELECT to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) AS x, COUNT(*) AS y FROM t_pasien WHERE kode_rs LIKE ANY (ARRAY[${eachKode}]) AND waktu_terbit BETWEEN '${startTime}' AND '${endTime}' AND provinsi = '${provinsi}' AND kota = '${kota}' AND kecamatan = '${kecamatan}' GROUP BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ORDER BY to_char(waktu_terbit, 'DD ')||trim(to_char(waktu_terbit, ' Month')) ASC;`
                        )
                        .then(data => {
                            totalPasienPerPeriode = data[0]
                        })
                }
            }
        }

        // Calculate last month Data, untuk persentase
        const lastDate = getLastDate(req)
        let lastMonthTotalPasien,
            lastMonthTotalPemeriksaan = 0,
            lastMonthTotalPria,
            lastMonthTotalWanita
        await getPasien(kode_rs, lastDate, provinsi, kota, kecamatan)
            .then(data => {
                data.forEach(v => {
                    lastMonthTotalPemeriksaan += v.pemeriksaan.length
                })
                lastMonthTotalPria = dataPasienPerChart(data, 'gender')['Laki-laki'] || 0
                lastMonthTotalWanita = dataPasienPerChart(data, 'gender')['Perempuan'] || 0
                return (
                    lastMonthTotalPasien = data.length,
                    lastMonthTotalPemeriksaan,
                    lastMonthTotalPria = dataPasienPerChart(data, 'gender')['Laki-laki'] || 0,
                    lastMonthTotalWanita = dataPasienPerChart(data, 'gender')['Perempuan'] || 0
                )
            })

        // Calculate All Data to respone
        getPasien(kode_rs, dates, provinsi, kota, kecamatan)
            .then(data => {

                // Total Pasien
                const totalPasien = data.length

                // Total Pemeriksaan & Pemeriksaan per nama
                let totalPemeriksaan = 0
                let dataPemeriksaan = []
                data.forEach(v => {
                    totalPemeriksaan += v.pemeriksaan.length
                    v.pemeriksaan.forEach(v => {
                        dataPemeriksaan.push(v)
                    })
                });
                let totalPemeriksaanPerNama = convertChartFormat(dataPasienPerChart(dataPemeriksaan, 'nama'))
                totalPemeriksaanPerNama.sort(function (a, b) {
                    return b.y - a.y;
                })

                // Total pasien per Gender
                let totalPasienPerGender = dataPasienPerChart(data, 'gender')

                // Total pasien per Wilayah
                tipeDemografi = 'provinsi'
                if (provinsi != '') {
                    tipeDemografi = 'kota'
                }
                if (kota != '') {
                    tipeDemografi = 'kecamatan'
                }
                let totalPasienPerWilayah = convertChartFormat(dataPasienPerChart(data, tipeDemografi))
                totalPasienPerWilayah.sort((a, b) => {
                    return (a.x < b.x ? -1 : (a.x > b.x ? 1 : 0))
                })

                // Total pasien per Diagnosa
                let totalPasienPerDiagnosa = convertChartFormat(dataPasienPerChart(data, 'diagnosa_awal'))
                totalPasienPerDiagnosa.sort((a, b) => {
                    // return (a.x < b.x ? -1 : (a.x > b.x ? 1 : 0))
                    return b.y - a.y;
                })

                // Calculate all Persentase
                let TotalPria = dataPasienPerChart(data, 'gender')['Laki-laki'] || 0,
                    TotalWanita = dataPasienPerChart(data, 'gender')['Perempuan'] || 0
                let persentasePasien,
                    persentasePemeriksaan,
                    persentasePria,
                    persentaseWanita
                if (req.query.dates.split(",")[1] == undefined) {
                    persentasePasien = getPersentase(totalPasien, lastMonthTotalPasien)
                    persentasePemeriksaan = getPersentase(totalPemeriksaan, lastMonthTotalPemeriksaan)
                    persentasePria = getPersentase(TotalPria, lastMonthTotalPria)
                    persentaseWanita = getPersentase(TotalWanita, lastMonthTotalWanita)

                } else {
                    persentasePasien = '-'
                    persentasePemeriksaan = '-'
                    persentasePria = '-'
                    persentaseWanita = '-'
                }

                res.successGet('Jumlah Pasien & Pemeriksaan', {
                    selectedVendor: selectedVendor,
                    totalPasien,
                    totalPemeriksaan,
                    totalPasienPerGender,
                    totalPasienPerWilayah,
                    totalPasienPerPeriode,
                    totalPemeriksaanPerNama,
                    totalPasienPerDiagnosa,
                    persentasePasien,
                    persentasePemeriksaan,
                    persentasePria,
                    persentaseWanita,
                })

            })
            .catch(err => {
                res.error500(err.message)
            })
    },
}