import dotenv from "dotenv";
dotenv.config();

export default {
  database: process.env.DB_DATABASE,
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  pass: process.env.DB_PASSWORD,
  dialect: process.env.DB_DIALECT,
  port: process.env.DB_PORT,
  secret_string: process.env.SECRET_STRING,
  backend_port: process.env.PORT,
};
