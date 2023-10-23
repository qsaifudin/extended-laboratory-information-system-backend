const controller = require("../controllers/dashboard.controller");
const authJwt = require("../middleware/authJwt");
module.exports = (app) => {
  app.get("/api/dashboard", authJwt.authVendor, controller.getAll)
};