module.exports = (sequelize, Sequelize) => {
    const Provinsi = sequelize.define('provinsi', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            // autoIncrement: true
        },
        nama: {
            type: Sequelize.STRING
        },
        status: {
            type: Sequelize.BOOLEAN,
            allowNull: false,
            defaultValue: false
        }
    }, {
        timestamps: false,
        createdAt: false,
        updatedAt: false,
    })

    return Provinsi;
}