const goodsDao = require('../dao/goodsDao');
const formidable = require('formidable');
const path = require('path');

//按分页展示首页商品
function showHomeGoods(req,res) {
    var pageSize = 10;
    var page = parseInt(req.query.page);
    goodsDao.getPageCount(pageSize,(err,pageCount)=>{
        if(err){
            return res.end(err.message);
        }
        goodsDao.getGoodsByPage(page,pageSize,(err,result)=>{
            if (err){
                return res.end(err.message);
            }
            goodsDao.selectNotice("",[],(err,notice)=>{
                if (err){
                    return res.end(err.message);
                }
                goodsDao.selectLunbo((err,lunbo)=>{
                    if(err){
                        return res.end(err.message);
                    }
                    res.render('home page.html',{goods:result,pageCount:pageCount,page:page,notice:notice,lun:lunbo,userName:req.session.userName,uId:req.session.uId});
                });
            });
        });
    });
}
//搜索商品
function searchGoods(req,res) {
    var search = req.body.search;
    goodsDao.selectGoodsByCon(`where f_name like '%${search}%'`,[],(err,result)=>{
        if(err){
            return res.end(err.message);
        }
        res.render('search.html',{searchList:result,userName:req.session.userName});
    });
}
//展示公告信息
function showNotice(req,res){
    var n_id = parseInt(req.query.n_id);
    goodsDao.selectNotice("where n_id=?",[n_id],(err,result)=>{
        if(err){
            return res.end(err.message);
        }
        res.render('notice.html',{notice:result[0],userName:req.session.userName});
    });
}
//展示商品详情信息
function showGoodsDetail(req,res){
    var Id = req.query.Id;
    goodsDao.selectGoodsDetail(Id,(err,result)=>{
        if(err){
            return res.end(err.message);
        }
        goodsDao.selectEnjoyGoods((err,item)=>{
            if(err){
                return res.end(err.message);
            }
            //查询评论
            goodsDao.selectComment([Id],(err,comment)=>{
                if(err){
                    return res.end(err.message);
                }
                // console.log(comment);
                res.render('details  goods.html',{fruits:result[0],picture:result,enjoy:item,comments:comment,userName:req.session.userName,uId:req.session.uId});
            })
        });
    });
}
//发布评论
function inserComment(req,res){
    var form = new formidable.IncomingForm();
    form.parse(req,(err,fields)=>{
        var f_id = fields.f_id;
        var user_id = fields.user_id;
        var comment = fields.comment;
        goodsDao.selectCart('where a.order_id=b.order_id and b.f_id=? and a.uId=?; ',[f_id,user_id],(err,goods)=>{
            if(err){
                return res.end(err.message);
            }
            if(goods.length==0){
                res.send('<script>alert("你还未购买，不能评论！！！");window.location.href = "/goods/detail?Id='+f_id+'"</script>')
            }else{
                goodsDao.insertComment([f_id,user_id,comment],(err,result)=>{
                    if(err){
                        return res.end(err.message);
                    }
                    res.send('<script>alert("发表成功");window.location.href = "/goods/detail?Id='+f_id+'"</script>')
                })
            }
        })
    })
}
//添加收藏
function addLike(req,res){
    var uId = req.session.uId;
    var f_id = req.body.f_id;
    goodsDao.selectLike('where uId=? and f_id=?;',[uId,f_id],(err,like)=>{
        if(err){
            return res.end(err.message);
        }
        if(like.length>0){
            res.send('<script>alert("已收藏");window.location.href="/goods/detail?Id='+f_id+'"</script>')
        }else{
            goodsDao.addLike([uId,f_id],(err,likes)=>{
                if(err){
                    return res.end(err.message);
                }
                res.send('<script>alert("收藏成功");window.location.href="/goods/detail?Id='+f_id+'"</script>')
            })
        }
    })
}

module.exports.showHomeGoods = showHomeGoods;
module.exports.showGoodsDetail = showGoodsDetail;
module.exports.showNotice = showNotice;
module.exports.inserComment = inserComment;
module.exports.addLike = addLike;
module.exports.searchGoods = searchGoods;
