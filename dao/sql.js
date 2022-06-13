const mysql = require('mysql');
module.exports.query = function query(sql,values,callback) {
    var connection = mysql.createConnection({
        host:'localhost', port:3306,
        user:'root', password:'cm200225',
        database:'fruitsnet1'
    });
    connection.connect((err)=>{
        if(err){
            return callback(err,null);
        };
        connection.query(sql,values,(err,result)=>{
            if(err){
                return callback(err,null);
            }
            callback(null,result);
        });
        connection.end();
    })
}