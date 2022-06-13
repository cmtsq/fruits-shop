const express = require('express');
const userCtr = require('../controller/userCtr');
var userRouter = express.Router();

//展示注册页
userRouter.get('/register',(req,res)=>{
    res.render('register.html');
});
//注册页跳转
userRouter.post('/reg',(req,res)=>{
    userCtr.regUser(req,res);
});
//用户效验
userRouter.post('/check',(req,res)=>{
    userCtr.check(req,res);
});
//展示登录页
userRouter.get('/login',(req,res)=>{
    res.render('login.html');
});
//退出登录
userRouter.get('/loginOut',(req,res)=>{
    userCtr.loginOut(req,res);
});
//登录页跳转
userRouter.post('/log',(req,res)=>{
    userCtr.loginUser(req,res);
});

module.exports = userRouter;