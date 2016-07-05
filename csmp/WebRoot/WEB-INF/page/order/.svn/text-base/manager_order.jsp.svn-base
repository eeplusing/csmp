<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单管理(卖家)</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/jquery-calendar.css" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/component/jquery-calendar.js"></script>
    
<style type="text/css">
.global{
  	list-style: none;  	
  	width:1300px;
  	margin: 0px auto;
}
  	
div.main {
	width: 1300px;
	display:block; 
}

div.order_no {
	width: 100%;
	border-top: 0px solid #FF4400;
}

div.order_no ul li {
	margin-top: 15px;
	width: 600px;
	height: 30px;
	background: #C40000;
	float: right;
}

div.order_no ul li input {
	border: 2px solid #FF4400;
	float: left;
}

input.txt {
	width: 500px;
	height: 30px;
	font-size: 16px;
	color: #666;
}

input.bton {
	width: 100px;
	height: 30px;
	font-size: 20px;
	font-weight: bold;
	color: #FFF;
	background: #FF4400;
	cursor: pointer;
}

div.head {
	border: 1px solid #C4D5E0;
	background: #F9FAFC;
	margin-bottom: 15px;
	margin-top: 10px;
}

div.head span {
	margin: 10px 15px;
	display: block;
	font-size: 14px;
	font-weight: bold;
	color: #333;
}

div.sel_form {
	border: 0px solid;
	font-size: 14px;
	color: #555;
}

div.sel_form ul {
	border: 0px solid #F00;
	clear: both;
}

div.sel_form ul li {
	height: 30px;
	margin: 5px 5px;
	float: left;
}

div.sel_form ul li input {
	width: 100px;
	border: 1px solid #C4D5E0;
}

div.sel_form ul li select {
	width: 100px;
	height: 18px;
	border: 1px solid #C4D5E0;
}

input.sear_ch{
  background: #FF4000;
  border:none;
  color: #FFFFFF;
}

#selbton {
	width: 60px;
	height: 17px;
	cursor: pointer;
	border: none;
}

.t_header {
	width: 100%;
	height: 30px;
	background: #589FD3;
	border: 1px solid #589FD3;
	color: #FFF;
	font-weight: bold;
	font-size: 16px;
}

.t_header li {
	text-align: center;
	float: left;
}

li.t_o_no,li.t_o_money,li.t_o_state,li.t_o_oper {
	width: 150px;
	border: 0px solid #00F;
}

li.t_g_name ,li.t_g_amount,li.t_g_price{
  width: 100px;
}

li.t_o_eva {
	width: 300px;
	border: 0px solid #00F;
}

.t_header li span {
	display: block;
	margin-top: 7px;
	border: 0px solid;
}

