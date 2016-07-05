var CsmpJS ={
	login : function(url, fun_name, ids){
		$.ajax({
			url:"check_user.action" ,
			type:"post", 
			cache:false,
			dataType:"text",
			success:function(msg){
			    if(msg == "1"){
			    	if(url == null){
						fun_name(ids);
					}else if(url!=null && ids!=null){
						window.parent.location.href=url+"?goodId="+ids;
					}else{
						if($("#mpage").attr("src") != null){
							$("#mpage").attr("src", url);
						}else{
							location.href=url;
						}
					}
			    }else{
			    	if(typeof  showLogin === "function"){
			    		showLogin();
			    	}else{
			    		if(window){
			    			window.top.showLogin();
			    		}else{
			    			win.top.showLogin();
			    		}
			    	}
			    }
			}
		});
	},
	showBG : function(fid, did, offsetW, offsetH){
		var ch = window.document.body.clientHeight;//浏览器可视区域的高度
	    var cw = window.document.body.clientWidth;//浏览器可视区域的宽度
        var bh = document.body.scrollHeight;//获取当前窗体的总高度
        var bw = document.body.scrollWidth;
        $("#" + fid).css({
             height:bh + 1000,
             width:bw + 1500, 
             display:"block"
        });
        var dh = $("#" + did).css("height").replace("px", "")*1;
        var dw = $("#" + did).css("width").replace("px", "")*1;
        var top = (ch - dh)*0.5 + offsetH;
        var left = (cw - dw)*0.5 + offsetW;
        $("#" + did).css("top", top).css("left", left);
        $("#" + did).show();
	},
	loading : function(options){
		var defaults = {
				mid : "01",
				txt : "Loading..."
		};
		var setting = $.extend(defaults, options);
		var tcw = window.top.document.body.clientWidth;//最外层父页面浏览器可视区域的宽度
		var tch = window.top.document.body.clientHeight;//最外层父页面浏览器可视区域的高度
		var tbh = window.top.document.body.scrollHeight;//最外层父页面当前窗体的总高度
		var ldiv = "<div id='cjs_loading'><div id='cjs_f_bg'></div><div id='cjs_load_gif'>" + setting.txt + "<img src='img/load/load_" + setting.mid + ".gif'></div></div>";
		$(ldiv).appendTo(window.top.document.body);
		/*
		    $("#f_bg", window.top.document).attr("id");//在iframe子页面获取最外层父页面元素
		    $("#f_bg", documnt.iframes('iframe').document).attr("id");//在父页面获取iframe子页面的元素
		*/
		$("#cjs_f_bg", window.top.document).css("opacity","0.3").css("background", "#CCC").css("height", tbh).css("width", tcw).css("position", "absolute").css("left", 0).css("top", 0)
        .css("display", "block").css("z-index", "20");
		
		var img_h = $("#cjs_load_gif img", window.top.document).css("height");
        var img_w = $("#cjs_load_gif img", window.top.document).css("width");
        img_h = img_h.substring(0, img_h.length - 2);
        img_w = img_w.substring(0, img_w.length - 2);
        var left = (tcw - img_w)*0.5;
        var top = (tch - img_h - 16)*0.5;
        $("#cjs_load_gif", window.top.document).css("font-size", "12px").css("height", img_h*1 + 12).css("width", img_w).css("position", "absolute").css("left", left).css("top", top).css("display", "block")
        .css("z-index", "30");
	},
	closeLoading:function(){
		$("#cjs_loading", window.top.document).remove();
	},
	msg: function(options){
		var defaults = {
				title : "提示",//标题文本内容
				t_color : "#15428B",//标题字体颜色
				t_size : "14px",//标题字体大小
				c_color : "#333",//文本信息字体颜色
				c_size : "12px",//文本信息字体大小
				line_height : "150%",//内容文本行间距
				border : "1px solid #99BBE8",//弹出框及内容文本边框
				background : "#E4EDFE"//弹出框背景色
		};
		var setting = $.extend(defaults, options);
		var mdiv = "", b = 0, c = 0;
		var tcw = window.top.document.body.clientWidth;//最外层父页面浏览器可视区域的宽度
		var tch = window.top.document.body.clientHeight;//最外层父页面浏览器可视区域的高度
		var tbh = window.top.document.body.scrollHeight;//最外层父页面当前窗体的总高度
		window.top.document.addEventListener("mousemove", function(e){
			if(!mdiv){
                return;
            }
			$(mdiv).css({"left":e.pageX-b, "top":e.pageY-c});
		}, false);
		window.top.document.addEventListener("mouseup", function(e){
			if(!mdiv){
                return;
            }
            document.all?mdiv.releaseCapture():window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
            mdiv="";
		}, false);
		var msg_div = "<div id='cjs_msg_win'><div id='cjs_f_bg'></div><div id='cjs_msg'><div id='cjs_m_top'><div id='cjs_title'></div><div id='cjs_close'></div></div><div id='cjs_m_body'><div id='cjs_m_content'></div><div id='cjs_m_bto'></div></div></div></div>";
		$(msg_div).appendTo(window.top.document.body);
		$("#cjs_f_bg", window.top.document).css({"opacity":"0.3", "background":"#CCC", "height":tbh, "width":tcw, "position":"absolute", "left":"0", "top":"0", "display":"block", "z-index":"20"});
		var left = (tcw - 300)*0.5;
        var top = (tch - 115)*0.5;
		$("#cjs_msg", window.top.document).css({"background":setting.background, "height":"115", "width":"300", "position":"absolute", "left":left, "top":top, "display":"block", "z-index":"30", "border":setting.border});
		$("#cjs_m_top", window.top.document).css({"height":"30", "width":"300"}).mousedown(function(e){
			mdiv = $("#cjs_msg", window.top.document);
			left = $(mdiv).css("left").replace("px", "")*1;
			top = $(mdiv).css("top").replace("px", "")*1;
			document.all?mdiv.setCapture():window.captureEvents(Event.MOUSEMOVE);
            b=e.clientX-left;
            c=e.clientY-top;
		});
		$("#cjs_title", window.top.document).text(setting.title).css({"height":"20", "margin-left":"5", "margin-top":"5", "display":"inline", "float":"left", "color":setting.t_color, "font-size":setting.t_size, "font-weight":"bold"});
		$("#cjs_close", window.top.document).attr("title","关闭").css({"width":"16", "height":"16", "margin-right":"5", "margin-top":"5", "display":"inline", "float":"right", "background":"url('img/close/close_5.png')","cursor":"pointer"}).click(function(){
			$("#cjs_msg_win", window.top.document).remove();
		});
		$("#cjs_m_body", window.top.document).css({"height":"70", "width":"280","padding":"5", "margin-left":"4", "font-size":setting.c_size, "line-height":setting.line_height, "background":"#FFF", "border":setting.border});
		$("#cjs_m_content", window.top.document).html("<span style='margin-left:10px;'></span>" + setting.content).css({"height":"50", "width":"280", "color":setting.c_color});
		$("#cjs_m_bto", window.top.document).html("<input type='button' value='确 定' id='cjs_qr_bot'>");
		$("#cjs_qr_bot", window.top.document).css({"display":"block", "width":"60", "height":"20", "margin-left":"110", "background":"url('img/other/bot.png')", "border":"none", "cursor":"pointer"}).click(function(){
			$("#cjs_msg_win", window.top.document).remove();
		});
	},
	confirm : function(options, callback){
		var setting = $.extend({
			title : "提示",//标题文本内容
			t_color : "#15428B",//标题字体颜色
			t_size : "14px",//标题字体大小
			c_color : "#333",//文本信息字体颜色
			c_size : "12px",//文本信息字体大小
			line_height : "150%",//内容文本行间距
			border : "1px solid #99BBE8",//弹出框及内容文本边框
			background : "#E4EDFE"//弹出框背景色
		}, options);
		
		var mdiv = "", b = 0, c = 0;
		var tcw = window.top.document.body.clientWidth;//最外层父页面浏览器可视区域的宽度
		var tch = window.top.document.body.clientHeight;//最外层父页面浏览器可视区域的高度
		var tbh = window.top.document.body.scrollHeight;//最外层父页面当前窗体的总高度
		window.top.document.addEventListener("mousemove", function(e){
			if(!mdiv){
                return;
            }
			$(mdiv).css({"left":e.pageX-b, "top":e.pageY-c});
		}, false);
		window.top.document.addEventListener("mouseup", function(e){
			if(!mdiv){
                return;
            }
            document.all?mdiv.releaseCapture():window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
            mdiv="";
		}, false);
		var msg_div = "<div id='cjs_msg_win'><div id='cjs_f_bg'></div><div id='cjs_msg'><div id='cjs_m_top'><div id='cjs_title'></div><div id='cjs_close'></div></div><div id='cjs_m_body'><div id='cjs_main'><div id='cjs_mark_gif'></div><div id='cjs_m_content'></div></div><div id='cjs_m_bto'></div></div></div></div>";
		$(msg_div).appendTo(window.top.document.body);
		$("#cjs_f_bg", window.top.document).css({"opacity":"0.3", "background":"#CCC", "height":tbh, "width":tcw, "position":"absolute", "left":"0", "top":"0", "display":"block", "z-index":"20"});
		var left = (tcw - 300)*0.5;
        var top = (tch - 115)*0.5;
		$("#cjs_msg", window.top.document).css({"background":setting.background, "height":"115", "width":"300", "position":"absolute", "left":left, "top":top, "display":"block", "z-index":"30", "border":setting.border});
		$("#cjs_m_top", window.top.document).css({"height":"30", "width":"300"}).mousedown(function(e){
			mdiv = $("#cjs_msg", window.top.document);
			left = $(mdiv).css("left").replace("px", "")*1;
			top = $(mdiv).css("top").replace("px", "")*1;
			document.all?mdiv.setCapture():window.captureEvents(Event.MOUSEMOVE);
            b=e.clientX-left;
            c=e.clientY-top;
		});
		$("#cjs_title", window.top.document).text(setting.title).css({"height":"20", "margin-left":"5", "margin-top":"5", "display":"inline", "float":"left", "color":setting.t_color, "font-size":setting.t_size, "font-weight":"bold"});
		$("#cjs_close", window.top.document).attr("title","关闭").css({"width":"16", "height":"16", "margin-right":"5", "margin-top":"5", "display":"inline", "float":"right", "background":"url('img/close/close_5.png')","cursor":"pointer"}).click(function(){
			$("#cjs_msg_win", window.top.document).remove();
			if (typeof (callback) == "function") {
				callback("关闭");
			}
		});
		$("#cjs_m_body", window.top.document).css({"height":"70", "width":"280","padding":"5", "margin-left":"4", "font-size":setting.c_size, "line-height":setting.line_height, "background":"#FFF", "border":setting.border});
		$("#cjs_mark_gif", window.top.document).html("<img id='cjs_mark_img'>").css({"height":"50", "width":"50", "display":"inline", "float":"left"});
		$("#cjs_mark_gif img", window.top.document).attr("src","img/other/153Z55P8-21.gif").css({"height":"50", "width":"50"});
		$("#cjs_m_content", window.top.document).html("<span style='margin-left:10px;'></span>" + setting.content).css({"height":"50", "width":"230", "display":"inline", "float":"right", "color":setting.c_color});
		$("#cjs_m_bto", window.top.document).html("<input type='button' value='确 定' id='cjs_qr_bot'><input type='button' value='取 消' id='cjs_cel_bot'>");
		$("#cjs_qr_bot", window.top.document).css({"width":"60", "height":"20", "margin-left":"70", "background":"url('img/other/bot.png')", "border":"none", "cursor":"pointer"}).click(function(){
			$("#cjs_msg_win", window.top.document).remove();
			if (typeof (callback) == "function") {
				callback("是");
			}
		});
		$("#cjs_cel_bot", window.top.document).css({"width":"60", "height":"20", "margin-left":"20", "background":"url('img/other/bot.png')", "border":"none", "cursor":"pointer"}).click(function(){
			$("#cjs_msg_win", window.top.document).remove();
			if (typeof (callback) == "function") {
				callback("否");
			}
		});
	},
	dialog : function(obj, options, callback){
		var setting = $.extend({
			title : "提示",//标题文本内容
			t_color : "#15428B",//标题字体颜色
			t_size : "14px",//标题字体大小
			border : "1px solid #99BBE8",//弹出框及内容文本边框
			background : "#E4EDFE"//弹出框背景色
		}, options);
		var mdiv = "", b = 0, c = 0;
		var tcw = window.top.document.body.clientWidth;//最外层父页面浏览器可视区域的宽度
		var tch = window.top.document.body.clientHeight;//最外层父页面浏览器可视区域的高度
		var tbh = window.top.document.body.scrollHeight;//最外层父页面当前窗体的总高度
		var dw = $(obj).css("width");
		var dh = $(obj).css("height");
		dw = parseInt(dw.substring(0, dw.length - 2)) + 10;
		dh = parseInt(dh.substring(0, dh.length - 2)) + 35;
		var left = (tcw - dw)*0.5;
        var top = (tch - dh)*0.5;
		window.top.document.addEventListener("mousemove", function(e){
			if(!mdiv){
                return;
            }
			$(mdiv).css({"left":e.pageX-b, "top":e.pageY-c});
		}, false);
		window.top.document.addEventListener("mouseup", function(e){
			if(!mdiv){
                return;
            }
            document.all?mdiv.releaseCapture():window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
            mdiv="";
		}, false);
		var dl_div = "<div id='cjs_dialog_win'><div id='cjs_f_bg'></div><div id='cjs_msg'><div id='cjs_m_top'><div id='cjs_title'></div><div id='cjs_close'></div></div><div id='cjs_content'>" + $(obj).html() + "</div></div></div>";
		$(dl_div).appendTo(window.top.document.body);
		$("#cjs_f_bg", window.top.document).css({"opacity":"0.3", "background":"#CCC", "height":tbh, "width":tcw, "position":"absolute", "left":"0", "top":"0", "display":"block", "z-index":"20"});
	    
		$("#cjs_msg", window.top.document).css({"background":setting.background, "height":dh, "width":dw, "position":"absolute", "left":left, "top":top, "display":"block", "z-index":"30", "border":setting.border});
		$("#cjs_m_top", window.top.document).css({"height":"30", "width":dw}).mousedown(function(e){
			mdiv = $("#cjs_msg", window.top.document);
			left = $(mdiv).css("left").replace("px", "")*1;
			top = $(mdiv).css("top").replace("px", "")*1;
			document.all?mdiv.setCapture():window.captureEvents(Event.MOUSEMOVE);
            b=e.clientX-top;
            c=e.clientY-top;
		});
		$("#cjs_title", window.top.document).text(setting.title).css({"height":"20", "margin-left":"5", "margin-top":"5", "display":"inline", "float":"left", "color":setting.t_color, "font-size":setting.t_size, "font-weight":"bold"});
		$("#cjs_close", window.top.document).attr("title", "关闭").css({"width":"16", "height":"16", "margin-right":"5", "margin-top":"5", "display":"inline", "float":"right", "background":"url('img/close/close_5.png')","cursor":"pointer"}).click(function(){
			$("#cjs_dialog_win", window.top.document).remove();
		});
		$("#cjs_content", window.top.document).css({"height":dh-35, "width":dw-10, "margin-left":"5", "border":setting.border});
		
		$("#cjs_cf", window.top.document).click(function(){
			if(typeof(callback) == "function"){
				callback("callback_msg_");
		    }else{
		    	msg({title:"Error", content:"Method does not exist!"});
		    }
		});
	},
	closeDialog: function(){
		$("#cjs_dialog_win", window.top.document).remove();
	},
	test : function(url, fun_name){
		if(url == null){
    		alert(arguments[0]+ ":" + arguments[1]+ ":" + arguments[2]);
			var number_arr = new Array();
			var i = 2;
			for(i;i<arguments.length;i++){
				number_arr[i-2] = arguments[i];
			}
			fun_name(number_arr);
		}
	}
};

function playnum(abc){
	alert(abc);
	return "321";
}

function buy(goodId) {
	$.post("save_car_good.action", {
		"goodId" : goodId
	}, function(data) {
		if (data == '"success"') {
			alert("添加成功！");
		}else if(data == '"noLogin"')
		{
		    alert("请先登录！");
		}else {
			alert("添加失败！");
		}
	});
}

function buyNow()
{

}