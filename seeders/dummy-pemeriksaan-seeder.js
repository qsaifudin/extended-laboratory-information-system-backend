'use strict';

const faker = require('faker/locale/id_ID')

module.exports = {

  up: async (queryInterface, Sequelize) => {
    let data = []
    let amount = 500

    let pemeriksaan = ['Glukosa', 'Darah', 'Urine', 'Elektrokardiogram', 'Ekokardiografi']
    let kodeRs = ['U_HU', 'U_AHP', 'U_AHK', 'U_Darmo', 'U_Haji', 'UD_MU', 'UD_MS', 'S_Soetomo', 'S_Premier', 'S_Royal']
    let kodeLab = ['HU', 'AHP', 'AHK', 'Darmo', 'Haji', 'MU', 'MS', 'Soetomo', 'Premier', 'Royal']

    while (amount--) {
      data.push({
        kode: faker.random.word(),
        nama: faker.random.arrayElement(pemeriksaan),
        satuan: faker.lorem.word(),
        metode: faker.lorem.word(),
        no_urut: faker.datatype.number({
          min: 1,
          max: 9999
        }),
        kategori_pemeriksaan: faker.random.alpha(),
        kategori_no_urut: faker.datatype.number({
          min: 1,
          max: 100
        }),
        subkategori_pemeriksaan: faker.random.alpha(),
        subkategori_no_urut: faker.datatype.number({
          min: 1,
          max: 100
        }),
        catatan: faker.lorem.sentence(),
        is_duplo: faker.datatype.boolean(),
        total_duplo: faker.datatype.number({
          min: 100,
          max: 1000
        }),
        kode_rs: 'RS' + faker.random.arrayElement(kodeRs),
        kode_lab: 'Lab_' + faker.random.arrayElement(kodeLab),
        registrasi_id: faker.datatype.number({
          min: 1000,
          max: 1999
        })
      })
    }

    await queryInterface.bulkInsert('t_pemeriksaan', data, {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('t_pemeriksaan', null, {});
  }
};