const { DataTypes } = require('sequelize');
const { Model } = require('sequelize');
const sequelize = require('./index.js');

/*
CREATE TABLE public.ruta (
    id_ruta integer NOT NULL,
    direccion text,
    vendedor text
);

*/

class Ruta extends Model {

}

Ruta.init({
    id_ruta: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,

    },
    direccion: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    vendedor: {
        type: DataTypes.STRING,
        allowNull: false,
    },
}, {
    sequelize,
    modelName: 'ruta',
})

module.exports = Ruta;