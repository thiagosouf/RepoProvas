import app from '../src/app.js';
import supertest from 'supertest';
import {client} from "./../src/database.js"
import jwt from "jsonwebtoken";

const ID= 23;
const NAME="exemplo teste";
const PDFURL="https://www.google.com";
const CATEGORY="Recuperação";
const DISCIPLINE="Humildade";
const TEACHER="Bruna Hamori";
const modelo = {name: NAME, pdfUrl: PDFURL, category: CATEGORY, discipline: DISCIPLINE, teacher: TEACHER}

const login = {email: "super@test.com", password: "1234567890"}

const err = {name: "exemplo teste", pdfUrl: "https://www.com.com"}

const token = jwt.sign({ userId: ID }, process.env.SECRET);

beforeEach(async()=>{
    await client.$executeRaw`DELETE FROM tests WHERE name = 'exemplo teste'`;
})

describe("PUSH /register", () => {
    it("returns 500 no token", async () => {
    const result = await supertest(app).post("/register")
    .send(modelo)
    expect(result.status).toEqual(500);
    })

    it("returns 422 invalid category", async () => {
        const result = await supertest(app).post("/register")
        .set('Authorization', `${token}`)
        .send({name: "exemplo teste", pdfUrl: "https://www.com.com", category: "ERRO", discipline: "JavaScript", teacher: "Diego Pinho"})
        expect(result.status).toEqual(422);
    })
    
    it("returns 422 invalid discipline", async () => {
        const result = await supertest(app).post("/register")
        .set('Authorization', `${token}`)
        .send({name: "exemplo teste", pdfUrl: "https://www.com.com", category: "Prática", discipline: "ERRO", teacher: "Diego Pinho"})
        expect(result.status).toEqual(422);
    })

    it("returns 422 invalid teacher", async () => {
        const result = await supertest(app).post("/register")
        .set('Authorization', `${token}`)
        .send({name: "exemplo teste", pdfUrl: "https://www.com.com", category: "Prática", discipline: "JavaScript", teacher: "ERRO"})
        expect(result.status).toEqual(422);
    })

    it("returns 422 invalid data", async () => {
        const result = await supertest(app).post("/register")
        .set('Authorization', `${token}`)
        .send({name: "", pdfUrl: "", category: "", discipline: "", teacher: ""})
        expect(result.status).toEqual(422);
    })

    it("returns 200 invalid teacher", async () => {
        const result = await supertest(app).post("/register")
        .set('Authorization', `${token}`)
        .send({name: "exemplo teste", pdfUrl: "https://www.com.com", category: "Prática", discipline: "JavaScript", teacher: "Diego Pinho"})
        expect(result.status).toEqual(200);
    })
})

afterAll(async ()=>{
    await  client.$disconnect();
})
