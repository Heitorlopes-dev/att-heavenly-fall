const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors')

const app = express();
app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }))

require('../controllers/UserController')(app);

const path = require('path');
const frontendPath = path.join(__dirname, '../../HeavenlyFall');
app.use(express.static(frontendPath));

app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000');
});