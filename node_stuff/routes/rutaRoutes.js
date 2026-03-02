const express = require('express');
const router = express.Router();
const rutaController = require('../controllers/rutaController');

router.post('/ruta', rutaController.crearRuta);
router.get('/ruta', rutaController.mostrarTodo);
router.get('/ruta/:id', rutaController.buscarRuta);
router.put('/ruta/:id', rutaController.cambiarRuta);
router.delete('/ruta/:id', rutaController.borrarRuta);

module.exports = router;