import db from "../config/Database.js";
import { DataTypes } from "sequelize";

const Note = db.define(
  "note",
  {
    name: DataTypes.STRING,
    desc: DataTypes.STRING,
  },
  { freezeTableName: true }
);

export default Note;
