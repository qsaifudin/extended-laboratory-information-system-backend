const db = require("../models")
const Provinsi = db.provinsi
const Kota = db.kota
const Kecamatan = db.kecamatan

module.exports = {
    getAllProvinsi: (req, res) => {
        Provinsi.findAll()
            .then(provinsi => {
                res.successGet('Provinsi', provinsi)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    getAllKota: (req, res) => {
        Kota.findAll()
            .then(kota => {
                res.successGet('Kota', kota)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    getKotaByProvinsi: (req, res) => {
        const {
            id
        } = req.params
        Kota.findAll({
                where: {
                    provinsi_id: id
                }
            })
            .then(kota => {
                res.successGet('Kota', kota)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    getAllKecamatan: (req, res) => {
        Kecamatan.findAll()
            .then(kecamatan => {
                res.successGet('Kecamatan', kecamatan)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    getKecamatanByKota: (req, res) => {
        Kecamatan.findAll({
                where: {
                    kota_id: req.params.id
                }
            })
            .then(kecamatan => {
                res.successGet('Kecamatan', kecamatan)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },
}