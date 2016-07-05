<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
<!-- 此处加入css -->
<style type="text/css">
     
div.page_no {
	width: 1298px; 
	margin-top : 5px;
	height: 30px;
	background: #F3F3F3;
	border: 1px solid #DEDEE0;
	margin-top: 10px;
}

div.page_no li {
	float: right;
	border: 0px solid #F00;
}

div.page_no li a {
	display: block;
	margin: 5px 10px;
	border: 1px solid #DEDEE0;
	width: 20px;
	height: 15px;
	padding-top: 2px;
	text-align: center;
	font-size: 12px;
	background: #FFF;
	color: #333;
	cursor: pointer;
}

div.page_no li a.buton {
	width: 60px;
	height: 15px;
	text-align: center;
	padding-top: 2px;
	font-size: 12px;
	background: #FFF;
	border: 1px solid #CCC;
}

div.page_no li a.n_click {
	color: #CCC;
}

div.page_no li input {
	float: right;
	display: block;
	margin: 5px 0px;
}

input.page_num {
	width: 30px;
	border-top: 1px solid #DEDEE0;
	border-bottom: 1px solid #DEDEE0; 
	border-left: none;
	border-right: none;
}

input.last {
	border: 1px solid #DEDEE0;
	background: #FFF;
	cursor: pointer;
}
  
input.n_last {
	color: #CCC;
	cursor: auto;
}


div.state {
	width: 100%;
	border-bottom: 2px solid #DDD;
}

.state li {
	height: 40px;
	float: left;
	border-bottom: 0px solid #DDD;
}

.state li a {
	height: 30px;
	display: block;
	font-size: 20px;
	font-weight: bold;
	color: #333;
	margin: 10px 30px;
	border: 0px solid #C9F;
	text-decoration: none;
}

.state li a:HOVER {
	height: 30px;
	display: block;
	font-size: 20px;
	font-weight: bold;
	color: #FF4400;
	margin: 10px 30px;
	border: 0px solid #C9F;
}

.state li span {
	height: 20px;
	display: block;
	margin-top: 10px;
	color: #DDD;
	border: 0px solid #C9F;
}

#ope2 li {
	font-size: 14px;
}

ul {
	list-style: none;
}
/*选项卡1*/
#global {
	width: 1300px;
	display: block;
	padding: 0px;
	margin: 0px auto;
	border: 0px solid #F00;
}

/*菜单class*/
.Menu {
	font: 18px "宋体";
	padding-top: 4px;
}

.Menubox {
	background: #589FD3;
	color: #FFF;
	height:33px;
}

.Menubox li {
	height:29px;
	float: left;
	display: block;
	cursor: pointer;
	width: 114px;
	text-align: center;	
	font-weight: bold;
	border: 0px solid #B6CFEA;
}

.Contentbox {
	clear: both;
	margin-top: 0px;
	border-top: none;
	height: 181px;
	text-align: center;
	padding-top: 8px;
}

li.focuse_li {
	background:#FF4400;
	color:#FFF;
}

.ope {
	float: left;
	cursor: pointer;
	font-size: 14px;
	color:#C40000;
	font-weight: bold;	
}
li.ope:hover {
     float: left;
	 cursor: pointer;
	 font-size: 14px; 
     color:black;
     font-weight: bold;
     }

/*表格格式*/
table.main,td,th {
	border-collapse: collapse;
	border: 1px solid #599FD3;
}
tr.tr_list{
  background:#599FD3;
  height: 30px;
  color: #FFFFFF;
  font-size: 14px;
}
tr.tr_body{
  font-size: 14px; 
}
th {
	heigth: 30px;
}

td {
	height: 90px;
	text-align: center;
}

#goodaddframe{
	margin: 0px auto;
	width: 1298px;
	border: 1px solid #ccc;
}

