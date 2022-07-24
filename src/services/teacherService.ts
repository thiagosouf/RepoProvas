import { conflictError, notFoundError, unauthorizedError, unprocessableError } from "../utils/errorUtils.js";
import * as repo from "../repositories/findTestRepository.js"
import validToken from "../utils/utils.js"

export async function getTeacherService(token:string){
    const userId = validToken(token)
    if(!userId)
        throw unauthorizedError();
    const result = await repo.findByTeacher()
    if(!result)
        throw notFoundError("Teacher not found");
    return result
}