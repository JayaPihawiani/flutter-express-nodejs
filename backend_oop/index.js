import express from "express";
import cors from "cors";
import db from "./config/Database.js";
import router from "./router/NoteRouter.js";
// import Note from "./models/Note.js";

try {
  await db.authenticate();
  console.log("Database connected");
  //   await Note.sync({ alter: true });
} catch (error) {
  console.log(error.message);
}

const app = express();

app.use(cors());
app.use(express.json());

// routing
app.use("/note", router);

app.listen(5000, () => console.log("Server running on port 5000"));
