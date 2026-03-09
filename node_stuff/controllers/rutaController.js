//El require es un "*Model", el nombre de la variable es *
const RutaModel = require('../models/ruta');

exports.crearRuta = async (req, res) => {
    try {
        const Ruta = await RutaModel.create(req.body);
        res.status(201).json(Ruta);
    } catch (error) {
        if (error.name === 'SequelizeValidationError') {
            return res.status(400).json({ error: error.errors.map(e => e.message) });
        }
        res.status(500).json({ error: 'Error de servidor' });
    }
};

exports.mostrarTodo = async (req, res) => {
    try {
        const Ruta = await RutaModel.findAll();
        res.json(Ruta);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.buscarRuta = async (req, res) => {
    try {
        const Ruta = await RutaModel.findByPk(req.params.id);
        if (!Ruta) {
            return res.status(404).json({ error: 'Ruta no encontrado' });
        }
        res.json(Ruta);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.cambiarRuta = async (req, res) => {
    try {
        const Ruta = await RutaModel.findByPk(req.params.id);
        if (!Ruta) {
            return res.status(404).json({ error: 'Ruta no encontrado' });
        }
        await Ruta.update(req.body);
        res.json(Ruta);
    } catch (error) {
        if (error.name === 'SequelizeValidationError') {
            return res.status(400).json({ error: error.errors.map(e => e.message) });
        }
        res.status(500).json({ error: error.message });
    }
};

exports.borrarRuta = async (req, res) => {
    try {
        const Ruta = await RutaModel.findByPk(req.params.id);
        if (!Ruta) {
            return res.status(404).json({ error: 'Ruta no encontrado' });
        }
        await Ruta.destroy();
        res.status(204).send();
    } catch (error) {
        if (error.message == "update or delete on table \"ruta\" violates foreign key constraint \"inventario_id_ruta_fkey\" on table \"inventario\"") {
            return res.status(409).json({ error: 'La ruta que intenta borrar es usado en el inventario' });
        }
        res.status(500).json({ error: error.message });
    }
};