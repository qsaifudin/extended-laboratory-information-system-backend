const db = require("../models")
const config = require("../config/auth.config")
const {
    user: User,
    role: Role,
    refreshToken: RefreshToken
} = db;
const tableName = 'User'
const jwt = require('jsonwebtoken');
const bcrypt = require("bcryptjs");
const Op = require('sequelize').Op

module.exports = {
    login: async (req, res) => {
        const {
            username,
            password
        } = req.body

        if (!username || !password) {
            return res.error400("Password atau Username Kosong")
        }

        User.findOne({
                where: {
                    username: {
                        [Op.iLike]: username
                    }
                },
                include: [{
                    model: Role,
                }],
            })
            .then(async (data) => {
                if (!data) {
                    return res.notFound(tableName)
                }

                const passwordIsValid = bcrypt.compareSync(
                    password,
                    data.password
                );

                if (!passwordIsValid) {
                    return res.error400("Password salah")
                }

                // Create Access token
                const getIp = req.connection.remoteAddress
                data.dataValues.accessToken = jwt.sign({
                    id: data.id,
                    role: data.role.nama,
                    vendor_id: data.vendor_id,
                    ip: getIp
                }, config.jwtAccessSecret, {
                    expiresIn: config.jwtAccessExpiration
                })

                // Create Refresh token, digunakan untuk mendapatkan access token baru
                const getRefreshToken = jwt.sign({
                    id: data.id,
                    role: data.role.nama,
                    vendor_id: data.vendor_id,
                    ip: getIp
                }, config.jwtRefreshSecret, {
                    expiresIn: config.jwtRefreshExpiration
                })

                // Simpan Refresh token ke database
                data.dataValues.refreshToken = await RefreshToken.createToken(data, getRefreshToken);

                delete data.dataValues.password

                return res.success('Berhasil Login', data)
            })
            .catch(err => {
                return res.error400(err.message)
            })

    },

    // Get data loggedIn user, 
    // Get data berdasarkan id pada token
    user: async (req, res) => {
        await User.findByPk(req.user.id, {
                include: [{
                    model: Role,
                }]
            })
            .then(data => {
                delete data.dataValues.password
                res.successGet(tableName, data)
            })
            .catch(err => {
                res.error500(err.message)
            })
    },

    refreshToken: async (req, res) => {
        const requestToken = req.body.refresh_token

        if (!requestToken) {
            return res.error400("Refresh token kosong")
        }

        try {
            // cek Refresh token pada database
            let refreshToken = await RefreshToken.findOne({
                where: {
                    token: requestToken
                }
            });

            if (!refreshToken) {
                return res.error400("Refresh token tidak ada di database")
            }

            if (RefreshToken.verifyExpiration(refreshToken)) {
                RefreshToken.destroy({
                    where: {
                        id: refreshToken.id
                    }
                });
                return res.error400("Refresh token expired, Login kembali")
            }

            // validasi Token, 
            // Validadi ip pada token apakah sama dengan ip yang melakukan request
            jwt.verify(requestToken, config.jwtRefreshSecret, (err, decoded) => {
                if (decoded.ip !== req.connection.remoteAddress) {
                    return res.error400("Token tidak sah!")
                }

                if (err) {
                    return res.error400(err.message)
                }

                // Buat access token baru
                let newAccessToken = jwt.sign({
                    id: decoded.id,
                    role: decoded.role,
                    vendor_id: decoded.vendor_id,
                    ip: decoded.ip
                }, config.jwtAccessSecret, {
                    expiresIn: config.jwtAccessExpiration,
                });

                return res.success('Generate access token baru', {
                    accessToken: newAccessToken,
                    refreshToken: refreshToken.token,
                })
            });
        } catch (err) {
            return res.error500(err.message)
        }
    },

    logout: async (req, res) => {
        await RefreshToken.destroy({
                where: {
                    user_id: req.user.id
                }
            })
            .then(() => {
                res.success('Berhasil Logout')
            })
            .catch(err => {
                res.error500(err.message)
            })
    }

}