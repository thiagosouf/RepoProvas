import { Router } from "express";
import { registerController } from "../controllers/homeController.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { registerSchema } from "../schemas/registerSchema.js";

const homeRouter = Router();

homeRouter.post('/register', validateSchema(registerSchema), registerController);

export default homeRouter;