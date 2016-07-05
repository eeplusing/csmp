<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>

<html>
 <head>
  <title>入库单列表</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/jquery-calendar.css" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/component/jquery-calendar.js"></script>
  
  <style type="text/css">
    body {
	  text-align: center;
    }   
    input,select{
      border: 1px solid #CCCCCC;
      color: #555555;
      display: inline-block;
      line-height: normal;
      padding: 4px;
    }
    
    .global{
  		list-style: none;  	
  		width:1300px;
  		margin: 0px auto;
    }
    
    h1{ font-size:16px;}

    /* from page*/
    .form { 
	   width:1211px;
    }
	 
    .form th,.form td{
	  padding-top:10px;
	  padding-bottom:10px;
	  border-top:1px solid #eee;
	  vertical-align:top
    }
	
    .form th{ 
	  text-align:center; 
	  padding-right:6px; 
    }
	
    .form .tip{ 
	  color:#666; 
	  margin-left:8px;
    }
    
    .ea-btn{
  	  font-size:16px;
  	  font-weight:bold;
  	  background:#FF4400;
  	  border: 1px solid #FF4400;
 	  color:#FFF;
  	  text-align:center;
  	  cursor:pointer;
  	  line-height: 14px;
  	  display:inline-block;
  	  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
  	  text-shadow: 0 -1px 0 rgba(255,255,255,1);
  	  padding: 6px 15px;
  	  outline:0 none;
  	  height:30px; 
 	  border-radius:4px; 
 	  width:100px; 
    }
	
    .ea-btn:link{
  	  color:#FFF;
    }
	
    .ea-btn:visited{
  	  color:#FFF;
    }
	
    .ea-btn:hover{
  	  border:1px solid #c6c6c6;
  	  background:#FF4400;
  	  color:#FFF;
  	  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  	  text-decoration: none;
    }

    .ea-btn:active{
  	  border:1px solid #cccccc;
  	  background:#FF4400;
  	  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset;
  	  color:#FFF;
  	  text-decoration: none;
    }
  </style>
  <script type="text/javascript">
    $(document).ready(function(){ 
   		var height = parseInt($(".global").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度535
        if(window){
		     window.parent.set_fheight("main", height + 20);
		     window.parent.set_fheight("mpage", height + 20);
		}else{
			 win.parent.set_fheight("main", height + 20);
			 window.parent.set_fheight("mpage", height + 20);
		}    
    });   
    
    //一级分类
    function doOneType()
    {
       //仓库id
       var storage_id = $("#storageId").val();
       if(storage_id==null)
       {
         storage_id="";
       }
       
       var typeId1 = $("#typeId1").val();
       if(typeId1==null)
       {
         typeId1="";
       }
       
       $("#one_type").attr("href", "go_export_data.action?storage_id="+storage_id+"&typeId1="+typeId1);
	   document.getElementById("one_type").click();
    }
    
    //二级分类
    function doTwoType()
    {
       //仓库id
       var storage_id = $("#storageId").val();
       if(storage_id==null)
       {
         storage_id="";
       }
       
       var typeId1 = $("#typeId1").val();
       if(typeId1==null)
       {
         typeId1="";
       }
       
       var typeId2 = $("#typeId2").val();
       if(typeId2==null)
       {
         typeId2="";
       }
       
       $("#two_type").attr("href", "go_export_data.action?storage_id="+storage_id+"&typeId1="+typeId1+"&typeId2="+typeId2);
	   document.getElementById("two_type").click();
    }
    
    //库存数据导出
    function exportStock()
    {
       //仓库id
       var storage_id = $("#storageId").val();
       if(storage_id==null)
       {
         storage_id="";
       }
       //一级分类
       var typeId1 = $("#typeId1").val();
       if(typeId1==null)
       {
         typeId1="";
       }
       //二级分类
       var typeId2 = $("#typeId2").val();
       if(typeId2==null)
       {
         typeId2="";
       }
       //商品id
       var good_id = $("#goodId").val();
       if(good_id==null)
       {
         good_id="";
       }
       
       $("#export_stock_data").attr("href", "export_stock_data.action?storage_id="+storage_id+"&typeId1="+typeId1+"&typeId2="+typeId2+"&good_id="+good_id);
	   document.getElementById("export_stock_data").click();
    }
    //订单数据导出
    function exportOrder()
    {
       //时间段
       var beginDate = $("#beginDate").val();
       if(beginDate==null)
       {
         beginDate="";
       }
       var endDate = $("#endDate").val();
       if(endDate==null)
       {
         endDate="";
       }
       //订单编号
       var orderNo = $("#orderNo").val();
       if(orderNo==null)
       {
         orderNo="";
       }
       
       $("#export_order_data").attr("href", "export_order_data.action?beginDate="+beginDate+"&endDate="+endDate+"&orderNo="+orderNo);
	   document.getElementById("export_order_data").click();
    }
  </script>
 </head>
 <body>
  <form action="">
  <div class="global">
   <div align="center">  
     <h2>数据导出</h2>
     
     <table class="form" style="margin-top: 20px;"> 
      <tr> 
       <th>库存数据导出:&nbsp;&nbsp;
                           仓库
         <c:if test="${storage_id != null && storage_id != ''}">
           <select id="storageId" name="storageId">
           <option value="">--------</option>
           <c:forEach items="${sList}" var="slist">
             <c:if test="${slist.storageId == storage_id}">
              <option value="${slist.storageId}" selected="selected">${slist.storageName}</option>
             </c:if>
             <c:if test="${slist.storageId != storage_id}">
              <option value="${slist.storageId}">${slist.storageName}</option>
             </c:if>
           </c:forEach>
          </select>
         </c:if>
         <c:if test="${storage_id == null || storage_id == ''}">
          <select id="storageId" name="storageId">
           <option value="">--------</option>
           <c:forEach items="${sList}" var="slist">
             <option value="${slist.storageId}">${slist.storageName}</option>
           </c:forEach>
          </select>
         </c:if>                   
         &nbsp;&nbsp;
                            一级分类
         <c:if test="${type_id1 != null && type_id1 != ''}">
          <select id="typeId1" name="typeId1" onchange="doOneType()">
           <option value="">--------</option>
           <c:forEach items="${oList}" var="olist">
             <c:if test="${olist.typeId == type_id1}">
               <option value="${olist.typeId}" selected="selected">${olist.typeName}</option>
             </c:if>
             <c:if test="${olist.typeId != type_id1}">
               <option value="${olist.typeId}">${olist.typeName}</option>
             </c:if>
           </c:forEach>
          </select>
         </c:if>
         <c:if test="${type_id1 == null || type_id1 == ''}">
          <select id="typeId1" name="typeId1" onchange="doOneType()">
           <option value="">--------</option>
           <c:forEach items="${oList}" var="olist">
             <option value="${olist.typeId}">${olist.typeName}</option>
           </c:forEach>
          </select>
         </c:if>
         <a href="" target="_self" id="one_type"></a>&nbsp;&nbsp;
                           二级分类
         <c:if test="${type_id2 != null && type_id2 != ''}">
          <select id="typeId2" name="typeId2" onchange="doTwoType()">
           <option value="">--------</option>
           <c:forEach items="${tList}" var="tlist">
             <c:if test="${tlist.typeId == type_id2}">
              <option value="${tlist.typeId}" selected="selected">${tlist.typeName}</option>
             </c:if>
             <c:if test="${tlist.typeId != type_id2}">
              <option value="${tlist.typeId}">${tlist.typeName}</option>
             </c:if>
           </c:forEach>
          </select>
         </c:if>
         <c:if test="${type_id2 == null || type_id2 == ''}">
          <select id="typeId2" name="typeId2" onchange="doTwoType()">
           <option value="">--------</option>
           <c:forEach items="${tList}" var="tlist">
             <option value="${tlist.typeId}">${tlist.typeName}</option>
           </c:forEach>
          </select>
         </c:if>
         <a href="" target="_self" id="two_type"></a>&nbsp;&nbsp;
                          商品
         <select id="goodId" name="goodId" style="width=100">
           <option value="">--------</option>
           <c:forEach items="${gList}" var="glist">
             <option value="${glist.goodId}">${glist.goodName}</option>
           </c:forEach>
         </select>&nbsp;&nbsp;
       
         <input type="button" class="ea-btn" id="btnStock" name="btnStock" value="导 出" onclick="exportStock()" />
         <a href="" target="_self" id="export_stock_data"></a>
       </th>  
      </tr> 
      
      <tr> 
       <th>订单数据导出:&nbsp;&nbsp;
                           时间
         <input type="text" name="beginDate" id="beginDate" maxlength="10" onfocus="$(this).calendar()" value="${beginDate}">
         -
         <input type="text" name="endDate" id="endDate" maxlength="10" onfocus="$(this).calendar()" value="${endDate}">&nbsp;&nbsp;
                            订单编号
         <input type="text" id="orderNo" name="orderNo" value=""/>&nbsp;&nbsp;
      
         <input type="button" class="ea-btn" id="btnOrder" name="btnOrder" value="导 出" onclick="exportOrder()" />
         <a href="" target="_self" id="export_order_data"></a>
       </th>  
      </tr> 
     </table>     
   </div>
  </div>
  </form>
 </body>
</html>