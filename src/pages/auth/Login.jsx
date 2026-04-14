import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import "./Auth.css";

const Login = () => {
  const navigate = useNavigate();
  const { login } = useAuth();

  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    setFormData((prev) => ({
      ...prev,
      [e.target.name]: e.target.value,
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    login(formData.email, formData.password);
    navigate("/profile");
  };

  return (
    <section className="auth-page">
      <div className="container auth-page__container">
        <div className="auth-card">
          <p className="auth-card__subtitle">Hoş Geldin</p>
          <h1 className="auth-card__title">Giriş Yap</h1>
          <p className="auth-card__text">
            Hesabına giriş yaparak rezervasyonlarını yönetebilirsin.
          </p>

          <form className="auth-form" onSubmit={handleSubmit}>
            <div className="auth-form__group">
              <label>E-posta</label>
              <input
                type="email"
                name="email"
                placeholder="ornek@mail.com"
                value={formData.email}
                onChange={handleChange}
                required
              />
            </div>

            <div className="auth-form__group">
              <label>Şifre</label>
              <input
                type="password"
                name="password"
                placeholder="Şifrenizi girin"
                value={formData.password}
                onChange={handleChange}
                required
              />
            </div>

            <button type="submit" className="auth-form__button">
              Giriş Yap
            </button>
          </form>

          <p className="auth-card__footer">
            Hesabın yok mu? <Link to="/register">Kayıt Ol</Link>
          </p>
        </div>
      </div>
    </section>
  );
};

export default Login;