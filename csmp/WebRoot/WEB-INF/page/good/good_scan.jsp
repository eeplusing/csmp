<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
<head>
<title>浏览商品</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search_style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
<style type="text/css">
body{
    overflow: hidden;
}
.page_no {
	margin-top: 10px;
	margin-bottom: 15px;
}

.page_no input {
	width: 60px;
	height: 20px;
	margin-left: 10px;
	font-size: 12px;
	background: #FFF;
	border: 1px solid #CCC;
	float: right;
	cursor: pointer;
}

.page_no li {
	margin-left: 10px;
	float: right;
}

.page_no li a {
	float: right;
	margin-left: 10px;
	border: 1px solid #CCC;
	width: 20px;
	height: 15px;
	padding-top: 2px;
	text-align: center;
	font-size: 12px;
	background: #FFF;
	color: #333;
	cursor: pointer;
}

.page_no li a:HOVER {
	text-decoration: none;
}

.page_no li a.n_page {
	background: #FC9;
}

.page_no li a.buton {
	width: 60px;
	height: 15px;
	text-align: center;
	padding-top: 2px;
	font-size: 12px;
	background: #FFF;
	border: 1px solid #CCC;
}

.page_no li a.n_click {
	color: #CCC;
}

body {
	text-align: center;
}

h1,h2,h3 {
	margin: 0;
	padding: 3px;
	text-align: left;
	font-size: 14px;
	font-weight: 400;
}

.ctd {
	padding: 20px;
	border: none;
}
.hctd{
    padding: 18px;
    border: 2px solid #FF6600;
}

div.order_no {
	width: 100%;
	margin: 30px 0px;
}

div.order_no ul li {
	margin-top: 15px;
	width: 603px;
	height: 35px;
	background: #C40000;
	float: inherit;
}

div.order_no ul li input {
	border: 0px solid #C40000;
	float: left;
}

input.txt {
	width: 500px;
	margin-top:2px;
	margin-left:2px;
	height: 31px;
	font-size: 16px;
	color: #666;
}

input.bton {
	width: 98px;
	height: 35px;
	font-size: 20px;
	font-weight: bold;
	color: #FFF;
	background: #C40000;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function onSearch() {
		var goodName = $("#goodName").val();
		if (goodName == '请输入商品名称') {
			goodName = "";
		}
		$("#search_good").attr("href", "good_getGoodShow.action?goodName=" + goodName);
		document.getElementById("search_good").click();
	}
	
	function scan_reload(){
	    var ptypeId = $("#selectA a").attr("rel");
	    var busyName = $("#selectB a").attr("rel");
	    var calorificValues = $("#selectC a").attr("rel");
	    var price = $("#selectD a").attr("rel");
	    var typeId = $("#selectE a").attr("rel");
	    
	    var url = "good_getGoodShow.action?time=" + new Date();
	    
	    if(ptypeId != "" && null != ptypeId){
	        url += "&ptypeId=" + ptypeId;
	    }
	    if(typeId != "" && null != typeId){
	        url += "&typeId=" + typeId;
	    }
	    if(busyName != "" && null != busyName){
	        url += "&busyName=" + busyName;
	    }
	    if(calorificValues != "" && null != calorificValues){
	        url += "&calorificValues=" + calorificValues;
	    }
	    if(price != "" && null != price){
	        url += "&price=" + price;
	    }
        
	    //$("#search_good").attr("href", url);
	   // alert(url);
	    $("#rform").attr("src", url);
		//document.getElementById("search_good").click();
	}
	
