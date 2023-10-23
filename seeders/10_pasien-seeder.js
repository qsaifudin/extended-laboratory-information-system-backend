"use strict";

const faker = require("faker/locale/id_ID");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let nomer = faker.datatype.number({
      min: 1000,
      max: 9999,
    });
    let nik = faker.datatype.number({
      min: 3111111111110001,
      min: 3990000000000001,
    });
    let nama = faker.name.findName();
    let hari = faker.datatype.number({
      min: 1,
      max: 30,
    });
    let bulan = faker.datatype.number({
      min: 1,
      max: 11,
    });
    let tahun = faker.datatype.number({
      min: 17,
      max: 90,
    });
    let waktu = faker.date.past();
    let kode = faker.datatype.string();
    let uuid = faker.datatype.uuid();
    let registrasi = faker.datatype.number({
      min: 1,
      max: 99999,
    });

    await queryInterface.bulkInsert(
      "t_pasien",
      [
        {
          no_lab: nomer,
          no_reg: nomer,
          no_rm: nomer,
          nik: nik,
          nama: "Bakiadi Sitompul",
          alamat: faker.address.streetAddress(),
          gender: faker.name.gender(),
          usia_hari: hari,
          usia_bulan: bulan,
          usia_tahun: tahun,
          diagnosa_awal: faker.lorem.word(),
          icdt: kode,
          penjamin: nama,
          unit_asal: faker.address.city(),
          dokter_pengirim: "dr." + faker.name.firstName(),
          waktu_registrasi: waktu,
          waktu_checkin: waktu,
          waktu_terbit: waktu,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "1000",
          provinsi: "35",
          kota: "3578",
          kecamatan: "3318010",
        },
        {
          no_lab: nomer,
          no_reg: nomer,
          no_rm: nomer,
          nik: nik,
          nama: "Opung Nababan",
          alamat: faker.address.streetAddress(),
          gender: faker.name.gender(),
          usia_hari: hari,
          usia_bulan: bulan,
          usia_tahun: tahun,
          diagnosa_awal: faker.lorem.word(),
          icdt: kode,
          penjamin: nama,
          unit_asal: faker.address.city(),
          dokter_pengirim: "dr." + faker.name.firstName(),
          waktu_registrasi: waktu,
          waktu_checkin: waktu,
          waktu_terbit: waktu,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "1001",
          provinsi: "35",
          kota: "3578",
          kecamatan: "3318010",
        },
      ],
      {}
    );
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("t_pasien", null, {});
  },
};
