import React from "react";
import logout from "../../../utils/logout";

const LogoutButton = () => {
  return (
    <button className="btn btn-danger" onClick={logout}>
      Cerrar sesión
    </button>
  );
};

export default LogoutButton;
