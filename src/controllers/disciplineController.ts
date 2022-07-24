import { Request, Response } from "express";
import {getDisciplineService} from "../services/disciplineService.js"

export async function disciplineController(req:Request,res:Response){
    const token = req.headers.authorization;
    const result = await getDisciplineService(token) 
    res.status(200).send(result)
} 