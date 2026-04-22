import express from "express";
import {
  getAllReservations,
  getReservationById,
  createReservation,
} from "../controllers/reservationController.js";

const router = express.Router();

router.get("/", getAllReservations);
router.get("/:id", getReservationById);
router.post("/", createReservation);

export default router;