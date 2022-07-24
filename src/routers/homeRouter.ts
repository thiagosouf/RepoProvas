import { Router } from "express";
import { registerController } from "../controllers/homeController.js";
import { disciplineController } from "../controllers/disciplineController.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { registerSchema } from "../schemas/registerSchema.js";

const homeRouter = Router();

homeRouter.post('/register', validateSchema(registerSchema), registerController);
homeRouter.get('/disciplines', disciplineController)
// homeRouter.get('/home/teacher', teacherController)

export default homeRouter;