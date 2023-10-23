const { Sequelize, QueryTypes } = require("sequelize");
const sequelize = new Sequelize(
  process.env.PGDATABASE,
  process.env.PGUSER,
  process.env.PGPASSWORD,
  {
    host: process.env.PGHOST,
    dialect: process.env.PGDIALECT,
    operatorsAliases: 0,
    logging: 0,
    define: {
      freezeTableName: 1,
    },
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000,
    },
    dialectOptions: {
      useUTC: false,
    },
    timezone: "+07:00",
  }
);

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.QueryTypes = QueryTypes;

db.user = require("../models/user.model")(sequelize, Sequelize);
db.role = require("../models/role.model")(sequelize, Sequelize);
db.refreshToken = require("../models/refresh_token.model")(
  sequelize,
  Sequelize
);

db.provinsi = require("../models/provinsi.model")(sequelize, Sequelize);
db.kota = require("../models/kota.model")(sequelize, Sequelize);
db.kecamatan = require("../models/kecamatan.model")(sequelize, Sequelize);

db.kategoriRs = require("../models/kategori_rs.model")(sequelize, Sequelize);
db.vendor = require("../models/vendor.model")(sequelize, Sequelize);
db.lab = require("../models/lab.model")(sequelize, Sequelize);
db.rumahsakit = require("./rumah_sakit.model")(sequelize, Sequelize);
db.transaksiPasien = require("./transaksi_pasien.model")(sequelize, Sequelize);
db.transaksiPemeriksaan = require("./transaksi_pemeriksaan.model")(
  sequelize,
  Sequelize
);

// ## Comment at first time to prevent create relation. After that, uncomment
require("./relation")(db);

db.ROLE = ["superadmin", "admin", "vendor", "rs", "lab"];

module.exports = db;