$(document).ready(function(){
							
	$("#select1 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		var rel = $(this).children("a").attr("rel");
		if ($(this).hasClass("select-all")) {
			$("#selectA").remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#selectA").length > 0) {
				$("#selectA a").html($(this).text()).attr("rel", rel);
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA").attr("rel", rel));
			}
		}
		//if($(this).children("a").text() == "煤炭" || $(this).children("a").attr("rel") == "1"){
		if($(this).children("a").attr("rel") == "1"){
		    $.ajax({
                type: "POST",
				url: "load_child_types.action?pid=1",
				dataType: "text",
				success: function(msg){
				    var types = eval("(" + msg + ")");
				    var child_dd = "";
				    for(var i = 0; i < types.length; i++){
				        child_dd += "<dd><a href=\"#\" rel=\"" + types[i].cid + "\">" + types[i].cname + "</a></dd>";
				    }
				    $("#select11").html("<dd class=\"select-all selected\"><a href=\"#\">全部</a></dd>" + child_dd);
				    $("#selectE").remove();
				    $("#select11 dd").click(function () {
						$(this).addClass("selected").siblings().removeClass("selected");
						var rel = $(this).children("a").attr("rel");
						if ($(this).hasClass("select-all")) {
							$("#selectE").remove();
						} else {
							var copyThisE = $(this).clone();
							if ($("#selectE").length > 0) {
								$("#selectE a").html($(this).text()).attr("rel", rel);
							} else {
								$(".select-result dl").append(copyThisE.attr("id", "selectE").attr("rel", rel));
							}
						}
						scan_reload();
					});
				}
            });
            
            $("#select4").html("<dd class=\"select-all selected\"><a href=\"#\">全部</a></dd><dd><a href=\"#\" rel=\"0~300\">300以下</a></dd>"+
                    "<dd><a href=\"#\" rel=\"300~599\">300~499</a></dd><dd><a href=\"#\" rel=\"600~899\">600~899</a></dd>"+
                    "<dd><a href=\"#\" rel=\"900~1199\">900~1199</a></dd><dd><a href=\"#\" rel=\"1200~750000\">1200以上</a></dd>");
				    $("#selectD").remove();
				    $("#select4 dd").click(function () {
						$(this).addClass("selected").siblings().removeClass("selected");
						var rel = $(this).children("a").attr("rel");
						if ($(this).hasClass("select-all")) {
							$("#selectD").remove();
						} else {
							var copyThisD = $(this).clone();
							if ($("#selectD").length > 0) {
								$("#selectD a").html($(this).text()).attr("rel", rel);
							} else {
								$(".select-result dl").append(copyThisD.attr("id", "selectD").attr("rel", rel));
							}
						}
						scan_reload();
			});
            $("#select11").parent().css("display", "block");
		    $("#select2").parent().css("display", "block");
		    $("#select3").parent().css("display", "block");
		    $("#select4").parent().css("display", "block");
		}
		else if($(this).children("a").attr("rel") == "48")
		{
		    $("#select4").html("<dd class=\"select-all selected\"><a href=\"#\">全部</a></dd><dd><a href=\"#\" rel=\"0~1000\">1000以下</a></dd>"+
                    "<dd><a href=\"#\" rel=\"1000~1599\">1000~1599</a></dd><dd><a href=\"#\" rel=\"1600~2199\">1600~2199</a></dd>"+
                    "<dd><a href=\"#\" rel=\"2200~2799\">2200~2799</a></dd><dd><a href=\"#\" rel=\"2800~750000\">2800以上</a></dd>");
				    $("#selectD").remove();
				    $("#select4 dd").click(function () {
						$(this).addClass("selected").siblings().removeClass("selected");
						var rel = $(this).children("a").attr("rel");
						if ($(this).hasClass("select-all")) {
							$("#selectD").remove();
						} else {
							var copyThisD = $(this).clone();
							if ($("#selectD").length > 0) {
								$("#selectD a").html($(this).text()).attr("rel", rel);
							} else {
								$(".select-result dl").append(copyThisD.attr("id", "selectD").attr("rel", rel));
							}
						}
						scan_reload();
			});
			$("#selectB").remove();
		    $("#selectC").remove();
		    $("#selectE").remove();
		    $("#select11").parent().css("display", "none");
		    $("#select2").parent().css("display", "none");
		    $("#select3").parent().css("display", "none");
		    $("#select4").parent().css("display", "block");
		}
		else if($(this).children("a").attr("rel") == "47")
		{
		    $("#select4").html("<dd class=\"select-all selected\"><a href=\"#\">全部</a></dd><dd><a href=\"#\" rel=\"0~100\">100以下</a></dd>"+
                    "<dd><a href=\"#\" rel=\"100~149\">100~149</a></dd><dd><a href=\"#\" rel=\"150~199\">150~199</a></dd>"+
                    "<dd><a href=\"#\" rel=\"200~149\">200~249</a></dd><dd><a href=\"#\" rel=\"250~750000\">250以上</a></dd>");
				    $("#selectD").remove();
				    $("#select4 dd").click(function () {
						$(this).addClass("selected").siblings().removeClass("selected");
						var rel = $(this).children("a").attr("rel");
						if ($(this).hasClass("select-all")) {
							$("#selectD").remove();
						} else {
							var copyThisD = $(this).clone();
							if ($("#selectD").length > 0) {
								$("#selectD a").html($(this).text()).attr("rel", rel);
							} else {
								$(".select-result dl").append(copyThisD.attr("id", "selectD").attr("rel", rel));
							}
						}
						scan_reload();
			});
			$("#selectB").remove();
		    $("#selectC").remove();
		    $("#selectE").remove();
		    $("#select11").parent().css("display", "none");
		    $("#select2").parent().css("display", "none");
		    $("#select3").parent().css("display", "none");
		    $("#select4").parent().css("display", "block");
		}
		else if($(this).children("a").attr("rel") == "90")
		{
		    $("#select4").html("<dd class=\"select-all selected\"><a href=\"#\">全部</a></dd><dd><a href=\"#\" rel=\"0~150\">150以下</a></dd>"+
                    "<dd><a href=\"#\" rel=\"150~199\">150~199</a></dd><dd><a href=\"#\" rel=\"200~299\">200~299</a></dd>"+
                    "<dd><a href=\"#\" rel=\"300~499\">300~499</a></dd><dd><a href=\"#\" rel=\"500~750000\">500以上</a></dd>");
				    $("#selectD").remove();
				    $("#select4 dd").click(function () {
						$(this).addClass("selected").siblings().removeClass("selected");
						var rel = $(this).children("a").attr("rel");
						if ($(this).hasClass("select-all")) {
							$("#selectD").remove();
						} else {
							var copyThisD = $(this).clone();
							if ($("#selectD").length > 0) {
								$("#selectD a").html($(this).text()).attr("rel", rel);
							} else {
								$(".select-result dl").append(copyThisD.attr("id", "selectD").attr("rel", rel));
							}
						}
						scan_reload();
			});
			$("#selectB").remove();
		    $("#selectC").remove();
		    $("#selectE").remove();
		    $("#select11").parent().css("display", "none");
		    $("#select2").parent().css("display", "none");
		    $("#select3").parent().css("display", "none");
		    $("#select4").parent().css("display", "block");
		}
		else{
		    $("#selectB").remove();
		    $("#selectC").remove();
		    $("#selectE").remove();
		    $("#selectD").remove();
		    $("#select11").parent().css("display", "none");
		    $("#select2").parent().css("display", "none");
		    $("#select3").parent().css("display", "none");
		    $("#select4").parent().css("display", "none");
		}
		scan_reload();
	});
	
	$("#select2 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		var rel = $(this).children("a").attr("rel");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length > 0) {
				$("#selectB a").html($(this).text()).attr("rel", rel);
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB").attr("rel", rel));
			}
		}
		scan_reload();
	});
	
	$("#select3 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		var rel = $(this).children("a").attr("rel");
		if ($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectC").length > 0) {
				$("#selectC a").html($(this).text()).attr("rel", rel);
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectC").attr("rel", rel));
			}
		}
		scan_reload();
	});
	
	$("#select4 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		var rel = $(this).children("a").attr("rel");
		if ($(this).hasClass("select-all")) {
			$("#selectD").remove();
		} else {
			var copyThisD = $(this).clone();
			if ($("#selectD").length > 0) {
				$("#selectD a").html($(this).text()).attr("rel", rel);
			} else {
				$(".select-result dl").append(copyThisD.attr("id", "selectD").attr("rel", rel));
			}
		}
		scan_reload();
	});
	
	$("#selectA").live("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
		//隐藏子菜单开始
		$("#select11").parent().css("display", "none");
		$("#select2").parent().css("display", "none");
		$("#select3").parent().css("display", "none");
		$("#select4").parent().css("display", "none");
		//隐藏子菜单结束
		scan_reload();
	});
	
	$("#selectB").live("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
		scan_reload();
	});
	
	$("#selectC").live("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
		scan_reload();
	});
	
	$("#selectD").live("click", function () {
		$(this).remove();
		$("#select4 .select-all").addClass("selected").siblings().removeClass("selected");
		scan_reload();
	});
	
	$("#selectE").live("click", function () {
		$(this).remove();
		$("#select11 .select-all").addClass("selected").siblings().removeClass("selected");
		scan_reload();
	});
	
	$(".select dd").live("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
});

