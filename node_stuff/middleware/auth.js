const jwt = require('jsonwebtoken');

exports.autenticar = (req, res, next) => {
    const token = req.header('Authorization')?.replace('Bearer ', '');
    if (!token) return res.status(401).json({ error: 'Acceso negado' });

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded;
        next();
    } catch (err) {
        res.status(401).json({ error: 'Token invalido' });
    }
};

exports.autorizar = (...permisos) => {
    return (req, res, next) => {
        if (!permisos.includes(req.user.permisos)) {
            return res.status(403).json({ error: 'Prohibido' });
        }
        next();
    };
};