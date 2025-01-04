const express = require('express');
const router = express.Router();
const { register, login, logout, getUser} = require('../controllers/auth.controller');
const { protectRoute } = require('../middleware/auth.middleware');

router.post('/register', register);
router.post('/login', login);
router.get('/user', protectRoute, getUser);
router.post('/logout', logout)

module.exports = router;
