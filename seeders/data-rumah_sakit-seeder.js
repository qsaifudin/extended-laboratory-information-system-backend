'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('rumah_sakit', [{
      nama: 'RS Husada Utama',
      kode: 'RSU_HU',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578200',
      alamat: 'Jl. Mayjen Prof. Dr. Moestopo No.31-35, Pacar Keling',
      kategori_id: '1',
      vendor_id: '1',
      status: 'true'
    },{
      nama: 'RS Adi Husada Pusat',
      kode: 'RSU_AHP',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578190',
      alamat: 'Jl. Undaan Wetan No.40-44, Ketabang',
      kategori_id: '1',
      vendor_id: '1',
      status: 'true'
    },{
      nama: 'RS Adi Husada Kapasari',
      kode: 'RSU_AHK',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578220',
      alamat: 'Jl. Kapasari No.97-101, Kapasan',
      kategori_id: '1',
      vendor_id: '1',
      status: 'true'
    },{
      nama: 'RS Darmo',
      kode: 'RSU_Darmo',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578180',
      alamat: 'Jl. Raya Darmo No.90, DR. Soetomo',
      kategori_id: '1',
      vendor_id: '2',
      status: 'true'
    },{
      nama: 'RSU Haji Surabaya',
      kode: 'RSU_Haji',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578080',
      alamat: 'Jl. Manyar Kertoadi, Klampis Ngasem',
      kategori_id: '1',
      vendor_id: '2',
      status: 'true'
    },{
      nama: 'RS Mata Undaan',
      kode: 'RSUD_MU',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578190',
      alamat: 'Jl. Undaan Kulon No.19, Peneleh',
      kategori_id: '4',
      vendor_id: '2',
      status: 'true'
    },{
      nama: 'RSUD Dr. Mohamad Soewandhie',
      kode: 'RSUD_MS',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578220',
      alamat: 'Jl. Tambak Rejo No.45-47, Tambakrejo',
      kategori_id: '2',
      vendor_id: '3',
      status: 'true'
    },{
      nama: 'RSU Dr. Soetomo',
      kode: 'RSS_Soetomo',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578100',
      alamat: 'Jl. Mayjen Prof. Dr. Moestopo No.6-8, Airlangga',
      kategori_id: '2',
      vendor_id: '3',
      status: 'true'
    },{
      nama: 'RS Premier Surabaya',
      kode: 'RSS_Premier',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578080',
      alamat: 'Jl. Nginden Intan Barat No.B, Ngenden Jangkungan',
      kategori_id: '3',
      vendor_id: '4',
      status: 'true'
    },{
      nama: 'RS Royal Surabaya',
      kode: 'RSS_Royal',
      provinsi_id: '35',
      kota_id: '3578',
      kecamatan_id: '3578070',
      alamat: 'Jl. Rungkut Industri I No.1, Kendangsari',
      kategori_id: '3',
      vendor_id: '4',
      status: 'true'
    }], {});
    
  },

  down: async (queryInterface, Sequelize) => {
     await queryInterface.bulkDelete('rumah_sakit', null, {});
  }
};
