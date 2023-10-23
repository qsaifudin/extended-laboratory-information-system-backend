'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('vendor', [{
      nama: 'PT Wahana Rizky Gumilang',
      provinsi_id: '35',
      kota_id: '3578',
      status: 'true'
    },{
      nama: 'PT Good People',
      provinsi_id: '35',
      kota_id: '3578',
      status: 'true'
    },{
      nama: 'PT Banteng Merah',
      provinsi_id: '35',
      kota_id: '3578',
      status: 'true'
    },{
      nama: 'PT Menguasai Indonesia',
      provinsi_id: '35',
      kota_id: '3578',
      status: 'true'
    }], {});

  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('vendor', null, {});
  }
};
