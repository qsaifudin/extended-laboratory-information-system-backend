const controller = require('../controllers/kategoriRs.controller')
const {
    authJwt
} = require('../middleware/authJwt')

module.exports = app => {

    app.get("/api/kategoriRs", controller.getAll);
    app.get("/api/kategoriRs/:id", controller.find);
    app.post("/api/kategoriRs", controller.store);
    app.patch("/api/kategoriRs/:id", controller.update);
}