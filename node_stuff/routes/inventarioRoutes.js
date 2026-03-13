const express = require('express');
const router = express.Router();
const inventarioController = require('../controllers/inventarioController');
const { autenticar, autorizar } = require('../middleware/auth');

router.post('/inventario', autenticar, autorizar('Admin', 'Gerente'), inventarioController.crearInventario);
router.get('/inventario', autenticar, autorizar('Admin', 'Gerente', 'Conductor'), inventarioController.mostrarTodo);
router.get('/inventario/:id', autenticar, autorizar('Admin', 'Gerente', 'Conductor'), inventarioController.buscarInventario);
router.put('/inventario/:id', autenticar, autorizar('Admin', 'Gerente'), inventarioController.cambiarInventario);
router.delete('/inventario/:id', autenticar, autorizar('Admin', 'Gerente'), inventarioController.borrarInventario);

module.exports = router;