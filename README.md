## ExpressJS Boilerplate with TypeScript and Prisma Integration

This is my go-to boilerplate for building REST APIs with ExpressJS, TypeScript, and Prisma. The project includes a scalable directory structure and configurations for development and production environments.

### Getting Started

To get started with the project, clone the repository and install the dependencies:

`git clone <repository_url>`
`cd express-ts-prisma-boilerplate`
`npm install`

### Database Configuration

The boilerplate is integrated with Prisma for database management. To set up the database:

    Copy the *.env.example* file in the project directory and add your database configuration as shown below:

    `DATABASE_URL="postgresql://user:password@localhost:5432/dbname?schema=public"`

Replace user, password, and dbname with your own database credentials.

Run the following command to create the database schema:

`npx prisma migrate dev --name init`

### Starting the Server

To start the server in development mode:

`npm run dev`

To start the server in production mode:

`npm run build`
`npm start`

### Project Structure

The project is structured in a scalable and modular way to make it easy to add new features and components. Here is an overview of the directory structure:

.
├── src
│ ├── config
│ │ ├── config.ts
│ │ ├── constants.ts
│ │ ├── env.ts
│ │ ├── middlewares.ts
│ │ └── routes.ts
│ ├── controllers
│ │ └── default.controller.ts
│ ├── prisma
│ │ ├── migrations
│ │ ├── models
│ │ ├── seeders
│ │ └── prisma.ts
│ ├── utils
│ ├── middlewares
│ │ └── index.ts
│ ├── routes
│ │ └── index.ts
│ ├── types
│ ├── app.ts
│ └── server.ts
├── .env.example
├── .gitignore
├── package.json
├── README.md
├── tsconfig.json
└── yarn.lock

### Coming Soon

- Looking to create branches for tRPC and GraphQL, too.
- Will create authentication branches set up to work with jwt authentication, cookie-based authentication, and other methods like NextAuth.

### Contributing

Contributions are welcome!

### License

This project is licensed under the MIT License.
