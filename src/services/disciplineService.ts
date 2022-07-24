import { conflictError, notFoundError, unauthorizedError, unprocessableError } from "../utils/errorUtils.js";
import * as repo from "../repositories/findTestRepository.js"
import validToken from "../utils/utils.js"

export async function getDisciplineService(token:string){
    const userId = validToken(token)
    if(!userId)
        throw unauthorizedError();
    console.log("aqui")
    const result = await repo.findByDiscipline()
    if(!result)
        throw notFoundError("Discipline not found");
    return result
}