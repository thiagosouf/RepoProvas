import { client } from "../database.js";

export async function findByDiscipline() {
    const tests = await client.terms.findMany({
        include:{
            disciplines:{
                select:{
                    name:true,
                    teachersDisciplines:{
                        select:{
                            tests:{
                                include:{
                                    category:true,
                                    teachersDisciplines:{
                                        select:{
                                            teachers:{
                                                select:{
                                                    name:true
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
console.log("oi")
    return tests
}