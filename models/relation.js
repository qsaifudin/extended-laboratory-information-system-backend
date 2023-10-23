module.exports = (db) => {
  db.user.hasOne(db.refreshToken, {
    foreignKey: "user_id",
    as: "refreshToken",
  });

  db.user.belongsTo(db.role, {
    foreignKey: "role_id",
  });

  db.user.belongsTo(db.vendor, {
    foreignKey: "vendor_id",
  });

  db.vendor.belongsTo(db.provinsi, {
    foreignKey: "provinsi_id",
    as: "provinsi",
  });

  db.vendor.belongsTo(db.kota, {
    foreignKey: "kota_id",
    as: "kota",
  });

  db.rumahsakit.belongsTo(db.provinsi, {
    foreignKey: "provinsi_id",
    as: "provinsi",
  });

  db.rumahsakit.belongsTo(db.kota, {
    foreignKey: "kota_id",
    as: "kota",
  });

  db.rumahsakit.belongsTo(db.kecamatan, {
    foreignKey: "kecamatan_id",
    as: "kecamatan",
  });

  db.vendor.hasMany(db.rumahsakit, {
    foreignKey: "vendor_id",
    as: "rumah_sakit",
  });

  db.rumahsakit.belongsTo(db.vendor, {
    foreignKey: "vendor_id",
    as: "vendor",
  });

  db.kategoriRs.hasMany(db.rumahsakit, {
    foreignKey: "kategori_id",
    as: "rumah_sakit",
  });

  db.rumahsakit.belongsTo(db.kategoriRs, {
    foreignKey: "kategori_id",
    as: "kategori_rs",
  });

  db.rumahsakit.hasMany(db.lab, {
    foreignKey: "rs_id",
    as: "lab",
  });

  db.lab.belongsTo(db.rumahsakit, {
    foreignKey: "rs_id",
    as: "rumah_sakit",
  });

  // db.rumahsakit.hasMany(db.transaksiPasien, {
  //     foreignKey: 'kode_rs',
  //     targetKey: 'kode',
  //     as: 'pasien'
  // })

  // db.rumahsakit.hasMany(db.transaksiPemeriksaan, {
  //     foreignKey: 'kode_rs',
  //     targetKey: 'kode',
  //     as: 'pemeriksaan'
  // })

  db.transaksiPasien.hasMany(db.transaksiPemeriksaan, {
    foreignKey: "registrasi_id",
    as: "pemeriksaan",
  });

  // db.transaksiPemeriksaan.belongsTo(db.transaksiPasien, {
  //   foreignKey: "registrasi_id",
  //   targetKey: "registrasi_id",
  //   as: "rumah_sakit",
  // });
};
