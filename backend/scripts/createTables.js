import pool from "../config/db.js";

const run = async () => {
  try {
    await pool.query(`
      DROP TABLE IF EXISTS reservation_seats CASCADE;
      DROP TABLE IF EXISTS reservations CASCADE;
      DROP TABLE IF EXISTS seats CASCADE;
      DROP TABLE IF EXISTS showtimes CASCADE;
      DROP TABLE IF EXISTS movies CASCADE;
      DROP TABLE IF EXISTS users CASCADE;

      CREATE TABLE users (
        id SERIAL PRIMARY KEY,
        username VARCHAR(100),
        email VARCHAR(100),
        password VARCHAR(255),
        role VARCHAR(20) DEFAULT 'user'
      );

      CREATE TABLE movies (
        id SERIAL PRIMARY KEY,
        tmdb_id INTEGER UNIQUE,
        title TEXT,
        genre TEXT,
        duration INTEGER,
        rating FLOAT,
        poster_url TEXT,
        description TEXT,
        release_date DATE,
        trailer_url TEXT
      );

      CREATE TABLE showtimes (
        id SERIAL PRIMARY KEY,
        movie_id INTEGER REFERENCES movies(id),
        show_date DATE,
        show_time TIME
      );

      CREATE TABLE seats (
        id SERIAL PRIMARY KEY,
        showtime_id INTEGER REFERENCES showtimes(id),
        seat_number VARCHAR(10),
        is_reserved BOOLEAN DEFAULT false
      );

      CREATE TABLE reservations (
        id SERIAL PRIMARY KEY,
        user_id INTEGER REFERENCES users(id),
        showtime_id INTEGER REFERENCES showtimes(id)
      );

      CREATE TABLE reservation_seats (
        id SERIAL PRIMARY KEY,
        reservation_id INTEGER REFERENCES reservations(id),
        seat_id INTEGER REFERENCES seats(id)
      );
    `);

    console.log("Tablolar OK ✅");
    process.exit();
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
};

run();