import { checkToken, createToken } from "../config/jwt.js";
import sequelize from "../models/connects.js";
import initModels from "../models/init-models.js";
import bcrypt from "bcrypt";

// ket noi model voi database
let model = initModels(sequelize);

// create sign up controller

const signUp = async (req, res) => {
  try {
    let { full_name, email, password } = await req.body;
    console.log(full_name, email, password);
    let checkEmail = await model.users.findAll({
      where: {
        email: email,
      },
    });
    if (checkEmail.length !== 0) {
      res.status(400).send("Email existed!");
      return;
    }
    let newPass = bcrypt.hashSync(password, 10);
    let newUser = {
      full_name,
      email,
      password: newPass,
    };
    await model.users.create(newUser);
    res.status(201).send(newUser);
  } catch (err) {
    res.status(400).send(err);
  }
};

//Dang nhap
const signIn = async (req, res) => {
  const { email, password } = await req.body;
  const user = await model.users.findOne({ where: { email } });
  if (!user) {
    res.status(404).send("Wrong email");
    return;
  }

  let checkPassword = await bcrypt.compareSync(password, user.password);
  if (!checkPassword) {
    res.status(404).send("Wrong password");
    return;
  }
  let token = await createToken(user);
  res.setHeader("token", token);
  res.status(200).send("Login thanh cong");
};

// Order
const order = async (req, res) => {
  try {
    const token = await req.headers.token;
    const tokenChecked = await checkToken(token);
    const { data } = await tokenChecked;
    const { amount, code, arr_sub_id } = req.body;
    let food_id = await Number(req.params.food_id);

    let date = new Date();

    const mySQLDateString = await date.toJSON().slice(0, 19).replace("T", " ");

    const order = {
      user_id: data.user_id,
      date_order: mySQLDateString,
      food_id,
      amount,
      code,
      arr_sub_id,
    };

    await model.orders.create(order);
    res.status(201).send("Order successfully");
  } catch (e) {
    res.status(401).send({ message: "Unauthorized!" });
  }
};

const deleteAllOrder = async (req, res) => {
  await model.orders.destroy({
    where: {},
  });
  return res.send("xoa thanh cong het order");
};
//xoa user
const deleteUser = async (req, res) => {
  try {
    const { email } = await req.body;
    const isExisted = await model.users.findOne({
      where: {
        email,
      },
    });
    if (!isExisted) {
      res.status(404).send("Not Found");
      return;
    }
    await model.users.destroy({
      where: {
        email,
      },
    });
    res.status(200).send("Da xoa");
  } catch (err) {
    res.send(err);
  }
};

const getLikeUser = async (req, res) => {
  try {
    const { token } = await req.headers;
    const { data } = await checkToken(token);
    const userLikeList = await model.like_res.findAll({
      where: {
        user_id: data.user_id,
      },
    });

    // const newList = userLikeList.map((item) => item.dataValues);
    if (!userLikeList.length) {
      res.status(404).send({ message: "Not Found!" });
    } else {
      res.status(200).send(userLikeList.map((item) => item.dataValues));
    }
  } catch (e) {
    res.status(400).send(e);
  }
};
const findRateByUser = async (req, res) => {
  try {
    const { token } = await req.headers;
    const user_id = await checkToken(token).data;
    const rateList = await model.rate_res.findAll({
      where: {
        user_id,
      },
    });
    if (rateList.length === 0) {
      res.status(404).send({ message: "Not Found" });
    } else {
      const newRateList = rateList.map((item) => item.dataValues);
      res.status(200).send(newRateList);
    }
  } catch (e) {
    res.status(401).send({ message: "Unauthorized!" });
  }
};

export {
  signUp,
  signIn,
  deleteUser,
  order,
  deleteAllOrder,
  getLikeUser,
  findRateByUser,
};