.fullbg {
	background: #BFBFBF;
	left: 0;
	opacity: 0.5; /*CSS标准.该属性支持Firefox, Safari和 Opera.0.5表示透明度为50%*/
	position: absolute;
	top: 0;
	z-index: 3;
	filter: alpha(opacity = 50); /*透明度兼容IE6*/
	-moz-opacity: 0.5; /*透明度兼容老版本的Mozilla浏览器*/
	-khtml-opacity: 0.5; /*透明度兼容老版本的Safari浏览器*/
}

/**修改商品基本信息*/
.dialog {
	background-color: #FFF;
	border: 5px solid #999;
	width: 1200px;
	height: 730px;
	margin: center;
	padding: 0px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 5%;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

/**商品    图片   信息*/
#dialog2 {
	border: 5px solid #999;
	width: 1200px;
	height: 600px;
	margin: center;
	padding: 0px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	border-radius: 5px;
	display: none;
}

/**商品  编辑图片  */
#imagePage
{
	border: 0px solid #DDD;
	width: 1190px;
	height: 550px;
	margin: center;
	padding:0px;
}

.dialog p.close {
	margin: 0 0 12px;
	height: px;
	line-height: 24px;
	background: #FFCC99;
	text-align: right;
	padding-right: 10px;
}

.dialog p.close a {
	color: #fff;
	text-decoration: none;
}

#dialog_text{
   width: 100%;
   height: 690px;
   border: 0px solid;
}

#mpage{
   width: 100%;
   height: 690px;
   border: 0px solid;
}

/*
添加图片路径 type="file" input的标签
**/
input.annex{	
	display:none;
}

#btnAddImg,#btnReset{
			height:30px;
			width:90px;
			margin:5px auto;
			font-size: 16px;
			font-weight:bolder;
			color:#333;
			background: #FC9;
}

tbody.allTab tr.alt td { /* css 注释：默认隔行背景颜色 */
	 background:#EAF8FF;
	 }   

tbody.allTab tr.over td{  /*鼠标经过变色   */
	background:#8CE6FE;
	} 
	
#searchText{
	width:263px;
	height:28px; 
	margin-top:1px;
	border:none; 
	font-size: 14px; 
	color:#999;
}

#searchBtn{
	background:#FF4400; 
	width: 50px; 
	height: 28px; 
	text-align: center; 
	border: none; 
	color:#FFF; 
	font-weight: bolder; 
	font-size: 14px;"
}
</style>

