const db = require("../models")
const KategoriRs = db.kategoriRs
const Op = require('sequelize').Op
const tableName = 'Kategori RS'

module.exports = {
    getAll: async (req, res) => {
        await KategoriRs.findAll({
                order: [
                    ['id', 'DESC'],
                ]
            })
            .then(data => {
                res.json({
                    status: true,
                    statusCode: 200,
                    message: 'Data Kategori RS ditemukan',
                    total: data.length,
                    data
                })
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    find: async (req, res) => {
        await KategoriRs.findByPk(req.params.id, {
                // Get data rs yang berelasi
                include: [{
                    model: db.rumahsakit,
                    as: 'rumah_sakit'
                }]
            })
            .then(data => {
                if (data) {
                    res.successGet(tableName, data)
                } else res.notFound(tableName)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    store: async (req, res) => {
        await KategoriRs.findOne({
                where: {
                    nama: {
                        [Op.iLike]: req.body.nama
                    }
                }
            })
            .then(data => {
                if (!data) {
                    KategoriRs.create(req.body)
                        .then(data => {
                            res.successStore(tableName, data)
                        })
                        .catch(err => {
                            res.errorPost400(err.errors[0].message)
                        })
                } else res.errorExist400(tableName)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    update: async (req, res) => {
        await KategoriRs.findOne({
                where: {
                    nama: {
                        [Op.iLike]: req.body.nama
                    },
                    id: {
                        [Op.ne]: req.params.id
                    }
                }
            })
            .then(result => {
                if (!result) {
                    KategoriRs.update(req.body, {
                            where: {
                                id: req.params.id
                            }
                        })
                        .then((data) => {
                            if (data == 1) {
                                res.successUpdate(tableName, req.body)
                            } else res.notFound(tableName)
                        })
                        .catch(err => {
                            res.errorPost400(err.errors[0].message)
                        });
                } else res.errorExist400(tableName)
            })
            .catch(error => {
                res.error500(error.message)
            })
    }
}