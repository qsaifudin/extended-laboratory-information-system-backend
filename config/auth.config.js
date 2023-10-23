module.exports = {
    // Akses token expired dalam satu jam
    jwtAccessSecret: "Adam_Labs_Secret_Key",
    jwtAccessExpiration: 3600,

    // Akses token expired dalam 2 hari
    jwtRefreshSecret: "Adam_Labs_Refresh_Secret_Key",
    jwtRefreshExpiration: 86400 * 2
}