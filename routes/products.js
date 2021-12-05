const express = require('express');
const router = express.Router();
const {database} = require('../config/helpers');

//OBTENER TODOS LOS PRODUCTOS


router.get('/all', function(req, res){

    database.table('products as p')
    .join([
        {
            table: "categories as c",
            on: `c.id = p.cat_id`
        }
    ])
    .withFields(['c.title as category',
        'p.title as name',
        'p.price',
        'p.quantity',
        'p.description',
        'p.image',
        'p.id'
    ])
    .sort({id: -1})
    .getAll()
    .then(prods => {
        if (prods.length > 0) {
            res.status(200).json({
                count: prods.length,
                products: prods
            });
        } else {
            res.json({message: "Productos no encontrados"});
        }
    })
    .catch(err => console.log(err));

})

router.get('/', function (req, res) {       // Sending Page Query Parameter is mandatory http://localhost:3636/api/products?page=1
    let page = (req.query.page !== undefined && req.query.page !== 0) ? req.query.page : 1;
    const limit = (req.query.limit !== undefined && req.query.limit !== 0) ? req.query.limit : 10;   // set limit of items per page
    let valorInicial;
    let valorFinal;
    if (page > 0) {
        valorInicial = (page * limit) - limit;     // 0, 10, 20, 30
        valorFinal = page * limit;                  // 10, 20, 30, 40
    } else {
        valorInicial = 0;
        valorFinal = 10;
    }
    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id`
            }
        ])
        .withFields(['c.title as category',
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.id'
        ])
        .slice(valorInicial, valorFinal)
        .sort({id: -1})
        .getAll()
        .then(prods => {
            if (prods.length > 0) {
                res.status(200).json({
                    count: prods.length,
                    products: prods
                });
            } else {
                res.json({message: "Productos no encontrados"});
            }
        })
        .catch(err => console.log(err));
});

//OBTENER UN SOLO PRODUCTO

router.get('/:productoId', (req, res) => {
    let productoId = req.params.productoId;
    console.log(productoId);

    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id`
            }
        ])
        .withFields(['c.title as category',
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.images',
            'p.id'
        ])
        .filter({'p.id' : productoId})
        .get()
        .then(prod => {
            if (prod) {
                res.status(200).json(prod);
            } else {
                res.json({message: `No se encontro el producto con el ID ${productoId}`});
            }
        })
        .catch(err => console.log(err));


});

//OBTENER LOS PRODUCTOS PERTENECIENTES A UNA CATEGORIA EN ESPECIFICO

router.get('/categoria/:nombrecat', (req, res) => {
    const nombrecat = req.params.nombrecat;
    console.log(nombrecat);
    let page = (req.query.page !== undefined && req.query.page !== 0) ? req.query.page : 1;
    const limit = (req.query.limit !== undefined && req.query.limit !== 0) ? req.query.limit : 10;   // set limit of items per page
    let valorInicial;
    let valorFinal;
    if (page > 0) {
        valorInicial = (page * limit) - limit;     // 0, 10, 20, 30
        valorFinal = page * limit;                  // 10, 20, 30, 40
    } else {
        valorInicial = 0;
        valorFinal = 10;
    }
    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id WHERE c.title LIKE '%${nombrecat}%'`
            }
        ])
        .withFields(['c.title as category',
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.id'
        ])
        .slice(valorInicial, valorFinal)
        .sort({id: .1})
        .getAll()
        .then(prods => {
            if (prods.length > 0) {
                res.status(200).json({
                    count: prods.length,
                    products: prods
                });
            } else {
                res.json({message: `No se encotraron productos para la categoria ${nombrecat}`});
            }
        })
        .catch(err => console.log(err));
});
module.exports = router;
