const express = require('express');
const goodsCtr = require('../controller/goodsCtr');
var goodsRouter = express.Router();

//首页数据
goodsRouter.get('/index',(req,res)=>{
    goodsCtr.showHomeGoods(req,res);
});
//搜索商品
goodsRouter.post('/search',(req,res)=>{
    goodsCtr.searchGoods(req,res);
});
//公告数据
goodsRouter.get('/notice',(req,res)=>{
    goodsCtr.showNotice(req,res);
});
//详情页数据
goodsRouter.get('/detail',(req,res)=>{
    goodsCtr.showGoodsDetail(req,res);
});
//发布评论
goodsRouter.post('/reply',(req,res)=>{
    if(!req.session.uId){
        res.send('<script>alert("没有登录，不能评论");window.location.href = "/user/login";</script>');
    }else{
        goodsCtr.inserComment(req,res);
    }
});
//收藏商品
goodsRouter.post('/addLike',(req,res)=>{
    if(!req.session.uId){
        res.send('<script>alert("没有登录，不能收藏");window.location.href = "/user/login";</script>');
    }else{
        goodsCtr.addLike(req,res);
    }
});

module.exports = goodsRouter;