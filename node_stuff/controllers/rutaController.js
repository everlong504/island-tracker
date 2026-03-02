const Ruta = require('../models/ruta');

exports.crearRuta = async (req, res) => {
    try {
        const Ruta = await Ruta.create(req.body);
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
        const Rutas = await Ruta.findAll();
        res.json(Rutas);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.buscarRuta = async (req, res) => {
    try {
        const Ruta = await Ruta.findByPk(req.params.id);
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
        const Ruta = await Ruta.findByPk(req.params.id);
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
        const Ruta = await Ruta.findByPk(req.params.id);
        if (!Ruta) {
            return res.status(404).json({ error: 'Ruta no encontrado' });
        }
        await Ruta.destroy();
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};