<script>

	function to_page(iden) {
	    var name = $("#searchText").val().replace(/(^\s*)|(\s*$)/g, "");
	    if(name=="请输入商品名称"){
	        name = "";
	    }
		if (iden == "fpage") { //转至首页
			$("#alink").attr("href", "good_manage_main.action?pageNum=1&pageSize=${pageBean.pageSize}&goodStat=${good_stat}&goodName=" + name);
		} else if (iden == "lpage") {  //转至尾页
			$("#alink").attr("href", "good_manage_main.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodStat=${good_stat}&goodName=" + name);
		} else if (iden == "secher_name") {   //以名称查询商品
			$("#alink").attr("href", "good_manage_main.action?pageNum=1&pageSize=${pageBean.pageSize}&goodStat=${good_stat}&goodName=" + name);
		}
		document.getElementById("alink").click();
	}
	
	function change_page(e){
		if(e.keyCode == 13){
		    var name = $("#searchText").val().replace(/(^\s*)|(\s*$)/g, "");//去除空格
			var pageNum = $("#current_page").val().replace(/(^\s*)|(\s*$)/g, "");
			var num_reg=/^[1-9]{1}\d*$/;
			var pageCount = ${pageBean.pageCount};
			pageNum = pageNum>pageCount? pageCount:pageNum;
			if(name=="请输入商品名称"){
	            name = "";
	        }
			if(!num_reg.test(pageNum)){
		        alert("页码只能为正整数");
                return false;
		    }
			$("#alink").attr("href", "good_manage_main.action?pageNum=" + pageNum + "&pageSize=${pageBean.pageSize}&goodStat=${good_stat}&goodName=" + name);
		    document.getElementById("alink").click();
		}
	}
	
	$(function() {
		var lid = "";
		if (${good_stat} == -1) {
			$("#one1").addClass("focuse_li");
		} else if (${good_stat} == 1) {
			$("#one3").addClass("focuse_li");
		} else if (${good_stat} == 0) {
			$("#one4").addClass("focuse_li");
		} else if (${good_stat} == 3)
		{
			$("#one5").addClass("focuse_li");
		}

		$(".Menubox li").each(function() { 
			//this:class="Menubox" 下的所有 li标签
			$(this).click(function(){ 
				lid = $(this).attr("id"); //获取click事件单击的li标签的id;		this:click事件单击的li标签,
				if (lid == "one1") {
					$("#goodaddframe").css("display", "none");
					$("#content-box").css("display", "block");
					$("#linked").attr("href","good_manage_main.action?goodStat=-1");
					document.getElementById("linked").click();
				} else if (lid == "one2") {
				    $(".Menubox li").each(function() {
					    $(this).removeClass("focuse_li"); //this:class="Menubox" 下的所有 li标签
				    });
					$("#content-box").css("display", "none");
					$("#goodaddframe").css("display", "block");
					$(this).addClass("focuse_li");
					$("#frame").attr("src","good_add_page.action");//给id = frame 的标签下的 src赋值=good_add_page.action
				} else if (lid == "one3") {
					$("#goodaddframe").css("display", "none");
					$("#content-box").css("display", "block");
					$("#linked").attr("href","good_manage_main.action?goodStat=1");
					document.getElementById("linked").click();
				} else if (lid == "one4") {
					$("#goodaddframe").css("display", "none");
					$("#content-box").css("display", "block");
					$("#linked").attr("href","good_manage_main.action?goodStat=0");
					document.getElementById("linked").click();
				}else if (lid == "one5") {
					$("#goodaddframe").css("display", "none");
					$("#content-box").css("display", "block");
					$("#linked").attr("href","good_manage_main.action?goodStat=3");
					document.getElementById("linked").click();
				}
			});
		});

		/*全选  全不选*/
		$("#checkAll").click(function() {
			$('input[name="subBox"]').attr("checked", this.checked);
		});
		
		var $subBox = $("input[name='subBox']");
		$subBox.click(function() {
			$("#checkAll").attr("checked",$subBox.length == $("input[name='subBox']:checked").length ? true: false);
		});
		
		/**单击行tr使该行checkbox状态改变*/
	    $("tr.tr_body").each(function(){	//获取行tr
	        $(this).children(".abc").each(function(){ //为每行里面的元素添加click事件
	           var cb = $(this).parent().find(".cb");//获取行tr里的checkBox
	             $(this).click(function(){
	                 cb.attr("checked", !cb.attr("checked"));
	                 var $subBox = $("input[name='subBox']");
	                 $("#checkAll").attr("checked",$subBox.length == $("input[name='subBox']:checked").length ? true: false);
	             });
	        });
	    });
		
		var height = parseInt($("div.list").css("height").replace("px",""));
	    //var height = document.body.scrollHeight;
	    if(height < 300) height = 300;
	    if(window){
	        window.parent.set_fheight("main", height);
	        window.parent.set_fheight("mpage", height);
		}else{
			win.parent.set_fheight("main", height);
			win.parent.set_fheight("mpage", height);
		}
		
		/**奇偶行间隔变色*/
    	$(".allTab tr").mouseover(function(){    //如果鼠标移到class为stripe的表格的tr上时，执行函数    
      		$(this).addClass("over");
      	}).mouseout(function(){  				//给这行添加class值为over，并且当鼠标一出该行时执行函数      
            $(this).removeClass("over");		//移除该行的class  
        });   
  		$(".allTab tr:even").addClass("alt");    //给class为stripe的表格的偶数行添加class值为alt 
	});

	//修改商品     基本信息     弹出层start
	function modify(gid) {
        CsmpJS.showBG("fullbg","dialog", 0, 0);
        $("#mpage").attr("src","good_modify_page.action?goodId=" + gid);
	}
	function closeBg() { 
        $("#fullbg,#dialog").hide();
        $("#mpage").attr("src","");
        location.reload();
    }
    //修改商品     基本信息     弹出层end
    
    //修改商品价格信息弹出层	start
	function priceModify() {
	    var ids = new Array();
	    var index = 0;
        $(":checkbox").each(function(){
            if($(this).attr("checked") == true){
                ids[index++] = $(this).val();
            }
        });
        
        if(index == 0){
            alert("请选择一条商品数据，再进行价格修改");
        }else if(index > 1){
            alert("该操作不支持批量操作，您只能选择一条数据");
        }else{
            $("#content-box").css("display", "none");
			$("#goodaddframe").css("display", "block");
            $("#frame").attr("src","good_price.action?goodId=" + ids[--index]);
        }
	}
	  
     //商品       编辑图片      弹出层start
	 function imageUpload() {
	    var ids = new Array();
	    var index = 0;
        $(":checkbox").each(function(){
            if($(this).attr("checked") == true){
                ids[index++] = $(this).val();
            }
        });
        
        if(index == 0){
            alert("请选择一条商品数据，再进行图片编辑");
            return false;
        }else if(index > 1){
            alert("该操作不支持批量操作，您只能选择一条数据");
            return false;
        }else{
            CsmpJS.showBG("fullbg2","dialog2", 0, 0);
            $("#imagePage").attr("src","good_image.action?goodId=" + ids[--index]);
        }
	 }
	 
	 function closeBg2() { 
         $("#fullbg2,#dialog2").hide();
         $("#imagePage").attr("src","");
     }
     //商品       编辑图片      弹出层end
     
     //商品设为热销商品
     function setHot(hotGood){
     	var ids = "";
        $(":checkbox").each(function(){
            if($(this).attr("checked") == true){
                if($(this).attr("id") != "checkAll"){
                	ids += $(this).val() + ",";
                }
            }
        });
        if(ids == ""){
        	if(hotGood == 1){
        		alert("请选择需设为热销的商品");
        	}else if(hotGood == 0){
	        	alert("请选择需取消热销的商品");
        	}
        	return false;
        }
        else{
            $.ajax({
				type : "POST",
				url : "good_setHot.action",
				data : "goodIds=" + ids + "&hotGood=" + hotGood,
				dataType : "text",
				success : function(msg) {
				    if(msg == "ok"){
				        alert("操作成功");
					    location.reload();//刷新本页面
				    }else{
				        alert("操作失败");
				    }
				}
			});
        }
     }
     
     //添加商品图片路径START
	 var index = 0;
	 function add_imgs(){
	     document.getElementById("add_annex").click();
	 }
	 function add_img(){
	     if($("#add_annex").val() != ""){
	         var htm = "<div id=\"" + index + "\"><span class=\"annex_name\">" + $("#add_annex").val() + "<a href=\"javascript:void(0);\" title=\"删除\" onclick=\"annex_close('" + index + "');\">×</a></span><input type=\"file\" name=\"image\" class=\"annex\"></div>";
	         $("#img_path").html($("#img_path").html() + htm); 
	         index++;
	     }
	 }
	    
	 function annex_close(oid){
	     document.getElementById(oid).innerHTML="";
	     document.getElementById(oid).style.display = "none";
	 }
	 //添加商品图片路径END
	   	
	 //上传图片->保存已添加图片start
	 function  saveImg(gid){
	   	 alert("上传图片成功");
	 }
	 //上传图片->保存已添加图片end
     
     
 	/**删除商品*/
    function remove(gid){
         if(confirm("确定要删除吗？")){
	         $.ajax({
				 type : "POST",
				 url : "good_delete.action",
					data : "goodId=" + gid,
					dataType : "text",
					success : function(msg) {
				    	if(msg == "ok"){
				        	alert("操作成功");
						    location.reload();//刷新本页面
					    }else{
					        alert("操作失败");
					    }
					}
		    });
        }
    }
    
    /**上下架操作*/
    function down_up_rack(stat){
        	var ids = "";
        	$(":checkbox").each(function(){
            	if($(this).attr("checked") == true){
                	if($(this).attr("id") != "checkAll"){
                		ids += $(this).val() + ",";
                	}
            	}
        	});
        	if(ids.length == 0){
        		alert("请选择要操作的商品");
        		return false;
        	}
        	if(stat == 2){
        		if(!confirm("确定要删除吗？")){
        			return false;
        		}
        	}
        	if(ids != ""){
            	$.ajax({
					type : "POST",
					url : "good_rack.action",
					data : "goodIds=" + ids + "&stat=" + stat,
					dataType : "text",
					success : function(msg) {
				    	if(msg == "ok"){
					        alert("操作成功");
						    location.reload();//刷新本页面
					    }else{
					        alert("操作失败"); 
				    	}
					}
				});
        	}
    }
    
    /**批量删除商品*/
    function dp_rack(stat, gid){
        $(":checkbox").each(function(){
            if($(this).val() == gid){
                $(this).attr("checked", true);
            }else{
                $(this).attr("checked", false);
            }
        });
        if(stat=='0'||stat=='1'){
        	down_up_rack(stat);
        }else if(confirm("确定要删除吗？")){
            down_up_rack(stat);
        }
    }
    
    function setframe_height(h){
        $("#goodaddframe").css("height", h);
        $("#frame").css("height", (h-4)).css("width", "1290").css("border", "none").css("background", "#FFF");
    }
    
    function setframe_css(name, value){
        $("#frame").css(name, value);
    }
    
