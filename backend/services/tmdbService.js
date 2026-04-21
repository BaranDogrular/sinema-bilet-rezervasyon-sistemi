import axios from "axios";

const BASE_URL = "https://api.themoviedb.org/3";

export const getMovieByIdFromTMDB = async (id) => {
  try {
    const API_KEY = process.env.TMDB_API_KEY;

    console.log("SERVICE TMDB_API_KEY:", API_KEY);

    const response = await axios.get(
      `${BASE_URL}/movie/${id}?api_key=${API_KEY}&language=en-US`
    );

    return response.data;
  } catch (error) {
    console.error("TMDB HATASI:", error.message);
    throw error;
  }
};
console.log("SERVER TMDB_API_KEY:", process.env.TMDB_API_KEY);