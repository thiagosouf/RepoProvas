import { client } from "../database.js";

export async function findByDiscipline() {
    const tests = await client.terms.findMany({
        include: {
            disciplines: {
                select: {
                    name: true,
                    teachersDisciplines: {
                        select: {
                            tests: {
                                include: {
                                    category: true,
                    teachersDisciplines: {
                        select: {
                            teachers: {
                                select: {
                                    name: true
                                }
                            }
                        }
                    }
                                }
                            }
                        }
                    }
                }
            }

        }
    })
    return tests
}

// export async function findByTeacher(){
//     const tests = await client.teachersDisciplines.findMany({
//         include: {
//             disciplines:{
//                 include:{
//                     terms:{},
//                 },
//             },
//             teachers:{},
//             tests:{
//                 include:{
//                     category:{},
//                 },
//             },
//         },
//     });
//     return tests;
// }

export async function findByTeacher() {
    const tests = await client.teachers.findMany({
        include: {
            teachersDisciplines:{
                select:{
                    disciplines:{
                        select:{
                            name:true,
                            terms:{
                                select:{
                                    number:true},}}},
                    tests: {
                        include: {
                            category: true
                                }
                            }
                        }
                    }
                }
            })
            
    return tests
}