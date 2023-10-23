module.exports = (sequelize, Sequelize) => {
    const KategoriRs = sequelize.define('kategori_rs', {
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
                    msg: 'Nama Kategori RS harus diisi'
                },
            }
        },
        status: {
            type: Sequelize.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },

    }, {
        timestamps: false,
        createdAt: false,
        updatedAt: false,
    })

    return KategoriRs;
}