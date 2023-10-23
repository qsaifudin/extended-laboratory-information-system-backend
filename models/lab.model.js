module.exports = (sequelize, Sequelize) => {
    const Lab = sequelize.define('lab', {
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
                    msg: 'Kode Lab harus diisi'
                },
                notEmpty: {
                    msg: 'Kode Lab harus diisi'
                },
                len: {
                    args: [3, 100],
                    msg: 'Kode Lab harus lebih dari 2 Karakter'
                }
            }
        },

        nama: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true,
            validate: {
                notNull: {
                    msg: 'Nama Lab harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Nama Lab harus diisi'
                },
                len: {
                    args: [3, 255],
                    msg: 'Nama Lab harus lebih dari 2 Karakter'
                }
            }
        },
        rs_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'ID Rumah Sakit pada Lab harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'ID Rumah Sakit pada Lab harus diisi'
                },
                isInt: {
                    args: true,
                    msg: 'RS ID hanya berisi angka'
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

    return Lab
}