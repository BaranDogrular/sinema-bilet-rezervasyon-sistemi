import express from "express";

const router = express.Router();

router.get("/", (req, res) => {
  res.json({
    message: "Auth route çalışıyor.",
  });
});

router.post("/register", (req, res) => {
  const { name, email, password } = req.body;

  res.json({
    message: "Kayıt başarılı (test).",
    user: {
      name,
      email,
    },
  });
});

router.post("/login", (req, res) => {
  const { email, password } = req.body;

  res.json({
    message: "Giriş başarılı (test).",
    user: {
      email,
    },
    token: "test-token-123",
  });
});

export default router;