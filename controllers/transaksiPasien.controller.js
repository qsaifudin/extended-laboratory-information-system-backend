const db = require("../models");
const Pasien = db.transaksiPasien;
const Sequelize = require("sequelize");
const Op = Sequelize.Op;

module.exports = {
  onSearchPaginated: async (req, res) => {
    let { nama, sortBy, dates, isExport } = req.query;
    let sortDesc = req.query.sortDesc == "true" ? "DESC" : "ASC";

    const page = parseInt(req.query.page) || 1;
    let limit = parseInt(req.query.limit) || 10;
    limit = limit == -1 ? null : limit;

    const offset = (page - 1) * limit;
    let dataRs = [];
    let condition;

    let clearDate = [];
    if (dates) {
      clearDate = dates.split(",");
      clearDate[1] = clearDate[1] ? clearDate[1] : clearDate[0];
      clearDate.sort();
      const startDate2 = clearDate[0].split(/[- ]+/);
      const endDate = clearDate[1].split(/[- ]+/);

      clearDate[0] = new Date(startDate2[0], startDate2[1] - 1, startDate2[2]);
      clearDate[1] = new Date(
        endDate[0],
        endDate[1] - 1,
        endDate[2],
        +24,
        "",
        -1
      );
    }
    if (req.user.role == "vendor") {
      await db.vendor
        .findByPk(req.user.vendor_id, {
          include: [
            {
              model: db.rumahsakit,
              as: "rumah_sakit",
            },
          ],
        })
        .then((res) => {
          res.rumah_sakit.forEach((item, index) => {
            dataRs[index] = item.kode;
          });
          condition = nama
            ? {
                [Op.and]: [
                  {
                    nama: {
                      [Op.iLike]: `%${nama}%`,
                    },
                  },
                  {
                    waktu_terbit: dates
                      ? {
                          [Op.between]: clearDate,
                        }
                      : {
                          [Op.ne]: null,
                        },
                  },
                  {
                    kode_rs: {
                      [Op.iLike]: {
                        [Op.any]: dataRs,
                      },
                    },
                  },
                ],
              }
            : {
                [Op.and]: [
                  {
                    kode_rs: {
                      [Op.iLike]: {
                        [Op.any]: dataRs,
                      },
                    },
                  },
                  {
                    waktu_terbit: dates
                      ? {
                          [Op.between]: clearDate,
                        }
                      : {
                          [Op.ne]: null,
                        },
                  },
                ],
              };
        });
    } else {
      condition = nama
        ? {
            [Op.and]: [
              {
                nama: {
                  [Op.iLike]: `%${nama}%`,
                },
              },
              {
                waktu_terbit: dates
                  ? {
                      [Op.between]: clearDate,
                    }
                  : {
                      [Op.ne]: null,
                    },
              },
            ],
          }
        : {
            [Op.and]: [
              {
                nama: {
                  [Op.ne]: null,
                },
              },
              {
                waktu_terbit: dates
                  ? {
                      [Op.between]: clearDate,
                    }
                  : {
                      [Op.ne]: null,
                    },
              },
            ],
          };
    }

    const getPagingData = (results, page, limit) => {
      const { count: total, rows: data } = results;
      const totalPages = Math.ceil(total / limit);

      return {
        status: true,
        statusCode: 200,
        message: "Transaksi Pasien ditemukan",
        currentPage: page,
        totalPages,
        total,
        data,
      };
    };
    if (isExport == "false") {
      await Pasien.findAndCountAll({
        where: condition,
        limit,
        offset,
        distinct: true,
        order: [[sortBy, sortDesc]],
      })
        .then((data) => {
          if (data) {
            return res.status(200).json(getPagingData(data, page, limit));
          } else notFound("Pasien");
        })
        .catch((error) => {
          res.error500(error.message);
        });
    } else {
      await Pasien.findAll({
        where: condition,
        distinct: true,
        order: [[sortBy, sortDesc]],
        include: [
          {
            model: db.transaksiPemeriksaan,
            as: "pemeriksaan",
            on: {
              registrasi_id: Sequelize.where(
                Sequelize.col("t_pasien.id"),
                "=",
                Sequelize.col("pemeriksaan.registrasi_id")
              ),
              kode_rs: Sequelize.where(
                Sequelize.col("t_pasien.kode_rs"),
                "=",
                Sequelize.col("pemeriksaan.kode_rs")
              ),
              kode_lab: Sequelize.where(
                Sequelize.col("t_pasien.kode_lab"),
                "=",
                Sequelize.col("pemeriksaan.kode_lab")
              ),
            },
            attributes: ["nama"],
          },
        ],
      })
        .then((data) => {
          if (data) {
            return res.successGet("Pasien", data);
          } else notFound("Pasien");
        })
        .catch((error) => {
          res.error500(error.message);
        });
    }
  },

  getAll: async (req, res) => {
    await Pasien.findAll({
      order: [["id", "DESC"]],
    })
      .then((data) => {
        if (data) {
          res.successGet("Pasien", data);
        } else notFound("Pasien");
      })
      .catch((error) => {
        res.error500(error.message);
      });
  },

  find: async (req, res) => {
    await Pasien.findByPk(req.params.id, {
      include: [
        {
          model: db.transaksiPemeriksaan,
          as: "pemeriksaan",
          on: {
            registrasi_id: Sequelize.where(
              Sequelize.col("t_pasien.registrasi_id"),
              "=",
              Sequelize.col("pemeriksaan.registrasi_id")
            ),
            kode_rs: Sequelize.where(
              Sequelize.col("t_pasien.kode_rs"),
              "=",
              Sequelize.col("pemeriksaan.kode_rs")
            ),
            kode_lab: Sequelize.where(
              Sequelize.col("t_pasien.kode_lab"),
              "=",
              Sequelize.col("pemeriksaan.kode_lab")
            ),
          },
        },
      ],
      order: [
        [
          {
            model: db.transaksiPemeriksaan,
            as: "pemeriksaan",
          },
          "id",
          "DESC",
        ],
      ],
    })
      .then((data) => {
        if (data) {
          res.successGet("Pasien", data);
        } else res.notFound("Pasien");
      })
      .catch((error) => {
        res.error500(error.message);
      });
  },

  store: async (req, res) => {
    await Pasien.create(req.body)
      .then(() => {
        res.successStore("Pasien", req.body);
      })
      .catch((error) => {
        res.errorPost400(error.errors[0].message);
      });
  },

  update: async (req, res) => {
    await Pasien.update(req.body, {
      where: {
        id: req.params.id,
      },
    })
      .then(() => {
        res.successUpdate("Pasien", req.body);
      })
      .catch((error) => {
        res.errorPost400(error.errors[0].message);
      });
  },
};
