import { Request, Response, Router } from "express";
var jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

// Prisma
import prisma from "../../prisma";

const router = Router();

const saltRounds = 10;

async function main() {
  router.post("/register", async (req: Request, res: Response) => {
    // get the user's details
    const { name, email, password, username } = req.body;

    const hashed = await bcrypt.hash(password, saltRounds);

    const newUser = await prisma.user.create({
      data: {
        email: email,
        username: username,
        fullName: name,
        password: hashed,
      },
    });

    return res.json({
      token: jwt.sign({ user: newUser.email }, process.env.JWT_SECRET),
    });
  });
  router.post("/login", async (req: Request, res: Response) => {
    // get the user's details
    const { email, password } = req.body;

    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });

    let authUser = false;

    if (user) {
      // check their password
      authUser = bcrypt.compare(
        password,
        user.password,
        function (err: { status: number }, result: any) {
          if (err) {
            return res
              .status(err.status)
              .json({ error: "An error occured, please try again later." });
          }
          if (result) {
            return res.json({
              token: jwt.sign({ user: user?.email }, process.env.JWT_SECRET),
            });
          } else {
            return res.status(403).json({ error: "Password does not match." });
          }
        }
      );
    }
  });
  router.get("/welcome", async (req: Request, res: Response) => {
    res.status(200).json({ message: "You are logged in if you can see this!" });
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
