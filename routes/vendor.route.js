const controller = require('../controllers/vendor.controller')
const authJwt = require("../middleware/authJwt")

module.exports = (app) => {
    app.get('/api/vendor/onSearchPaginated', authJwt.authAdmin, controller.onSearchPaginated)
    app.get('/api/vendor', authJwt.authAdmin, controller.getAll)
    app.get('/api/vendor/:id', authJwt.authVendor, controller.find) // Can access by vendor Role
    app.post('/api/vendor', authJwt.authAdmin, controller.store)
    app.patch('/api/vendor/:id', authJwt.authAdmin, controller.update)
}