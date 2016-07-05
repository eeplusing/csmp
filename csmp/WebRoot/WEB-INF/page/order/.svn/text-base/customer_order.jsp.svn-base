<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的订单</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    
    <style type="text/css">
        div.main{
              width:1080px;
              margin: 0px auto;
              border: 0px solid #C9F;
        }
        div.state{
              width:100%;
              border-bottom: 2px solid #DDD;
        }
        .state li{
              height:40px;
              float: left;
              border-bottom: 0px solid #DDD;
        }
        .state li a{
              height:30px;
              display:block;
              font-size:16px;
              font-weight:bold;
              color:#333;
              margin: 10px 20px;
              border: 0px solid #C9F;
              text-decoration: none;
        }
        .state li a:HOVER{
              height:30px;
              display:block;
              font-size:16px;
              font-weight:bold;
              color:#FF4400;
              margin: 10px 20px;
              border: 0px solid #C9F;
        }
        li.afocus a{
              height:30px;
              display:block;
              font-size:16px;
              font-weight:bold;
              color:#FF4400;
              margin: 10px 20px;
        }
        .state li span{
              height:20px;
              display:block;
              margin-top:10px;
              color: #DDD;
              border: 0px solid #C9F;
        }
        div.sel_no{
              width:100%;
              margin: 20px 0px;
              border: 0px solid #C9F;
              margin-left: 800px;
        }
        div.sel_no li{
              width: 271px;
              height:25px;
              padding:0px;
              border:1px solid #FF4400;
              background: #FF4400;
        }
        div.sel_no li input{
              float: left;
        }
        input.orderNo{
              width:200px;
              height:25px;
              display:block;
              margin: 0px;
              border: 0px solid #000;
              font-size: 12px;
              color: #999999;
              border-right: 1px solid #CCC;
        }
        input.sel_but{
              width:70px;
              height:25px;
              display:block;
              margin: 0px;
              color: #FFF;
              cursor:pointer;
              border: 0px solid #000;
              background: #FF4400;
        }
        .list_head{
              height: 40px;
              background:#FF4400 ;
              color: #F0F0F0;
        }
        .list_head li{
              float: left;
              margin-top: 15px;
              border: 0px solid #000;
              background:#FF4400;
        }
        li.head_id{
              width: 400px;
              text-align: center;
              font-size: 12px;
        }
        li.head_price,li.head_num,li.head_g_oper,li.price,li.num,li.g_o{
              width: 80px;
              text-align: center;
              font-size: 12px;
        }
        li.head_t_m,li.head_y_m,li.t_m,li.y_m{
              width: 100px;
              text-align: center;
              font-size: 12px;
        }
        li.head_state,li.head_o_oper,li.o_s,li.o_o{
              width: 116px;
              text-align: center;
              font-size: 12px;
        }
        .page_no{
              width: 100%;
              margin-top: 10px;
              margin-bottom: 15px;
        }
        .page_no li{
              margin-left:10px;
              float: right;
        }
        .page_no li a{
            float: right;
            margin-left:10px;
            border: 1px solid #CCC;
            width: 20px;
            height:15px;
            padding-top:2px;
            text-align:center;
            font-size: 12px;
            background: #FFF;
            color:#333;
            cursor: pointer;
        }
        .page_no li a:HOVER{
            text-decoration: none;
        }
        .page_no li a.n_page{
            background: #F40;
            color:#FFF;
        }
        .page_no li a.buton{
              width:60px;
              height:15px;
              text-align:center;
              padding-top:2px;
              font-size: 12px;
              background: #FFF;
              border: 1px solid #CCC;
        }
        .page_no li a.n_click{
              color:#CCC;
        }
        .order_list{
              border: 1px solid #599FD3;
              margin-bottom: 10px;
        }
        .list_no{
              width: 100%;
              height: 40px;
              background:#599FD3;
              font-size: 12px;
              color: #FFFFFF;
              line-height:40px;  
              overflow:hidden;   
        }
        
        .list_no input{
              height: 40px;
              border: 0px solid #000;;
              background: #F40;
              margin-left: 15px;   
        }
        .good_list li{
              float: left;
        }
        .img{
              display:inline;
        }
        li.price, li.num, li.g_o{
            margin-top: 10px;
        }
        li.t_m, li.y_m, li.o_s, li.o_o{
            padding-top: 10px;
            border-left: 1px solid #599FD3;
        }
        .remark span{
              display:block;
              font-size:12px;
              width: 245px;
              word-break: break-all;
              word-wrap:break-word;
              overflow: hidden;
        }
        span.r{
            max-height:75px;
            color:#333;
        }
        span.hv{
            margin-top:5px;
            max-height:30px;
            color:#999;
        }
        .n_f{
              border-top: 1px solid #599FD3;
        }
        li.img, li.remark{
              margin: 10px 5px;
        }
        li.img img{
              width: 129px;
              height: 107px;
              border: 0px solid #F40;
        }
        .o_s{
            line-height: 150%;
        }
        .oo{
            width: 60px;
            height: 25px;
            font-size: 12px;
            font-weight: bold;
            color:#FFF;
            padding-top:5px;
            background: #F40;
            border: none;
            cursor: pointer;
        }
        font{
            color: #F40;
        }
    </style>
    
    <script type="text/javascript">
        $(function(){
            //var height = document.body.scrollHeight;
           var height = parseInt($(".main").css("height").replace("px", ""));
            if(height < 630) height = 630;//设置最小高度740
           if(window){
                 window.parent.set_fheight("main", height + 55);
                 window.parent.set_fheight("mpage", height + 55);
            }else{
                 win.parent.set_fheight("main", height + 55);
                 win.parent.set_fheight("mpage", height + 55);
            }
        
            $("#orderNo").focus(function(){
                if($(this).val() == "输入订单编号进行查询"){
                    $(this).val("");
                }
            });
            $("#orderNo").blur(function(){
                if($(this).val() == null || $(this).val().length == 0 || $(this).val() == ""){
                    $(this).val("输入订单编号进行查询");
                }
            });
            
            $("#all_no").focus();
            $('.t_m').each(function(){
                var height = $(this).parent().parent('.good_list').css('height');
                $(this).css('height', height);
                $(this).nextAll().each(function(){
                    $(this).css('height', height);
                });
            });
            $('.g_i').each(function(){
                $(this).children(":first").nextAll().each(function(){
                    $(this).addClass("n_f");
                });
            });
        });
        
        function srech(size, state){
            var orderNo = $("#orderNo").val();
            if(orderNo == "输入订单编号进行查询"){
                orderNo = "";
            }
            $("#serch_order").attr("href","order_list.action?pageNum=1&&pageSize=" + size + "&&orderStat=" + state + "&&orderNo=" + orderNo);
            document.getElementById("serch_order").click();
        }
        
        /*调用父窗口弹出层*/
        function taken(oid){
            if(confirm("确定收到的商品无误吗?")){
                $.ajax({
                    type: "POST",
				    url: "order_taken.action",
				    data: "orderId=" + oid,
				    dataType: "text",
				    success: function(msg){
				        alert(msg);
				        location.reload();//刷新本页面
				    }
                });
            }
        }
        
        function showBg(oid) {
            if(window){
                window.parent.showBg(oid);
            }else{
                win.parent.showBg(oid);
            }
        }
        
        function showBg2(oid) {
            if(window){
                window.parent.showBg2(oid);
            }else{
                win.parent.showBg2(oid);
            }
        }
        
        function cancel(oid){
            if(window){
                window.parent.cancel(oid);
            }else{
                win.parent.cancel(oid);
            }
        }
        
        function pay_order(oid){
            window.open("pay_index.action?orderId=" + oid);
        }
    </script>
  </head>
  
  <body style="overflow: hidden;">
     <div class="main">
         <div class="state">
             <ul>
                <c:if test="${orderStat == -1}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=-1&&orderNo=${orderNo}" target="main" id="all_no">所有订单</a>
                    </li>
                </c:if>
                <c:if test="${orderStat != -1}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=-1&&orderNo=${orderNo}" target="main" id="all_no">所有订单</a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 0}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=0&&orderNo=${orderNo}" target="main">待审核<font>${uncheck}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 0}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=0&&orderNo=${orderNo}" target="main">待审核<font>${uncheck}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 1}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=1&&orderNo=${orderNo}" target="main">待付款<font>${checked}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 1}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=1&&orderNo=${orderNo}" target="main">待付款<font>${checked}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 2}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=2&&orderNo=${orderNo}" target="main">待发货<font>${outStock}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 2}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=2&&orderNo=${orderNo}" target="main">待发货<font>${outStock}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 4}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=4&&orderNo=${orderNo}" target="main">待收货<font>${waitTake}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 4}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=4&&orderNo=${orderNo}" target="main">待收货<font>${waitTake}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 6}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=6&&orderNo=${orderNo}" target="main">待评价<font>${taken}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 6}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=6&&orderNo=${orderNo}" target="main">待评价<font>${taken}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 7}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=7&&orderNo=${orderNo}" target="main">已完成<font>${end}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 7}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=7&&orderNo=${orderNo}" target="main">已完成<font>${end}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 8}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=8&&orderNo=${orderNo}" target="main">申请取消<font>${appCancel}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 8}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=8&&orderNo=${orderNo}" target="main">申请取消<font>${appCancel}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
                <c:if test="${orderStat == 9}">
                    <li class="afocus s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=9&&orderNo=${orderNo}" target="main">已取消<font>${canceled}</font></a>
                    </li>
                </c:if>
                <c:if test="${orderStat != 9}">
                    <li class="s_a">
                    	<a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=9&&orderNo=${orderNo}" target="main">已取消<font>${canceled}</font></a>
                    </li>
                </c:if>
                <li><span>|</span></li>
             </ul>
             <div style="clear: both;"></div>
         </div>
         <div class="sel_no">
             <ul>
                <li>
                    <c:if test="${orderNo == null || orderNo == ''}">
                        <input type="text" name="orderNo" id="orderNo" class="orderNo" value="输入订单编号进行查询"/>
                    </c:if>
                    <c:if test="${orderNo != null && orderNo != ''}">
                        <input type="text" name="orderNo" id="orderNo" class="orderNo" value="${orderNo}"/>
                    </c:if>
                    <a href="" target="main" id="serch_order"></a>
                    <input type="button" class="sel_but" onclick="srech(${pageBean.pageSize},${orderStat});" value="订单搜索"/>
                </li>
             </ul>
             <div style="clear: both;"></div>
         </div>
         <div>
             <div class="list_head">
                 <ul>
                    <li class="head_id"><p>商品</p></li>
                    <li class="head_price"><p>单价(元)</p></li>
                    <li class="head_num"><p>数量</p></li>
                    <li class="head_g_oper"><p>商品操作</p></li>
                    <li class="head_t_m"><p>订单总价(元)</p></li>
                    <li class="head_y_m"><p>运费(元)</p></li>
                    <li class="head_state"><p>订单状态</p></li>
                    <li class="head_o_oper"><p>订单操作</p></li>
                 </ul>
                 <div style="clear: both;"></div>
             </div>
             <div class="page_no">
                 <ul>
                     <li>
                         <c:if test="${pageBean.currentPage >= pageBean.pageCount && pageBean.pageCount > 0}">
                             <a href="#" class="buton n_click">下一页</a>
                         </c:if>
                         <c:if test="${pageBean.currentPage < pageBean.pageCount && pageBean.pageCount > 0}">
                             <a href="order_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" class="buton" title="Next Page" target="main">下一页</a>
                         </c:if>
                     </li>
                     <li>
                         <c:if test="${pageBean.pageCount == 1}">
                             <a href="#" class="n_page">1</a>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 2}">
                             <c:if test="${pageBean.currentPage == 1}">
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 3}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 4}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                                 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                             	 <a href="#" class="n_page">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 5}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                             	 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                             	 <a href="#" class="n_page">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 5}">
                             	 <a href="#" class="n_page">5</a>
                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 6}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                                 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                             	 <a href="#" class="n_page">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 5}">
                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
                             	 <a href="#" class="n_page">5</a>
                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 6}">
                             	 <a href="#" class="n_page">6</a>
                             	 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount > 6}">
                             <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                             	 <a href="#" class="n_page">${pageBean.pageCount}</a>
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == pageBean.pageCount - 1}">
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
                             	 <a href="#" class="n_page">${pageBean.pageCount - 1}</a>
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 1}">
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
	                             	 <a href="#" class="n_page">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage >= pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
	                             	 <a href="#" class="n_page">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
	                             	 <a href="#" class="n_page">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=5&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">5</a>
	                             	 <a href="#" class="n_page">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="#" class="n_page">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                             </c:if>
                             
                             <c:if test="${pageBean.currentPage == 5}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="#">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                             </c:if>
                             
                             <c:if test="${pageBean.currentPage > 5}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.currentPage + 1}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.currentPage + 1}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 2}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.pageCount - 1}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" target="main">1</a>
                                 </c:if>
                             </c:if>
                         </c:if>
                     </li>
                     <li>
                         <c:if test="${pageBean.currentPage == 1 && pageBean.pageCount > 0}">
                             <a href="#" class="buton n_click">上一页</a>
                         </c:if>
                         <c:if test="${pageBean.currentPage > 1}">
                             <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&&orderStat=${orderStat}&&orderNo=${orderNo}" class="buton" title="Last Page" target="main">上一页</a>
                         </c:if>
                     </li>
                 </ul>
                 <div style="clear: both;"></div>
             </div>
             <c:forEach items="${pageBean.recordList}" var="order">
	             <div class="order_list">
	                <div class="list_no">
	                    <span style="margin-left: 10px; ">订单号：${order.orderNo}</span> 
	                    <div style="clear: both;"></div>
	                </div>
	                <div class="good_list">
	                    <ul>
	                        <li class="g_i">
	                            <c:forEach items="${order.orderDetails}" var="od">
		                            <div class="good_info">
		                                <ul>
		                                    <li class="img">
		                                      <img alt="" src="home_showImage.action?goodId=${od.goodId}" >
		                                    </li>
		                                    <li class="remark">
		                                        <span class="r">${od.specification}</span>
		                                        <span class="hv">${od.headValue}</span>
		                                    </li>
		                                    <li class="price">
		                                           ${od.salePrice}
		                                    </li>
		                                    <li class="num">
		                                           ${od.num}
		                                    </li>
		                                    <li class="g_o">
		                                           <a href="#">退货</a>/<a href="#">换货</a>
		                                    </li>
		                                </ul>
		                                <div style="clear: both;"></div>
		                            </div>
	                            </c:forEach>
	                        </li>
	                        <li class="t_m" style="color: #FF4400;">${order.orderAmount}</li>
	                        <li class="y_m">${order.orderCarriage}</li>
	                        <li class="o_s">
	                            <c:if test="${order.orderState == 0}">
	                                待审核<br />
	                                <a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                                <a href="#" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 1}">
	                                待支付<br />
	                                <a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                                <a href="#" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 2}">
	                                已支付,正在做出库前准备工作<br />
	                                <a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                                <a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 3}">
	                                正在出库...<br />
	                                <a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                                <a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 4 || order.orderState == 5}">
	                                物流运输中...<br />
	                            	<a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                            	<a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 6}">
	                                待评价<br />
	                            	<a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                            	<a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 7}">
	                                已完成<br />
	                            	<a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                            	<a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 8}">
	                                申请取消中...<br />
	                            	<a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                            	<a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 9}">
	                                已取消<br />
	                            	<a href="order_info.action?orderId=${order.orderId}" title="查看订单流转信息">订单详情</a><br />
	                            	<a href="javascript:void(0);" title="查看订单流转的详细信息" onclick="showBg('${order.orderId}');">流转信息</a>
	                            </c:if>
	                        </li>
	                        <li class="o_o">
	                            <c:if test="${order.orderState == 0}">
	                            	<input type="button" value="取消订单" title="申请取消订单" class="oo" onclick="cancel('${order.orderId}')">
	                            </c:if>
	                            <c:if test="${order.orderState == 1}">
	                            	<input type="button" value="取消订单" title="申请取消订单" class="oo" onclick="cancel('${order.orderId}')">
	                            	<br /><br />
	                            	<input type="button" value="立即支付" title="在线支付订单" class="oo" onclick="pay_order('${order.orderId}')">
	                            </c:if>
	                            <c:if test="${order.orderState == 4 || order.orderState == 5}">
	                            	<input type="button" value="确认收货" title="确认商品信息准确无误并已收到" class="oo" onclick="taken('${order.orderId}')">
	                            </c:if>
	                            <c:if test="${order.orderState == 6}">
	                            	<input type="button" value="评价订单" title="对此次订单交易商家的服务态度做评价" class="oo" onclick="showBg2('${order.orderId}');">
	                            </c:if>
	                        </li>
	                    </ul>
	                    <div style="clear: both;"></div>
	                </div>
	             	<div style="clear: both;"></div>
	             </div>
             </c:forEach>
         </div>
         <div style="clear: both;"></div>
     </div>
  </body>
</html>
