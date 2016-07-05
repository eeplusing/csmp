<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>新增入库单</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/in_storage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  <style type="text/css">
    input,select{
      border: 1px solid #CCCCCC;
      color: #555555;
      display: inline-block;
      line-height: normal;
      padding: 4px;
    }   
    
    h1{ font-size:16px;}

/* from page*/
.form { 
	width:1211px;
}
	 
.form th,.form td{
	padding:10px;
	border-top:1px solid #eee;
	vertical-align:top
}
	
.form th{ 
	text-align:right; 
	padding-right:6px; 
}
	
.form .tip{ 
	color:#666; 
	margin-left:8px;
}
    
    
    /*green button*/
.ea-btn-green{
  	font-size:16px;
  	font-weight:bold;
  	background:#FF4400;
  	border: 1px solid #FF4400;
  	border-radius:2px;
  	color:#FFF;
  	text-align:center;
  	cursor:pointer;
  	line-height: 14px;
  	display:inline-block;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
  	text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.2);
  	padding: 6px 15px;
  	outline:0 none;
}
	
.ea-btn-green:link{
  	color: #FFF;
  	font-weight:bold;
}
	
.ea-btn-green:visited{
  	color: #FFF;
  	font-weight:bold;
}
	
.ea-btn-green:hover{
  	border:1px solid #FF4400;
 	background:#FF4400;
 	color:#FFF;
  	font-weight:bold;
 	text-decoration: none;
}
	
.ea-btn-green:active{
  	border:1px solid #FF4400;
  	background:#FF4400;
 	color:#FFF;
  	font-weight:bold;
  	text-decoration: none;
}     
  </style>
  <script type="text/javascript">
    function goBack()
    {
       $("#go_back").attr("href", "in_storage_list.action");
	   document.getElementById("go_back").click();
    }
    
    function saveInStorage()
    {
       var can_submit = true;
       var storageId = $("#storageId").val();
       if(storageId=="")
       {
          alert("请选择仓库！");
          return false;
       }
       var ids = "";
       var json_str = "[";
       var index = 0;
       $("tr.abc").each(function(){
           var goodId = $(this).children("td").children(".goodId").val().replace(/(^\s*)|(\s*$)/g, "");
           var amount = $(this).children("td").children(".amount").val().replace(/(^\s*)|(\s*$)/g, "");
           if(null == goodId || goodId == "" || goodId.length == 0){
             alert("请选择商品！");
             can_submit = false;
	         return false;
           } else if(null == amount || amount == "" || amount.length == 0){
             alert("请输入数量！");
             can_submit = false;
	         return false;
           } else if(isNaN(amount))
           {
             alert("数量应为数字格式！");
             can_submit = false;
	         return false;
           } else{
	           if(ids.indexOf(goodId +",") == 0 ||ids.indexOf("," + goodId +",") > 0){
	               alert("商品重复！");
	               can_submit = false;
	               return false;
	           }else{
	               ids += goodId +",";
	               if(index > 0){
	                  json_str += ",";
	               }
	               json_str += "{goodId:" + goodId + ", amount:" + amount + "}";
	           }
           }
           index++;
       });
       json_str += "]";
       
       if(!can_submit){
           return false;
       }
       
       $.ajax({
			    url:"save_in_storage.action" ,
			    data: "storageId=" + storageId + "&json_str=" + json_str,
				type:"post", 
				cache:false,
				dataType:"json",				
				success:function(results){
				    if(results=='success')
				    {
				       alert("新增入库单成功！");
				       $("#go_back").attr("href", "in_storage_list.action");
	                   document.getElementById("go_back").click();
				    }else
				    {
				       alert("新增入库单失败！");
				    }			    
			    }
	   });
    }
    
    function addTableBill()
    {
       var lastRowNum=jQuery("#tblBillHid").val();
	   var tblEment=jQuery("#tblBill");
	   var rowHTML="<tr class='abc'><td><select class='goodId' id='goodId' name='goodId' style='width:120px'>"+
               "<option value=''>--------</option>"+
               "<c:forEach items='${gList}' var='glist'>"+
               "<option value='${glist.goodId}'>${glist.goodName}</option>"+
               "</c:forEach></select></td>"+
			   "<td><input type='text' size='10' id='amount' class='amount' name='amount' value=''/>&nbsp;<font color='red'>*</font></td>"+
			   "<td><input type='button' value='删 除' onclick='delTableBill()' style='cursor: pointer; color:#F00; font-size:12px;' /></td>"+
			   "</tr>";
	   jQuery("#tblBill tr:eq("+(parseInt(lastRowNum)-1)+")" ).after(rowHTML);
	   var rowNum=parseInt(lastRowNum)+1;
	   jQuery("#tblBillHid").val(rowNum);
    }
    
    function delTableBill(){
	   var lastRowNum=jQuery("#tblBillHid").val();
	   if(parseInt(lastRowNum)>2){
		  document.getElementById("tblBill").deleteRow(parseInt(lastRowNum)-1);
    	  var rowNum=parseInt(lastRowNum)-1;
    	  jQuery("#tblBillHid").val(rowNum);
	   }
    }
  </script>
 </head>
 <body>
   <div align="center">

     <h1>新增入库单</h1>
  
     <table class="form" cellpadding="0" cellspacing="0" border="0">
      <tr>
       <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;仓库名称</td>
       <td align="left">
        <select id="storageId" name="storageId" style="width=100">
           <option value="">--------</option>
           <c:forEach items="${sList}" var="slist">
             <option value="${slist.storageId}">${slist.storageName}</option>
           </c:forEach>
        </select>
       </td>
      </tr>
      
      <tr>
        <td colspan="2">
          <table class="subtable" id="tblBill" name="tblBill" style="text-align:center;margin-left:290px;">
            <tr>
             <td>商品名称</td>
             <td>数量</td>
             <td></td>
            </tr>
            <tr class="abc">
             <td>
              <select class="goodId" id="goodId" name="goodId" style="width:120px;">
               <option value="">--------</option>
               <c:forEach items="${gList}" var="glist">
                <option value="${glist.goodId}">${glist.goodName}</option>
               </c:forEach>
              </select>
             </td>

             <td>
              <input type="text" size="10" class="amount" id="amount" name="amount" value=""/><font color='red'>*</font>    
             </td>  
       
             <td>
	          <input type="button" value="删 除" onclick="delTableBill()" style="cursor: pointer; color:#F00; font-size:12px;" />
		      <input type="hidden" id="tblBillHid" name="tblBillHid" value="2"/>
	         </td>
           </tr>
          </table>
        </td>
      </tr>  
      <tr>
		<td colspan="2">
		  <input type="button" value="添 加" class="ea-btn-green" onclick="addTableBill()" style="cursor: pointer; margin-left:330px;" />
		  <input type="button" value="提 交" class="ea-btn-green" onclick="saveInStorage()" style="margin-left:5px;" />
		  <input type="button" value="取 消" class="ea-btn-green" onclick="goBack()" style="margin-left:5px;" />
		  <a href="" target="main" id="go_back"></a>
	    </td>
	  </tr>    
     </table>    
   </div>   
 </body>
</html>