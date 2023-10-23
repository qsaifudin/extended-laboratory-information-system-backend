module.exports = (sequelize, Sequelize) => {
    const Pemeriksaan = sequelize.
    define('t_pemeriksaan', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        kode: {
            type: Sequelize.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kode harus diisi'
                },
                notEmpty: {
                    msg: 'Kode harus diisi'
                }
            }
        },
        nama: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Nama harus diisi'
                },
                notEmpty: {
                    msg: 'Nama harus diisi'
                }
            }
        },
        satuan: {
            type: Sequelize.STRING(50),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Satuan harus diisi'
                },
                notEmpty: {
                    msg: 'Satuan harus diisi'
                }
            }
        },
        metode: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Metode harus diisi'
                },
                notEmpty: {
                    msg: 'Metode harus diisi'
                }
            }
        },
        no_urut: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'No Urut harus diisi'
                },
                notEmpty: {
                    msg: 'No Urut harus diisi'
                },
                isInt: {
                    msg: 'No Urut hanya berisi angka'
                }
            }
        },
        kategori_pemeriksaan: {
            type: Sequelize.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kategori Pemeriksaan harus diisi'
                },
                notEmpty: {
                    msg: 'Kategori Pemeriksaan harus diisi'
                }
            }
        },
        kategori_no_urut: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Kategori No Urut harus diisi'
                },
                notEmpty: {
                    msg: 'Kategori No Urut harus diisi'
                }
            }
        },
        subkategori_pemeriksaan: {
            type: Sequelize.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Subkategori Pemeriksaan harus diisi'
                },
                notEmpty: {
                    msg: 'Subkategori Pemeriksaan harus diisi'
                }
            }
        },
        subkategori_no_urut: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Subkategori No Urut harus diisi'
                },
                notEmpty: {
                    msg: 'Subkategori No Urut harus diisi'
                }
            }
        },
        catatan: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Catatan tidak boleh Null'
                }
            }
        },
        is_duplo: {
            type: Sequelize.BOOLEAN,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Is Duplo harus diisi'
                },
                notEmpty: {
                    msg: 'Is Duplo harus diisi'
                }
            }
        },
        total_duplo: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Total Duplo harus diisi'
                },
                notEmpty: {
                    msg: 'Total Duplo harus diisi'
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
            }
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

    return Pemeriksaan
}