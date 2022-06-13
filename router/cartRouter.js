const express = require('express');
const cartCtr = require('../controller/cartCtr');
var cartRouter = express.Router();

cartRouter.get('/showCart',(req,res)=>{
    cartCtr.showCart(req,res);
});
cartRouter.post('/addCart',(req,res)=>{
    if(!req.session.uId){
        res.send("<script>alert('请先登录');window.location.href='/user/login'</script>");
        return;
    }
    cartCtr.addGoodsToCart(req,res);
});
//删除所勾选的商品
cartRouter.post('/delete',(req,res)=>{
    cartCtr.delCheckGoods(req,res);
});
//清空购物车
cartRouter.get('/deleteAll',(req,res)=>{
    cartCtr.delAllGoods(req,res);
});

module.exports = cartRouter;