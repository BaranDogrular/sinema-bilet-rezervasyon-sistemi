import axios from "axios";

const API_KEY = import.meta.env.VITE_TMDB_API_KEY;
const BASE_URL = "https://api.themoviedb.org/3";
const IMAGE_BASE_URL = "https://image.tmdb.org/t/p";

console.log("API KEY:", API_KEY);

export const getImageUrl = (path, size = "original") => {
  if (!path) {
    return "https://via.placeholder.com/500x750?text=No+Image";
  }

  return `${IMAGE_BASE_URL}/${size}${path}`;
};

export const getMovieById = async (id) => {
  try {
    const res = await axios.get(
      `${BASE_URL}/movie/${id}?api_key=${API_KEY}&language=en-US`
    );

    console.log("Çekilen film:", res.data);
    return res.data;
  } catch (error) {
    console.error("Film çekilemedi:", id, error);
    return null;
  }
};