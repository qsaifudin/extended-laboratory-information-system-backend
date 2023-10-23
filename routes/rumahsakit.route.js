const controller = require('../controllers/rumahsakit.controller')
const authJwt = require("../middleware/authJwt");

module.exports = app => {
    app.get('/api/rumahsakit', controller.getAll) // Can access by vendor Role
    app.get('/api/rumahsakit/onSearchPaginated', authJwt.authAdmin, controller.onSearchPaginated)
    app.get('/api/rumahsakit/:id', authJwt.authAdmin, controller.find)
    app.post('/api/rumahsakit', authJwt.authAdmin, controller.store)
    app.patch('/api/rumahsakit/:id', authJwt.authAdmin, controller.update)
}