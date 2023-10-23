import jwt from "jsonwebtoken";
import config from "./config.js";

//create token
const createToken = (data) => {
  let token = jwt.sign({ data }, config.secret_string, {
    algorithm: "HS256",
    expiresIn: "60d",
  });
  // console.log(token);
  return token;
};

const checkToken = (data) => {
  let token = jwt.verify(data, config.secret_string);
  return token;
};

export { createToken, checkToken };
