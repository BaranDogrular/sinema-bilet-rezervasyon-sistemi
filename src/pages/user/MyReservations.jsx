import { Navigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import reservations from "../../data/reservations";
import "./MyReservations.css";

const MyReservations = () => {
  const { user, isAuthenticated } = useAuth();

  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  const userReservations = reservations.filter(
    (reservation) => reservation.userId === user.id
  );

  return (
    <section className="reservations-page">
      <div className="container">
        <div className="reservations-page__header">
          <p className="reservations-page__subtitle">Biletlerim</p>
          <h1 className="reservations-page__title">Rezervasyonlarım</h1>
          <p className="reservations-page__text">
            Satın aldığın veya ayırttığın tüm biletleri burada görüntüleyebilirsin.
          </p>
        </div>

        <div className="reservations-page__list">
          {userReservations.length > 0 ? (
            userReservations.map((reservation) => (
              <div className="reservation-card" key={reservation.id}>
                <div className="reservation-card__top">
                  <h3 className="reservation-card__title">
                    {reservation.movieTitle}
                  </h3>
                  <span className="reservation-card__status">
                    {reservation.status}
                  </span>
                </div>

                <div className="reservation-card__details">
                  <div>
                    <span>Tarih</span>
                    <strong>{reservation.date}</strong>
                  </div>

                  <div>
                    <span>Saat</span>
                    <strong>{reservation.time}</strong>
                  </div>

                  <div>
                    <span>Salon</span>
                    <strong>{reservation.hall}</strong>
                  </div>

                  <div>
                    <span>Koltuklar</span>
                    <strong>{reservation.seats.join(", ")}</strong>
                  </div>

                  <div>
                    <span>Toplam</span>
                    <strong>{reservation.totalPrice} ₺</strong>
                  </div>
                </div>
              </div>
            ))
          ) : (
            <p className="reservations-page__empty">
              Henüz bir rezervasyon bulunmuyor.
            </p>
          )}
        </div>
      </div>
    </section>
  );
};

export default MyReservations;