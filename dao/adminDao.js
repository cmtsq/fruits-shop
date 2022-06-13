const sql = require('./sql');

//查询管理员
function selectAdmin(condition,params,callback) {
    var sqlStr= "select * from tb_admin "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    })
}
//插入管理员信息
function insertAdmin(params,callback) {
    var sqlStr = "insert into tb_admin(a_user,a_pass) values(?,?)";
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result.insertId);
    });
}
//修改管理员信息
function alterAdmin(params,callback){
    var sqlStr = "update tb_admin set a_user=?,a_pass=? where a_id=?";
    sql.query(sqlStr,params,(err,result)=> {
        if (err) {
            return callback(err, null);
        }
        //返回更新记录的行数
        callback(null, result.affectedRows)
    });
}
//插入商品信息
function insertGoods(params,callback){
    var sqlStr = "insert into tb_fruits(f_name,f_price,f_stock,f_type,f_picurl) values(?,?,?,?,?)";
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result.insertId);
    });
}
//修改商品信息
function alterGoods(params,callback){
    var sqlStr = "update tb_fruits set f_name=?,f_price=?,f_stock=?,f_type=?,f_picurl=? where f_id=?";
    sql.query(sqlStr,params,(err,result)=> {
        if (err) {
            return callback(err, null);
        }
        //返回更新记录的行数
        callback(null, result.affectedRows)
    });
}
//删除管理员
function delAdmin(params,callback){
    sql.query("delete from tb_admin where a_id=?",params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        //删除成功，返回删除记录的行数
        callback(null,result.affectedRows);
    })
}
//根据查询条件查询商品信息
function searchGoodsByCon(condition,params,callback) {
    var sqlStr = "select * from tb_fruits "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result);
    })
}
//查询所有评论
function selectAllComment(callback){
    var sqlStr = 'select * from tb_comment c,tb_user a,tb_fruits b where b.f_id=c.f_id and a.uId=c.uId;';
    sql.query(sqlStr,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results);
    })
}
//添加回复评论内容
function inserReply(params,callback){
    console.log('1');
    var sqlStr = "insert into reply(name,f_id,content) values(?,?,?);";
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results.affectedRows);
    })
}
//发货
function updateOrder(condition,params,callback){
    var sqlStr = "update tb_order set order_state='待发货' "+condition;
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results);
    })
}

module.exports.selectAdmin = selectAdmin;
module.exports.insertAdmin = insertAdmin;
module.exports.alterAdmin = alterAdmin;
module.exports.insertGoods = insertGoods;
module.exports.alterGoods = alterGoods;
module.exports.delAdmin = delAdmin;
module.exports.searchGoodsByCon = searchGoodsByCon;
module.exports.selectAllComment = selectAllComment;
module.exports.inserReply = inserReply;
module.exports.updateOrder = updateOrder;


