<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
      <title>订单详情</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">

      <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
      
      <style type="text/css">
          body{
              overflow: hidden;
          }
          .main{
              width: 1200px;
              margin: 50px auto;
              border: 1px solid #EEE;
          }
          div.t_info{
              width:100% - 20px;
              height: 25px;
              background: #F3F3F3;
              padding-top: 15px;
              padding-left: 20px;
              font-size: 14px;
              font-weight: bold;
              margin-bottom: 20px;
          }
          div.step-no li{
              width: 100%;
          }
          li.img div{
              width: 90%;
              margin:0px auto; 
          }
          li.img li{
              height:34px;
              float:left;
          }
          li.img p{
              font-size:22px; 
              margin-left: 100px;
              margin-top: 5px;
              font-weight: bolder;
              color:#FFF;
          }
          li.img li.img1{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -260px 0px;
          }
          li.img li.img2{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -350px -34.5px;
          }
          li.img li.img3{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -260px -68px;
          }
          li.img li.img4{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -260px -102px;
          }
          li.img li.img5{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -260px -136px;
          }
          li.img li.img6{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -260px -170px;
          }
          li.img li.img7{
              background: url("${pageContext.request.contextPath}/images/step.png") no-repeat -350px -204.3px;
          }
          
          li.text{
              font-size: 12px;
              color: #999;
              font-weight: bold;
          }
          li.text span.text1{
              margin-left: 4%;
          }
          li.text span.text2{
              margin-left: 15%;
          }
          li.text span.text3{
              margin-left: 18%;
          }
          
          li.text span.now{
              color:#3F7F7F;
          }
          li.time{
              padding-top:20px;
              font-size: 12px;
              color: #999;
          }
          li.time span.time1{
              margin-left: 2%;
          }
          li.time span.time2{
              margin-left: 9%;
          }
          li.time span.time3{
              margin-left: 13%;
          }
          div.order_info{
              width:90%;
              margin:30px auto;
              background: #F3F3F3;
              border: 1px solid #F3F3F3;
          }
          div.order_info div{
              width: 100%;
              margin-top: 10px;
              margin-bottom: 2px;
              font-size: 14px;
          }
          div.order_info div li{
              float: left;
          }
          div.order_info li.i_c{
              width: 80px;
              border: 0px solid;
              text-align: right;
              color:#999;
          }
          div.order_info li.i_d{
              width: 90%;
              color: #555;
          }
          div.oper_bton{
              padding-bottom:10px;
              background: #FFF;
              line-height: 200%;
          }
          div.oper_bton li p{
              margin-left:10px;
              font-weight: bolder;
              color:#333;
          }
          div.oper_bton li span{
              margin-left:10px;
              margin-right:10px;
              color:#333;
          }
          div.oper_bton li input{
              margin-right: 10px;
              width: 60px;
              height:25px;
              background: #FC9;
              border: none;
              cursor: pointer;
              font-size: 12px;
              font-weight: bold;
          }
      </style>
      
      <script type="text/javascript">
          $(function(){
              var height = parseInt($(".main").css("height").replace("px", ""));
              if(height < 600) height = 600;//设置最小高度740
             if(window){
                   window.parent.set_fheight("main", height + 50);
                   window.parent.set_fheight("mpage", height + 50);
		      }else{
			       win.parent.set_fheight("main", height + 50);
			       win.parent.set_fheight("mpage", height + 50);
		      }
          });
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

		    function cancel(oid){
	            if(window){
	                window.parent.cancel(oid);
	            }else{
	                win.parent.cancel(oid);
	            }
	        }
	        function pay_order(oid){
            	window.parent.document.location.href="pay_index.action?orderId=" + oid;
        	}
      </script>
  </head>
  
  <body>
      <div class="main">
          <div class="t_info">订单详情</div>
          <div class="step-no">
              <ul>
                 <li class="text">
                    <c:if test="${order.orderState == 0 || order.orderState == 8}">
                        <span class="text1 now">提交订单</span>
                    </c:if>
                    <c:if test="${order.orderState != 0 && order.orderState != 8}">
                        <span class="text1">提交订单</span>
                    </c:if>
                    <c:if test="${order.orderState == 1}">
                        <span class="text2 now">通过审核</span>
                    </c:if>
                    <c:if test="${order.orderState != 1}">
                        <span class="text2">通过审核</span>
                    </c:if>
                    <c:if test="${order.orderState == 2}">
                        <span class="text3 now">支付完成</span>
                    </c:if>
                    <c:if test="${order.orderState != 2}">
                        <span class="text3">支付完成</span>
                    </c:if>
                    <c:if test="${order.orderState == 6}">
                        <span class="text3 now">确认收货</span>
                    </c:if>
                    <c:if test="${order.orderState != 6}">
                        <span class="text3">确认收货</span>
                    </c:if>
                    <c:if test="${order.orderState == 7}">
                        <span class="text3 now">评价订单</span>
                    </c:if>
                    <c:if test="${order.orderState != 7}">
                        <span class="text3">评价订单</span>
                    </c:if>
                    <div style="clear:both;"></div>
                 </li>
                 <li class="img">
                    <div>
                       <ul>
                          <c:if test="${order.orderState == 0 || order.orderState == 8 || order.orderState == 9}">
                              <li class="img2" style="width: 12.5%;"><p style="font-size:22px; margin-left: 10px;">1</p></li>
                          </c:if>
                          <c:if test="${order.orderState > 0 && order.orderState < 8}">
                              <li class="img7" style="width: 12.5%"></li>
                          </c:if>
                          <c:if test="${order.orderState == 1}">
                              <li class="img1" style="width: 25%"><p style="">2</p></li>
                          </c:if>
                          <c:if test="${order.orderState < 1 || order.orderState == 8 || order.orderState == 9}">
                              <li class="img4" style="width: 25%"><p style="">2</p></li>
                          </c:if>
                          <c:if test="${order.orderState > 1 && order.orderState < 8}">
                              <li class="img6" style="width: 25%"></li>
                          </c:if>
                          <c:if test="${order.orderState == 2}">
                              <li class="img1" style="width: 25%"><p style="">3</p></li>
                          </c:if>
                          <c:if test="${order.orderState < 2 || order.orderState == 8 || order.orderState == 9}">
                              <li class="img4" style="width: 25%"><p style="">3</p></li>
                          </c:if>
                          <c:if test="${order.orderState > 2 && order.orderState < 8}">
                              <li class="img6" style="width: 25%"></li>
                          </c:if>
                          <c:if test="${order.orderState == 6}">
                              <li class="img1" style="width: 25%"><p style="font-size:22px; margin-left: 100px; margin-top: 5px;">4</p></li>
                          </c:if>
                          <c:if test="${order.orderState < 6 || order.orderState == 8 || order.orderState == 9}">
                              <li class="img4" style="width: 25%"><p style="font-size:22px; margin-left: 100px; margin-top: 5px;">4</p></li>
                          </c:if>
                          <c:if test="${order.orderState == 7}">
                              <li class="img6" style="width: 25%"></li>
                              <li class="img3" style="width: 12.5%"><p style="font-size:22px; margin-left: 100px; margin-top: 5px;">5</p></li>
                          </c:if>
                          <c:if test="${order.orderState < 7 || order.orderState == 8 || order.orderState == 9}">
                              <li class="img5" style="width: 12.5%"><p style="font-size:22px; margin-left: 100px; margin-top: 5px;">5</p></li>
                          </c:if>
                       </ul>
                    </div>
                    <div style="clear:both;"></div>
                 </li>
                 <li class="time">
                    <span class="time1" >${orderDate}</span>
                    <c:if test="${order.orderState < 8}">
	                    <span class="time2">${checkTime}</span>
	                    <span class="time3">${payTime}</span>
	                    <span class="time3">${takeGoodTime}</span>
	                    <span class="time3">${evaluateTime}</span>
                    </c:if>
                    <div style="clear:both;"></div>
                 </li>
              </ul>
              <div style="clear:both;"></div>
          </div>
          <div class="order_info">
              <div>
                  <ul>
	                 <li class="i_c">订单编号：</li>
	                 <li class="i_d">${order.orderNo}</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div>
                  <ul>
	                 <li class="i_c">收货地址：</li>
	                 <li class="i_d">${order.address.address}</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div>
                  <ul>
	                 <li class="i_c">收 货 人：</li>
	                 <li class="i_d">${order.address.consigneName}</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div>
                  <ul>
	                 <li class="i_c">电    话：</li>
	                 <li class="i_d">${order.address.consignePhone}</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div>
                  <ul>
	                 <li class="i_c">邮    编：</li>
	                 <li class="i_d">${order.address.postCode}</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div class="oper_bton">
                  <ul>
                      <c:if test="${order.orderState == 0}">
	                      <li>
	                          <p>订单状态：客户的订单已经提交成功，正在等待管理员审核订单。</p>
	                          <span>您可以</span>
	                          <input type="button" value="申请取消" onclick="cancel('${order.orderId}')"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 1}">
	                      <li>
	                          <p>订单状态：订单已经审核通过，等待客户进行订单支付。</p>
	                          <span>您可以</span>
	                          <input type="button" value="申请取消" onclick="cancel('${order.orderId}')"/>
	                          <input type="button" value="立即支付" onclick="pay_order('${order.orderId}')"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 2}">
	                      <li>
	                          <p>订单状态：客户已经成功支付订单，等待商家发货。</p>
	                          <span>您可以</span>
	                          <input type="button" value="流转信息" onclick="showBg('${order.orderId}');"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 3}">
	                      <li>
	                          <p>订单状态：商家正在进行商品出库。</p>
	                          <span>您可以</span>
	                          <input type="button" value="流转信息" onclick="showBg('${order.orderId}');"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 4}">
	                      <li>
	                          <p>订单状态：商品已经开始配送，请注意查收。</p>
	                          <span>您可以</span>
	                          <input type="button" value="流转信息" onclick="showBg('${order.orderId}');"/>
	                          <input type="button" value="确认收货" onclick="taken('${order.orderId}')"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 5}">
	                      <li>
	                          <p>订单状态：商品已经配送至指定地址，等待确认领取。</p>
	                          <span>您可以</span>
	                          <input type="button" value="流转信息" onclick="showBg('${order.orderId}');"/>
	                          <input type="button" value="确认收货" onclick="taken('${order.orderId}')"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 6}">
	                      <li>
	                          <p>订单状态：客户已收货。</p>
	                          <span>您可以</span>
	                          <input type="button" value="流转信息" onclick="showBg('${order.orderId}');"/>
	                          <input type="button" value="评价订单" onclick="showBg2('${order.orderId}');"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 7}">
	                      <li>
	                          <p>订单状态：客户已对订单做出评价，订单已完成。</p>
	                          <span>您可以</span>
	                          <input type="button" value="流转信息" onclick="showBg('${order.orderId}');"/>
	                      </li>
                      </c:if>
                      <c:if test="${order.orderState == 8}">
	                      <li>
	                          <p>订单状态：客户已申请取消订单，正在等待管理员处理。</p>
	                      </li>
                      </c:if>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div style="clear:both;"></div>
          </div>
          <div style="clear:both;"></div>
      </div>
  </body>
</html>
