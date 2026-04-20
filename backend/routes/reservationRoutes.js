import express from "express";

const router = express.Router();

router.get("/", (req, res) => {
  res.json({
    message: "Reservations route çalışıyor.",
    reservations: [
      {
        id: 1,
        userId: 1,
        movieTitle: "Interstellar",
        date: "18 Nisan 2026",
        time: "17:00",
        hall: "Salon 5",
        seats: ["C2", "C3"],
        totalPrice: 380,
        status: "Onaylandı",
      },
    ],
  });
});

router.post("/", (req, res) => {
  const { movieId, showtimeId, seats, totalPrice } = req.body;

  res.json({
    message: "Rezervasyon oluşturuldu (test).",
    reservation: {
      movieId,
      showtimeId,
      seats,
      totalPrice,
    },
  });
});

export default router;