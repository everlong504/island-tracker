const express = require('express');
const router = express.Router();
const rutaController = require('../controllers/rutaController');
const { autenticar, autorizar } = require('../middleware/auth');

router.post('/ruta', autenticar, autorizar('Admin', 'Gerente'), rutaController.crearRuta);
router.get('/ruta', autenticar, autorizar('Admin', 'Gerente', 'Conductor'), rutaController.mostrarTodo);
router.get('/ruta/:id', autenticar, autorizar('Admin', 'Gerente', 'Conductor'), rutaController.buscarRuta);
router.put('/ruta/:id', autenticar, autorizar('Admin', 'Gerente'), rutaController.cambiarRuta);
router.delete('/ruta/:id', autenticar, autorizar('Admin', 'Gerente'), rutaController.borrarRuta);

module.exports = router;