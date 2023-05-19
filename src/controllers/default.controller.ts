import { Request, Response, Router } from "express";

// Prisma
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const router = Router();

async function main() {
  router.get("/", async (req: Request, res: Response) => {
    res.status(200).send("Welcome to this Express application");
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
