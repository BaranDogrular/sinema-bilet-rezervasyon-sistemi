export const getAllReservations = (req, res) => {
  res.json({
    reservations: [
      {
    id: 1,
    userId: 1,
    movieTitle: "Dune: Part Two",
    date: "15 Nisan 2026",
    time: "16:30",
    hall: "Salon 3",
    seats: ["A4", "A5"],
    totalPrice: 440,
    status: "Onaylandı",
  },
  {
    id: 2,
    userId: 1,
    movieTitle: "Interstellar",
    date: "18 Nisan 2026",
    time: "17:00",
    hall: "Salon 5",
    seats: ["C2", "C3", "C4"],
    totalPrice: 570,
    status: "Onaylandı",
  },
    ],
  });
};

export const getReservationById = (req, res) => {
  const { id } = req.params;

  res.json({
    id: Number(id),
    userId: 1,
    movieTitle: "Project Hail Mary",
    date: "18 Nisan 2026",
    time: "17:00",
    hall: "Salon 5",
    seats: ["C2", "C3"],
    totalPrice: 380,
    status: "Onaylandı",
  });
};

export const createReservation = (req, res) => {
  const { movieId, showtimeId, seats, totalPrice } = req.body;

  res.json({
    message: "Rezervasyon oluşturuldu (test).",
    reservation: {
      id: Date.now(),
      movieId,
      showtimeId,
      seats,
      totalPrice,
      status: "Onaylandı",
    },
  });
};