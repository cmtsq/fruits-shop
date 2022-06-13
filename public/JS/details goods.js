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


//使用滑动效果，显示隐藏的被选元素。
// 使用滑动效果，隐藏被选元素
//导航栏下拉列表框
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



//图片放大
//animate():CSS 属性集的自定义动画
$(".other_content a .fruit .f_image").mouseout(function () {
    $(this).animate({width:"100%",height:"100%"})
})
$(".other_content a .fruit .f_image").mouseover(function () {
    $(this).animate({width:"90%",height:"90%"})
});

//鼠标展示图片
//设置或返回被选元素
$(".small_img ul li img").mouseover(function () {
    $("#showing").attr("src",$(this).attr("src"));//实现刷新图片
})