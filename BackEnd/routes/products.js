const express = require('express');
const router = express.Router();
const {database} = require('../config/helpers');

/* GET home page -> Iau toate produsele. */
router.get('/', function(req, res) {
  //res.render('index', { title: 'Express' });

  // nr pagini în funcție de câte produse ai -> pag 1, 2...
  // pagelimit -> 9 produse pe pagină
  let page = (req.query.page != undefined && req.query.page != 0) ? req.query.page : 1;
  const limit = (req.query.limit != undefined && req.query.limit != 0) ? req.query.limit : 9;

  let startValue, endValue;
  if(page > 0)
  {
    startValue = (page * limit) - limit;
    endValue = page * limit;
  }
  else
  {startValue = 0; endValue = 9;}

  database.table('products as p').join([{
    table: 'categories as c',
    on: 'c.id = p.cat_id'
  }]).withFields(['c.title as category',
  'p.title as name',
  'p.price',
  'p.quantity',
  'p.description',
  'p.image',
  'p.id']).slice(startValue, endValue).sort({id: .1}).getAll().then(prods => {
    if(prods.length > 0)
    {
      res.status(200).json({
        count: prods.length,
        products: prods
      });
    }
    else {
      res.json({message: 'No Products Found!'});
    }
  }).catch(err => console.log(err));

});


/* GET -> Iau un singur produs. */
router.get('/:prodId', (req, res) => {
  let productId = req.params.prodId;
  console.log(productId);

  database.table('products as p').join([{
    table: 'categories as c',
    on: 'c.id = p.cat_id'
  }]).withFields(['c.title as category',
    'p.title as name',
    'p.price',
    'p.quantity',
    'p.image',
    'p.images',
    'p.description',
    'p.id']).filter({'p.id': productId}).get().then(prod => {
    if(prod)
    {
      res.status(200).json(prod);
    }
    else {
      res.json({message: `No Product Found with id: ${productId}!`});
    }
  }).catch(err => console.log(err));
});


/* GET -> Iau Produse după Categorie. */
router.get('/category/:catName', (req, res) => {
  let page = (req.query.page != undefined && req.query.page != 0) ? req.query.page : 1;
  const limit = (req.query.limit != undefined && req.query.limit != 0) ? req.query.limit : 10;

  let startValue, endValue;
  if(page > 0)
  {
    startValue = (page * limit) - limit;
    endValue = page * limit;
  }
  else
  {startValue = 0; endValue = 9;}

  // Iau Numele categoriei din URL
  const cat_title = req.params.catName;

  database.table('products as p').join([{
    table: 'categories as c',
    on: `c.id = p.cat_id where c.title like '%${cat_title}%'`
  }]).withFields(['c.title as category',
    'p.title as name',
    'p.price',
    'p.quantity',
	'p.description',
    'p.image',
    'p.id']).slice(startValue, endValue).sort({id: .1}).getAll().then(prods => {
    if(prods.length > 0)
    {
      res.status(200).json({
        count: prods.length,
        products: prods
      });
    }
    else {
      res.json({message: 'No Products Found in This Category!'});
    }
  }).catch(err => console.log(err));
});




module.exports = router;
