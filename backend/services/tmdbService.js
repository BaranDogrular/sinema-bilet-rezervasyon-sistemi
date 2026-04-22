import axios from "axios";

const BASE_URL = "https://api.themoviedb.org/3";

export const getMovieByIdFromTMDB = async (id) => {
  const API_KEY = process.env.TMDB_API_KEY;

  const response = await axios.get(
    `${BASE_URL}/movie/${id}?api_key=${API_KEY}&language=en-US`
  );

  return response.data;
};

export const getMovieTrailerFromTMDB = async (id) => {
  const API_KEY = process.env.TMDB_API_KEY;

  const response = await axios.get(
    `${BASE_URL}/movie/${id}/videos?api_key=${API_KEY}&language=en-US`
  );

  const videos = response.data.results || [];

  const trailer =
    videos.find(
      (video) => video.type === "Trailer" && video.site === "YouTube"
    ) ||
    videos.find((video) => video.site === "YouTube");

  return trailer || null;
};