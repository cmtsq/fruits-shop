const sql = require('./sql');

//确认收货
function updatePer(condition,params,callback){
    var sqlStr = "update tb_order set order_state='已收货' "+condition;
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results);
    });
}
//查询收藏
function selectLike(condition,params,callback){
    var sqlStr = 'select * from tb_fruits a,tb_collect b where a.f_id=b.f_id ' + condition;
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results);
    })
}
//删除收藏
function delLike(condition,params,callback){
    var sqlStr = 'delete from tb_collect ' + condition;
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results.affectedRows);
    });
}
//对地址的增删改查
function selectUserAddr(sqlStr,params,callback){
    sql.query(sqlStr,params,(err,results)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,results);
    });
}
module.exports.updatePer = updatePer;
module.exports.selectLike = selectLike;
module.exports.delLike = delLike;
module.exports.selectUserAddr = selectUserAddr;