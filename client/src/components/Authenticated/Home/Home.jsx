import React from "react";
import { useNavigate } from "react-router-dom";
import LogoutButton from "../shared/LogoutButton";

const Home = () => {
  const navigate = useNavigate();

  const goToPerfil = () => {
    navigate("/home/perfil");
  };

  return (
    <div className="container mt-5">
      <h2>You are logged in</h2>
      <div className="btn-group" role="group" aria-label="Basic example">
        <button className="btn btn-primary" onClick={goToPerfil}>
          Ir a Perfil
        </button>
        <LogoutButton />
      </div>
    </div>
  );
};

export default Home;
