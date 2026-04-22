let users = [
  {
    id: 1,
    name: "Admin User",
    email: "admin@example.com",
    password: "123456",
    role: "admin",
  },
  {
    id: 2,
    name: "Normal User",
    email: "user@example.com",
    password: "123456",
    role: "user",
  },
];

export const getAuthStatus = (req, res) => {
  res.json({
    message: "Auth route çalışıyor.",
  });
};

export const registerUser = (req, res) => {
  const { name, email, password } = req.body;

  const existingUser = users.find((user) => user.email === email);

  if (existingUser) {
    return res.status(400).json({
      message: "Bu email ile kayıtlı kullanıcı zaten var.",
    });
  }

  const newUser = {
    id: Date.now(),
    name,
    email,
    password,
    role: "user",
  };

  users.push(newUser);

  res.status(201).json({
    message: "Kayıt başarılı.",
    user: {
      id: newUser.id,
      name: newUser.name,
      email: newUser.email,
      role: newUser.role,
    },
  });
};

export const loginUser = (req, res) => {
  const { email, password } = req.body;

  const user = users.find(
    (item) => item.email === email && item.password === password
  );

  if (!user) {
    return res.status(401).json({
      message: "Email veya şifre hatalı.",
    });
  }

  res.json({
    message: "Giriş başarılı.",
    user: {
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role,
    },
    token: "test-token-123",
  });
};