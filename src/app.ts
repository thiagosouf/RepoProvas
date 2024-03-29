import cors from 'cors';
import express, { json } from 'express';
import "express-async-errors";
import router from "./routers/routers.js";
import { errorHandlerMiddleware } from "./middlewares/errorHandlerMiddleware.js";


const app = express();
app.use(cors());
app.use(json());
app.use(router);
app.use(errorHandlerMiddleware);

export default app