const express = require('express');
const router = express.Router();
const inventarioController = require('../controllers/inventarioController');

router.post('/inventario', inventarioController.crearInventario);
router.get('/inventario', inventarioController.mostrarTodo);
router.get('/inventario/:id', inventarioController.buscarInventario);
router.put('/inventario/:id', inventarioController.cambiarInventario);
router.delete('/inventario/:id', inventarioController.borrarInventario);

module.exports = router;