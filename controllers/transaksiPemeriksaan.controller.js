const db = require('../models')
const Pemeriksaan = db.transaksiPemeriksaan
const Sequelize = require('sequelize')
const Op = Sequelize.Op

module.exports = {
    onSearchPaginated: async (req, res) => {
        const {nama} = req.query
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
            const {count: total, rows: data} = results
            const totalPages = Math.ceil(total / limit)

            return {
                status: true,
                statusCode: 200,
                message: 'Transaksi Pemeriksaan ditemukan',
                currentPage: page,
                totalPages,
                total,
                data 
            }
        }

        await Pemeriksaan.findAndCountAll({ 
            where: condition, limit, offset, distinct: true, 
            order: [
                ['id', 'DESC']
            ]
        })
        .then(data => {
            if (data) {
                res.json(getPagingData(data, page, limit))
            } else notFound('Pemeriksaan')
        })
        .catch(error => {
            res.error500(error.message)
        })
    },
    
    getAll: async (req, res) => {
        await Pemeriksaan.findAll({
            order: [
                ['id', 'DESC']
            ]
        })
        .then(data => {
            if (data) {
                res.successGet('Pemeriksaan', data)
            } else notFound('Pemeriksaan')
        })
        .catch(error => {
            res.error500(error.message)
        })
    },

    find: async (req, res) => {
        await Pemeriksaan.findByPk(req.params.id, {

        })
        .then((data) => {
            if (data) {
                res.successGet('Pemeriksaan', data)
            }
            else res.notFound('Pemeriksaan')
        })
        .catch(error => {
            res.error500(error.message)
        })
    },

    store: async (req, res) => {
        await Pemeriksaan.create(req.body)
        .then(() => {
            res.successStore('Pemeriksaan', req.body)
        })
        .catch(error => {
            res.errorPost400(error.errors[0].message)
        })
    },

    update: async (req, res) => {
        await Pemeriksaan.update(req.body, {
            where: {
                id: req.params.id
            }
        })
        .then(() => {
            res.successUpdate('Pemeriksaan', req.body)
        })
        .catch(error => {
            res.errorPost400(error.errors[0].message)
        })
    }
}