div.page_no {
	width: 100%; margin-top : 10px;
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

li.t_g_info {
	width: 300px;
}

li.t_g_info div {
	width: 100%;
}

li.t_g_info div li {
	width: 100px;
	float: left;
}

div.o_info {
	width: 100%;
	border-left: 1px solid #CCC;
	border-right: 1px solid #CCC;
	border-bottom: 1px solid #CCC;
	font-size: 12px;
}

div.o_info li {
	float: left;
}

div.o_info li span {
	display: block;
	margin: 0px auto;
	text-align: center;
	padding-top: 5px;
	border: 0px solid #F00;
}

li.t_o_no,li.t_o_money,li.t_o_state,li.t_o_eva span {
	padding-top: 0px;
}

li.t_o_oper input {
	display: block;
	margin: 5px auto;
	width: 80px;
	height: 18px;
	padding-top: 2px;
	background: #FF4000;
	border: none;
	cursor: pointer;
	color: #FFFFFF;
}
div.rodd{
    background: #EAF8FF;
}
div.modd{
    background: #99BBE8;
}
</style>

<script type="text/javascript">
    $(function(){
        var index = 0;
        $(".o_info").each(function(){
            if(index%2 == 1){
                $(this).addClass("rodd");
            }
            index++;
            $(this).mousemove(function(){
                $(this).addClass("modd");
            });
            $(this).mouseout(function(){
                $(this).removeClass("modd");
            });
        });
        
        var height = parseInt($(".global").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度535
       if(window){
		     window.parent.set_fheight("main", height + 20);
		     window.parent.set_fheight("mpage", height + 20);
		}else{
			 win.parent.set_fheight("main", height + 20);
			 window.parent.set_fheight("mpage", height + 20);
		}
		
		$("span.g_name").each(function(){
		    $(this).text(get_text($(this).text(), 16));
		});
		
		$("li.no_center").each(function(){
		    var h1 = parseInt($(this).css("height").replace("px", ""));
		    var h2 = parseInt($(this).parent().css("height").replace("px", ""));
		    $(this).css("margin-top", (h2-h1)*0.5);
		});
    });
    
    function get_text(txt, l){
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
               if(rlen <= l - 4){
                  rtxt +=  txt.substr(i, 1);
               } else {
                  return rtxt + "...";
               }
           }
        
        } else {
            return txt;
        }
    }
    
	function to_page(iden) {
		if (iden == "fpage") {
			$("#alink").attr("href", "order_morder.action?pageNum=1&pageSize=${pageBean.pageSize}&oraState=${orderStat}&orderNo=${orderNo}&sTime=${sTime}&eTime=${eTime}&evaState=${evaState}");
		} else if (iden == "lpage") {
			$("#alink").attr("href", "order_morder.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&oraState=${orderStat}&orderNo=${orderNo}&sTime=${sTime}&eTime=${eTime}&evaState=${evaState}");
		} else if (iden == "secher") {
			$("#alink").attr("href", "order_morder.action?pageNum=1&pageSize=${pageBean.pageSize}&oraState=" + $("#oraState").val() + "&orderNo=" + $("#orderNo").val() + "&sTime=" + $("#sTime").val() + "&eTime=" + $("#eTime").val() + "&evaState=" + $("#evaState").val());
		} else if (iden == "secher_no") {
			$("#alink").attr("href", "order_morder.action?pageNum=1&pageSize=${pageBean.pageSize}&orderNo=" + $("#orderNo").val());
		} else {
			$("#alink").attr("href", "order_morder.action?pageNum=${pageBean.currentPage}&pageSize=${pageBean.pageSize}&oraState=${orderStat}&orderNo=${orderNo}&sTime=${sTime}&eTime=${eTime}&evaState=${evaState}");
		}
		document.getElementById("alink").click();
	}
	
	function change_page(e){
		if(e.keyCode == 13){
			var pageNum = $("#current_page").val().replace(/(^\s*)|(\s*$)/g, "");
			var num_reg=/^[1-9]{1}\d*$/;
			var pageCount = ${pageBean.pageCount};
			pageNum = pageNum>pageCount? pageCount:pageNum;
			if(!num_reg.test(pageNum)){
		        alert("页码只能为正整数");
                return false;
		    }
			$("#alink").attr("href", "order_morder.action?pageNum=" + pageNum + "&pageSize=${pageBean.pageSize}&oraState=${orderStat}&orderNo=${orderNo}&sTime=${sTime}&eTime=${eTime}&evaState=${evaState}");
		    document.getElementById("alink").click();
		}
	}

	function check_order(oid) {//开启订单审核窗口
	  	if(window){
    		window.parent.check_order(oid);
       	}else{
	        win.parent.check_order(oid);
    	}
	}
	
	function look_reason(oid) {//查看取消原因
		$.ajax({
			type : "POST",
			url : "order_lookReason.action",
			data : "orderId=" + oid,
			dataType : "text",
			success : function(msg) {
				alert("申请原因如下:\r\t" + msg);
			}
		});
	}
	
	function pass_app(oid) {//通过订单取消申请
		if (confirm("通过后订单将被取消，确定要通过吗？")) {
			$.ajax({
				type : "POST",
				url : "order_passApply.action",
				data : "orderId=" + oid,
				dataType : "text",
				success : function(msg) {
					alert(msg);
					location.reload();//刷新本页面
				}
			});
		}
	}
	
	function ref_app(oid) {//拒绝订单取消申请
		if (confirm("拒绝后订单将返回申请取消前的状态，确定要拒绝吗？")) {
			$.ajax({
				type : "POST",
				url : "order_refApply.action",
				data : "orderId=" + oid,
				dataType : "text",
				success : function(msg) {
					alert(msg);
					location.reload();//刷新本页面
				}
			});
		}
	}
