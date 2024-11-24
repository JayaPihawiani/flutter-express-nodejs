import Note from "../models/Note.js";

class NoteController {
  constructor(model) {
    this.note = model;
  }

  createNote = async (req, res) => {
    const { name, desc } = req.body;

    if (!name || !desc)
      return res.status(400).json({ msg: "Field ada yang kosong!" });

    try {
      await Note.create({ name, desc });
      res.status(201).json({ msg: "Berhasil membuat Note." });
    } catch (error) {
      res.json(error.message);
    }
  };

  getNote = async (req, res) => {
    try {
      const response = await this.note.findAll({
        attributes: ["id", "name", "desc", "createdAt"],
        order: [["id", "DESC"]],
      });

      const formatted = response.map((e) => ({
        ...e.dataValues,
        createdAt: e.createdAt.toLocaleString().split(",")[0],
      }));
      res.status(200).json(formatted);
    } catch (error) {
      res.json(error.message);
    }
  };

  getNoteById = async (req, res) => {
    try {
      const response = await Note.findOne({ where: { id: req.params.id } });
      if (!response) return res.sendStatus(404);
      res.status(200).json(response);
    } catch (error) {
      res.json(error.message);
    }
  };

  deleteNote = async (req, res) => {
    try {
      const response = await Note.findOne({ where: { id: req.params.id } });
      if (!response) return res.sendStatus(404);
      await Note.destroy({ where: { id: response.id } });
      res.status(200).json({ msg: "Berhasil menghapus Note!" });
    } catch (error) {
      res.json(error.message);
    }
  };

  updateNote = async (req, res) => {
    const { name, desc } = req.body;
    try {
      const response = await Note.findOne({ where: { id: req.params.id } });
      if (!response) return res.sendStatus(404);
      await Note.update({ name, desc }, { where: { id: response.id } });
      res.status(200).json({ msg: "Berhasil update Note." });
    } catch (error) {
      res.json(error.message);
    }
  };
}

export default NoteController;
