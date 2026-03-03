//El require es un "*Model", el nombre de la variable es *


const UserModel = require('../models/user');

exports.crearUsuario = async (req, res) => {
    try {
        const User = await UserModel.create(req.body);
        res.status(201).json(User);
    } catch (error) {
        if (error.name === 'SequelizeValidationError') {
            return res.status(400).json({ error: error.errors.map(e => e.message) });
        }
        if (error.name === 'SequelizeUniqueConstraintError') {
            return res.status(409).json({ error: 'Este correo ya esta registrado' });
        }
        res.status(500).json({ error: 'Error de servidor' });
    }
};

exports.mostrarTodo = async (req, res) => {
    try {
        const User = await UserModel.findAll();
        res.json(User);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.buscarUsuario = async (req, res) => {
    try {
        const User = await UserModel.findByPk(req.params.id);
        if (!User) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        res.json(User);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.cambiarUsuario = async (req, res) => {
    try {
        const User = await UserModel.findByPk(req.params.id);
        if (!User) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        await User.update(req.body);
        res.json(User);
    } catch (error) {
        if (error.name === 'SequelizeValidationError') {
            return res.status(400).json({ error: error.errors.map(e => e.message) });
        }
        res.status(500).json({ error: error.message });
    }
};

exports.borrarUsuario = async (req, res) => {
    try {
        const User = await UserModel.findByPk(req.params.id);
        if (!User) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        await User.destroy();
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};