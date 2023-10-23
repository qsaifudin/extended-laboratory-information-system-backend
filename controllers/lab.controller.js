const db = require('../models')
const Lab = db.lab
const Op = require('sequelize').Op

module.exports = {
    onSearchPaginated: async (req, res) => {
        let {nama} = req.query
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
                message: 'Lab ditemukan',
                currentPage: page,
                totalPages,
                total,
                data
            }
        }

        await Lab.findAndCountAll({
                where: condition,
                limit,
                offset,
                include: [{
                    model: db.rumahsakit,
                    as: 'rumah_sakit',
                    attributes: ['nama']
                }],
                order: [
                    [sortBy, sortDesc]
                ],
            })
            .then(data => {
                if (data) {
                    res.json(getPagingData(data, page, limit))
                } else res.notFound('Lab')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    getAll: async (req, res) => {
        await Lab.findAll({
                include: [{
                    model: db.rumahsakit,
                    as: 'rumah_sakit',
                    attributes: ['nama']
                }],
                order: [
                    ['id', 'DESC']
                ]
            })
            .then(data => {
                if (data) {
                    res.successGet('Lab', data)
                } else res.notFound('Lab')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    find: async (req, res) => {
        await Lab.findByPk(req.params.id, {
                include: [{
                    model: db.rumahsakit,
                    as: 'rumah_sakit',
                    attributes: ['nama']
                }]
            })
            .then(data => {
                if (data) {
                    res.successGet('Lab', data)
                } else res.notFound('Lab')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    store: async (req, res) => {
        await Lab.findOne({
                where: {
                    kode: {
                        [Op.iLike]: req.body.kode
                    }
                }
            })
            .then(data => {
                if (!data) {
                    Lab.findOne({
                            where: {
                                nama: {
                                    [Op.iLike]: req.body.nama
                                }
                            }
                        })
                        .then(result => {
                            if (!result) {
                                Lab.create(req.body)
                                    .then(() => {
                                        res.successStore('Lab', req.body)
                                    })
                                    .catch(error => {
                                        res.errorPost400(error.errors[0].message)
                                    })
                            } else res.errorExist400('Nama Lab')
                        })
                        .catch(error => {
                            res.error500(error.message)
                        })
                } else res.errorExist400('Kode Lab')
            })
            .catch(error => {
                res.error500(error.message)
            })
    },

    update: async (req, res) => {
        const {
            id
        } = req.params

        await Lab.findOne({
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
                    Lab.findOne({
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
                                Lab.update(req.body, {
                                        where: {
                                            id
                                        }
                                    })
                                    .then(() => {
                                        res.successUpdate('Lab', req.body)
                                    })
                                    .catch(error => {
                                        res.errorPost400(error.errors[0].message)
                                    })
                            } else res.errorExist400('Nama Lab')
                        })
                        .catch(error => {
                            res.error500(error.message)
                        })
                } else res.errorExist400('Kode Lab')
            })
            .catch(error => {
                res.error500(error.message)
            })
    }
}