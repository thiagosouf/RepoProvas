import app from '../src/app.js';
import supertest from 'supertest';
import jwt from "jsonwebtoken";

const ID = 23;

const token = jwt.sign({ userId: ID }, process.env.SECRET);

describe("GET /disciplines", () => {
    it("returns 200", async () => {
    const result = await supertest(app).get("/disciplines")
    .set('Authorization', `${token}`)
    expect(result.status).toEqual(200);
    })

    it("returns 500", async () => {
        const result = await supertest(app).get("/disciplines")
        .set('Authorization', `${ID}`)
        expect(result.status).toEqual(500);
        })
})

describe("GET /teacher", () => {
    it("returns 200", async () => {
    const result = await supertest(app).get("/teacher")
    .set('Authorization', `${token}`)
    expect(result.status).toEqual(200);
    })

    it("returns 500", async () => {
        const result = await supertest(app).get("/teacher")
        .set('Authorization', `${ID}`)
        expect(result.status).toEqual(500);
        })
})