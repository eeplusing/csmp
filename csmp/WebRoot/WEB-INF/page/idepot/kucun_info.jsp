<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单管理</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
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

.title{
	width:100px;
	height:30px;
	float:left;
	margin-left:5px;
	margin-top:6px;
	font-weight: bold;
	border:0px solid #F00;
	text-align:center;
	cursor:pointer;
	color: #FFFFFF;
	}

/*鼠标单击 		前 	按钮颜色发生变化 */
.title1{
	background:#FF4400;
	color: #FFFFFF;
	}

/*鼠标单击		后	按钮颜色发生变化 */
.title2{
	background:#F19914;
	color: #FFFFFF;
	}


div.head {
	border: 1px solid #C4D5E0;
	background: #F9FAFC;
	margin-bottom: 15px;
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



.t_header {
	width: 100%;
	height: 30px;
	background:#599FD3;
	border: 0px solid #C4D5E0;
	color:#FFF;
	font-weight: bold;
	}

.t_header li {
	margin-top:7px;
	text-align: center;
	float: left;
	border: 0px solid #f00;
	}

li.th_All{
	width:10px;
	margin-left:6px;
	}

li.th_no,li.th_owner,li.th_size{
	width: 100px;
	border: 0px solid #00F;
	}

li.th_distribution{
	width: 100px;
	}
li.th_name{
	width:155px;
	}

li.th_address{
	width: 225px;
	}


li.th_maxsize,li.th_initialsize,li.th_currentsize,li.th_unwaterLevel {
	width: 100px;
	}

li.th_surface{
	width:90px;
	}

.allTab{
	border:0px solid #F00;
	text-align: center;
	width:1302px;
	cellspacing:0px;
	border-collapse: collapse;
	}

.allTab td{
	height:30px;
	font-size:16px;
	border-left:0px solid #F00;
	border-right:0px solid #F00;
	border-top:0px solid #F00;
	border-bottom:0px solid #F00;
	text-align: center;
	vertical-align:middle;
	background:#FFF;
	}
  
table.allTab tr.alt td { /* css 注释：默认隔行背景颜色 */
	 background:#EAF8FF;
	 }   

table.allTab tr.over td{  /*鼠标经过变色   */
	background:#8CE6FE;
	} 

#addStore,#modifyStore{
	height:480px;
	width:1000px;
	margin-left:150px;
	margin-top:50px;
	border:0px solid #F00;
}

.addTab ,.modifyTab{
	margin-left:125px;
	text-align:center;
}
.addTab td,.modifyTab td{
	border:0px solid #F00;
	height:40px;
	width:100px;
}

.addTab input,.modifyTab input{
	border:1px solid #6289AE;
	height:30px;
	width:300px;
	margin-top:5px;
}

.tdinput{
	height:50px;
	width:300px;
}

#btnSave{
	height:30px;
	width:80px;
	margin-left: 400px;
	background:#F40;
	border:0px;
	color:#FFF;
	font-weight:bold;
}

