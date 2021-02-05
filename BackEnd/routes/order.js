const express = require('express');
const router = express.Router();
const {database} = require('../config/helpers');

/* GET orders page -> Iau toate comenzile. */
router.get('/', (req, res) => {
    database.table('orders_details as od').join([{
        table: 'orders as o',
        on: 'o.id = od.order_id'
    },
    {
        table: 'products as p',
        on: 'p.id = od.product_id'
    },
    {
        table: 'users as u',
        on: 'u.id = o.user_id'
    }]).withFields(['o.id',
    'p.title as name',
    'p.description',
    'p.price',
    'u.username']).sort({id: 1}).getAll().then(orders => {
        if(orders.length > 0)
            res.status(200).json(orders)
        else res.json({message: 'No Orders Found!'});
    }).catch(err => console.log(err));
});


/* GET -> Iau o singură comandă. */
router.get('/:id', (req, res) => {
    const orderId = req.params.id;

    database.table('orders_details as od').join([{
        table: 'orders as o',
        on: 'o.id = od.order_id'
    },
        {
            table: 'products as p',
            on: 'p.id = od.product_id'
        },
        {
            table: 'users as u',
            on: 'u.id = o.user_id'
        }]).withFields(['o.id',
        'p.title as title',
        'p.description',
        'p.price',
		'p.image',
		'od.quantity as quantityOrdered',
        'u.username']).filter({'o.id': orderId}).getAll().then(orders => {       // GetAll pt că o comandă poate să aibă mai multe produse în ea
        if(orders.length > 0)
            res.status(200).json(orders)
        else res.json({message: 'No Order Found!'});
    }).catch(err => console.log(err));
});



/* POST -> Plasez o nouă comandă */
router.post('/new', (req, res) => {
    let {userId, products} = req.body;
    //if(userId !== null && userId > 0)
    //{
        database.table('orders').insert({
            user_id: userId
        }).then(newOrderId => {
            if(newOrderId > 0)
            {
                products.forEach(async (p) => {
                    let data = await database.table('products').filter({id: p.id}).withFields(['quantity']).get();
                    let inCart = p.incart;

                    // Actualizez numărul de produse rămase pe stoc atunci când e plasata o comandă
                    if(data.quantity > 0)
                    {
                        data.quantity = data.quantity - inCart;
                        if(data.quantity < 0) data.quantity = 0;
                    }
                    else data.quantity = 0;

                    //
                    database.table('orders_details').insert({
                        order_id: newOrderId,
                        product_id: p.id,
                        quantity: inCart
                    }).then(newId => {
                        database.table('products').filter({id: p.id}).update({quantity: data.quantity}).then(successNum => {})
                            .catch(err => console.error(err));
                    }).catch(err => console.log(err));
                })
            }
            else res.json({message: 'New Order Failed while adding products.', success: false});
            
            res.json({
                message: `Order successfully placed with id: ${newOrderId}!`,
                success: true,
                order_id: newOrderId,
                products: products
            });

        }).catch(err => console.log(err));
    //}
    //else res.json({message: 'New order failed!', success: false});
});


/* POST: fake payment */
router.post('/payment', (req, res) => {
    setTimeout(() => {
        res.status(200).json({success: true});
    }, 3000)
});


module.exports = router;