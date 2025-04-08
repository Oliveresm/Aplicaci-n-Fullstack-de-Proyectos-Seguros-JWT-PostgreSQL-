import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./api/axiosConfig";
import Login from "./components/Login/Login";
import Register from "./components/Login/Register";
import Home from "./components/Authenticated/Home/Home";
import PrivateRoute from "./components/routes/PrivateRoute";
import Perfil from './components/Authenticated/Perfil/Perfil';

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route
          path="/home"
          element={
            <PrivateRoute>
              <Home />
            </PrivateRoute>
          }
        />
        <Route
          path="/home/perfil"
          element={
            <PrivateRoute>
              <Perfil />
            </PrivateRoute>
          }
        />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);
