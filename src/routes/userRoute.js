import express from "express";
import {
  deleteAllOrder,
  deleteUser,
  findRateByUser,
  getLikeUser,
  order,
  signIn,
  signUp,
} from "../controllers/userController.js";

const userRoute = express.Router();

userRoute.post("/signup", signUp);

userRoute.get("/login", signIn);

userRoute.delete("/delete", deleteUser);

userRoute.post("/order/:food_id", order);

userRoute.get("/order/delete", deleteAllOrder);

userRoute.get("/getlikebyuser", getLikeUser);

userRoute.get("/getratebyuser", findRateByUser);

export default userRoute;