#btnCancel{
	height:30px;
	width:80px;
	margin-left: 40px;
	background:#F40;
	border:0px;
	color:#FFF;
	font-weight:bold;
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
    
	$(function(){
		$("#addStore").css("display","none");
		$("#modifyStore").css("display","none");
		
		$("#head input").each(function() { 
			$(this).addClass("title1");
			$(this).click(function(){
				$("#head input").each(function(){
					$(this).removeClass("title2");
					$(this).addClass("title1");
				});	
				$(this).removeClass("title1");
				$(this).addClass("title2");
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
	   	 $(".trbody").each(function(){	//获取行tr
	          $(this).children(".abc").each(function(){ //为每行里面的元素添加click事件
	          	  var cb = $(this).parent().find(".cb");//获取行tr里的checkBox
	              $(this).click(function(){
	              	cb.attr("checked", !cb.attr("checked"));
	              });
	          });
	      });
	 });
	
	/**奇偶行间隔变色*/
	$(document).ready(function(){ 
    	$(".allTab tr").mouseover(function(){    //如果鼠标移到class为stripe的表格的tr上时，执行函数    
      		$(this).addClass("over");
      	}).mouseout(function(){  				//给这行添加class值为over，并且当鼠标一出该行时执行函数      
            $(this).removeClass("over");		//移除该行的class  
            });   
  		$(".allTab tr:even").addClass("alt");    //给class为stripe的表格的偶数行添加class值为alt 
  	});   
	
	
	
	
	/**新增仓库*/
	function add(){
			$("#addStore").css("display","block");
			$("#modifyStore").css("display","none");
			$("#selcetAll").css("display","none");
    }
    
	/*保存 新增仓库*/
	function saveAdd(){
        var name = $("#add_name").val().replace(/(^\s*)|(\s*$)/g, "");
        var size = $("#add_size").val().replace(/(^\s*)|(\s*$)/g, "");	
        var address = $("#add_address").val().replace(/(^\s*)|(\s*$)/g, "");	
        var owner = $("#add_owner").val().replace(/(^\s*)|(\s*$)/g, "");
        var maxsize = $("#add_maxsize").val().replace(/(^\s*)|(\s*$)/g, "");
        var currentsize = $("#add_currentsize").val().replace(/(^\s*)|(\s*$)/g, "");
        var distribution = $("#add_distribution").val().replace(/(^\s*)|(\s*$)/g, "");
        var unwaterLevel = $("#add_unwaterLevel").val().replace(/(^\s*)|(\s*$)/g, "");
        var surface = $("#add_surface").val().replace(/(^\s*)|(\s*$)/g, "");
        var reg = /^\d+$/ ;
         
        if(name == "" ){
        	alert("仓库名称不能为空！");
        	return false;
        }
        if(currentsize == "" ){
        	alert("当前库存不能为空！");
        	return false;
        }
        if(maxsize == "" ){
        	alert("最大库容不能为空！");
        	return false;
        }
        if( owner == "" ){
        	alert("所有者不能为空！");
        	return false;
        }
        if( address == "" ){
        	alert("仓库地址不能为空！");
        	return false;
        }
        if((!reg.test(currentsize))&&(currentsize !="")){
            alert("当前库存只能为整数！！");
            return false;
        }
        if((!reg.test(maxsize))&&(maxsize !="")){
            alert("最大库容只能为整数！！");
            return false;
        }
        $.ajax({
			type : "POST",
			url : "store_add.action",
			data : "name=" + name + "&size=" + size + "&address=" + address + "&owner=" + owner + 
					"&maxsize=" + maxsize + "&currentsize=" + currentsize + "&distribution="
					 + distribution + "&unwaterLevel=" + unwaterLevel + "&surface=" + surface,
			dataType : "text",
			success : function(msg) {
			    if(msg == "ok"){
			        alert("添加仓库成功");
				    location.reload();//刷新本页面
			    }else{
			        alert("添加失败");
			    }
			}
        });
	}
    
    var tempStoreId=""; //记录选择修改仓库的ID
    
	/**编辑仓库*/
	function modify(){
			$("#modifyStore").css("display","block");
			$("#addStore").css("display","none");
			$("#selcetAll").css("display","none");
			var index = 0;
			var id = "";
			tempStoreId = ""; //  复位     记录选择修改仓库的ID
        	$(":checkbox").each(function(){
            	if($(this).attr("checked") == true){
                	if($(this).attr("id") != "checkAll"){
                		id += $(this).val();
                		index++;
                	}
            	}
        	});
        	if(index == 0) {
        		$("#modifyStore").css("display","none");
				$("#selcetAll").css("display","block");
				alert("请您选择一个仓库后再进行该操作！");
        		cancel();
        	}
        	if(index > 1) {
	        	$("#modifyStore").css("display","none");
				$("#selcetAll").css("display","block");
				alert("您只能选择一个仓库进行该操作");
            	cancel();
        	}
        	if(index=1){
		        $.ajax({
			        type : "POST",
					url : "store_modify_show.action",
					data : "sid=" + id,
					dataType : "text",
					success : function(msg) {
					    var store = eval("(" + msg + ")");
					    tempStoreId=store.storageId;
					    $("#modify_name").val(store.storageName);
					    $("modify_distribution").val(store.distributionWay);
					    $("#modify_size").val(store.storageSpecification);
					    $("#modify_unwaterLevel").val(store.waterproofGrade);
					    $("#modify_address").val(store.storageAddress);
					    $("#modify_surface").val(store.surface);
				    	$("#modify_maxsize").val(store.stockMaxAmount);
					    $("#modify_owner").val(store.ower);
					}
				});
			}
    }
		
	/**保存修改的仓库 */
	function saveModify(){
		var id=tempStoreId;
		var name = $("#modify_name").val().replace(/(^\s*)|(\s*$)/g, "");
        var size = $("#modify_size").val().replace(/(^\s*)|(\s*$)/g, "");	
        var address = $("#modify_address").val().replace(/(^\s*)|(\s*$)/g, "");	
        var owner = $("#modify_owner").val().replace(/(^\s*)|(\s*$)/g, "");
        var maxsize = $("#modify_maxsize").val().replace(/(^\s*)|(\s*$)/g, "");
        var distribution = $("#modify_distribution").val().replace(/(^\s*)|(\s*$)/g, "");
        var unwaterLevel = $("#modify_unwaterLevel").val().replace(/(^\s*)|(\s*$)/g, "");
        var surface = $("#modify_surface").val().replace(/(^\s*)|(\s*$)/g, "");
        var reg = /^\d+$/ ;
        if(name == "" ){
        	alert("仓库名称不能为空！");
        	return false;
        }
         if(maxsize == "" ){
        	alert("最大库容不能为空！");
        	return false;
        }
        if( owner == "" ){
        	alert("所有者不能为空！");
        	return false;
        }
        if( address == "" ){
        	alert("仓库地址不能为空！");
        	return false;
        }
        if((!reg.test(maxsize))&&(maxsize !="")){
            alert("最大库容只能为整数！！");
            return false;
        }
        $.ajax({
			type : "POST",
			url : "store_modify.action",
			data : "id=" + id + "&name=" + name + "&size=" + size + "&address=" + address + "&owner=" + owner + "&maxsize=" + maxsize + 
					"&distribution=" + distribution + "&unwaterLevel=" + unwaterLevel + "&surface=" + surface,
			dataType : "text",
			success : function(msg) {
			    if(msg == "ok"){
			        alert("修改仓库成功");
				    location.reload();//刷新本页面
			    }else{
			        alert("修改失败");
			    }
			}
		});
	 }
	
	/*删除仓库*/
	function del( ){
		var ids = "";
		/**获取所选择仓库的ID*/
        $(":checkbox").each(function(){ 
            if($(this).attr("checked") == true){
                if($(this).attr("id") != "checkAll"){
                	ids += $(this).val() + ",";
                }
            }
        });
        if(ids.length<1)
        {
        	alert("请选择至少一个仓库后，再进行删除操作！");
        	return false;
        }
        else if(confirm("确定要删除吗？")){
	         $.ajax({
				type : "POST",
				url : "store_delete.action",
				data : "sids=" + ids,
				dataType : "text",
				success : function(msg) {
				    if(msg == "ok"){
				        alert("删除仓库成功");
				        location.reload();
				    }
				    else{
				        alert("删除失败");
				        return false;
				    }
				}
			 });
		}
	}	
	
	/**刷新页面*/
	function cancel(){
		location.reload();//刷新本页面
	}
   /**搜索页面*/
   function searchkucun(){
   		var storageId = $("#storageId").val();
   		var storageName = $("#storageName").val();
   		var storageAddress = $("#storageAddress").val();
   		var ower = $("#ower").val();
   		var distributionWay = $("#distributionWay").val();
   		var waterproofGrade = $("#waterproofGrade").val();
   		$("#linked").attr("href","store_searchKucun.action?storageId=" + storageId+"&storageName="+storageName+"&storageAddress="+storageAddress+"&ower="+ower+"&distributionWay="+distributionWay+"&waterproofGrade="+waterproofGrade);
		document.getElementById("linked").click();
   }
</script>
</head>
  <body>
  <a href="javascript:void(0);" id="linked"></a>
   <div class="global">
     <div class="main">
        <div id="head">
            <input type="button" id="t1" class="title" value="新增仓库" onclick="add();">
            <input type="button" id="t2" class="title" value="编辑仓库" onclick="modify();">
            <input type="button" id="t3" class="title" value="删除仓库" onclick="del();">
            <div style="clear: both;"></div>
        </div>
        <br>
 
        <!--查询显示所有仓库 -->
        <div id="selcetAll">
          <div class="sel_form">
             <ul>
              	 <li>
                     <span>仓库编号：</span><input id="storageId" type="text" >
                 </li> 
                 <li>
                     <span>仓库名称：&nbsp;&nbsp;</span><input id="storageName" type="text" >
                 </li>
                 <li>
                     <span>地址：&nbsp;&nbsp;</span><input id="storageAddress" type="text" >
                 </li>
                 <li>
                     <span>所有者：</span><input id="ower" type="text">
                 </li>
                 <li>
                     <span>配送方式：</span><input id="distributionWay" type="text">
                     <!--  <select name="" id="">
                       <option selected="" value="">免费运送 </option>
                       <option selected="" value="">货到付款</option>
                       <option selected="" value="">贷款支付</option>
                     </select>-->
                 </li>
                 
                 <li>
                 	 <span>防水级别：</span>
                     <input id="waterproofGrade" type="text">
                 </li>
                 <li>
                     <input type="button" value="搜    索" onclick="searchkucun();" style="background:#FF4000;color:#FFF;height:20px;font-size:14px; ">
                 </li>
                 <div style=" clear:both;"></div>
             </ul>
             <div style="clear: both;"></div>
          </div>
          
          <div class="t_header">
              <ul>
              	  <li>
              	  	&nbsp;&nbsp;&nbsp;<input class="th_All" id="checkAll" type="checkbox">
              	  </li>
                  <li class="th_no">
                      <span>仓库编号</span>
                  </li>
                  <li class="th_name">
                      <span>仓库名称</span>
                  </li>
                  <li class="th_size">
                      <span>规格</span>
                  </li>
                  <li class="th_address">
                      <span>地址</span>
                  </li>
                  <li class="th_owner">
                      <span>所有者</span>
                  </li>
                  <li class="th_maxsize">
                      <span>最大库容</span>
                  </li>
                  <li class="th_initialsize">
                      <span>初始库容</span>
                  </li>
                  <li class="th_currentsize">
                      <span>当前库存</span>
                  </li>
                  <li class="th_distribution">
                      <span>配送方式</span>
                  </li>
                  <li class="th_unwaterLevel">
                      <span>防水级别</span>
                  </li>
                  <li class="th_surface">
                      <span>地表</span>
                  </li>
              </ul>
              <div style="clear: both;"></div>
          </div>
          
       	  <div>
          	<table class="allTab">
          		<s:if test="!#stores.isEmpty">
		           <s:iterator value="stores" id="store">
		              <tr class="trbody">
		              	<td>
		              		<input name="subBox" class="subox cb" type="checkbox" style="margin-left:0px;" value="${store.storageId}">
		              	</td>
		                <td class="abc" style="width:100px;" >
		                	<li style="overflow:hidden; width:100px;" >${store.storageId}</li>
		                </td>
		                <td class="abc" style="width:150px;">
		                	<li style="overflow:hidden; width:150px; ">${store.storageName}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		                	<li style="overflow:hidden; width:100px;">${store.storageSpecification}</li>
		                </td>
		                <td class="abc" style="width:220px;">
		                	<li style="overflow:hidden; width:220px;">${store.storageAddress}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		               		<li style="overflow:hidden; width:100px;">${store.ower}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		                	<li style="overflow:hidden; width:100px;">${store.stockMaxAmount}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		                	<li style="overflow:hidden; width:100px;">${store.stockIniAmount}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		                	<li style="overflow:hidden; width:100px;">${store.stockAmount}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		                	<li style="overflow:hidden; width:100px;">${store.distributionWay}</li>
		                </td>
		                <td class="abc" style="width:100px;">
		                	<li style="overflow:hidden; width:100px;">${store.waterproofGrade}</li>
		                </td>
		                <td class="abc" style="width:90px;">
		                	<li style="overflow:hidden; width:90px; ">${store.surface}</li>
		                </td>
		            </tr>
		         </s:iterator>
	          </s:if>
          </table>
        </div>
       </div>
   </div>
   <!-- 新增仓库 -->
        <div id="addStore">
          <table class="addTab">
            <tr>
              <td><span>仓库名称:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_name" style="" value=" "> 
              </td>
              <td><span>配送方式:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_distribution" style="" value=" ">
              </td>
           </tr>
           <tr>
              <td><span>当前库存:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_currentsize" style="" value=" ">
              </td>
           	  <td><span>防水级别:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_unwaterLevel" style="" value=" ">
              </td>
           </tr>
           <tr>
           	  <td><span>最大库容:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_maxsize" style="" value=" ">
              </td>
           	  <td><span>仓库地面:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_surface" style="" value=" ">
              </td>
           </tr>
           <tr>
              <td><span>仓库规格:</span></td>
              <td>
              	<input type="text" id="add_size"style="" value=" ">
              </td>
              <td><span>仓库地址:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_address" style="" value=" "> 
              </td>
           </tr>
           <tr>
              
           </tr>
           <tr>
              <td><span>所有者:</span></td>
              <td class="tdinput">
              	<input type="text" id="add_owner" style="" value=" ">
              </td>
              
           </tr>
        </table>
        <br>
        <div>
        	<input type="button" id="btnSave"  value="保   存" onclick="saveAdd();">
        	<input type="button" id="btnCancel"  value="取  消" onclick="cancel();">
        </div>
        <div style="clear: both;"></div>
       </div>
         
          
       <!--编辑仓库 -->
       <div id="modifyStore">
          <table class="modifyTab">
            <tr>
              <td><span>仓库名称:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_name"> 
              </td>
              <td><span>配送方式:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_distribution">
              </td>
           </tr>
           <tr>
              <td><span>仓库规格:</span></td>
              <td>
              	<input type="text" id="modify_size">
              </td>
           	  <td><span>防水级别:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_unwaterLevel">
              </td>
           </tr>
           <tr>
              <td><span>仓库地址:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_address"> 
              </td>
              <td><span>仓库地面:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_surface">
              </td>
           </tr>
           <tr>
           	  <td><span>最大库容:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_maxsize">
              </td>
              <td><span>所有者:</span></td>
              <td class="tdinput">
              	<input type="text" id="modify_owner">
              </td>
           </tr>
        </table>
        <br>
        <div>
        	<input type="button" id="btnSave"  value="保存" onclick="saveModify();">
        	<input type="button" id="btnCancel"  value="取消" onclick="cancel();">
        </div>
        <div style="clear: both;"></div>
       </div>
  </div>
  </body>
</html>
