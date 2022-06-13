const cartDao = require('../dao/cartDao');
const orderDao = require('../dao/orderDao');
const async = require('async');

//结算商品，生成订单
function submitOrder(req,res) {
    var uId = req.session.uId;
    var checkGoods = req.body.checkFruits;
    var order_address = req.body.address;
    orderDao.insertGoodsToOrder([uId,order_address],(err,result)=>{
        if(err){
            return res.end(err.message);
        }
        var order_id = result;
        if(checkGoods==undefined){
            res.send("<script>alert('请选择要结算的商品！');window.location.href='/cart/showCart'</script>")
        }else{
            if(typeof checkGoods == "object")
            {
                async.each(checkGoods,(f_id,callback)=>{
                    cartDao.selectByCon("and b.uId=? and a.f_id=?",[uId,f_id],(err,item)=>{
                        orderDao.insertOrderDetail([order_id,f_id,item[0].goodsNum,item[0].f_price],(err,result1)=>{
                            cartDao.del("where uId=? and f_id=?",[uId,f_id],(err,result2)=>{
                                callback(err);
                            });
                        });
                    });
                },(err)=>{
                    if(err){
                        return res.send(err.message);
                    }
                    res.send("<script>alert('订单生成成功！');window.location.href='/per/persenter'</script>");
                });
            }else{
                cartDao.selectByCon("and b.uId=? and a.f_id=?",[uId,checkGoods],(err,item)=>{
                    orderDao.insertOrderDetail([order_id,checkGoods,item[0].goodsNum,item[0].f_price],(err,result1)=>{
                        if(err){
                            return res.end(err.message);
                        }
                        cartDao.del("where uId=? and f_id=?",[uId,checkGoods],(err,result2)=>{
                            if(err){
                                return res.end(err.message);
                            }
                            res.send("<script>alert('订单生成成功！');window.location.href='/per/persenter'</script>");
                        });
                    });
                });
            }
        }
    });
}
//前台订单的显示
function showOrderHistory(req,res){
    if(req.session.userName){
        var uId = req.session.uId;
        orderDao.selectOrder("and a.uId=? group by order_id",[uId],(err,result)=>{
            if(err){
                return res.end(err.message);
            }
            res.render('order history.html',{order:result});
        });
    }else{
        res.redirect('/user/login');
    }
}
//订单详情
function showOrder(req,res){
    if(req.session.userName){
        var order_id = req.query.id;
        var uId = req.session.uId;
        var address = req.query.address;
        orderDao.selectOrderDetail("and c.uId=? and c.order_id=? and e.address=?",[uId,order_id,address],(err,result)=>{
            if(err){
                return res.end(err.message);
            }
            res.render('orders.html',{orders:result,order:result[0]});
        })
    }else{
        res.redirect('/user/login');
    }
}

module.exports.submitOrder = submitOrder;
module.exports.showOrderHistory = showOrderHistory;
module.exports.showOrder = showOrder;