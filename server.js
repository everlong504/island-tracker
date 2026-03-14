const express = require('express');
const path = require('path');


const sequelize = require('./node_stuff/models/index.js');
const userRoutes = require('./node_stuff/routes/userRoutes.js');
const inventarioRoutes = require('./node_stuff/routes/inventarioRoutes.js');
const rutaRoutes = require('./node_stuff/routes/rutaRoutes.js');
const autorizacionRoutes = require('./node_stuff/routes/autorizacionRoutes.js');


const app = express();
app.use(express.json());
app.use('/images', express.static(path.join(__dirname, 'images')));
app.use(express.static(path.join(__dirname, 'pagina_Web')));

app.use('/api', userRoutes);
app.use('/api', inventarioRoutes);
app.use('/api', rutaRoutes);
app.use('/api', autorizacionRoutes);


app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, '/pagina_Web/index.html'));
});




// Sync database and start server
const PORT = process.env.PORT || 3000;

sequelize.sync({ force: false }) // set force: true to drop tables on each restart
    .then(() => {
        console.log('Database synced');
        app.listen(PORT, () => {
            console.log(`Server running on port ${PORT}`);
        });
    })
    .catch(err => {
        console.error('Unable to connect to database:', err);
    });