module.exports = (sequelize, Sequelize) => {
    const Kecamatan = sequelize.define('kecamatan', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            // autoIncrement: true
        },
        kota_id: {
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

    return Kecamatan;
}