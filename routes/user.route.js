const controller = require('../controllers/user.controller')

module.exports = (app) => {
    app.get('/api/user/', controller.getAll) // List Data
    app.get('/api/user/onSearchPaginated', controller.onSearchPaginated) // List Data
    app.get('/api/user/role', controller.getRole) // List Data
    app.get('/api/user/:id', controller.find) // Detail Data
    app.post('/api/user/', controller.store);
    app.patch('/api/user/:id', controller.update) // Update Data
}