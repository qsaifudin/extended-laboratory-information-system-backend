const db = require("../models")
const {
    user: User,
    role: Role,
    vendor: Vendor
} = db;
const bcrypt = require("bcryptjs");
const Op = require('sequelize').Op

const tableName = 'User'
module.exports = {
    getAll: async (req, res) => {
        await User.findAll({
                order: [
                    ['id', 'DESC'],
                ],
                include: [{
                    model: Role,
                }, {
                    model: Vendor,
                    attributes: [
                        'id', 'nama',
                    ],
                }]
            })
            .then(data => {
                data = data.map(function (item) {
                    delete item.dataValues.password
                    return item;
                });
                res.successGet(tableName, data)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    onSearchPaginated: async (req, res) => {
        const page = parseInt(req.query.page) || 1
        const limit = parseInt(req.query.limit) || 10
        let {
            nama,
            sortBy
        } = req.query
        let sortDesc = req.query.sortDesc == 'true' ? 'DESC' : 'ASC'

        const size = limit
        const offset = (page - 1) * limit

        let condition = nama ? {
            nama: {
                [Op.iLike]: `%${nama}%`
            }
        } : null

        const getPagingData = (data, page, size) => {
            const {
                count: total,
                rows: user
            } = data
            const currentPage = parseInt(page)
            const totalPages = Math.ceil(total / size)

            return {
                status: true,
                statusCode: 200,
                message: 'Data User ditemukan',
                currentPage,
                totalPages,
                total,
                data: user
            }
        }

        await User.findAndCountAll({
                where: condition,
                limit,
                offset,
                order: [
                    [sortBy, sortDesc]
                ],
                include: [{
                    model: Role,
                }, {
                    model: Vendor,
                    attributes: [
                        'id', 'nama',
                    ],
                }]
            })
            .then(data => {
                const results = getPagingData(data, page, size)

                results.data.map(function (item) {
                    delete item.dataValues.password
                    return item;
                });

                res.json(results)

            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    getRole: async (req, res) => {
        await Role.findAll()
            .then(data => {
                res.successGet('Role', data)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    find: async (req, res) => {
        await User.findByPk(req.params.id, {
                include: [{
                    model: Role,
                }]
            })
            .then((data) => {
                if (data) {
                    delete data.dataValues.password
                    res.successGet(tableName, data)
                } else res.notFound(tableName)

            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    store: async (req, res) => {
        let {
            password,
            username
        } = req.body
        req.body.password = bcrypt.hashSync(password, 8)
        await User.findOne({
                where: {
                    username: {
                        [Op.iLike]: req.body.username
                    }
                }
            }).then(data => {
                if (!data) {
                    User.create(req.body)
                        .then(data => {
                            delete data.dataValues.password
                            res.successStore(tableName, data)
                        })
                        .catch(err => {
                            res.errorPost400(err.errors[0].message)
                        })
                } else res.errorExist400('Username')
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    update: async (req, res) => {
        let {
            password
        } = req.body
        if (password) {
            req.body.password = bcrypt.hashSync(password, 8)
        }

        await User.findOne({
                where: {
                    username: {
                        [Op.iLike]: req.body.username
                    },
                    id: {
                        [Op.ne]: req.params.id
                    }
                }
            })
            .then(result => {
                if (!result) {
                    User.update(req.body, {
                            where: {
                                id: req.params.id
                            }
                        })
                        .then(data => {
                            if (data == 1) {
                                res.successUpdate(tableName, req.body)
                            } else res.notFound(tableName)
                        })
                        .catch(err => {
                            res.errorPost400(err.errors[0].message)
                        })
                } else res.errorExist400('Username')
            })
            .catch(error => {
                res.error500(error.message)
            })
    }

}