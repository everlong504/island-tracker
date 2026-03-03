const { DataTypes } = require('sequelize');
const sequelize = require('./index.js');
const { Model } = require('sequelize');


/*
CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    nombre text,
    direccion text,
    ubicacion public.geography(Point,4326),
    precio numeric(10,2),
    cantidad integer,
    telefono character varying(8),
    contacto text,
    id_ruta integer
    IMAGEN TAMBIEN
);

*/

class Inventario extends Model {

}

Inventario.init({
    id_inventario: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,

    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    direccion: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    ubicacion: {
        type: DataTypes.GEOMETRY('POINT'),
        allowNull: false,
    },
    precio: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false,
    },
    cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    telefono: {
        type: DataTypes.STRING(8),
        allowNull: false,
    },
    contacto: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    id_ruta: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    imagen: {
        type: DataTypes.STRING,
    }
},

    {
        sequelize,
        modelName: 'Ruta',
    })


module.exports = Inventario;