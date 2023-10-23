const db = require('../models')
const csvtojson = require('csvtojson');
const provinsi = "./dataSeed/provinsi.csv";
const kota = "./dataSeed/kota.csv";
const kecamatan = "./dataSeed/kecamatan.csv";

// Insert Data dari file csv

// Insert Data Provinsi
csvtojson().fromFile(provinsi).then(async source => {
  for (let i = 0; i < source.length; i++) {
    const id = source[i]["id"],
      nama = source[i]["nama"],
      status = true
    await db.sequelize.query(`INSERT INTO provinsi values(${id},'${nama}',${status})`)
  }
});

// Insert Data Kota
csvtojson().fromFile(kota).then(async source => {
  for (let i = 0; i < source.length; i++) {
    const id = source[i]["id"],
      provinsi_id = source[i]["provinsi_id"],
      nama = source[i]["nama"],
      status = true
    await db.sequelize.query(`INSERT INTO kota values(${id},${provinsi_id},'${nama}',${status})`)
  }
});

// Insert Data Kecamatan
csvtojson().fromFile(kecamatan).then(async source => {
  for (let i = 0; i < source.length; i++) {
    const id = source[i]["id"],
      kota_id = source[i]["kota_id"],
      nama = source[i]["nama"],
      status = true
    await db.sequelize.query(`INSERT INTO kecamatan values(${id},${kota_id},'${nama}',${status})`)
  }
});