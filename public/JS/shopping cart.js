//全选或全不选
//prop():设置或返回被选元素的属性和值
//attr 是从页面搜索获得元素值，所以页面必须明确定义元素才能获取值，相对来说较慢。
// prop是从属性对象中取值，属性对象中有多少属性，就能获取多少值，不需要在页面中显示定义
$("#inputAll").click(function() {
    if(this.checked) {
        $(".check").prop("checked",true);
        getTotal()
    } else {
        $(".check").prop("checked", false);
        getTotal()
    }
});
//选中全部商品后，全选会勾住
$(".check").click(function () {
    if( $(".check:checked").length == $(".check").length){
        $("#inputAll").prop('checked',true);
        getTotal();
    }else {
        $("#inputAll").prop('checked',false);
        getTotal()
    }
});
//水果数量的增减
$(".plus").click(function () {
    let n=$(this).siblings("input").val();
    n++;
    $(this).siblings("input").val(n);
    //商品小计
    // 获取单价的文本值
    //获得当前元素集合中每个元素的后代
    let price=$(this).parent().siblings().find(".figure").text();
    //获取商品小计
    $(this).parent().siblings().find(".subtotal").text((parseFloat(price)*n).toFixed(2));
    getTotal();
});
$(".minus").click(function () {
    let n=$(this).siblings("input").val();
    n--;
    if(n>=0) {
        $(this).siblings("input").val(n);
    }
    //商品小计
    //  获取单价的文本值
    let price=$(this).parent().siblings().find(".figure").text();
    //获取商品小计
    $(this).parent().siblings().find(".subtotal").text((parseFloat(price)*n).toFixed(2));
    getTotal();
});
//商品数量文本框改变
$(".sum").change(function () {
    let n=$(this).val();
    //商品小计
    //  获取单价的文本值
    let price=$(this).parent().siblings().find(".figure").text();
    console.log(price);
    //获取商品小计
    $(this).parent().siblings().find(".subtotal").text((parseFloat(price)*n).toFixed(2)+"元");
    getTotal();
});

//勾选商品，总价和总数量发生改变
$(".check").click(function () {
    getTotal()
});

//获取商品件数和总价
function getTotal () {
    var count=0;
    var money=0;
    // 变量"i"遍历的索引位置，从0开始，变量“ele”遍历得到的对象元素
    //each():规定为每个匹配元素规定运行的函数
    $(".total #money").text(money.toFixed(2));
    $(".selected #quantity").text(count);
    $(".check").each(function () {
        if(this.checked){
            $(this).parent().siblings().find(".sum").each(function (i,ele){
                count+=parseInt($(ele).val());
            });
            $(".selected #quantity").text(count);
            $(this).parent().siblings().find(".subtotal").each(function (i,ele) {
                if (i>=0){
                    money+=parseFloat($(ele).text());//$(ele).text():读取总价
                }
            });
            $(".total #money").text(money.toFixed(2));
        }
    });
}
