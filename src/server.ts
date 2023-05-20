import dotenv from "dotenv";
import express, { Express, NextFunction } from "express";
import routes from "./routes";
var jwt = require("jsonwebtoken");

declare global {
  namespace Express {
    interface Request {
      user?: { [key: string]: any };
    }
  }
}

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded());

// Middleware to check and verify JWT token
app.use((req, res, next: NextFunction) => {
  // Exclude authentication requirement for certain routes
  const excludedRoutes = ["/api/register", "/api/login"];
  if (excludedRoutes.includes(req.path)) {
    return next();
  }

  const authorizationHeader = req.headers.authorization;

  if (authorizationHeader && authorizationHeader.startsWith("Bearer ")) {
    const token = authorizationHeader.split(" ")[1];

    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      req.user = decoded; // Add the user to the request object's context
      next();
    } catch (error) {
      res.status(401).json({ error: "Invalid token" });
    }
  } else {
    res.status(401).json({ error: "You must be logged in to see this" });
  }
});

app.use("/api", routes);

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
