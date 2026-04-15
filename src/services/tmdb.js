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

export const getMovieVideos = async (id) => {
  try {
    const res = await axios.get(
      `${BASE_URL}/movie/${id}/videos?api_key=${API_KEY}&language=en-US`
    );

    console.log("Çekilen videolar:", res.data.results);
    return res.data.results || [];
  } catch (error) {
    console.error("Film videoları çekilemedi:", id, error);
    return [];
  }
};

export const getMovieTrailer = async (id) => {
  try {
    const videos = await getMovieVideos(id);

    const trailer =
      videos.find(
        (video) => video.type === "Trailer" && video.site === "YouTube"
      ) ||
      videos.find(
        (video) => video.type === "Teaser" && video.site === "YouTube"
      ) ||
      videos.find((video) => video.site === "YouTube");

    return trailer || null;
  } catch (error) {
    console.error("Film fragmanı alınamadı:", id, error);
    return null;
  }
};