const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.post('/user', userController.crearUsuario);
router.get('/user', userController.mostrarTodo);
router.get('/user/:id', userController.buscarUsuario);
router.put('/user/:id', userController.cambiarUsuario);
router.delete('/user/:id', userController.borrarUsuario);

module.exports = router;