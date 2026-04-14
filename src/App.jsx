import { BrowserRouter, Routes, Route } from "react-router-dom";
import MainLayout from "./layout/MainLayout";
import Home from "./pages/user/Home";
import Movies from "./pages/user/Movies";
import MovieDetail from "./pages/user/MovieDetail";
import Showtimes from "./pages/user/Showtimes";
import SeatSelection from "./pages/user/SeatSelection";
import Login from "./pages/auth/Login";
import Register from "./pages/auth/Register";
import Profile from "./pages/user/Profile";
import MyReservations from "./pages/user/MyReservations";

function App() {
  return (
    <BrowserRouter>
      <MainLayout>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/movies" element={<Movies />} />
          <Route path="/movies/:id" element={<MovieDetail />} />
          <Route path="/movies/:id/showtimes" element={<Showtimes />} />
          <Route path="/booking/:showtimeId" element={<SeatSelection />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/profile" element={<Profile />} />
          <Route path="/my-reservations" element={<MyReservations />} />
        </Routes>
      </MainLayout>
    </BrowserRouter>
  );
}

export default App;