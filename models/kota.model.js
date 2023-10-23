module.exports = (sequelize, Sequelize) => {
    const Kota = sequelize.define('kota', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            // autoIncrement: true
        },
        provinsi_id: {
            type: Sequelize.INTEGER
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

    return Kota;
}