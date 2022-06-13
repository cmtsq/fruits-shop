// 点击用户头像，获取用户名称
$('.comment img').click(function(){
    var index = $('.comment img').index(this);
    var uname = $('.comment:eq('+index+') .uname').text();
    var goodsId = $('.comment:eq('+index+') .goodsId').text();
    $('.name').val("回复"+uname);
    $('.f_id').val(goodsId)
    $('textarea').focus();
    $('.comment p,.comment span').css('color','black');
    $('.comment:eq('+index+') p,.comment:eq('+index+') span').css('color','red')
});