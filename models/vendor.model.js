module.exports = (sequelize, Sequelize) => {
    const Vendor = sequelize.define('vendor', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nama: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true,
            validate: {
                notNull: {
                    msg: 'Nama Vendor harus diisi'
                },
                notEmpty: {
                    args: true,
                    msg: 'Nama Vendor harus diisi'
                },
                len: {
                    args: [3, 255],
                    msg: 'Nama Vendor harus lebih dari 2 karakter'
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
                }
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
        status: {
            type: Sequelize.BOOLEAN,
            allowNull: false,
            defaultValue: false,
        },

    }, {
        timestamps: false
    })

    return Vendor;
}