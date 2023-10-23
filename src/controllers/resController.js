import sequelize from "../models/connects.js";
import initModels from "../models/init-models.js";

import { checkToken } from "../config/jwt.js";

let model = initModels(sequelize);

const createLike = async (req, res) => {
  try {
    const { like_stat } = await req.body;
    const res_id = await Number(req.params.res_id);
    const { user_id } = await checkToken(req.headers.token).data;
    const checkExisted = await model.like_res.findOne({
      where: {
        res_id,
        user_id,
      },
    });
    if (!checkExisted) {
      let date = new Date();

      const mySQLDateString = await date
        .toJSON()
        .slice(0, 19)
        .replace("T", " ");
      const newLike = {
        user_id,
        res_id,
        like_stat,
        date_like: mySQLDateString,
      };
      console.log(newLike);
      await model.like_res.create(newLike);
      res.status(201).send("Da Like");
    } else {
      const like = 1;
      const dislike = 0;
      if (checkExisted.dataValues.like_stat === like) {
        let date = new Date();

        const mySQLDateStringUpdate = await date
          .toJSON()
          .slice(0, 19)
          .replace("T", " ");

        const updateLike = await {
          ...checkExisted.dataValues.like_stat,
          date_like: mySQLDateStringUpdate,
          like_stat: dislike,
        };
        updateLike;
        await model.like_res.update(updateLike, {
          where: {
            user_id,
            res_id,
          },
        });
        res.status(200).send("Da cap nhat thanh cong");
      } else {
        let date = new Date();

        const mySQLDateStringUpdate = await date
          .toJSON()
          .slice(0, 19)
          .replace("T", " ");

        const updateLike = await {
          ...checkExisted.dataValues.like_stat,
          date_like: mySQLDateStringUpdate,
          like_stat: like,
        };
        console.log(updateLike);
        await model.like_res.update(updateLike, {
          where: {
            user_id,
            res_id,
          },
        });
        res.status(200).send("Da cap nhat thanh cong");
      }

      res.send();
    }
  } catch (e) {
    res.status(401).send(e);
  }
};

//lay danh sach like theo nha hang
const getLikeRes = async (req, res) => {
  try {
    const { res_id } = req.params;
    const resLikeList = await model.like_res.findAll({
      where: {
        res_id,
      },
    });

    if (!resLikeList.length) {
      res.status(404).send({ message: "Not Found!" });
    } else {
      res.status(200).send(resLikeList.map((item) => item.dataValues));
    }
  } catch (e) {
    res.status(400).send(e);
  }
};

const createRateRes = async (req, res) => {
  try {
    const { token } = await req.headers;
    const res_id = await req.params;
    const { user_id } = await checkToken(token).data;
    const amount = await req.body;
    const date = new Date();
    const date_rate = await date.toJSON().slice(0, 19).replace("T", " ");
    const newRate = {
      res_id,
      user_id,
      amount,
      date_rate,
    };

    const rateExisted = await model.rate_res.findAll({
      where: {
        user_id,
        res_id,
      },
    });
    if (rateExisted.length !== 0) {
      return res.status(400).send({
        message: "Rate existed!",
      });
    }
    await model.rate_res.create(newRate);
    res.status(201).send({ messs: "Rate successfully!" });
  } catch (e) {
    res.status(401).send({ mess: "Unauthorized" });
  }
};
const findRateByRes = async (req, res) => {
  try {
    const res_id = await req.params;
    const rateList = await model.rate_res.findAll({
      where: {
        res_id,
      },
    });
    if (rateList.length === 0) {
      res.status(404).send({ mess: "Not Found" });
    } else {
      const newRateList = rateList.map((item) => item.dataValues);
      res.status(200).send(newRateList);
    }
  } catch (err) {
    res.status(400).send({ mess: "Bad request" });
  }
};

export { createLike, getLikeRes, createRateRes, findRateByRes };
