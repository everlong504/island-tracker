const express = require('express');

const sequelize = require('./node_stuff/models/index.js');
const User = require('./node_stuff/models/user.js');
const userRoutes = require('./node_stuff/routes/userroutes.js');

const app = express();
app.use(express.json());


app.use('/api', userRoutes);

app.get('/', (req, res) => {
    res.send('Hello World!');
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