const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// Define routes
router.post('/users', userController.crearUsuario);
router.get('/users', userController.mostrarTodo);
router.get('/users/:id', userController.buscarUsuario);
router.put('/users/:id', userController.cambiarUsuario);
router.delete('/users/:id', userController.borrarUsuario);

module.exports = router;