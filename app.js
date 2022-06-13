const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
var app = express();
app.listen(3000,'127.0.0.1',()=>{
        console.log('服务器已经启动');
    }
);
app.use(session({
    secret:'201666',
    resave:false,
    saveUninitialized:true
}));
app.use('/public',express.static(path.join(__dirname,'public')));
app.engine('html',require('express-art-template'));
app.use(bodyParser.urlencoded({extended:false}));
app.use('/goods',require('./router/goodsRouter'));
app.use('/user',require('./router/userRouter'));
app.use('/cart',require('./router/cartRouter'));
app.use('/order',require('./router/orderRouter'));
app.use('/back',require('./router/adminRouter'));
app.use('/per',require('./router/perRouter'));
