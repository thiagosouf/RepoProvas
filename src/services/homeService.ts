import { conflictError, notFoundError, unauthorizedError, unprocessableError } from "../utils/errorUtils.js";
import * as repo from "../repositories/homeRepository.js"
import validToken from "../utils/utils.js"

export async function registerService(body:repo.testsRepository,token:string){
    const userId = validToken(token)
    if(!userId)
        throw unauthorizedError();
    const {name, pdfUrl, category, discipline, teacher} = body
    const findTeacher =  await repo.findTeacher(teacher)
    if(!findTeacher)
        throw unprocessableError("Teacher not found");
    const findCategory = await repo.findCategory(category)
    if(!findCategory)
        throw unprocessableError("Category not found");
    const findDiscipline = await repo.findDiscipline(discipline)
    if(!findDiscipline)
        throw unprocessableError("Discipline not found");
    const teacherId = findTeacher.id
    const disciplineId = findDiscipline.id
    const categoryId = findCategory.id
    const findTeacherDiscipline = await repo.findTeacherDiscipline(teacherId, disciplineId)
    if(!findTeacherDiscipline)
        throw unprocessableError("TeacherDiscipline not found");

    const result = await repo.createTest(body, categoryId, findTeacherDiscipline.id)
    if(!result)
        throw unprocessableError("Test not created");
    return result
}