const config = require("../config/auth.config");

module.exports = (sequelize, Sequelize) => {
  const RefreshToken = sequelize.define("refresh_token", {
    token: {
      type: Sequelize.STRING,
    },
    expiry_date: {
      type: Sequelize.DATE,
    },
    user_id: {
      type: Sequelize.INTEGER,
    },
  }, {
    timestamps: false,
    createdAt: false,
    updatedAt: false,
  });

  RefreshToken.createToken = async function (user, requestToken) {
    let expiredAt = new Date();

    expiredAt.setSeconds(expiredAt.getSeconds() + config.jwtRefreshExpiration);

    let refreshToken = await this.create({
      token: requestToken,
      user_id: user.id,
      expiry_date: expiredAt.getTime(),
    });

    return refreshToken.token;
  };

  RefreshToken.verifyExpiration = (token) => {
    return token.expiry_date.getTime() < new Date().getTime();
  };

  return RefreshToken;
};