const controller = require("../controllers/auth.controller");
const authJwt = require("../middleware/authJwt");
module.exports = (app) => {
  app.post("/api/auth/login", controller.login);
  app.get("/api/auth/user",authJwt.verifyToken, controller.user);
  app.post("/api/auth/refreshToken", controller.refreshToken);
  app.post("/api/auth/logout", authJwt.verifyToken, controller.logout);
};