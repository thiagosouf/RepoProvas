import { Request, Response } from "express";
import {registerService} from "../services/homeService.js"

export async function registerController(req:Request,res:Response){
    const token = req.headers.authorization;
    const result = await registerService(req.body,token) 
    res.status(200).send(result)
}