const controller = require('../controllers/lab.controller')

module.exports = app => {
    app.get('/api/lab/', controller.getAll) // List Data
    app.get('/api/lab/onSearchPaginated', controller.onSearchPaginated) // List Data
    app.get('/api/lab/:id', controller.find) // Detail Data
    app.post('/api/lab', controller.store) //Create Data
    app.patch('/api/lab/:id', controller.update) //Update Data
}