const express = require('express');
const orderCtr = require('../controller/orderCtr');
var orderRouter = express.Router();

//结算商品，生成订单
orderRouter.post('/orderList',(req,res)=>{
    orderCtr.submitOrder(req,res);
});

module.exports = orderRouter;