require('dotenv').config()
const express = require("express")
const bodyParser = require("body-parser")
const authJwt = require("./middleware/authJwt")
const cors = require("cors")
const app = express()

app.use(bodyParser.json({
  verify: (req, res, buf) => {
    req.rawBody = buf
  }
}))

app.use(bodyParser.urlencoded({
  extended: false,
  verify: (req, res, buf) => {
    req.rawBody = buf
  }
}))

app.use(cors())

const {
  pghost: host,
  server_port: port
} = process.env;

// Connect to database
const db = require("./models")

// ##commen saat pertama kali, Setelah itu uncomment
db.sequelize.sync()
// ## Uncomment saat pertama kali untuk migrate table, Setelah itu di comment
// db.sequelize.sync({
//   force: true
// }).then(() => {
//   initial();
// });

// Respone Helper
app.use(require('./middleware/responseHelper').responseHelper)

// Routing
require("./routes/auth.route")(app)

// custom verify
// API post pasien,pemeriksaan public
require('./routes/transaksiPasien.route')(app)
require('./routes/transaksiPemeriksaan.route')(app)

//verify token
app.use(authJwt.verifyToken)

//verify vendor role
app.use(authJwt.authVendor)
require('./routes/dashboard.route')(app)

require("./routes/rumahsakit.route")(app)
require("./routes/vendor.route")(app)

//verify admin role
app.use(authJwt.authAdmin)
require("./routes/kategoriRs.route")(app)
require("./routes/lab.route")(app)
require("./routes/wilayah.route")(app)

//verify superadmin role
app.use(authJwt.authSuperAdmin)
require("./routes/user.route")(app)

app.listen(port, () => {
  console.log(`Server listening on port http://localhost:${port}`)
})

// Auto Insert data below when sequelize.sync force is true
const Role = db.role;
const User = db.user;
const bcrypt = require("bcryptjs");

function initial() {
  Role.create({
    nama: "superadmin"
  });
  Role.create({
    nama: "admin"
  });
  Role.create({
    nama: "vendor"
  });
  Role.create({
    nama: "rs"
  });
  Role.create({
    nama: "lab"
  });

  User.create({
    nama: 'superadmin',
    username: 'superadmin',
    password: bcrypt.hashSync('1234567890', 8),
    role_id: '1'
  })

  // Data wialyah
  require('./dataSeed/autoSeedWilayah')
}