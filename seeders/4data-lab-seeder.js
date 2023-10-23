'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('lab', [{
      kode: 'Lab_HU',
      nama: 'Lab Husada Utama',
      rs_id: '1',
      status: 'true'
    },{
      kode: 'Lab_AHP',
      nama: 'Lab Adi Husada Pusat',
      rs_id: '2',
      status: 'true'
    },{
      kode: 'Lab_AHK',
      nama: 'Lab Adi Husada Kapasari',
      rs_id: '3',
      status: 'true'
    },{
      kode: 'Lab_Darmo',
      nama: 'Lab Darmo',
      rs_id: '4',
      status: 'true'
    },{
      kode: 'Lab_Haji',
      nama: 'Lab Haji',
      rs_id: '5',
      status: 'true'
    },{
      kode: 'Lab_MU',
      nama: 'Lab Mata Undaan',
      rs_id: '6',
      status: 'true'
    },{
      kode: 'Lab_DMS',
      nama: 'Lab Dr. Mohamad Soewandhie',
      rs_id: '7',
      status: 'true'
    },{
      kode: 'Lab_Soetomo',
      nama: 'Lab Soetomo',
      rs_id: '8',
      status: 'true'
    },{
      kode: 'Lab_Premier',
      nama: 'Lab Premier',
      rs_id: '9',
      status: 'true'
    },{
      kode: 'Lab_Royal',
      nama: 'Lab Royal',
      rs_id: '10',
      status: 'true'
    }], {});
    
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('lab', null, {});
  }
};