</script>
</head>
  <body>
    <div class="global">
      <div class="main">
          <div class="order_no">
              <ul>
                  <li>
                      <input type="text" id="orderNo" class="txt" value="${orderNo}">
                      <input type="button" class="bton" value="查    询" onclick="to_page('secher_no')">
                  </li>
              </ul>
              <div style="clear: both;"></div>
          </div>
          <div class="head">
              <span>订单管理(卖家)</span>
          </div>
          <div class="sel_form">
              <ul>
                  <li>
                      <span>交易时间：从&nbsp;&nbsp;</span><input type="text" name="sTime" id="sTime" maxlength="10" onfocus="$(this).calendar()" value="${sTime}">
                  </li>
                  <li>
                      <span>到&nbsp;&nbsp;</span><input type="text" name="eTime" id="eTime" maxlength="10" onfocus="$(this).calendar()" value="${eTime}">
                  </li>
                  <li>
                      <span>客户姓名：</span><input type="text" name="userName" id="userName" value="${userName}">
                  </li>
                  <li>
                      <span>订单状态：</span>
                      <select name="oraState" id="oraState">
                          <c:forEach items="${stateMap}" var="s">
                              <c:if test="${s.key == orderStat}">
                                  <option selected="selected" value="${s.key}">${s.value}</option>
                              </c:if>
                              <c:if test="${s.key != orderStat}">
                                  <option value="${s.key}">${s.value}</option>
                              </c:if>
                          </c:forEach>
                      </select>
                  </li>
                  <li>
                      <span>评价状态：</span>
                      <select name="evaState" id="evaState">
                              <c:if test="${evaState == -1}">
                                  <option selected="selected" value="-1">全部</option>
                                  <option value="0">否</option>
                                  <option value="1">是</option>
                              </c:if>
                              <c:if test="${evaState == 0}">
                                  <option value="-1">全部</option>
                                  <option selected="selected" value="0">否</option>
                                  <option value="1">是</option>
                              </c:if>
                              <c:if test="${evaState == 1}">
                                  <option value="-1">全部</option>
                                  <option value="0">否</option>
                                  <option selected="selected" value="1">是</option>
                              </c:if>
                      </select>
                  </li>
                  <li>
                      <input type="button" id="selbton"  value="搜    索" class="sear_ch" onclick="to_page('secher');">
                  </li>
                  <div style=" clear:both;"></div>
              </ul>
              <div style="clear: both;"></div>
          </div>
          <div class="t_header">
              <ul>
                  <li class="t_o_no">
                      <span>订单编号</span>
                  </li>
                  <li class="t_g_name">
                      <span>商品名称</span>
                  </li>
                  <li class="t_g_price">
                      <span>单价</span>
                  </li>
                  <li class="t_g_amount">
                      <span>数量</span>
                  </li>
                  <li class="t_o_money">
                      <span>订单总价</span>
                  </li>
                  <li class="t_o_state">
                      <span>订单状态</span>
                  </li>
                  <li class="t_o_eva">
                      <span>评价</span>
                  </li>
                  <li class="t_o_oper">
                      <span>操作</span>
                  </li>
              </ul>
              <div style="clear: both;"></div>
          </div>
          <div class="page_no">
              <ul>
                  <li>
                      <a href="#" id="alink" style="display:none;"></a>
                      <c:if test="${pageBean.currentPage >= pageBean.pageCount}">
                          <a href="javascript:void(0);" class="buton n_click">下一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          <a href="order_morder.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&oraState=${orderStat}&orderNo=${orderNo}&sTime=${sTime}&eTime=${eTime}&evaState=${evaState}" class="buton" title="Next Page">下一页</a>
                      </c:if>
                  </li>
                  <li>
                      <c:if test="${pageBean.currentPage >= pageBean.pageCount}">
                          <input type="button" class="last n_last" value="&gt;&gt;">
                      </c:if>
                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          <input type="button" class="last" title="尾页" value="&gt;&gt;" onclick="to_page('lpage')">
                      </c:if>
                  </li>
                  <li>
                      <input type="text" value="${pageBean.currentPage}/${pageBean.pageCount}" onkeydown="change_page(event);" id="current_page" class="page_num">
                  </li>
                  <li>
                      <c:if test="${pageBean.currentPage == 1}">
                          <input type="button" class="last n_last" value="&lt;&lt;">
                      </c:if>
                      <c:if test="${pageBean.currentPage > 1}">
                          <input type="button" class="last" title="首页" onclick="to_page('fpage')" value="&lt;&lt;">
                      </c:if>
                  </li>
                  <li>
                      <c:if test="${pageBean.currentPage == 1}">
                          <a href="javascript:void(0);" class="buton n_click">上一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage > 1}">
                          <a href="order_morder.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&oraState=${orderStat}&orderNo=${orderNo}&sTime=${sTime}&eTime=${eTime}&evaState=${evaState}" class="buton" title="Last Page" target="main">上一页</a>
                      </c:if>
                  </li>
              </ul>
              <div style="clear: both;"></div>
          </div>
          <div class="o_list">
              <ul>
                 <li>
                     <c:forEach items="${pageBean.recordList}" var="order">
                         <div class="o_info">
                             <ul>
                                 <li class="t_o_no no_center"><span>${order.orderNo}</span></li>
                                 <li class="t_g_info no_center">
                                     <c:forEach items="${order.orderDetails }" var="detail">
                                         <div class="o_d_info">
                                             <ul>
	                                             <li>
	                                                 <span class="g_name">${detail.goodName}</span>
	                                                 <div style="clear: both;"></div>
	                                             </li>
	                                             <li>
	                                                 <span>${detail.salePrice}</span>
	                                                 <div style="clear: both;"></div>
	                                             </li>
	                                             <li>
	                                                 <span>${detail.num}</span>
	                                                 <div style="clear: both;"></div>
	                                             </li>
                                             </ul>
                                             <div style="clear: both;"></div>
                                         </div>
                                     </c:forEach>
                                 </li>
                                 <li class="t_o_money no_center"><span>${order.orderAmount}</span></li>
                                 <li class="t_o_state no_center">
                                     <c:if test="${order.orderState == 0}">
                                         <span>待审核</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 1}">
                                         <span>待支付</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 2}">
                                         <span>已支付</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 3}">
                                         <span>出库中</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 4}">
                                         <span>配送中</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 5}">
                                         <span>待收货</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 6}">
                                         <span>待评价</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 7}">
                                         <span>已完成</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 8}">
                                         <span>取消申请处理中</span>
                                     </c:if>
                                     <c:if test="${order.orderState == 9}">
                                         <span>已取消</span>
                                     </c:if>
                                 </li>
                                 <li class="t_o_eva no_center"><span>${order.evaluateInfo}</span></li>
                                 <li class="t_o_oper no_center">
                                     <c:if test="${order.orderState == 0}">
                                         <input type="button" value="审核" onclick="check_order('${order.orderId}')">
                                     </c:if>
                                     <c:if test="${order.orderState == 8}">
                                         <input type="button" value="查看原因" title="查看申请取消订单的原因" onclick="look_reason('${order.orderId}')">
                                         <input type="button" value="通过申请" title="通过申请，订单将被取消" onclick="pass_app('${order.orderId}')">
                                         <input type="button" value="拒绝申请" title="拒绝申请，订单将返回之前的状态" onclick="ref_app('${order.orderId}')">
                                     </c:if>
                                 </li>
                                 <div style="clear: both;"></div>
                             </ul>
                             <div style="clear: both;"></div>
                         </div>
                     </c:forEach>
                 </li>
              </ul>
          	  <div style="clear: both;"></div>
          </div>
          <div style="clear: both;"></div>
      </div>
     </div>
  </body>
</html>
