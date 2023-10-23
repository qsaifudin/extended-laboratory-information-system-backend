module.exports = (sequelize, Sequelize) => {
    const Rumahsakit = sequelize.define('rumah_sakit', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        kode: {
            type: Sequelize.STRING(100),
            allowNull: false,
            unique: true,
            validate: {
                notNull: {
                    msg: 'Kode Rumah Sakit harus diisi'
                },
                notEmpty: {
                    msg: 'Kode Rumah Sakit harus diisi'
                },
                len: {
                    args: [3, 100],
                    msg: 'Kode Rumah Sakit harus lebih dari 2 karakter'
                }
            }
        },
        nama: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true,
            validate: {
                notNull: {
                    msg: 'Nama Rumah Sakit harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Nama Rumah Sakit harus diisi'
                },
                len: {
                    args: [3, 255],
                    msg: 'Nama Rumah Sakit harus lebih dari 2 karakter'
                }
            }
        },
        provinsi_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Provinsi harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Provinsi harus diisi'
                },
            }
        },
        kota_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kota harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Kota harus diisi'
                }
            }
        },
        kecamatan_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kecamatan harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Kecamatan harus diisi'
                }
            }
        },
        alamat: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Alamat harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Alamat harus diisi'
                }
            }
        },
        kategori_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kategori ID harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Kategori ID harus diisi'
                },
                isInt: {
                    args: true,
                    msg: 'Kategori ID hanya berisi angka'
                }
            }
        },
        vendor_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Vendor ID harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Vendor ID harus diisi'
                },
                isInt: {
                    args: true,
                    msg: 'Vendor ID hanya berisi angka'
                }
            }
        },
        status: {
            type: Sequelize.BOOLEAN,
            allowNull: false,
            defaultValue: false
        }
    }, {
        timestamps: false,
    })

    return Rumahsakit
}