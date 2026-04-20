import express from "express";

const router = express.Router();

router.get("/", (req, res) => {
  res.json({
    message: "Movies route çalışıyor.",
    movies: [
      {
        id: 1,
        title: "Interstellar",
        genre: "Bilim Kurgu"
      },
      {
        id: 2,
        title: "Oppenheimer",
        genre: "Dram / Tarih"
      }
    ]
  });
});

export default router;