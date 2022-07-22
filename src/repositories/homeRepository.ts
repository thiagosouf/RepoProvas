import { client } from "../database.js";

export interface testsRepository {
    name: string,
    pdfUrl: string,
    category: string,
    discipline: string,
    teacher: string
}

export async function findTeacher(name:string) {
    return await client.teachers.findFirst({
        where: {name : name}
    })
}

export async function createTeacher(name:string) {
    return await client.teachers.create({
        data:{
            name:name
        }
    })
}

export async function findCategory(name:string) {
    return await client.categories.findFirst({
        where: {name : name}
    })
}

export async function findDiscipline(name:string) {
    return await client.disciplines.findFirst({
        where: {name : name}
    })
}

export async function createTeacherDiscipline(teacherId:number, disciplineId:number) {
    return await client.teachersDisciplines.create({
        data:{
            teacherId:teacherId,
            disciplineId:disciplineId
}})}

export async function findTeacherDiscipline(teacherId:number, disciplineId:number) {
    return await client.teachersDisciplines.findFirst({
        where: {teacherId : teacherId, disciplineId : disciplineId}
    })
}


export async function createTest(body:testsRepository, categoryId:number, teacherDisciplineId:number) {
    return await client.tests.create({
        data:{
            name:body.name,
            pdfUrl:body.pdfUrl,
            categoryId: categoryId,
            teacherDisciplineId: teacherDisciplineId
        }
    })
}