let reservations = [
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
];

export const getAllReservations = (req, res) => {
  res.json({
    reservations,
  });
};

export const getReservationById = (req, res) => {
  const { id } = req.params;

  const reservation = reservations.find((item) => item.id === Number(id));

  if (!reservation) {
    return res.status(404).json({ message: "Rezervasyon bulunamadı." });
  }

  res.json(reservation);
};

export const createReservation = (req, res) => {
  const {
    userId,
    movieTitle,
    date,
    time,
    hall,
    seats,
    totalPrice,
  } = req.body;

  const newReservation = {
    id: Date.now(),
    userId,
    movieTitle,
    date,
    time,
    hall,
    seats,
    totalPrice,
    status: "Onaylandı",
  };

  reservations.push(newReservation);

  res.status(201).json({
    message: "Rezervasyon oluşturuldu.",
    reservation: newReservation,
  });
};