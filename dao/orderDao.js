const sql = require('./sql');
//插入信息到订单表
function insertGoodsToOrder(params,callback) {
    var sqlStr = "insert into tb_order(uId,order_address) values(?,?) ";
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result.insertId);
    });
}
//插入信息到订单详情表
function insertOrderDetail(params,callback){
    var sqlStr = "insert into tb_order_detail(order_id,f_id,goodsNum,f_price) values(?,?,?,?)";
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    });
}
//查询订单信息
function selectOrder(condition,params,callback) {
    var sqlStr= "select * from tb_user a,tb_order b where a.uId=b.uId "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    });
}
//查看订单详情
function selectOrderDetail(condition,params,callback) {
    var sqlStr= "select * from tb_fruits a,tb_user b,tb_order c,tb_order_detail d,tb_address e where b.uId=e.uId and  b.uId=c.uId and a.f_id=d.f_id and c.order_id=d.order_id "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    });
}

module.exports.insertGoodsToOrder = insertGoodsToOrder;
module.exports.insertOrderDetail = insertOrderDetail;
module.exports.selectOrder = selectOrder;
module.exports.selectOrderDetail = selectOrderDetail;