import jwt from "jsonwebtoken";
import { conflictError, notFoundError, unauthorizedError, unprocessableError } from "../utils/errorUtils.js";
import * as repo from "../repositories/authRepository.js";

export type CreateSignupData = Omit<repo.UserRepository, "confirmPassword">;
export type CreateLoginData = Omit<repo.UserRepository, "confirmPassword" | "id">;
 
export async function signupService(signupData: CreateSignupData) {
    const usuarioCadastrado = await repo.findUserByEmail(signupData.email)
    if (usuarioCadastrado)
        throw conflictError()
    const cadastro = await repo.createUser(signupData)  
}

export async function loginService(loginData:CreateLoginData){
    const loginUsuario = await repo.findUserByEmail(loginData.email)
    if (!loginUsuario)
        throw notFoundError()
    const check = await repo.checkLogin(loginData.password, loginUsuario.password)
    if (!check)
        throw unauthorizedError()
    const token = jwt.sign({ userId: loginUsuario.id }, process.env.SECRET);
    return token
}

