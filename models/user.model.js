module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define('user', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nama: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notEmpty: {
                    msg: 'Nama harus diisi'
                },
                len: {
                    args: [3, 255],
                    msg: ' Nama harus lebih dari 2 Karakter'
                }
            }
        },
        username: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notEmpty: {
                    msg: 'Username harus diisi'
                },
                len: {
                    args: [3, 50],
                    msg: 'Username harus lebih dari 2 Karakter'
                }
            }
        },
        password: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notEmpty: {
                    msg: 'Password harus diisi'
                },
                len: {
                    args: [8, 100],
                    msg: 'Password harus lebih dari 8 Karakter'
                }
            }
        },
        role_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            validate: {
                notEmpty: {
                    msg: 'Role harus diisi'
                },
            }
        },
        vendor_id: {
            type: Sequelize.INTEGER,
        },
    }, {
        timestamps: false,
        createdAt: false,
        updatedAt: false,
    })

    return User;
}