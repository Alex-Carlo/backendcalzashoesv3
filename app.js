const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');
const app = express();


// view engine setup

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(cors({
  origin: '*',
  methods: ['GET', 'PUT', 'DELETE', 'PATCH', 'POST'],
  allowedHeaders: 'Content-Type, Authorization, Origin, X-Requested-With, Accept'
}));



app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


// importar rutas
const productsRoute = require('./routes/products');
const usersRoute = require('./routes/users');
const authRoute = require('./routes/auth');
const ordersRoute = require('./routes/orders');

//Usar Rutas

app.use('/api/productos', productsRoute);
app.use('/api/users', usersRoute);
app.use('/api/auth', authRoute);
app.use('/api/orders', ordersRoute);


module.exports = app;
