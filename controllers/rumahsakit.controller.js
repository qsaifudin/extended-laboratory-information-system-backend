const db = require('../models')
const Rumahsakit = db.rumahsakit
const Op = require('sequelize').Op

module.exports = {
    onSearchPaginated: async (req, res) => {
        let {
            nama
        } = req.query
        sortBy = req.query.sortBy || 'id'
        sortDesc = req.query.sortDesc == 'true' ? 'DESC' : 'ASC'

        const page = parseInt(req.query.page) || 1
        let limit = parseInt(req.query.limit) || 10
        limit = limit == -1 ? null : limit

        const offset = (page - 1) * limit

        let condition = nama ? {
            nama: {
                [Op.iLike]: `%${nama}%`
            }
        } : null

        const getPagingData = (results, page, limit) => {
            const {
                count: total,
                rows: data
            } = results
            const totalPages = Math.ceil(total / limit)

            return {
                status: true,
                statusCode: 200,
                message: 'Rumah Sakit ditemukan',
                currentPage: page,
                totalPages,
                total,
                data
            }
        }

        await Rumahsakit.findAndCountAll({
                where: condition,
                limit,
                offset,
                distinct: true,
                include: [{
                    model: db.kota,
                    as: 'kota',
                    attributes: ['nama']
                }],
                order: [
                    [sortBy, sortDesc]
                ]
            })
            .then(data => {
                if (data) {
                    res.json(getPagingData(data, page, limit))
                } else notFound('Rumah Sakit')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    getAll: async (req, res) => {
        vendorId = req.query.vendorId ? req.query.vendorId : {
            [Op.ne]: null
        }
        await Rumahsakit.findAll({
                where: {
                    vendor_id: vendorId
                },
                order: [
                    ['id', 'DESC']
                ]
            })
            .then(data => {
                if (data) {
                    res.successGet('Rumah Sakit', data)
                    } else res.notFound('Rumah Sakit')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    find: async (req, res) => {
        await Rumahsakit.findByPk(req.params.id, {
                include: [{
                        model: db.provinsi,
                        as: 'provinsi'
                    },
                    {
                        model: db.kota,
                        as: 'kota'
                    },
                    {
                        model: db.kecamatan,
                        as: 'kecamatan'
                    },
                    {
                        model: db.kategoriRs,
                        as: 'kategori_rs'
                    },
                    {
                        model: db.vendor,
                        as: 'vendor'
                    },
                    {
                        model: db.lab,
                        as: 'lab'
                    }
                ]
            })
            .then(data => {
                if (data) {
                    res.successGet('Rumah Sakit', data)
                } else res.notFound('Rumah Sakit')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    store: async (req, res) => {
        const {
            nama,
            kode
        } = req.body
        await Rumahsakit.findOne({
                where: {
                    kode: {
                        [Op.iLike]: req.body.kode
                    }
                }
            })
            .then(data => {
                if (!data) {
                    Rumahsakit.findOne({
                            where: {
                                nama: {
                                    [Op.iLike]: req.body.nama
                                }
                            }
                        })
                        .then(result => {
                            if (!result) {
                                Rumahsakit.create(req.body)
                                    .then(() => {
                                        res.successStore('Rumah Sakit', req.body)
                                    })
                                    .catch(error => {
                                        res.errorPost400(error.errors[0].message)
                                    })
                            } else res.errorExist400('Nama Rumah Sakit')
                        })
                        .catch(error => {
                            res.error500(error.message)
                        })
                } else res.errorExist400('Kode Rumah Sakit')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    update: async (req, res) => {
        const {
            id
        } = req.params

        await Rumahsakit.findOne({
                where: {
                    kode: {
                        [Op.iLike]: req.body.kode
                    },
                    id: {
                        [Op.ne]: id
                    }
                }
            })
            .then(result => {
                if (!result) {
                    Rumahsakit.findOne({
                            where: {
                                nama: {
                                    [Op.iLike]: req.body.nama
                                },
                                id: {
                                    [Op.ne]: id
                                }
                            }
                        })
                        .then(result => {
                            if (!result) {
                                Rumahsakit.update(req.body, {
                                        where: {
                                            id
                                        }
                                    })
                                    .then(() => {
                                        res.successUpdate('Rumah Sakit', req.body)
                                    })
                                    .catch(error => {
                                        res.errorPost400(error.errors[0].message)
                                    })
                            } else res.errorExist400('Nama Rumah Sakit')
                        })
                        .catch(error => {
                            res.error500(error.message)
                        })
                } else res.errorExist400('Kode Rumah Sakit')
            })
            .catch(error => {
                res.error500(error.message)
            })
    }
}