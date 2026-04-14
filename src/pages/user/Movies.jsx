import { useEffect, useState } from "react";
import { getMovieById, getImageUrl } from "../../services/tmdb";
import MovieCard from "../../components/movie/MovieCard";
import "./Movies.css";

const movieIds = [
  687163,  // Project Hail Mary
  872585,  // Oppenheimer
  157336,  // Interstellar
  414906,  // The Batman
  1325734, // The Drama
  693134,  // Dune: Part Two
  969681,  // Spider-man: Brand New Day
  858024,  // Hamnet
];

const Movies = () => {
  const [movies, setMovies] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchMovies = async () => {
      setLoading(true);

      const results = await Promise.all(
        movieIds.map(async (id) => {
          const movie = await getMovieById(id);

          if (!movie) return null;

          return {
            id: movie.id,
            title: movie.title,
            genre: movie.genres?.[0]?.name || "Film",
            duration: movie.runtime
              ? `${movie.runtime} dk`
              : "Bilinmiyor",
            rating: movie.vote_average
              ? movie.vote_average.toFixed(1)
              : "N/A",
            image: getImageUrl(movie.poster_path),
            description: movie.overview || "Açıklama yok",
          };
        })
      );

      setMovies(results.filter(Boolean));
      setLoading(false);
    };

    fetchMovies();
  }, []);

  if (loading) {
    return (
      <section className="movies-page">
        <div className="container">
          <h1>Filmler yükleniyor...</h1>
        </div>
      </section>
    );
  }

  return (
    <section className="movies-page">
      <div className="container">
        <div className="movies-page__header">
          <p className="movies-page__subtitle">TMDB</p>
          <h1 className="movies-page__title">Seçili Filmler</h1>
        </div>

        <div className="movies-page__grid">
          {movies.map((movie) => (
            <MovieCard key={movie.id} movie={movie} />
          ))}
        </div>
      </div>
    </section>
  );
};

export default Movies;