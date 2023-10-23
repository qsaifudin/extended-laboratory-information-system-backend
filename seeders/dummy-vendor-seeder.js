'use strict';

const faker = require('faker/locale/id_ID')

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let data = []
    let amount = 10

    while(amount--) {

      data.push({
        nama: faker.name.findName(),
        provinsi_id: '35',
        kota_id: '3578',
        status: 'true'
      })
    }
    await queryInterface.bulkInsert('vendor', data, {});

  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('vendor', null, {});
  }
};
