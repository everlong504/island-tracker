const { DataTypes } = require('sequelize');
const sequelize = require('./index.js');
const { Model } = require('sequelize');
const bcrypt = require('bcrypt');

/*
CREATE TABLE users (
    id_users INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    permisos TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    last_login TIMESTAMPTZ
);
*/

/*

last_login TIMESTAMPTZ: 2026-02-28 15:54:07.187129-06

*/

class User extends Model {

}

User.init({
    id_users: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            isEmail: true,
            notEmpty: true
        }
    },
    password_hash: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    permisos: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            isIn: [['Admin', 'Conductor', 'Gerente']],
            notEmpty: true
        }
    },
    is_active: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
    },
    last_login: {
        type: DataTypes.DATE,
    },
},
    {
        hooks: {
            beforeCreate: async (user) => {
                if (user.password_hash) {
                    user.password_hash = await bcrypt.hash(user.password_hash, 12);
                }
            },
            beforeUpdate: async (user) => {
                if (user.changed('password')) {
                    user.password_hash = await bcrypt.hash(user.password_hash, 12);
                }
            }
        },
        sequelize,
        modelName: 'users',
    })


module.exports = User;