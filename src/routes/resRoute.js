import express from "express";
import {
  createLike,
  createRateRes,
  findRateByRes,
  getLikeRes,
} from "../controllers/resController.js";

const resRoute = express.Router();

resRoute.post("/likeornot/:res_id", createLike);

resRoute.get("/getlikebyres/:res_id", getLikeRes);

resRoute.post("/rateres/res", createRateRes);

resRoute.get("/findratebyres", findRateByRes);
export default resRoute;
