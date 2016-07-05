$(function() {
	var anum = 20;
	var height = parseInt($("#all").css("height").replace("px", ""));
	if(isNaN(height)){
		height = $("#all").height();
		anum = 40;
	}
    if(height < 630) height = 630;//设置最小高度740
    
    if(window){
          window.parent.set_fheight("main", height + anum);
          window.parent.set_fheight("mpage", height + anum);
    }else{
          win.parent.set_fheight("main", height + anum);
          win.parent.set_fheight("mpage", height + anum);
    }
    
    $("#marquee").kxbdMarquee({direction:"up",isEqual:false});
	$("a.new_link").each(function(){
	    $(this).text(get_text($(this).text(), 38));
	});
    
	$("li.m_c_t_t").click(function(){
		$("li.m_c_t_t").each(function (){
			$(this).removeClass("mct_hot");
		});
		$(this).addClass("mct_hot");
		var c_name = $(this).attr("name");
		var index = 0;
		$(".m_c_m div").each(function (){
			$(this).removeClass("cose");
			if(c_name == "mei" && index == 0){
				$(this).addClass("cose");
			}else if(c_name == "zhongzi" && index == 2){
				$(this).addClass("cose");
			}else if(c_name == "huafei" && index == 4){
				$(this).addClass("cose");
			}else if(c_name == "shuiguo" && index == 6){
				$(this).addClass("cose");
			}
			index++;
		});
	});
	
	$("#mao").click(function(){
		window.top.open_customer();
	});
	
	$("tbody").each(function(){
		$(this).children("tr").each(function(){
			$(this).children("td:first").each(function(){
				$(this).children("a.ggid").text(get_text($(this).children("a.ggid").text(), 20));
			});
			$(this).children("td:last").text(get_text($(this).children("td:last").text(), 34));
		});
		$(this).children("tr:odd").each(function(){
			$(this).css("background", "#EEE");
		});
	});
	
	$("#footer li").click(function(){
		if($(this).attr("class") == "sh"){
			if(window){
				window.open("http://www.shenhuagroup.com.cn/cs/sh/index.html");
			}else{
				win.open("http://www.shenhuagroup.com.cn/cs/sh/index.html");
			}
		}else if($(this).attr("class") == "jh"){
			if(window){
				window.open("http://www.gsjhjt.com/");
			}else{
				win.open("http://www.gsjhjt.com/");
			}
		}else if($(this).attr("class") == "tw"){
			if(window){
				window.open("http://8098833.czvv.com/");
			}else{
				win.open("http://8098833.czvv.com/");
			}
		}
	});
});

function get_text(txt, l){
	//alert(txt);
    var len = 0;
    for (var i=0; i<txt.length; i++) {
        if (txt.charCodeAt(i) > 127 || txt.charCodeAt(i) == 94) {  
            len += 2;
        } else {  
            len ++;
        }
    }
    
    if(len > l){
       var rtxt = "";
       var rlen = 0;
       
       for (var i=0; i<txt.length; i++) {
           if (txt.charCodeAt(i) > 127 || txt.charCodeAt(i) == 94) {  
               rlen += 2;
           } else {
               rlen ++;
           }
           if(rlen < l){
              rtxt +=  txt.substr(i, 1);
           } else {
              return rtxt;
           }
       }
    
    } else {
        return txt;
    }
}