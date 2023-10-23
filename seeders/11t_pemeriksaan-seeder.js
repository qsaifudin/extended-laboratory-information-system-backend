"use strict";

const faker = require("faker/locale/id_ID");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let nama = faker.name.findName();
    let word = faker.lorem.word();
    let nomer = faker.datatype.number({
      min: 1,
      max: 9999,
    });
    let pemeriksaan = faker.random.alpha();
    let noUrut = faker.datatype.number({
      min: 10,
      max: 100,
    });
    let registrasi = faker.datatype.number({
      min: 1,
      max: 99999,
    });
    let duplo = faker.datatype.number({
      min: 100,
      max: 1000,
    });

    await queryInterface.bulkInsert(
      "t_pemeriksaan",
      [
        {
          kode: faker.datatype.uuid(),
          nama: "Bakiadi Sitompul",
          satuan: word,
          metode: word,
          no_urut: nomer,
          kategori_pemeriksaan: pemeriksaan,
          kategori_no_urut: noUrut,
          subkategori_pemeriksaan: pemeriksaan,
          subkategori_no_urut: noUrut,
          catatan: faker.lorem.sentence(),
          is_duplo: faker.datatype.boolean(),
          total_duplo: duplo,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "1",
        },
        {
          kode: faker.datatype.uuid(),
          nama: "Bakiadi Sitompul",
          satuan: word,
          metode: word,
          no_urut: nomer,
          kategori_pemeriksaan: pemeriksaan,
          kategori_no_urut: noUrut,
          subkategori_pemeriksaan: pemeriksaan,
          subkategori_no_urut: noUrut,
          catatan: faker.lorem.sentence(),
          is_duplo: faker.datatype.boolean(),
          total_duplo: duplo,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "1",
        },
        {
          kode: faker.datatype.uuid(),
          nama: "Bakiadi Sitompul",
          satuan: word,
          metode: word,
          no_urut: nomer,
          kategori_pemeriksaan: pemeriksaan,
          kategori_no_urut: noUrut,
          subkategori_pemeriksaan: pemeriksaan,
          subkategori_no_urut: noUrut,
          catatan: faker.lorem.sentence(),
          is_duplo: faker.datatype.boolean(),
          total_duplo: duplo,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "1",
        },
        {
          kode: faker.datatype.uuid(),
          nama: "Opung Nababan",
          satuan: word,
          metode: word,
          no_urut: nomer,
          kategori_pemeriksaan: pemeriksaan,
          kategori_no_urut: noUrut,
          subkategori_pemeriksaan: pemeriksaan,
          subkategori_no_urut: noUrut,
          catatan: faker.lorem.sentence(),
          is_duplo: faker.datatype.boolean(),
          total_duplo: duplo,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "2",
        },
        {
          kode: faker.datatype.uuid(),
          nama: "Opung Nababan",
          satuan: word,
          metode: word,
          no_urut: nomer,
          kategori_pemeriksaan: pemeriksaan,
          kategori_no_urut: noUrut,
          subkategori_pemeriksaan: pemeriksaan,
          subkategori_no_urut: noUrut,
          catatan: faker.lorem.sentence(),
          is_duplo: faker.datatype.boolean(),
          total_duplo: duplo,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "2",
        },
        {
          kode: faker.datatype.uuid(),
          nama: "Opung Nababan",
          satuan: word,
          metode: word,
          no_urut: nomer,
          kategori_pemeriksaan: pemeriksaan,
          kategori_no_urut: noUrut,
          subkategori_pemeriksaan: pemeriksaan,
          subkategori_no_urut: noUrut,
          catatan: faker.lorem.sentence(),
          is_duplo: faker.datatype.boolean(),
          total_duplo: duplo,
          kode_rs: "RSS_Royal",
          kode_lab: "Lab_Royal",
          registrasi_id: "2",
        },
      ],
      {}
    );
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("t_pemeriksaan", null, {});
  },
};
