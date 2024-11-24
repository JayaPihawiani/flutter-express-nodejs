import NoteController from "../controller/NoteController.js";
import express from "express";
import Note from "../models/Note.js";

const router = express.Router();
const note = new NoteController(Note);

router.post("/", note.createNote);
router.get("/", note.getNote);
router.get("/:id", note.getNoteById);
router.delete("/:id", note.deleteNote);
router.patch("/:id", note.updateNote);

export default router;
