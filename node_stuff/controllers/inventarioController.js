//El require es un "*Model", el nombre de la variable es *

const InventarioModel = require('../models/inventario');

exports.crearInventario = async (req, res) => {
    try {
        const Inventario = await InventarioModel.create(req.body);
        res.status(201).json(Inventario);
    } catch (error) {
        if (error.name === 'SequelizeValidationError') {
            return res.status(400).json({ error: error.errors.map(e => e.message) });
        }
        if (error.name === 'SequelizeForeignKeyConstraintError') {
            return res.status(400).json({ error: 'El id de ruta no existe' });
        }
        res.status(500).json({ error: 'Error de servidor' });
    }
};

exports.mostrarTodo = async (req, res) => {
    try {
        const Inventario = await InventarioModel.findAll();
        res.json(Inventario);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.buscarInventario = async (req, res) => {
    try {
        const Inventario = await InventarioModel.findByPk(req.params.id);
        if (!Inventario) {
            return res.status(404).json({ error: 'Inventario no encontrado' });
        }
        res.json(Inventario);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.cambiarInventario = async (req, res) => {
    try {
        const Inventario = await InventarioModel.findByPk(req.params.id);
        if (!Inventario) {
            return res.status(404).json({ error: 'Inventario no encontrado' });
        }
        await Inventario.update(req.body);
        res.json(Inventario);
    } catch (error) {
        if (error.name === 'SequelizeValidationError') {
            return res.status(400).json({ error: error.errors.map(e => e.message) });
        }
        res.status(500).json({ error: error.message });
    }
};

exports.borrarInventario = async (req, res) => {
    try {
        const Inventario = await InventarioModel.findByPk(req.params.id);
        if (!Inventario) {
            return res.status(404).json({ error: 'Inventario no encontrado' });
        }
        await Inventario.destroy();
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};