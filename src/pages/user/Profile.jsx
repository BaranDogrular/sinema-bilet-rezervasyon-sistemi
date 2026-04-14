import { Navigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import "./Profile.css";

const Profile = () => {
  const { user, isAuthenticated } = useAuth();

  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  return (
    <section className="profile-page">
      <div className="container">
        <div className="profile-card">
          <p className="profile-card__subtitle">Kullanıcı Profili</p>
          <h1 className="profile-card__title">{user.name}</h1>
          <p className="profile-card__text">
            Hesap bilgilerini ve üyelik detaylarını burada görüntüleyebilirsin.
          </p>

          <div className="profile-card__info">
            <div className="profile-card__item">
              <span>Ad Soyad</span>
              <strong>{user.name}</strong>
            </div>

            <div className="profile-card__item">
              <span>E-posta</span>
              <strong>{user.email}</strong>
            </div>

            <div className="profile-card__item">
              <span>Rol</span>
              <strong>{user.role}</strong>
            </div>

            <div className="profile-card__item">
              <span>Üyelik Durumu</span>
              <strong>Aktif</strong>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Profile;