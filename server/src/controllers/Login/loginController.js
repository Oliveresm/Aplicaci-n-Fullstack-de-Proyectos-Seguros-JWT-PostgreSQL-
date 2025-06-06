import pool from "../../models/db.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt"

const login = async (req, res) => {
  const { email, pass } = req.body;
  const consult = "SELECT * FROM login WHERE email = $1";
  try {
    const result = await pool.query(consult, [email]);

    if (result.rows.length === 0) {
      return res.status(401).json({ message: "Credenciales inválidas" });
    }

    const user = result.rows[0];
    const isMatch = await bcrypt.compare(pass, user.password);

    if (!isMatch) {
      return res.status(401).json({ message: "Credenciales inválidas" });
    }

    const payload = {
      email: result.rows[0].email,
    };

    const token = jwt.sign(payload, "Stack", {
      expiresIn: "1m",
    });

    const refreshToken = jwt.sign(payload, "StackRefresh", {
      expiresIn: "1d",
    });

    res.cookie("refreshToken", refreshToken, {
      httpOnly: true,
      secure: false,
      sameSite: "Lax",
      maxAge: 5 * 60 * 1000,
    });

    return res.status(200).json({
      message: "Login exitoso",
      token,
    });
  } catch (e) {
    console.error("Error en login:", e);
    return res.status(500).json({ message: "Error en la base de datos" });
  }
};

export default login;
