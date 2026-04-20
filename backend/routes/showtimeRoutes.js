import express from "express";

const router = express.Router();

router.get("/", (req, res) => {
  res.json({
    message: "Showtimes route çalışıyor.",
    showtimes: [
      {
        id: 1,
        movieId: 1,
        hall: "Salon 1",
        date: "16 Nisan 2026",
        time: "13:00",
        price: 180,
        format: "2D",
      },
      {
        id: 2,
        movieId: 1,
        hall: "Salon 2",
        date: "16 Nisan 2026",
        time: "16:30",
        price: 220,
        format: "IMAX",
      },
      {
        id: 3,
        movieId: 2,
        hall: "Salon 3",
        date: "16 Nisan 2026",
        time: "20:00",
        price: 200,
        format: "3D",
      },
    ],
  });
});

router.get("/:id", (req, res) => {
  const { id } = req.params;

  res.json({
    message: `Showtime detail endpoint çalışıyor. Seans id: ${id}`,
  });
});

export default router;