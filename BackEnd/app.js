const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');  // share your resources with diff domains
const bodyParser = require('body-parser')  //altfel am eroare TypeError: Cannot destructure property 'userId' of 'req.body' as it is undefined.
const app = express();


// Import Rute
const productsRoute = require('./routes/products');
const usersRoute = require('./routes/users');
const orderRouter = require('./routes/order');
const authRouter = require('./routes/auth');



/*
	Eroare: TypeError: Cannot destructure property 'userId' of 'req.body' as it is undefined.
	TREBUIE PUSE LINIILE ASTEA 2 COD ÎNAINTE DE RUTE CA SĂ MEARGĂ.
*/
app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true }))




// Use Rute
app.use('/api/products', productsRoute);
app.use('/api/users', usersRoute);
app.use('/api/orders', orderRouter);
app.use('/api/auth', authRouter);




app.use(cors({
    origin: "*",
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
    allowedHeaders: 'Content-Type, Authorization, Origin, X-Requested-With, Accept'
}));




/*
	LINIILE ASTEA DE COD AR PUTEA FI FOLOSITE PT EROAREA DE ALLOWRESTRICTIONS, DAR MIE NU ÎMI MERGE... SO...

app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});
app.use(function(req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
 });*/
 

 


app.use(logger('combined'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));






module.exports = app;
