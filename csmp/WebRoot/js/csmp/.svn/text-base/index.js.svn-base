$(function() {
	$(".login-out").click(function(){
		var div = $(this).next("div");
		if(div.css("display") == "none"){
			div.slideDown('fast');
		}else{
			div.slideUp('fast');
		}
	});
	
	$("#menu li").click(function(){
		li_click();
		$(this).css("background", "url('css/img/2.jpg') no-repeat");
		if($(this).attr("class") == "home"){
			$(this).children("label").css("color", "#FFF").css("background", "url('css/img/b1.png') no-repeat");
			$("#mpage").attr("src","main");
		}else if($(this).attr("class") == "good-scan"){
			$(this).children("label").css("color", "#FFF").css("background", "url('css/img/b2.png') no-repeat");
			$("#mpage").attr("src","good_getGoodScan");
		}else if($(this).attr("class") == "my-cart"){
			$(this).children("label").css("color", "#FFF").css("background", "url('css/img/b3.png') no-repeat");
			CsmpJS.login("car_list");
		}else if($(this).attr("class") == "my-order"){
			$(this).children("label").css("color", "#FFF").css("background", "url('css/img/b4.png') no-repeat");
			CsmpJS.login("order_list");
		}
	});
	
	$("a.l_out").click(function(){
		$.ajax({
		    url:"home_loginOut.action",
			type:"post", 
			cache:false,
			dataType:"text",
			success:function(msg){
				if(msg == "0"){
					window.location.href="index.action";
				}
			}
		});
	});
	
	$("li.coll_page").click(function(){
		try {
			window.external.addFavorite("http://202.100.84.157:8244/csmp/index", "卖炭网-首页");
		} catch (e) {
			try {
				window.sidebar.addPanel("卖炭网-首页", "http://202.100.84.157:8244/csmp/index", "");   
			} catch (e) {
				alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");
			}
		}
	});
	
	$("li.mao").click(function(){
		window.top.open_customer();
	});
});

function li_click(){
	$("#menu_list li").each(function(){
		$(this).css("background", "#FFF");
		if($(this).attr("class") == "home"){
			$(this).children("label").css("color", "#666").css("background", "url('css/img/b1-1.png') no-repeat");
		}else if($(this).attr("class") == "good-scan"){
			$(this).children("label").css("color", "#666").css("background", "url('css/img/b2-1.png') no-repeat");
		}else if($(this).attr("class") == "my-cart"){
			$(this).children("label").css("color", "#666").css("background", "url('css/img/b3-1.png') no-repeat");
		}else if($(this).attr("class") == "my-order"){
			$(this).children("label").css("color", "#666").css("background", "url('css/img/b4-1.png') no-repeat");
		}
	});
}