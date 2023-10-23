const jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");

module.exports = {
    verifyToken: (req, res, next) => {
        let token = req.headers["authorization"]
        if (!token) {
            return res.error400("Access token tidak ada")
        }
        token = token.split(' ')[1];
        jwt.verify(token, config.jwtAccessSecret, (err, decoded) => {
            if (err) {
                return res.error400(err.message)
            }
            if (decoded.ip !== req.connection.remoteAddress) {
                return res.error400("Access token tidak sah!")
            }
            req.user = decoded;
            next();
        });
    },

    authSuperAdmin: (req, res, next) => {
        if (req.user.role == 'superadmin') {
            next();
            return;
        }
        res.error400('Anda bukan Superadmin')
    },

    authAdmin: (req, res, next) => {
        const role = req.user.role
        if (role == 'superadmin' || role == 'admin') {
            next();
            return;
        }
        res.error400('Anda bukan Admin')
    },

    authVendor: (req, res, next) => {
        const role = req.user.role
        if (role == 'superadmin' || role == 'admin' || role == 'vendor') {
            next();
            return;
        }
        res.error400('Anda bukan user Vendor')
    },

    authRs: (req, res, next) => {
        const role = req.user.role
        if (role == 'superadmin' || role == 'admin' || role == 'vendor' || role == 'rs') {
            next();
            return;
        }
        res.error400('Anda bukan user RS')
    },

    authLab: (req, res, next) => {
        const role = req.user.role
        if (role == 'superadmin' || role == 'admin' || role == 'vendor' || role == 'rs' || role == 'lab') {
            next();
            return;
        }
        res.error400('Anda bukan user Lab')
    },

}