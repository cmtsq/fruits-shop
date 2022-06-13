const perDao = require('../dao/perDao');
const userDao = require('../dao/userDao');
const formidable = require('formidable');
const path = require('path');

//显示个人中心
function showPer(req,res) {
    if(!req.session.uId){
        res.send('<script>alert("请前往登录");window.location.href = "/user/login";</script>');
    }else{
        var uId = req.session.uId;
        userDao.selectByCon('where uId=?',[uId],(err,result)=>{
            if(err){
                return res.send(err);
            }
            res.render('personal.html',{uId:req.session.uId,user:result[0]});
        });
    }
}
//确认收货
function receiveGoods(req,res){
    var order_id = req.query.order_id;
    perDao.updatePer('where order_id=?',[order_id],(err,update)=>{
        if(err){
            return res.send(err.message);
        }
        res.send(`<script>alert("收货成功");window.location.href="/per/orderDetail?id=${order_id}";</script>`)
    });
}
//查询收藏
function selectLike(req,res){
    var uId = req.session.uId;
    perDao.selectLike('and b.uId=?;',[uId],(err,likes)=>{
        if(err){
            return res.end(err.message);
        }
        res.render('collect.html',{likes:likes});
    })
}
//取消收藏
function delLike(req,res){
    var f_id = req.query.collect_id;
    var uId = req.session.uId;
    perDao.delLike('where f_id=? and uId=?;',[f_id,uId],(err,results)=>{
        if(err){
            return res.send(err.message);
        }
        res.send('<script>alert("已取消收藏！");window.location.href="/per/collect";</script>');
    });
}
//查询地址
function selectUserAddr(req,res){
    var uId = req.session.uId;
    perDao.selectUserAddr('select * from tb_address where uId=?;',[uId],(err,Addrs)=>{
        if(err){
            return res.send(err.message);
        }
        res.render('address.html',{Addrs:Addrs});
    });
}
//添加地址
function addAddress(req,res){
    var uname = req.body.uname;
    var phone = req.body.phone;
    var address = req.body.address;
    var uId = req.session.uId;
    perDao.selectUserAddr('insert into tb_address values(null,?,?,?,?)',[uId,uname,phone,address],(err,addAddress)=>{
        if(err){
            return res.send(err.message);
        }
        res.send('<script>alert("添加成功");window.location.href="/per/address"</script>');
    });
}
//根据ID显示修改地址页
function updateAddress(req,res) {
    var addressID = req.query.addressID;
    perDao.selectUserAddr('select * from tb_address where add_id=?',[addressID],(err,addrs)=>{
        if(err){
            return res.send(err.message);
        }
        res.render('address_update.html',{addrs:addrs[0]});
    });
}
//修改地址
function doUpdateAddr(req,res) {
    var add_id = req.body.add_id;
    var uname = req.body.uname;
    var phone = req.body.phone;
    var address = req.body.address;
    perDao.selectUserAddr('update tb_address set uname=?,phone=?,address=? where add_id=?',[uname,phone,address,add_id],(err,updateAddress)=>{
        if(err){
            return res.send(err.message);
        }
        res.send('<script>alert("修改成功");window.location.href="/per/address"</script>');
    });
}
//删除地址
function delAddress(req,res) {
   var add_id = req.query.addressID;
   perDao.selectUserAddr("delete from tb_address where add_id=?;",[add_id],(err,results)=>{
       if(err){
           return res.send(err.message);
       }
       res.send('<script>alert("已删除");window.location.href="/per/address";</script>');
   })
}

module.exports.receiveGoods = receiveGoods;
module.exports.selectLike = selectLike;
module.exports.delLike = delLike;
module.exports.selectUserAddr = selectUserAddr;
module.exports.addAddress = addAddress;
module.exports.delAddress = delAddress;
module.exports.showPer = showPer;
module.exports.updateAddress = updateAddress;
module.exports.doUpdateAddr = doUpdateAddr;