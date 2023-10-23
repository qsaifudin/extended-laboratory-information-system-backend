const moment = require('moment')
moment.locale('id-ID')

module.exports = (sequelize, Sequelize) => {
    const Transaksi = sequelize.define('t_pasien', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        no_lab: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            validate: {
                notEmpty: {
                    args: true,
                    msg: 'No Lab harus diisi'
                },
                notNull: {
                    args: true,
                    msg: 'No Lab harus diisi'
                },
                isInt: {
                    args: true,
                    msg: 'No Lab hanya berisi angka'
                }
            }
        },
        no_reg: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'No Reg harus diisi'
                },
                notEmpty: {
                    msg: 'No Reg harus diisi'
                },
                isInt: {
                    msg: 'No Reg hanya berisi angka'
                }
            }
        },
        no_rm: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'No Rm harus diisi'
                },
                notEmpty: {
                    msg: 'No Req harus diisi'
                },
                isInt: {
                    msg: 'No Rm hanya berisi angka'
                }
            }
        },
        nik: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'NIK harus diisi'
                },
                notEmpty: {
                    msg: 'NIK harus diisi'
                }
            }
        },
        nama: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Nama pasien harus diisi'
                },
                notEmpty: {
                    msg: 'Nama pasien harus diisi'
                }
            }
        },
        provinsi: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Provinsi harus diisi'
                },
                notEmpty: {
                    msg: 'Provinsi harus diisi'
                }
            }
        },
        kota: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kota harus diisi'
                },
                notEmpty: {
                    msg: 'Kota harus diisi'
                }
            }
        },
        kecamatan: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kecamatan harus diisi'
                },
                notEmpty: {
                    msg: 'Kecamatan harus diisi'
                }
            }
        },
        alamat: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Alamat pasien harus diisi'
                },
                notEmpty: {
                    msg: 'Alamat pasien harus diisi'
                }
            }
        },
        gender: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Gender harus diisi'
                },
                notEmpty: {
                    msg: 'Gender harus diisi'
                }
            }
        },
        usia_hari: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Usia Hari harus diisi'
                },
                notEmpty: {
                    msg: 'Usia Hari Harus diisi'
                },
                isInt: {
                    msg: 'Usia Hari hanya berisi angka'
                }
            }
        },
        usia_bulan: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Usia Bulan harus diisi'
                },
                notEmpty: {
                    msg: 'Usia bulan harus diisi'
                },
                isInt: {
                    msg: 'Usia Bulan hanya berisi angka'
                }
            }
        },
        usia_tahun: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Usia Tahun harus diisi'
                },
                notEmpty: {
                    msg: 'Usia Tahun harus diisi'
                },
                isInt: {
                    msg: 'Usia Tahun hanya berisi angka'
                }
            }
        },
        diagnosa_awal: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Diagnosa Awal harus diisi'
                },
                notEmpty: {
                    msg: 'Diagnosa Awal harus diisi'
                }
            }
        },
        icdt: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Icdt harus diisi'
                },
                notEmpty: {
                    msg: 'Icdt harus diisi'
                }
            }
        },
        penjamin: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Penjamin harus diisi'
                },
                notEmpty: {
                    mssg: 'Penjamin harus diisi'
                }
            }
        },
        unit_asal: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Unit Asal harus diisi'
                },
                notEmpty: {
                    msg: 'Unit Asal harus diisi'
                }
            }
        },
        dokter_pengirim: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Dokter Pengirim harus diisi'
                },
                notEmpty: {
                    msg: 'Dokter Pengirim harus diisi'
                }
            }
        },
        waktu_registrasi: {
            type: Sequelize.DATE,
            allowNull: false,
            get: function () {
                return moment(this.getDataValue('waktu_registrasi')).format('dddd, DD MMMM YYYY - HH:mm:ss')
            },
            validate: {
                notNull: {
                    msg: 'Waktu Registrasi harus diisi'
                },
                notEmpty: {
                    msg: 'Waktu Registrasi harus diisi'
                }
            }
        },
        waktu_checkin: {
            type: Sequelize.DATE,
            allowNull: false,
            get: function () {
                return moment(this.getDataValue('waktu_checkin')).format('dddd, DD MMMM YYYY - HH:mm:ss')
            },
            validate: {
                notNull: {
                    msg: 'Waktu Checkin harus diisi'
                },
                notEmpty: {
                    msg: 'Waktu Checkin harus diisi'
                }
            }
        },
        waktu_terbit: {
            type: Sequelize.DATE,
            allowNull: false,
            get: function () {
                return moment(this.getDataValue('waktu_terbit')).format('dddd, DD MMMM YYYY - HH:mm:ss')
            },
            validate: {
                notNull: {
                    msg: 'Waktu Terbit harus diisi'
                },
                notEmpty: {
                    msg: 'Waktu Terbit harus diisi'
                }
            }
        },
        kode_rs: {
            type: Sequelize.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kode RS harus diisi'
                },
                notEmpty: {
                    msg: 'Kode RS harus diisi'
                }
            },
        },
        kode_lab: {
            type: Sequelize.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kode Lab harus diisi'
                },
                notEmpty: {
                    msg: 'Kode Lab harus diisi'
                }
            }
        },
        registrasi_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Registrasi ID harus diisi'
                },
                notEmpty: {
                    msg: 'Registrasi ID harus diisi'
                }
            }
        }
    }, {
        timestamps: false

    })

    return Transaksi
}