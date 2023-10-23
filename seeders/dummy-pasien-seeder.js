'use strict';

const faker = require('faker/locale/id_ID')

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let data = []
    let amount = 100

    let genders = ['Laki-laki', 'Perempuan']
    let kodeRs = ['U_HU', 'U_AHP', 'U_AHK', 'U_Darmo', 'U_Haji', 'UD_MU', 'UD_MS', 'S_Soetomo', 'S_Premier', 'S_Royal']
    let kodeLab = ['HU', 'AHP', 'AHK', 'Darmo', 'Haji', 'MU', 'MS', 'Soetomo', 'Premier', 'Royal']

    while (amount--) {
      data.push({
        no_lab: faker.datatype.number({
          min: 1000,
          max: 9999
        }),
        no_reg: faker.datatype.number({
          min: 1000,
          max: 9999
        }),
        no_rm: faker.datatype.number({
          min: 1000,
          max: 9999
        }),
        nik: faker.datatype.number({
          min: 3111111111110001,
          min: 3990000000000001
        }),
        nama: faker.name.findName(),
        provinsi: faker.address.county(),
        kota: faker.address.city(),
        kecamatan: faker.address.streetName(),
        alamat: faker.address.streetAddress(),
        gender: faker.random.arrayElement(genders),
        usia_hari: faker.datatype.number({
          min: 1,
          max: 30
        }),
        usia_bulan: faker.datatype.number({
          min: 1,
          max: 11
        }),
        usia_tahun: faker.datatype.number({
          min: 17,
          max: 90
        }),
        diagnosa_awal: faker.lorem.word(),
        icdt: faker.lorem.word(),
        penjamin: faker.name.findName(),
        unit_asal: faker.address.city(),
        dokter_pengirim: 'dr.' + faker.name.firstName(),
        waktu_registrasi: faker.date.past(),
        waktu_checkin: faker.date.past(),
        waktu_terbit: faker.date.past(),
        kode_rs: 'RS' + faker.random.arrayElement(kodeRs),
        kode_lab: 'Lab_' +faker.random.arrayElement(kodeLab),
        registrasi_id: faker.datatype.number({
          min: 1000,
          max: 1999
        })
      })
    }

    await queryInterface.bulkInsert('t_pasien', data, {});

  },
  down: async (queryInterface, Sequelize) => {

    await queryInterface.bulkDelete('t_pasien', null, {});
  }
};