function reinitIframe(){ 
      var iframe = document.getElementById("rform"); 
      try{ 
           var bHeight = iframe.contentWindow.document.body.scrollHeight; 
           var dHeight = iframe.contentWindow.document.documentElement.scrollHeight; 
           var height = Math.max(bHeight, dHeight); 
           iframe.height = height; 
      }catch (ex){} 
} 
window.setInterval("reinitIframe()", 100); 
function set_gheight(h){
    $("#rform").css("height", h);
    $("#gshow").css("height", h);
    var height = parseInt($("#all_div").css("height").replace("px", ""));
    if(height < 300) height = 300;//设置最小高度740
    if(window){
         window.parent.set_fheight("main", height + 20);
         window.parent.set_fheight("mpage", height + 20);
	}else{
	     win.parent.set_fheight("main", height + 20);
	     win.parent.set_fheight("mpage", height + 20);
	}
}
</script>
</head>
<body>
	<%
		request.setAttribute("value", request.getParameter("goodName"));
	%>
	<div align="center" id="all_div">
		<div id="good_list" style="margin-top: 10px;">
		    <table style=" width: 1310px;">
		      <tr>
		        <td style="width: 400px; "><img alt="" src="${pageContext.request.contextPath}/images/zhuan.gif" style="text-align: left; "></td>
		        <td>
		          <div class="order_no">
				   <ul style="align:center">
					<li><input type="text" id="goodName" name="goodName"
						class="txt" value="${empty value ? '请输入商品名称':value}"
						onfocus="this.value=''"
						onblur="if(this.value==''){this.value='请输入商品名称'}" /> <input
						type="button" class="bton" id="searchBtn" name="searchBtn"
						value="查    询" onclick="onSearch();" /> <a href="" target="gshow"
						id="search_good"></a></li>
				   </ul>
			     </div>
		        </td>
		        <td>
		          <div style="margin: 8px;"><font color="red" size="5"><b>品质优</b></font></div>
		          <div style="margin: 8px;"><font color="red" size="5">&nbsp;&nbsp;&nbsp;&nbsp;<b>价格低</b></font></div>
		          <div style="margin: 8px;"><font color="red" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>有保障</b></font></div>
		        </td>
		      </tr>
		    </table>
		    <div style="clear: both;"></div>
		</div>
		
		<div style="margin-top: 10px; width: 1308px;">
		  <div>
				<ul class="select">
				    <li class="select-list">
						<dl id="select1">
							<dd class="select-all selected">
								<a href="#">全部</a>
							</dd>
							<c:forEach items="${tList}" var="tlist">
							  <c:if test="${tlist.parentId == 0}">
								  <dd>
									<a href="#" rel="${tlist.typeId}">${tlist.typeName}</a>
								  </dd>
							  </c:if>
							</c:forEach>
						</dl>
					</li>
					<li class="select-list" style="display:none;">
						<dl id="select11">
						</dl>
					</li>
					<li class="select-list" style="display:none;">
						<dl id="select2">
							<dd class="select-all selected">
								<a href="#">全部</a>
							</dd>
							<dd>
								<a href="#" rel="0">工业</a>
							</dd>
							<dd>
								<a href="#" rel="1">民用</a>
							</dd>
						</dl>
					</li>
					<li class="select-list" style="display:none;">
						<dl id="select3">
							<dd class="select-all selected">
								<a href="#">全部</a>
							</dd>
							<dd>
								<a href="#" rel="0~6000">6000以下</a>
							</dd>
							<dd>
								<a href="#" rel="6000~6499">6000~6499</a>
							</dd>
							<dd>
								<a href="#" rel="6500~6999">6500~6999</a>
							</dd>
							<dd>
								<a href="#" rel="7000~7500">7000~7500</a>
							</dd>
							<dd>
								<a href="#" rel="7500~750000">7500以上</a>
							</dd>
						</dl>
					</li>
					<li class="select-list" style="display:none;">
						<dl id="select4">
						</dl>
					</li>
					<li class="select-result">
						<dl>
							<dt>已选条件：</dt>
							<dd class="select-no" id="select-no">暂时没有选择过滤条件</dd>
						</dl>
					</li>
				</ul>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
		</div>

        <div id="gshow" style="width: 1310px;">
		   <iframe name="gshow" id="rform" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" src="good_getGoodShow.action" >
		   </iframe>
		   <div style="clear: both;"></div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>