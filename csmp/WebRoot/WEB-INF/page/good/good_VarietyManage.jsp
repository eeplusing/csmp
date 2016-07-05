<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>商品种类</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">   
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <style type="text/css">
       body{
            overflow: hidden;
       }
       
       .global{
  		 list-style: none;  	
  		 width:1300px;
  		 margin: 0px auto;
  	   }
       
       div.ptable{
           width: 100%;
           border: 1px solid #FFA44B;
       }
       div.title{
           width: 100%;
           height: 30px;
           border-bottom: 0px solid #FFA44B;
           background: #589FD3;
        
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
           font-size: 12px;
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
           font-size: 12px;
           border-top: 1px solid #CCC;
           border-bottom: 1px solid #CCC;
           background: #F8F8F8;
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
          width: 666px;
          
       }
       ul.r_info li{
           float: left;
           height: 20px;
           padding-top: 5px;
           font-size: 12px;
           text-align: center;
           border-right: 1px dashed #CCC;
           border-bottom: 1px dashed #CCC;
       }
       ul.r_info li.pp{
           width: 283px;
           padding-left: 5px;
           overflow: hidden;
           text-align: left;
       }
       
       li.no{
           width: 70px;
           }
       li.unit{
           width: 50px;
       }
       li.cb{
           width: 50px;
       }
       li.pp{
           width: 288px;
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
       input.ty_re{
         background:#ffffff;
         height:30px;
         width:400px;
         font-size: 12px;
       
       }
       input.ty_na{
         background:#ffffff;
         height:30px;
         width:100px;
         font-size: 12px;
       
       }
        input.bot{
         border:none;
         background:#FC9;
         width: 60px;
         height:30px;
         font-size: 15px; 
         font-weight: bold; 
         padding-top: 8px; 
         display:block; 
         margin: 5px auto;

        }
    </style>
    <script type="text/javascript">
	     
       //删除商品种类
      function delType(){ 
			var typeIds="";
		   	$(":checkbox").each(function(){
		       if($(this).attr("checked") == true){
		           typeIds += $(this).val() + ",";
		       }
		   });
        
           if(typeIds == ""){
                alert("请先选中要删除的种类！");
                return;
           }else{
               if(confirm("确认要删除选中的种类吗?")){
                    $.ajax({
					    type : "POST",
					    url : "type_delType.action",
					    data : "typeIds=" + typeIds ,
					    dataType : "text",
					    success : function(msg) {
					        alert(msg);
					        location.reload();//刷新本页面
				        }
                    });
               }else{
                   return false;
               }        
           } 
    } 
	      
       $(function(){
           var height = parseInt($(".global").css("height").replace("px", ""));
           if(height < 300) height = 300;//设置最小高度535
          if(window){
		       window.parent.set_fheight("main", height + 20);
		       window.parent.set_fheight("mpage", height + 20);
		   }else{
			   win.parent.set_fheight("main", height + 20);
			   window.parent.set_fheight("mpage", height + 20);
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
		   
		   $(".oper input").each(function() {
		        $(this).click(function(){
		        	if($(this).attr("class") == "mod"){
		                	var index = 0;
		                	var pids = new Array();
		                	$(":checkbox").each(function(){
				            	if($(this).attr("checked") == true){
				                	pids[index++] = $(this).val();
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
					                window.top.up_Type(pids[--index]);
					            }else{
					                win.top.up_Type(pids[--index]);
				    	        }
				        	}
		            }else if($(this).attr("class") == "add"){
		                	if(window){
				            	window.top.open_addType();
				        	}else{
				            	win.top.open_addType();
				        	}
		            }
		        });
		   });
       });
    </script>
  </head>
  
  <body>
      <div class="global">
          <div class="ptable">
              <div class="title">
                   <span>商品分类列表</span>
                   <div style="clear:both;"></div>
              </div>
              <div class="oper">
                  <input type="button" class="add" value="添 加">|
                  <input type="button"  value="删 除"  onclick="delType();">|
                  <input type="button" class="mod" value="编 辑" >
                  <div style="clear:both;"></div>
              </div>
              <div class="list_head">
                  <ul>
                      <li style="width: 45px;"> - </li>
                      <li class="no">种类名称</li>
                      <li class="unit">单位</li>
                      <li class="pp" >描述</li>
                      <li class="pname">父类ID</li>
                      <li class="gname">种类级别</li>
                  </ul>
                  <div style="clear:both;"></div>
              </div>
              <div class="list_main">
                 <c:forEach items="${typeList}" var="type">
                     <ul class="r_info">
	                     <li><input type="checkbox" value="${type.typeId}" class="cb" name="tid"></li>
	                     <li class="no abc">${type.typeName }</li>
	                     <li class="unit abc">${type.typeUnit}</li>
	                     <li class="pp abc" >${type.remark }</li>
	                     <li class="pname abc">
	                         <c:if test="${type.parentId == 0}"> - </c:if>
	                         <c:forEach items="${typeList}" var="t">
	                             <c:if test="${type.parentId == t.typeId}">${t.typeName}</c:if>
	                         </c:forEach>
	                     </li>
	                     <li class="gname abc">
	                         <c:if test="${type.typeGrade == 1}">一级</c:if>
	                         <c:if test="${type.typeGrade == 2}">二级</c:if>
	                         <c:if test="${type.typeGrade == 3}">三级</c:if>
	                     </li>
	                 </ul>
                 </c:forEach> 
                  <div style="clear:both;"></div>
              </div>
        </div> 
     </div>
  </body>
</html>
