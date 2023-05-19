import { Router } from "express";
import authController from "../controllers/auth.controller";
import defaultController from "../controllers/default.controller";

const api = Router().use(defaultController).use(authController);

export default Router().use("/", api);
