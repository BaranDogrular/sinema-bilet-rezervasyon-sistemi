import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import "./Home.css";
import MovieCard from "../../components/movie/MovieCard";
import { getMovieById, getImageUrl } from "../../services/tmdb";

const movieIds = [
  687163,
  872585,
  157336,
  414906,
  1325734,
  693134,
  969681,
  858024,
];

const Home = () => {
  const [movies, setMovies] = useState([]);
  const [loadingMovies, setLoadingMovies] = useState(true);
  const [activeIndex, setActiveIndex] = useState(0);

  useEffect(() => {
    const fetchMovies = async () => {
      setLoadingMovies(true);

      const results = await Promise.all(
        movieIds.map(async (id) => {
          const movie = await getMovieById(id);

          if (!movie) return null;

          return {
            id: movie.id,
            title: movie.title,
            genre:
              movie.genres?.map((genre) => genre.name).join(" / ") || "Film",
            duration: movie.runtime ? `${movie.runtime} dk` : "Bilinmiyor",
            rating: movie.vote_average
              ? movie.vote_average.toFixed(1)
              : "N/A",
            image: getImageUrl(movie.poster_path),
            backdrop: getImageUrl(movie.backdrop_path || movie.poster_path),
            description: movie.overview || "Açıklama yok",
          };
        })
      );

      setMovies(results.filter(Boolean));
      setLoadingMovies(false);
    };

    fetchMovies();
  }, []);

  useEffect(() => {
    if (movies.length === 0) return;

    const interval = setInterval(() => {
      setActiveIndex((prev) => (prev + 1) % movies.length);
    }, 5000);

    return () => clearInterval(interval);
  }, [movies]);

  const activeMovie = movies[activeIndex];

  const handlePrev = () => {
    setActiveIndex((prev) =>
      prev === 0 ? movies.length - 1 : prev - 1
    );
  };

  const handleNext = () => {
    setActiveIndex((prev) => (prev + 1) % movies.length);
  };

  return (
    <>
      <section
        className="home-hero-slider"
        style={{
          backgroundImage: activeMovie
            ? `linear-gradient(90deg, rgba(0,0,0,0.95) 0%, rgba(0,0,0,0.72) 42%, rgba(0,0,0,0.35) 100%), url(${activeMovie.backdrop})`
            : "none",
        }}
      >
        <div className="container home-hero-slider__container">
          <div className="home-hero-slider__content">
            <span className="home-hero-slider__badge">Vizyonda</span>

            <h1 className="home-hero-slider__title">
              {activeMovie?.title || "Eden Cineverse"}
            </h1>

            <p className="home-hero-slider__text">
              {activeMovie?.description ||
                "Vizyondaki filmleri keşfet, seansını seç ve koltuğunu hemen ayırt."}
            </p>

            <div className="home-hero-slider__meta">
              <span>⭐ {activeMovie?.rating || "N/A"}</span>
              <span>{activeMovie?.duration || "Bilinmiyor"}</span>
              <span>{activeMovie?.genre || "Film"}</span>
            </div>

            <div className="home-hero-slider__actions">
              {activeMovie && (
                <Link
                  to={`/movies/${activeMovie.id}`}
                  className="home-hero-slider__primary-btn"
                >
                  İncele
                </Link>
              )}

              <a
                href="#featured-movies"
                className="home-hero-slider__secondary-btn"
              >
                Filmleri Keşfet
              </a>
            </div>
          </div>

          {!loadingMovies && movies.length > 0 && (
            <div className="home-hero-slider__posters">
              {movies.slice(0, 4).map((movie, index) => (
                <button
                  key={movie.id}
                  className={`home-hero-slider__poster ${
                    activeIndex === index ? "active" : ""
                  }`}
                  onClick={() => setActiveIndex(index)}
                  type="button"
                >
                  <img src={movie.image} alt={movie.title} />
                </button>
              ))}
            </div>
          )}

          {!loadingMovies && movies.length > 0 && (
            <div className="home-hero-slider__controls">
              <button onClick={handlePrev} type="button">‹</button>
              <span>
                {activeIndex + 1} / {movies.length}
              </span>
              <button onClick={handleNext} type="button">›</button>
            </div>
          )}
        </div>
      </section>

      <section className="featured-movies" id="featured-movies">
        <div className="container">
          <div className="section-header">
            <div>
              <p className="section-header__subtitle">Vizyondakiler</p>
              <h2 className="section-header__title">Öne Çıkan Filmler</h2>
            </div>
          </div>

          {loadingMovies ? (
            <p className="home-loading-text">Filmler yükleniyor...</p>
          ) : (
            <div className="featured-movies__grid">
              {movies.map((movie) => (
                <MovieCard key={movie.id} movie={movie} />
              ))}
            </div>
          )}
        </div>
      </section>

      <section className="features">
        <div className="container features__container">
          <div className="feature-box">
            <h3 className="feature-box__title">Hızlı Rezervasyon</h3>
            <p className="feature-box__text">
              Film, seans ve koltuk seçimini birkaç adımda tamamla.
            </p>
          </div>

          <div className="feature-box">
            <h3 className="feature-box__title">Güvenli Deneyim</h3>
            <p className="feature-box__text">
              Rezervasyonlarını kullanıcı dostu panelden kolayca yönet.
            </p>
          </div>

          <div className="feature-box">
            <h3 className="feature-box__title">Premium Arayüz</h3>
            <p className="feature-box__text">
              Sinema atmosferine uygun modern ve şık bir rezervasyon deneyimi.
            </p>
          </div>
        </div>
      </section>

      <section className="promo">
        <div className="container promo__container">
          <div>
            <p className="promo__subtitle">Sinema Keyfini Kaçırma</p>
            <h2 className="promo__title">
              Haftanın en popüler filmleri için yerini hemen ayırt
            </h2>
          </div>

          <Link to="/movies" className="promo__button">
            Hemen İncele
          </Link>
        </div>
      </section>
    </>
  );
};

export default Home;