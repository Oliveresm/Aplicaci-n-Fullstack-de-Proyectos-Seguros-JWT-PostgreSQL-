import { Router } from 'express';
import login from "../../controllers/Login/loginController.js";
import logout from "../../controllers/Login/logout.js";
import register from "../../controllers/Login/registerController.js";
import refresh from '../../controllers/Login/refreshController.js';

const loginRouter = Router();

loginRouter.post("/refresh", refresh);

loginRouter.post('/login', login);

loginRouter.post("/logout", logout);

loginRouter.post("/register", register);

export default loginRouter;