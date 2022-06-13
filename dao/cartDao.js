const sql = require('./sql');

function selectByCon(condition,params,callback){
    var sqlStr = "select * from tb_fruits a,tb_cart b,tb_user c where a.f_id=b.f_id and b.uId=c.uId "+condition;
    sql.query(sqlStr,params,(err,item)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,item);
    })
}
function insertCart(uId,f_id,goodsNum,callback) {
    var sqlStr = "insert into tb_cart(uId,f_id,goodsNum) value(?,?,?)";
    sql.query(sqlStr,[uId,f_id,goodsNum],(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result.affectedRows);
    })
}
function updateCart(goodsNum,f_id,uId,callback){
    var sqlStr = "update tb_cart set goodsNum=goodsNum+? where f_id=? and uId=?";
    sql.query(sqlStr,[goodsNum,f_id,uId],(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result.affectedRows);
    })
}
function del(condition,params,callback){
    var sqlStr = "delete from tb_cart "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err,null);
        }
        callback(null,result.affectedRows);
    })
}
function selectAddress(condition,params,callback){
    var sqlStr = "select * from tb_address "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(er,rnull);
        }
        callback(null,result);
    });
}

module.exports.selectByCon = selectByCon;
module.exports.insertCart = insertCart;
module.exports.updateCart = updateCart;
module.exports.del = del;
module.exports.selectAddress = selectAddress;