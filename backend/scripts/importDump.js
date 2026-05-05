import fs from "fs";
import path from "path";
import pool from "../config/db.js";

const filePath = path.join(process.cwd(), "sinema_clean.sql");

const run = async () => {
  try {
    const sql = fs.readFileSync(filePath, "utf-8");

    const queries = sql
      .split(";")
      .map(q => q.trim())
      .filter(q => q.length);

    for (const query of queries) {
      await pool.query(query);
    }

    console.log("Database import edildi ✅");
    process.exit();
  } catch (err) {
    console.error("HATA:", err);
    process.exit(1);
  }
};

run();