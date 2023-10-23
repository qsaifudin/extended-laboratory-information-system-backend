const db = require("../models")
const Vendor = db.vendor
const Op = require('sequelize').Op

module.exports = {

    onSearchPaginated: async (req, res) => {
        let {
            nama,
            sortBy
        } = req.query
        let sortDesc = req.query.sortDesc == 'true' ? 'DESC' : 'ASC'

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
                message: 'Vendor ditemukan',
                currentPage: page,
                totalPages,
                total,
                data
            }
        }

        await Vendor.findAndCountAll({
                where: condition,
                limit,
                offset,
                distinct: true,
                order: [
                    [sortBy, sortDesc]
                ],
                include: [{
                        model: db.provinsi,
                        as: 'provinsi'
                    },
                    {
                        model: db.kota,
                        as: 'kota'
                    }
                ]
            })
            .then(data => {
                if (data) {
                    res.status(200).json(getPagingData(data, page, limit))
                } else notFound('Vendor')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    getAll: async (req, res) => {
        await Vendor.findAll({
                order: [
                    ['id', 'DESC']
                ]
            })
            .then(data => {
                if (data) {
                    res.successGet('Vendor', data)
                } else notFound('Vendor')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    find: async (req, res) => {
        await Vendor.findByPk(req.params.id, {
                include: [{
                        model: db.provinsi,
                        as: 'provinsi'
                    },
                    {
                        model: db.kota,
                        as: 'kota'
                    }
                ]
            })
            .then(data => {
                if (data) {
                    res.successGet('Vendor', data)
                } else res.notFound('Vendor')

            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    store: async (req, res) => {
        await Vendor.findOne({
                where: {
                    nama: {
                        [Op.iLike]: req.body.nama
                    }
                }
            })
            .then(data => {
                if (!data) {
                    Vendor.create(req.body)
                        .then(() => {
                            res.successStore('Vendor', req.body)
                        })
                        .catch(error => {
                            res.errorPost400(error.errors[0].message)
                        })
                } else res.errorExist400('Nama Vendor')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    update: async (req, res) => {
        await Vendor.findOne({
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
                    Vendor.update(req.body, {
                            where: {
                                id: req.params.id
                            }
                        })
                        .then(() => {
                            res.successUpdate('Vendor', req.body)
                        })
                        .catch(error => {
                            res.errorPost400(error.errors[0].message)
                        })
                } else res.errorExist400('Nama Vendor')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },
}