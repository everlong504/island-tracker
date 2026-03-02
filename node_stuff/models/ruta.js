const { DataTypes } = require('sequelize');
const sequelize = require('./index.js');

/*
CREATE TABLE public.ruta (
    id_ruta integer NOT NULL,
    direccion text,
    vendedor text
);

*/


const Ruta = sequelize.define('Ruta', {
    id_ruta: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
    },
    direccion: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    vendedor: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});

module.exports = Ruta;