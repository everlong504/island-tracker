const express = require('express');
const router = express.Router();
const autorizacionController = require('../controllers/autorizacionController');
const { autenticar } = require('../middleware/auth');

router.post('/login', autorizacionController.login);
router.get('/me', autenticar, autorizacionController.me);

module.exports = router;