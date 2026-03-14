const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const { autenticar, autorizar } = require('../middleware/auth');

router.post('/user', autenticar, autorizar('Admin'), userController.crearUsuario);
router.get('/user', autenticar, autorizar('Admin'), userController.mostrarTodo);
router.get('/user/:id', autenticar, autorizar('Admin'), userController.buscarUsuario);
router.put('/user/:id', autenticar, autorizar('Admin'), userController.cambiarUsuario);
router.delete('/user/:id', autenticar, autorizar('Admin'), userController.borrarUsuario);

module.exports = router;