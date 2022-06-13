const  sql = require('./sql');

//查询商品信息
function selectGoodsByCon(condition,params,callback) {
    var sqlStr = "select * from tb_fruits "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,result);
    });
}
//查询公告信息
function selectNotice(condition,params,callback) {
    var sqlStr = "select * from tb_notice "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,result);
    });
}
//查询轮播图信息
function selectLunbo(callback) {
    var sqlStr = "select * from tb_lunbo";
    sql.query(sqlStr,(err,result)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,result);
    });
}
//查询商品详情信息
function selectGoodsDetail(Id,callback){
    var sqlStr = "select * from tb_fruits join tb_fruits_picurl on tb_fruits.f_id=tb_fruits_picurl.f_id where tb_fruits.f_id=?";
    sql.query(sqlStr,[Id],(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    });
}
//猜你喜欢
function selectEnjoyGoods(callback){
    var sqlStr = "select * from tb_fruits join fruit_enjoy on tb_fruits.f_id=fruit_enjoy.f_id";
    sql.query(sqlStr,(err,item)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,item);
    });
}
//查询对该商品的评论
function selectComment(params,callback){
    var sqlStr = "select * from tb_user u,tb_comment c where u.uId=c.uId and c.f_id=?;";
    sql.query(sqlStr,[params],(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    })
}
//按页查询fruits信息
function getGoodsByPage(page,pageSize,callback) {
    var sqlStr = "select * from tb_fruits limit ?,?";
    sql.query(sqlStr,[(page-1)*pageSize,pageSize],(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    });
}
//得到总页数
function getPageCount(pageSize,callback) {
    var sqlStr = "select count(*) as newsCount from tb_fruits";
    sql.query(sqlStr,[],(err,result)=>{
        if(err){
            return callback(err,null);
        }
        var newsCount = result[0].newsCount;
        var pageCount = Math.ceil(newsCount/pageSize);
        callback(null,pageCount);
    })
}
//添加评论
function insertComment(params,callback){
    var sqlStr = "insert into tb_comment(f_id,uId,c_content) values(?,?,?);";
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return console.log(err.message);
        }
        callback(null,result.affectedRows);
    })
}
//查询是否收藏
function selectLike(condition,params,callback){
    var sqlStr = "select * from tb_collect " + condition;
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return console.log(err.message);
        }
        callback(null,results);
    })
}
//添加收藏
function addLike(params,callback){
    var sqlStr = 'insert into tb_collect(uId,f_id) values(?,?);';
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results.affectedRows);
    })
}
//查询该用户是否购买
function selectCart(condition,params,callback){
    var sqlStr = "select * from tb_order a,tb_order_detail b " + condition;
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results);
    })
}

module.exports.selectGoodsByCon = selectGoodsByCon;
module.exports.selectGoodsDetail = selectGoodsDetail;
module.exports.selectEnjoyGoods = selectEnjoyGoods;
module.exports.selectNotice = selectNotice;
module.exports.selectLunbo = selectLunbo;
module.exports.getGoodsByPage = getGoodsByPage;
module.exports.getPageCount = getPageCount;
module.exports.selectComment = selectComment;
module.exports.selectCart = selectCart;
module.exports.insertComment = insertComment;
module.exports.addLike = addLike;
module.exports.selectLike = selectLike;