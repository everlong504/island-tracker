const { Sequelize } = require('sequelize');
const pg = require('pg');
require('dotenv').config();

pg.defaults.parseInputDatesAsUTC = true;
const { types } = pg;
types.setTypeParser(types.builtins.TIMESTAMPTZ, (str) => str);


const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: 'postgres',
        logging: false,
        define: {
            timestamps: false,
            freezeTableName: true,
        },
    }

);

module.exports = sequelize;