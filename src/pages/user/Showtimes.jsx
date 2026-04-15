import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import { getMovieById } from "../../services/tmdb";
import showtimes from "../../data/showtimes";
import "./Showtimes.css";

const Showtimes = () => {
  const { id } = useParams();
  const [movie, setMovie] = useState(null);
  const [loading, setLoading] = useState(true);

  const movieShowtimes = showtimes.filter(
    (showtime) => showtime.movieId === Number(id)
  );

  useEffect(() => {
    const fetchMovie = async () => {
      setLoading(true);

      const data = await getMovieById(id);

      if (data) {
        setMovie({
          id: data.id,
          title: data.title,
        });
      }

      setLoading(false);
    };

    fetchMovie();
  }, [id]);

  if (loading) {
    return (
      <section className="showtimes-page">
        <div className="container">
          <h2>Seanslar yükleniyor...</h2>
        </div>
      </section>
    );
  }

  if (!movie) {
    return (
      <section className="showtimes-page">
        <div className="container">
          <h2>Film bulunamadı.</h2>
        </div>
      </section>
    );
  }

  return (
    <section className="showtimes-page">
      <div className="container">
        <div className="showtimes-page__header">
          <p className="showtimes-page__subtitle">Seans Seçimi</p>
          <h1 className="showtimes-page__title">{movie.title}</h1>
          <p className="showtimes-page__text">
            Sana uygun seansı seç ve koltuk rezervasyonuna devam et.
          </p>
        </div>

        <div className="showtimes-page__grid">
          {movieShowtimes.length > 0 ? (
            movieShowtimes.map((showtime) => (
              <div className="showtime-card" key={showtime.id}>
                <div className="showtime-card__top">
                  <span className="showtime-card__format">{showtime.format}</span>
                  <span className="showtime-card__price">{showtime.price} ₺</span>
                </div>

                <h3 className="showtime-card__time">{showtime.time}</h3>
                <p className="showtime-card__info">{showtime.date}</p>
                <p className="showtime-card__info">{showtime.hall}</p>

                <Link
                  to={`/booking/${showtime.id}`}
                  className="showtime-card__button"
                >
                  Koltuk Seç
                </Link>
              </div>
            ))
          ) : (
            <p>Bu film için henüz seans bulunmuyor.</p>
          )}
        </div>
      </div>
    </section>
  );
};

export default Showtimes;