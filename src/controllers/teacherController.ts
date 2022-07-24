import { Request, Response } from "express";
import {getTeacherService} from "../services/teacherService.js"

export async function teacherController(req:Request,res:Response){
    const token = req.headers.authorization;
    const result = await getTeacherService(token) 
    res.status(200).send(result)
} 