const  sql = require('./sql');

//插入用户信息
function insertUser(params,callback) {
    var sqlStr = "insert into tb_user(userName,passWord,linkName) values(?,?,?)";
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            console.log(err.message);
            return callback(err,null);
        }
        callback(null,result.insertId);
    })
}

function selectByCon(condition,params,callback) {
    var sqlStr = "select * from tb_user "+condition;
    sql.query(sqlStr,params,(err,result)=>{
        if(err){
            return callback(err.message);
        }
        callback(null,result);
    })
}

module.exports.insertUser = insertUser;
module.exports.selectByCon = selectByCon;