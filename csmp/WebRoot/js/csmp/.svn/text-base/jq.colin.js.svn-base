(function($,window,document){
	var methods = {
	    tree : function(options){
	    	var settings = $.extend({
		        fsize : "14px",//节点字体大小
		        fcolor : "#333",//节点字体颜色
		        ticon : "",//非叶子节点图标
		        licon : "",//叶子节点图标
		        lineh : "150%",
		        isopened : false,//默认是否展开
		        checkboxed : true,//是否带复选框
		        cachecked: false,//是否做级联选择
		        linked: false//a标签是否可用
			}, options);
	    	var trees = "";
	    	if(settings.type == "json"){
	    		trees = settings.source[0];
	    	}else{
	    		$.ajax({
                    type: "POST",
				    url: settings.source,
				    data: settings.data,
				    dataType: "text",
				    success: function(msg){
				    	trees = eval("(" + settings.msg + ")");
				    }
                });
	    	}
	    	$(this).html("<ul>" + treeDiv(settings.isopened, settings.checkboxed, trees) + "</ul>").css({"font-size":settings.fsize, "color":settings.fcolor, "line-height":settings.lineh});
	    	$(this).attr("class", "jqc_tree");
	    	$("li.t_m_li a").click(function(){
	    		var cdn = $(this).parent().next("li");
	    		if(cdn.css("display") == "none"){
	    			cdn.slideDown('fast');
	    			$(this).parent().removeClass("closed").addClass("opened");
	    		}else{
	    			cdn.slideUp('fast');
	    			$(this).parent().removeClass("opened").addClass("closed");
	    		}
	    	});
	    	$("a.t_link").click(function(){
	    		if(settings.linked){
	    			window.top.cpage.window.location.href = $(this).attr("name");
	    		}
	    	});
	    	$(":checkbox").click(function(){
	    		var ced = $(this).attr("checked");
	    		if(settings.cachecked){
	    			if($(this).parent().attr("class") != "no_childs"){
	    				var chs = $(this).parent().next("li");
		    			$(chs).find("input").each(function(){
		    				$(this).attr("checked", ced);
		    			});
	    			}
	    			$(this).parents().each(function(){
                        if($(this).attr("class") == "cs_li"){
                        	if(ced){
                        		$(this).prev("li.t_m_li").children("input").attr("checked", ced);
                        	}
                        }
	    			});
	    		}
	    	});
	    },
	    treeValue : function(){
	    	var array = new Array();
	    	var index = 0;
	    	$(this).find(".cb_abc").each(function(){
	    		array[index++] = $(this).val();
	    	});
	    	return array;
	    },
	    addEle : function(options){
	    	var fEle = $("#" + options.from);
	    	var toEle = $("#" + options.to);
	    	
	    	if(options.type == "after"){
	    		if(options.to.indexOf("fid") >= 0){
	    			$(toEle).next("li").after($(fEle));
		    	}else{
		    		$(toEle).after($(fEle));
		    	}
    		}else if(options.type == "before"){
    			$(toEle).before($(fEle));
    		}else{
    			$(fEle).appendTo($(toEle).next("li").children("ul"));
    		}
	    },
	    removeEle : function(ele){
	    	$(this).find(".cb_abc").each(function(){
	    		if($(this).attr("checked")){
	    			var p = $(this).parent();
	    			if($(p).attr("id").indexOf("fid") >= 0){
	    	    		$(p).next("li").remove();
	    	    	}
	    	    	$(p).remove();
	    		}
	    	});
	    },
		aui : function(options){
			var settings = $.extend({
				color : "#F00",
		        fontSize : "12px",
		        textDecoration : "none"
			}, options);
			return this.each(function() {//加return支持链式调用
		        //对每个元素进行操作
		        $(this).append(' ' + $(this).attr('href')).css({
		            "color" : settings.color,
		            "fontSize" : settings.fontSize,
		            "textDecoration" : settings.textDecoration
		        });
		    });
		}
	    
	};
	$.fn.clplugin = function(method) {
	    //在这里面,this指的是用jQuery选中的元素
		if(methods[method]){
			//arguments是JavaScript里的一个内置对象，它包括了函数调用时传入的所有参数。
			//Array.prototype.slice.call(arguments, 1):将arguments的第二个元素转换成数组对象
			//apply的第一个参数(这里是this)将代替Function(methods[method])类里this对象
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		}else{
			CsmpJS.msg({title:"Error", content:"Method " + method + " does not exist!"});
		}
	};
	function treeDiv(isopened, checkboxed, trees){
		var rs = "";
		var cs = trees.childs;
		if(null != cs && cs.length > 0){
			rs += "<li class=\"t_m_li closed\" id=\"fid" + trees.value + "\">";
			if(checkboxed){
				rs += "<input class=\"cb_abc\" type=\"checkbox\" value=\"" + trees.value + "\">";
			}
			rs += "<a class=\"t_link\" name=\"" + trees.asrc + "\" href=\"javascript:void(0)\">" + trees.txt + "</a></li><li class=\"cs_li\"";
			if(!isopened){
				rs +="style=\"display: none;\"";
			}
			rs += "><ul>";
			for(var i = 0; i<cs.length; i++){
				rs += treeDiv(isopened, checkboxed, cs[i]);
			}
			rs += "</ul></li>";
		}else{
			rs += "<li class=\"no_childs\" id=\"cid" + trees.value + "\">";
			if(checkboxed){
				rs += "<input class=\"cb_abc\" type=\"checkbox\" value=\"" + trees.value + "\">";
			}
			rs += "<a class=\"t_link\" name=\"" + trees.asrc + "\" href=\"javascript:void(0)\">" + trees.txt + "</a></li>";
		}
		return rs;
	}
})(jQuery,window,document);