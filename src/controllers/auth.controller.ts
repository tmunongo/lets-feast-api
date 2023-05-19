import { Request, Response, Router } from "express";
var jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

// Prisma
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const router = Router();

const saltRounds = 10;

async function main() {
  router.get("/register", async (req: Request, res: Response) => {
    // get the user's details
    const { name, email, password } = req.body;

    const hashed = bcrypt.hash(password, saltRounds);

    const newUser = await prisma.user.create({
      data: {
        name: name,
        email: email,
        password: hashed,
      },
    });
  });
  router.get("/login", async (req: Request, res: Response) => {
    // get the user's details
    const { username, password } = req.body;

    console.log(`${username} is trying to login ..`);

    if (username === "admin" && password === "admin") {
      return res.json({
        token: jwt.sign({ user: "admin" }, process.env.JWT_SECRET),
      });
    }
  });
  router.get("/welcome", async (req: Request, res: Response) => {
    res.status(401).send("You must be logged in to continue!");
  });
}

main()
  .catch((e) => {
    console.log(e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

export default router;
