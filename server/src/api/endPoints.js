import { Router } from 'express';
import verifyToken from '../middleware/verifyToken.js'
import loginRouter from './Login/loginEndPoints.js';
import perfilRouter from './Profile/profileEndPoints.js';
import pruebasRouter from './Test/test.js';

const router = Router();

router.use('/', pruebasRouter)

router.use('/', loginRouter)

router.use('/', verifyToken , perfilRouter)

export default router;