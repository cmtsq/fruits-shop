const express = require('express');
const perCtr = require('../controller/perCtr');
const orderCtr = require('../controller/orderCtr');
var perRouter = express.Router();

//显示个人中心
perRouter.get('/persenter',(req,res)=>{
    perCtr.showPer(req,res);
});
//显示我的订单
perRouter.get('/order',(req,res)=>{
    orderCtr.showOrderHistory(req,res);
});
//显示订单详情
perRouter.get('/orderDetail',(req,res)=>{
    orderCtr.showOrder(req,res);
});
//确认收货
perRouter.get('/receiveGoods',(req,res)=>{
    perCtr.receiveGoods(req,res);
});
//我的收藏
perRouter.get('/collect',(req,res)=>{
    perCtr.selectLike(req,res);
});
//取消收藏
perRouter.get('/delCollect',(req,res)=>{
    perCtr.delLike(req,res);
});
//显示地址
perRouter.get('/address',(req,res)=>{
    perCtr.selectUserAddr(req,res);
});
//添加地址
perRouter.get('/addAddress',(req,res)=>{
    res.render('address_add.html');
});
//提交地址
perRouter.post('/doAddAddrs',(req,res)=>{
    perCtr.addAddress(req,res);
});
//修改地址
perRouter.get('/updateAddress',(req,res)=>{
    perCtr.updateAddress(req,res);
});
perRouter.post('/doUpdateAddrs',(req,res)=>{
    perCtr.doUpdateAddr(req,res);
});
//删除地址
perRouter.get('/delAddress',(req,res)=>{
    perCtr.delAddress(req,res);
});

module.exports = perRouter;