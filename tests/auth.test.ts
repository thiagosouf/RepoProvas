import app from '../src/app.js';
import supertest from 'supertest';
import {client} from "./../src/database.js"

const EMAIL = "super@test.com";
const PASSWORD = "1234567890";
const login = { email: EMAIL, password: PASSWORD }


describe("POST /signup", () => {
    it("returns 200 for valid input", async () => {
        await client.$executeRaw`DELETE FROM users WHERE email = 'super@test.com'`;
        const result = await supertest(app).post("/signup").send(login);

        const user =await client.users.findFirst({
            where:{ email: login.email }
        })
        
        expect(user.email).toEqual(login.email);
    });

    it("returns 409 for valid input", async () => {
        const result = await supertest(app).post("/signup").send(login);
        const status = result.status;
        
        expect(status).toEqual(409);
    });
});


describe("POST /login", () => {
    it("returns 200 for valid input", async () => {
        const result = await supertest(app).post("/").send(login);
        const status = result.status;
        
        expect(status).toEqual(200);
    });

    it("returns 404 for valid input", async () => {
        const err = {
            email: "erro@erro.com",
            password: "1234567890"
        }
        const result = await supertest(app).post("/").send(err);
        const status = result.status;
        
        expect(status).toEqual(404);
    });
});

afterAll(async ()=>{
    await  client.$disconnect();
})