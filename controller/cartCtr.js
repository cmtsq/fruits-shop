const cartDao = require('../dao/cartDao');
const async = require('async');

//展示购物车
function showCart(req,res){
    if(req.session.userName){
        var uId = req.session.uId;
        cartDao.selectByCon('and b.uId=?',[uId],(err,result)=> {
            if (err) {
                return res.send(err.message);
            }
            cartDao.selectAddress("where uId=?",[uId],(err,addressResult)=>{
                if(err){
                    res.end(err.message);
                }
                res.render('shopping cart.html',{addressList:addressResult,goodsList:result,userName:req.session.userName});
            });
        });
    }else{
        res.redirect('/user/login');
    }
}
//添加商品到购物车
function addGoodsToCart(req,res) {
    var uId = parseInt(req.session.uId);
    var f_id = parseInt(req.body.f_id);
    var goodsNum = parseInt(req.body.goodsNum);
    cartDao.selectByCon('and b.uId=? and a.f_id=?',[uId,f_id],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        if(result.length>0){
            cartDao.updateCart(uId,f_id,goodsNum,(err,result)=>{
                if(err){
                    return res.send(err.message);
                }
                res.send("<script>alert('添加成功!');window.location.href='/cart/showCart'</script>");
            })
        }else {
            cartDao.insertCart(uId,f_id,goodsNum,(err,result)=>{
                if(err){
                    return res.send(err.message);
                }
                res.send("<script>alert('添加成功');window.location.href='/cart/showCart'</script>");
            })
        }
    })
}
//删除所勾选的商品
function delCheckGoods(req,res){
    var checkGoods = req.body.checkFruits;
    if(checkGoods==undefined){
        res.send("<script>alert('没有商品可删除');window.location.href='/cart/showCart'</script>");
    }else{
        async.each(checkGoods,(f_id,callback)=>{
            cartDao.del("where f_id=?",[f_id],(err,result)=>{
                callback(err);
            });
        },(err)=>{
            if(err){
                return res.send(err.message);
            }
            res.send('<script>alert("删除成功");window.location.href="/cart/showCart"</script>');
        });
    }
}
//清空购物车
function delAllGoods(req,res){
    cartDao.del("",[],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        res.send('<script>alert("清空成功");window.location.href="/cart/showCart"</script>');
    });
}

module.exports.showCart = showCart;
module.exports.addGoodsToCart = addGoodsToCart;
module.exports.delCheckGoods = delCheckGoods;
module.exports.delAllGoods = delAllGoods;