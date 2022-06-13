const adminDao = require('../dao/adminDao');
const goodsDao = require('../dao/goodsDao');
const orderDao = require('../dao/orderDao');
const sql = require('../dao/sql');

//管理员登录
function adminUser(req,res){
    var a_user = req.body.name;
    var a_pass = req.body.pass;
    adminDao.selectAdmin("where a_user=? and a_pass=?",[a_user,a_pass],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        if(result.length>0){
            //将用户名和用户ID保存在session中
            req.session.a_user = result[0].a_user;
            req.session.a_pass = result[0].a_pass;
            req.session.a_id = result[0].a_id;
            res.send("<script>alert('登录成功');window.location.href='/back/backIndex?page=1'</script>")
        }else{
            res.send("<script>alert('用户名或者密码错误');window.location.href='/back/adminLogin'</script>")
        }
    });
}
//管理员注销登录
function adminLoginOut(req,res){
    req.session.a_user = null;
    req.session.a_pass = null;
    req.session.a_id = null;
    res.redirect('/back/adminLogin');
}
//后台数据
function showAdmin(req,res) {
    if(req.session.a_user){
        var pageSize = 4;
        var page = parseInt(req.query.page);
        goodsDao.getPageCount(pageSize,(err,pageCount)=> {
            if (err) {
                return res.end(err.message);
            }
            goodsDao.getGoodsByPage(page, pageSize, (err, result) => {
                if (err) {
                    return res.end(err.message);
                }
                orderDao.selectOrder("",[],(err,orders)=>{
                    if (err) {
                        return res.end(err.message);
                    }
                    adminDao.selectAdmin("",[],(err,person)=>{
                        if(err){
                            return res.end(err.message);
                        }
                        res.render('admin/admin.html',{goods:result,pageCount:pageCount,page:page,orders:orders,
                            person:person,a_user:req.session.a_user,a_id:req.session.a_id});
                    });
                });
            })
        });
    }else{
        res.redirect('/back/adminLogin');
    }
}
//添加管理员信息
function addAdmin(req,res){
    var a_user = req.body.adminName;
    var a_pass = req.body.passWord;
    adminDao.insertAdmin([a_user,a_pass],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        res.send("<script>alert('添加成功');window.location.href='/back/backIndex?page=1'</script>");
    });
}
//添加水果信息
function addGoods(req,res){
    var f_name = req.body.fruitName;
    var f_price = req.body.price;
    var f_stock = req.body.stock;
    var f_type = req.body.type;
    var f_picurl = req.body.picurl;
    adminDao.insertGoods([f_name,f_price,f_stock,f_type,f_picurl],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        res.send("<script>alert('添加成功');window.location.href='/back/backIndex?page=1'</script>");
    });
}
//通过id查询需要修改的管理员信息
function showUpdateAdmin(req,res){
    if(req.session.a_user){
        var Id = parseInt(req.query.id);
        adminDao.selectAdmin("where a_id=?",[Id],(err,result)=>{
            // 3.用res对象进行客户端响应
            if(err){
                return res.end(err.message);
            }
            res.render('admin/updateAdmin.html',{adminList:result[0],a_user:req.session.a_user,a_id:req.session.a_id});
        });
    }else{
    res.redirect('/back/adminLogin');
    }
}
//修改的管理员信息
function updateAdmin(req,res){
    var a_user = req.body.adminName;
    var a_pass = req.body.passWord;
    var a_id = req.body.id;
    adminDao.alterAdmin([a_user,a_pass,a_id],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        res.send("<script>alert('修改成功');window.location.href='/back/backIndex?page=1';</script>");
    });
}
//可移除管理员
function delAdmin(req,res) {
    var id = req.query.id;
    adminDao.delAdmin([id],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        res.send("<script>alert('移除成功！');window.location.href='/back/backIndex?page=1'</script>");
    });
}
//通过id查询需要修改的商品信息
function showUpdateGoods(req,res){
    if(req.session.a_user){
        var Id = parseInt(req.query.id);
        goodsDao.selectGoodsByCon("where f_id=?",[Id],(err,result)=>{
            if(err){
                return res.end(err.message);
            }
            res.render('admin/updateFruits.html',{fruitsList:result[0],a_user:req.session.a_user,a_id:req.session.a_id});
        });
    }else{
        res.redirect('/back/adminLogin');
    }
}
//修改的商品信息
function updateGoods(req,res){
    var f_name = req.body.fruitName;
    var f_price = req.body.price;
    var f_stock = req.body.stock;
    var f_type = req.body.type;
    var f_picurl = req.body.picurl;
    var f_id = req.body.id;
    adminDao.alterGoods([f_name,f_price,f_stock,f_type,f_picurl,f_id],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        res.send("<script>alert('修改成功');window.location.href='/back/backIndex?page=1'</script>");
    });
}
//查询订单详细信息
function showOrderDetail(req,res){
    if(req.session.a_user){
        var order_id = req.query.order_id;
        var address = req.query.address;
        orderDao.selectOrderDetail("and c.order_id=? and e.address=?",[order_id,address],(err,result)=>{
            if(err){
                return res.send(err.message);
            }
            res.render('admin/order.html',{order:result[0],orders:result,a_user:req.session.a_user,a_id:req.session.a_id});
        });
    }else{
        res.redirect('/back/adminLogin');
    }
}
//模糊查询商品信息
function searchGoods(req,res) {
    var searchKey = req.body.searchKey;
    //``处理字符串连接问题
    adminDao.searchGoodsByCon(`where f_name like '%${searchKey}%'`,[],(err,result)=>{
        if(err){
            return res.end(err.message);
        }
        res.render('admin/selectFruits.html',{searchGoods:result,a_user:req.session.a_user,a_id:req.session.a_id});
    });
}
//查看商品评论
function comment(req,res){
    adminDao.selectAllComment((err,comments)=>{
        if(err){
            return res.send(err.message);
        }
        var sqlStr = "select * from reply;";
        sql.query(sqlStr,(err,reply)=>{
            if(err){
                return res.send(err.message);
            }
            res.render('admin/comment.html',{comments:comments,replys:reply,a_id:req.session.a_id});
        });
    });
}
//回复评论
function reply(req,res){
    var name = req.query.name;
    var f_id = req.query.f_id;
    var comment = req.query.comment;
    adminDao.inserReply([name,f_id,comment],(err,reply)=>{
        if(err){
            return res.send(err.message);
        }
        res.send('<script>alert("回复成功");window.location.href="/back/comment";</script>')
    })

}
//发货功能
function sendGoods(req,res){
    var order_id = req.query.order_id;
    adminDao.updateOrder('where order_id=?',[order_id],(err,update)=>{
        if(err){
            return res.send(err.message);
        }
        res.send(`<script>alert("发货成功");window.location.href='/back/backIndex?page=1';</script>`);
    });
}

module.exports.adminUser = adminUser;
module.exports.showAdmin = showAdmin;
module.exports.addAdmin = addAdmin;
module.exports.addGoods = addGoods;
module.exports.showUpdateAdmin = showUpdateAdmin;
module.exports.updateAdmin = updateAdmin;
module.exports.showUpdateGoods = showUpdateGoods;
module.exports.updateGoods = updateGoods;
module.exports.showOrderDetail = showOrderDetail;
module.exports.delAdmin = delAdmin;
module.exports.searchGoods = searchGoods;
module.exports.comment = comment;
module.exports.reply = reply;
module.exports.adminLoginOut = adminLoginOut;
module.exports.sendGoods = sendGoods;



