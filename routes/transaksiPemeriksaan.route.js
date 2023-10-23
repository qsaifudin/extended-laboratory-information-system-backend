const controller = require('../controllers/transaksiPemeriksaan.controller')
const authJwt = require("../middleware/authJwt");

module.exports = app => {
    app.post('/api/transaksipemeriksaan', controller.store)
    app.get('/api/transaksipemeriksaan/onSearchPaginated', [authJwt.verifyToken, authJwt.authVendor], controller.onSearchPaginated)
    app.get('/api/transaksipemeriksaan', [authJwt.verifyToken, authJwt.authVendor], controller.getAll)
    app.get('/api/transaksipemeriksaan/:id', [authJwt.verifyToken, authJwt.authVendor], controller.find)
    app.patch('/api/transaksipemeriksaan/:id', [authJwt.verifyToken, authJwt.authVendor], controller.update)
}