<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>商品价格编辑主页</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <style type="text/css">
       body{
           width: 1288px;
           overflow: hidden;
           border: 0px solid #000;
       }
       
       div.ptable{
           width: 80%;
           margin: 20px 10%;
           border: 1px solid #FF4400;
       }
       div.title{
           width: 100%;
           height: 30px;
           border-bottom: 1px solid #FF4400;
           background:#FF4400 ;
          
          /* background: url("${pageContext.request.contextPath}/images/t_top.png") repeat-x;*/
       }
       div.title span{
           display: block;
           padding-top: 7px;
           padding-left: 10px;
           font-size: 16px;
           font-weight: bold;
           color: #FFF;
       }
       div.oper{
           width: 100%;
           height: 30px;
           font-size: 22px;
           background: #EEE;
           color: #CCC;
       }
       
       div.oper input[type=button]{
           margin-top: 5px;
           padding: 1px;
           width: 45px;
           height: 22px;
           font-size: 14px;
           color: #333;
           border: none;
       }
       div.oper input[type=button]:HOVER{
           padding: 0px;
           cursor: pointer;
           border: 1px solid #33A0E5;
           color: #33A0E5;
       }
       input.add{
           margin-left: 20px;
       }
       div.list_head{
           width:100%;
           height:30px;
           border-top: 1px solid #CCC;
           border-bottom: 1px solid #CCC;
           background: #599FD3;
       }
       div.list_head ul li{
           float: left;
           padding-top:6px;
           height:24px;
           border-right: 1px solid #CCC;
           text-align: center;
       }
       input[type=checkbox]{
           display:block;
           width:45px;
       }
       ul.r_info{
          width: 400px;
          
       }
       ul.r_info li{
           float: left;
           height: 20px;
           padding-top: 5px;
           text-align: center;
           border-right: 1px dashed #CCC;
           border-bottom: 1px dashed #CCC;
       }
       li.cb, li.no{
           width: 50px;
       }
       li.pp{
           width: 80px;
       }
       li.gname, li.pname{
           width: 100px;
       }
       ul.c_odd li{
          background: #EEF
       }
       ul.c_h li{
          background: #D0E5F5;
       }
    </style>
    <script type="text/javascript">
       $(function(){
           var height = document.body.scrollHeight;
           if(height < 740) height = 740;//设置最小高度740
          if(window){
               window.parent.setframe_height(height);
               window.parent.setframe_css("background", "#FFF");
           }else{
               win.parent.setframe_height(height);
               win.parent.setframe_css("background", "#FFF");
           }
           var index = 0;
           $("ul.r_info").each(function(){
               if(index%2 == 1){
                   $(this).addClass("c_odd");
               }
               index++;
               
               //实现行点击选中功能
               $(this).children(".abc").click(function(){
                   var cb = $(this).parent().find(".cb");
                   cb.attr("checked", !cb.attr("checked"));
               });
           });
           
           $("ul.r_info").hover(function() {
			       $(this).addClass("c_h");
		       }, function() {
			       $(this).removeClass("c_h");
		   });
		   
		   $("#all_check").click(function(){
		       if($(this).attr("checked") == true){
		           $(".cb").each(function() {
					   $(this).attr("checked", true);
				   });
		       }else{
		           $(".cb").each(function() {
					   $(this).attr("checked", false);
				   });
		       }
		   });
		   
		   $(".oper input").each(function() {
		        $(this).click(function(){
		            if($(this).attr("class") == "add"){
		                if(window){
				            window.parent.parent.add_price(${good.goodId});
				        }else{
				            win.parent.parent.add_price(${good.goodId});
				        }
		            }else if($(this).attr("class") == "del"){
		                var pids = "";
				        $(":checkbox").each(function(){
				            if($(this).attr("checked") == true){
				                if($(this).attr("id") != "all_check"){
				                    pids += $(this).val() + ",";
				                }
				            }
				        });
				        if(pids.indexOf(",") <= 0){
				            alert("请选择要删除的数据！"); 
				            return false;
				        }
		                if(confirm("确定要删除勾选的价格吗？")){
					        $.ajax({
								type : "POST",
								url : "price_delete.action",
								data : "pids=" + pids,
								dataType : "text",
								success : function(msg) {
								    alert(msg);
								    location.reload();
								}
							});
				        }
		            }else if($(this).attr("class") == "mod"){
		                var index = 0;
		                var pids = new Array();
		                $(":checkbox").each(function(){
				            if($(this).attr("checked") == true){
				                if($(this).attr("id") != "all_check"){
				                    pids[index++] = $(this).val();
				                }
				            }
				        });
				        if(index <= 0){
				            alert("请选择要编辑的数据！");
				            return false;
				        }else if(index > 1){
				            alert("该操作不支持批量操作！");
				            return false;
				        }else{
				            if(window){
				                window.parent.parent.modify_price(pids[--index]);
				            }else{
				                win.parent.parent.modify_price(pids[--index]);
				            }
				        }
		            }
		        });
		   });
       });
    </script>
  </head>
  
  <body>
      <div>
          <div class="ptable">
              <div class="title">
                   <span>价格列表&gt;<s:property value="#good.goodName"/></span>
                   <div style="clear:both;"></div>
              </div>
              <div class="oper">
                  <input type="button" class="add" value="添 加">|
                  <input type="button" class="del" value="删 除" >|
                  <input type="button" class="mod" value="编 辑" >
                  <div style="clear:both;"></div>
              </div>
              <div class="list_head">
                  <ul>
                      <li><input type="checkbox" title="全选" class="cb" id="all_check"></li>
                      <li class="no">序号</li>
                      <li class="pp">价格</li>
                      <li class="pname">价格名称</li>
                      <li class="gname">等级名称</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div class="list_main" >
                  <s:iterator value="#good.prices" status="cno">
                       <ul class="r_info">
	                      <li><input type="checkbox" value="<s:property value='infoId'/>" class="cb"></li>
	                      <li class="no abc"><s:property value="#cno.index + 1"/></li>
	                      <li class="pp abc"><s:property value='price'/></li>
	                      <li class="pname abc"><s:property value='priceName'/></li>
	                      <li class="gname abc"><s:property value='grade.gradeName'/></li>
	                      <div style="clear:both;"></div>
	                  </ul>
                  </s:iterator>
                  <div style="clear:both;"></div>
              </div>
          </div>
          <div style="clear:both;"></div>
      </div>
  </body>
</html>
