'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
     await queryInterface.bulkInsert('kategori_rs', [{
        nama: 'Rumah Sakit Umum',
        status: 'true'
     },{
        nama: 'Rumah Sakit Umum Daerah',
        status: 'true'
     },{
        nama: 'Rumah Sakit Swasta',
        status: 'true'
     },{
        nama: 'Rumah Sakit Khusus',
        status: 'true'
     },{
        nama: 'Klinik',
        status: 'true'
     }], {});
  },

   down: async (queryInterface, Sequelize) => {
      await queryInterface.bulkDelete('kategori_rs', null, {});
   
   }
};
