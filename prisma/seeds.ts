import { client } from "../src/database.js"
import bcrypt from "bcrypt";


// create admin user
async function main(){
  const SALT = 10;
  const hashedPassword = bcrypt.hashSync("admin", SALT);

	// cria se já não existe -> se já existe, faz nada
  await client.users.upsert({
    where: { email: "admin@admin.com" },
    update: {},
    create: {
      email: "admin@admin.com",
      password: hashedPassword
    }
  });

  await client.terms.createMany({
      data:[
          {number:1},
          {number:2},
          {number:3},
          {number:4},
          {number:5},
          {number:6}
    ]
  })

  await client.categories.createMany({
      data:[
          {name:"Projeto"},
          {name:"Prática"},
          {name:"Recuperação"}
      ]
  })

  await client.teachers.createMany({
      data:[
          {name:"Diego Pinho"},
          {name:"Bruna Hamori"}
      ]
  })

  await client.disciplines.createMany({
      data:[
          {name:"HTML e CSS",termId:1},
          {name:"JavaScript",termId:2},
          {name:"React",termId:3},
          {name:"Humildade",termId:1},
          {name:"Planejamento",termId:2},
          {name:"Autoconfiança",termId:3}
      ]
  })

  await client.teachersDisciplines.createMany({
      data:[
          {teacherId:1, disciplineId:1},
          {teacherId:1, disciplineId:2},
          {teacherId:1, disciplineId:3},
          {teacherId:2, disciplineId:4},
          {teacherId:2, disciplineId:5},
          {teacherId:2, disciplineId:6},
      ]
  })
}

main().catch(e => {
  console.log(e);
  process.exit(1);
}).finally(async () => {
  await client.$disconnect();
})