</script>
</head>
<body>
<center>
<div id="global">
    <div class="list">
	    <a href="javascript:void(0);" id="linked"></a>
		<!-- 菜单选项卡 -->
		<div class="Menubox">
			<ul>
			   <li id="one1" class="Menu" ><span> 全部商品 </span> <span style="margin-right:20px;"></span></li>
			  
			   <li id="one2" class="Menu" ><span> 发布商品 </span></li>
			   
			   <li id="one3" class="Menu" ><span> 已上架  </span></li>
			 
			   <li id="one4" class="Menu"><span> 已下架 </span></li>
			   
			   <li id="one5" class="Menu"><span> 热销商品 </span></li>
			</ul>
			<div style="clear: both;"></div>
		</div><br/>
	    <div id="content-box">
			<!--商品列表页面 -->
		   <div class= "Content" id="con_one1">
		   	   <!-- 对商品进行操作 -->
			   <div id="ope11">
				   	<ul>
						<li class="ope">&nbsp;&nbsp;&nbsp;&nbsp;
						   <input id="checkAll" type="checkbox" /> 全选<span style="margin-left:20px;"></span>
						</li>
						
						<s:if test="%{#good_stat == 1 || #good_stat == -1}">
						    <li class="ope" onclick="down_up_rack('0');">下架<span style="margin-left:20px;"></span></li>
						</s:if>
						
						<s:if test="%{#good_stat == 0 || #good_stat == -1}">
						    <li class="ope" onclick="down_up_rack('1');">上架<span style="margin-left:20px;"></span></li>
						</s:if>
						
						<li class="ope" onclick="down_up_rack('2');">删除<span style="margin-left:20px;"></span></li>
						
						<li class="ope" onclick="imageUpload();">编辑图片<span style="margin-left:20px;"></span></li>
						
						<li class="ope" onclick="priceModify();">修改价格<span style="margin-left:20px;"></span></li>
						
						<li class="ope" onclick="setHot('1');">设为热销<span style="margin-left:20px;"></span></li>
						
						<li class="ope" onclick="setHot('0');">取消热销<span style="margin-left:20px;"></span></li>
						
						<li style="float:right;"> <span style="margin-right:10px;"></span>
						   <div style="width: 320px; height: 30px; background:#FF4400; padding: 0px;">
					          <input type="text" id="searchText" value="${empty gn ? '请输入商品名称':gn}" 
					          		onfocus="this.value='';" onblur="if(this.value==''){this.value='${gn}'}">
					          <input type="button" id="searchBtn" value="查  询" onclick="to_page('secher_name');"/>
					          <a href="" target="gshow" id="search_good"></a>
						   </div>
						</li> 
					</ul>
					<div style="clear:both;"></div>
				</div>
				
				<div class="page_no">
	              <ul>
	                  <li>
	                      <a href="#" id="alink" style="display:none;"></a>
	                      <c:if test="${pageBean.currentPage >= pageBean.pageCount && pageBean.pageCount > 0}">
	                          <a href="javascript:void(0);" class="buton n_click">下一页</a>
	                      </c:if>
	                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
	                          <a href="good_manage_main.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodStat=${good_stat}&goodName=${gn}" class="buton" title="Next Page">下一页</a>
	                      </c:if>
	                  </li>
	                  <li>
	                      <c:if test="${pageBean.currentPage >= pageBean.pageCount && pageBean.pageCount > 0}">
	                          <input type="button" class="last n_last" value="&gt;&gt;">
	                      </c:if>
	                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
	                          <input type="button" class="last" title="尾页" value="&gt;&gt;" onclick="to_page('lpage')">
	                      </c:if>
	                  </li>
	                  <li>
	                      <c:if test="${pageBean.pageCount > 0}">
	                          <input type="text" id="current_page" class="page_num" value="${pageBean.currentPage}/${pageBean.pageCount}" onkeydown="change_page(event);" >
	                      </c:if>
	                  </li>
	                  <li>
	                      <c:if test="${pageBean.currentPage == 1 && pageBean.pageCount > 0}">
	                          <input type="button" class="last n_last" value="&lt;&lt;">
	                      </c:if>
	                      <c:if test="${pageBean.currentPage > 1 && pageBean.pageCount > 0}">
	                          <input type="button" class="last" title="首页" onclick="to_page('fpage')" value="&lt;&lt;">
	                      </c:if>
	                  </li>
	                  <li>
	                      <c:if test="${pageBean.currentPage == 1 && pageBean.pageCount > 0}">
	                          <a href="javascript:void(0);" class="buton n_click">上一页</a>
	                      </c:if>
	                      <c:if test="${pageBean.currentPage > 1 && pageBean.pageCount > 0}">
	                          <a href="good_manage_main.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodStat=${good_stat}&goodName=${gn}" class="buton" title="Last Page" target="main">上一页</a>
	                      </c:if>
	                  </li>
	              </ul>
	              <div style="clear: both;"></div>
	          </div>
				
				<!-- 商品列表 -->
				<div style="margin-top: 0px; margin-bottom: 20px;" align="center">
	             <table class="main">
	                <thead>	<!-- 表头 -->
	                    <tr class="tr_list">
	                       <th style="width:40px;"></th>
	                       <th style="width:175px;">图片</th>
	                       <th style="width:345px;">商品名称</th>
	                       <th style="width:80px;">状态</th>
	                       <th style="width:190px;">上架时间</th>
	                       <th style="width:190px;">下架时间</th>
	                       <th style="width:160px;">类别</th>
	                       <th style="width:95px">操作</th>
	                    </tr>
	                </thead>
	                <tbody class="allTab"> <!-- 表身 -->
	                        <s:iterator value="#pageBean.recordList" id="good">
	                        
		                        <tr class="tr_body">
			                         <td>
			                         	<input name="subBox" class="cb" type="checkbox" value="${good.goodId}">
			                         </td>
			                         <td class="abc">
			                          
			                         	<!-- <img src="home_showImage.action?goodId=${good.goodId}" style="height:80px;width:80px;"/> -->
			                         	<c:forEach items="${good.images}" var="image">
			                                <c:if test="${image.isDefault == 1}">
			                                    <img alt="" src="${pageContext.request.contextPath}${image.imagePath}" style="height:80px;width:80px;"/>
			                                </c:if>
			                            </c:forEach>
			                         </td>
			                         <td class="abc">
			                         	<s:if test="#good.goodHot==1">
			                         		<span >${good.goodName}</span>
			                         		<img  style="width:25px;height:10px;" src="${pageContext.request.contextPath}/images/hotGood.png">
			                         	</s:if>
			                         	<s:else>
			                         		<span>${good.goodName}</span>
			                         	</s:else>
			                         </td>
			                         <td class="abc" style="color: red;">
			                             <s:if test="%{#good.goodStat == 1}">
			                                                                                                   在售 
			                             </s:if>
			                             <s:else>
			                                                                                                   停售
			                             </s:else>
		                             </td>
			                         <td class="abc">
			                             <s:date name="%{#good.upRackTime}" format="yyyy-MM-dd HH:mm:ss"/>
			                         </td>
			                         <td class="abc">
			                             <s:date name="%{#good.downRackTime}" format="yyyy-MM-dd HH:mm:ss"/>
			                         </td>
			                         <td class="abc">${good.type.typeName}</td>
			                         <td>
			                            <s:if test="%{#good.goodStat == 1 || #good.good_stat == -1}">
			                                <input type="button" value="下 架" onclick="dp_rack('0', ${good.goodId});" style="border:none; background:#FF4400; width: 50px; height:22px; text-align: center; font-size: 12px; font-weight: bold; padding-top: 2px; display:block; margin: 5px auto;color: #FFF;"/>
			                            </s:if>
			                            <s:elseif test="%{#good.goodStat == 0 || #good.good_stat == -1}">
			                                <input type="button" value="上  架" onclick="dp_rack('1', ${good.goodId});" style="border:none; background:#FF4400; width: 50px; height:22px; text-align: center; font-size: 12px; font-weight: bold; padding-top: 2px; display:block; margin: 5px auto;color: #FFF;"/>
			                            </s:elseif>
				                        <input id="btnModify" type="button" value="修  改" onclick="modify('${good.goodId}');" style="border:none; background:#FF4400; width: 50px; height:22px; text-align: center; font-size: 12px; font-weight: bold; padding-top: 2px; display:block; margin: 5px auto;color: #FFF;"/>
				                        <input id="btnDelete" type="button" value="删  除" onclick="remove('${good.goodId}');" style="border:none; background:#FF4400; width: 50px; height:22px; text-align: center; font-size: 12px; font-weight: bold; padding-top: 2px; display:block; margin: 5px auto;color: #FFF;"/>
			                         </td>
			                     </tr>
	                        </s:iterator>
	                </tbody>
	             </table>
	             <div style="clear: both;"></div>
	          </div>
	          <div style="clear: both;"></div>
		   	</div>
		   	<div style="clear: both;"></div>
		</div>
		<div style="clear: both;"></div> 
	</div>
	
	<!-- 增加商品页面 start -->
	<div id="goodaddframe" style="display:none;">
	    <iframe src="" id="frame"></iframe>
	    <div style="clear: both;"></div>
	</div>
	
	<!-- 增加商品页面 end -->
	
	<!-- 修改      商品基本信息      弹出层 start-->
	<div>
		<div id="fullbg" class="fullbg"></div>
		<div id="dialog" class="dialog">
			<p style="float:left; margin-top: 2px;">
				<span style="margin-left:20px; font-size:16px; font-weight:bold; color:#333;">修改商品基本信息</span>
			</p>
			<p class="close">
				<a href="#" onclick="closeBg();" title="关闭">×</a>
			</p>
			<div id="dialog_text">
			    <iframe src="" id="mpage" scrolling="auto" name="modify_main"></iframe>
			    
			    <div style="clear: both;"></div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<!-- 修改商品基本信息弹出层 end-->
		
	<!--商品    编辑 图片       弹出层start -->	
	<div>
		<div id="fullbg2" class="fullbg"></div>
		<div id="dialog2" class="dialog">
			<p class="close">
				<a href="#" onclick="closeBg2();" title="关闭">×</a>
			</p>
			<div id="dialog_text2">
				 <iframe  scrolling="no" src="" id="imagePage" scrolling="auto" name="image_main"></iframe>
			     <div style="clear: both;"></div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<!--商品    编辑 图片   弹出层end-->
	<div style="clear: both;"></div>
</div>
</center>
</body>
</html>
