//当前时间
function showTime(){
    var now=new Date();
    var x=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+"&nbsp;&nbsp;";
    var t=now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
    var p=document.getElementById("time");
    //将当前时间显示在p里面
    p.innerHTML=x+t;
}
window.setInterval("showTime()",1000);


//轮播广告
// function carousel() {
//     //var images = ["lunbo01.png","lunbo02.jpg","lunbo03.png","lunbo04.jpg"];
//
//     var images = new Array();
//     lun.forEach((item,index)=>{
//         images[index] = images.push(item);
//     });
//     var index = 0;
//     $("#list li").eq(0).css("background","red");
//     setInterval(function () {
//         index++;
//         if(index == images.length){
//             index = 0;
//         }
//         $("#image").attr("src",`../public/image\\${images[index]}`);//设置或返回被选元素的值
//         $("#list li").css("background","#aaaaaa");
//         $("#list li").eq(index).css("background","green");
//     },1000);
// }
// carousel();

//自动滑动
function notice(){
    setInterval(function () {
        //animate():CSS 属性集的自定义动画,linear值:不同的动画点中设置动画速度
        $("#express li").first().animate({marginTop:'-38px'},1000,"linear",function () {

            $(this).css("margin-top","0px");
            $("#express").append($(this)).clone();
            $(this).remove();
            $("#express").append($(this));
        });
    },1000);
}
notice();

//导航栏下拉列表框
// 使用滑动效果，显示隐藏被选元素
// 使用滑动效果，隐藏被选元素
function pullDown(){
    $("#menu1").click(function () {
        $(".nav1 ul li .n_top1").slideDown(1000);
    })
        .mouseout(function () {
            $(".nav1 ul li .n_top1").slideUp(1000);
        })
    $("#menu2").click(function () {
        $(".nav1 ul li .n_top2").slideDown(1000);
    })
        .mouseout(function () {
            $(".nav1 ul li .n_top2").slideUp(1000);
        })
    $("#menu3").click(function () {
        $(".nav1 ul li .n_top3").slideDown(1000);
    })
        .mouseout(function () {
            $(".nav1 ul li .n_top3").slideUp(1000);
        });
}
pullDown();



//四季水果的显示与不显示
//mouseout()mouseleave()与鼠标在其被选元素的子元素上来回离开时:触发mouseout,不触发mouseleave
function show(){
    $(".main_left li").mouseover(function () {
        $(this).find("ul").show();
    })

    $(".main_left li").mouseleave(function () {
        $(this).find("ul").hide();
    })
    }
show();



//广告与卖家入门切换
function cut(){
    $(".main_right .notice .notice1 li").click(function () {
        var index = $(this).index();
        if(index == 0)
        {
            $("#express").show();
            $("#expression").hide();
            $("#li1").css("background","#d6e9d6");
            $("#li2").css("background","white");
        }else{
            $("#express").hide();
            $("#expression").show();
            $("#li2").css("background","#d6e9d6");
            $("#li1").css("background","white");
        }
    })
}
cut();