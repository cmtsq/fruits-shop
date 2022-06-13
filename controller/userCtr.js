const userDao = require('../dao/userDao');

//用户注册
function regUser(req,res) {
    var userName = req.body.userName;
    var passWord = req.body.passWord;
    var linkName = req.body.linkName;
    userDao.insertUser([userName,passWord,linkName],(err,result)=>{
        if(err){
            return res.send(err.message)
        }
        res.send("<script>alert('注册成功');window.location.href='/user/login'</script>");
    })
}
//用户效验
function check(req,res) {
    var userName = req.body.uname;
    userDao.selectByCon("where userName=?",[userName],(err,result)=>{
        if(err){
            res.send(err.message);
        }
        //将查询到的记录数发送给客户端
        res.send({usersCount:result.length});
    })
}
//用户登录
function loginUser(req,res){
    var userName = req.body.userName;
    var passWord = req.body.passWord;
    userDao.selectByCon("where userName=? and passWord=?",[userName,passWord],(err,result)=>{
        if(err){
            return res.send(err.message);
        }
        if(result.length>0){
            //将用户名和用户ID保存在session中
            req.session.userName = result[0].userName;
            req.session.uId = result[0].uId;
            res.send("<script>alert('登录成功');window.location.href='/goods/index?page=1'</script>")
        }else{
            res.send("<script>alert('用户名或者密码错误');window.location.href='/user/login'</script>")
        }
    });
}
//退出登录
function loginOut(req,res){
    //清除登录时存储在session中的值
    req.session.userName = null;
    req.session.uId = null;
    res.send("<script>window.location.href='/user/login'</script>");
}

module.exports.regUser = regUser;
module.exports.check = check;
module.exports.loginUser = loginUser;
module.exports.loginOut = loginOut;