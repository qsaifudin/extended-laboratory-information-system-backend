const controller = require('../controllers/transaksiPasien.controller.js')
const authJwt = require("../middleware/authJwt");

module.exports = app => {
    app.post('/api/transaksipasien', controller.store) // API Public
    app.get('/api/transaksipasien/onSearchPaginated', [authJwt.verifyToken, authJwt.authVendor], controller.onSearchPaginated)
    app.get('/api/transaksipasien', [authJwt.verifyToken, authJwt.authVendor], controller.getAll)
    app.get('/api/transaksipasien/:id', [authJwt.verifyToken, authJwt.authVendor], controller.find)
    app.patch('/api/transaksipasien/:id', [authJwt.verifyToken, authJwt.authVendor], controller.update)
}