const express = require('express');
const router = express.Router();
const autorizacionController = require('../controllers/autorizacionController');

router.post('/login', autorizacionController.login);

module.exports = router;