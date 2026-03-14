const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const User = require('../models/user.js');

exports.login = async (req, res) => {
    try {

        const { email, password_hash } = req.body;

        if (typeof req.body.password_hash === 'string' && !req.body.password_hash.includes('$2a$12$')) {
            req.body.password_hash = await bcrypt.hash(req.body.password_hash, 12);
        } else if (typeof req.body.password_hash !== 'string') {
            return res.status(400).json({ error: 'Contraseña inválida' });
        }


        const user = await User.findOne({ where: { email } });
        if (!user) {
            return res.status(401).json({ error: 'Credenciales invalidas' });
        }

        const validPassword = await bcrypt.compare(password_hash, user.password_hash);
        if (!validPassword) {
            return res.status(401).json({ error: 'Credenciales invalidas' });
        }

        const token = jwt.sign(
            { id_users: user.id_users, email: user.email, permisos: user.permisos },
            process.env.JWT_SECRET,
            { expiresIn: process.env.JWT_EXPIRES_IN }
        );

        res.json({
            message: 'Login exitoso',
            token,
            user: { id_users: user.id_users, email: user.email, permisos: user.permisos }
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.me = async (req, res) => {
    try {
        const user = await User.findByPk(req.user.id, {
            attributes: { exclude: ['password_hash'] }
        });
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }
        res.json(user);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Server error' });
    }
};
