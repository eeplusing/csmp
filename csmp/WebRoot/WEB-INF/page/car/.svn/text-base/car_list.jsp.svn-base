<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    
    <title>我的购物车</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
  
      <style type="text/css">
        body{
              overflow: hidden;
        }
        
        div.main{
              width:1050px;
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
        .list_head{
              margin-top:15px;
              height: 40px;
              background:#F40;
              color: #FFF;
        }
        .list_head li{
              float: left;
              margin-top: 15px;
              border: 0px solid #000;
        }
       
        li.head_price{
           margin-left:0px;
           width:100px;
           text-align: center;
           font-size: 12px;
           border: 0px solid;
        }
        li.t_m{
           margin-left:6px;
           text-align: center;
           font-size: 12px;
           border: 0px solid;
        }
        li.n_m{
           margin-left:10px;
           width:100px;
           text-align: center;
           font-size: 12px;
           border: 0px solid;
        }
        li.head_num, li.img{
           width:140px;
           text-align: center;
           font-size: 12px;
           border: 0px solid;
        }
        li.head_t_m{
           width:300px;
           text-align: center;
           font-size: 12px;
           border: 0px solid;
        }
        li.remark{
           width:277px;
           font-size: 12px;
           border: 0px solid;
        }
        li.head_g_oper,li.head_y_m, li.head_state, li.head_o_oper, li.o_p, li.row_total, li.num, li.p_m{
           width:100px;
           text-align: center;
           font-size: 12px;
           border: 0px solid;
        }
        .car_list{
              border-bottom: 1px solid #F40;
              border-left: 1px solid #F40;
              border-right: 1px solid #F40;
              padding-top: 10px;
        }
        .car_list li{
              float: left;
        }
        
        .img{
              display:inline;
        }
        li.price, li.num, li.g_o{
            margin-top: 10px;
        }
        .remark span{
              display:block;
              font-size:12px;
              width: 275px;
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
              border-top: 1px solid #F40;
        }
        li.img, li.remark{
              margin: 10px 5px;
        }
        li.img img{
              width: 129px;
              height: 107px;
              border: 0px solid #F40;
        }
        li.afocus a{
              height:30px;
              display:block;
              font-size:20px;
              font-weight:bold;
              color:#F40;
              margin: 10px 30px;
        }
        .o_p input{
              border:none; 
              background:#F40; 
              width: 50px; 
              height:30px; 
              font-size: 15px; 
              font-weight: bold; 
              display:block; 
              margin: 5px auto;
              color: #FFF;
        }
        li.t_m,li.n_m,li.p_m,li.num,li.row_total,li.o_p{
              margin-top: 40px;
        } 
        li.t_m{
          margin-left: 10px;
        }
        input.num-pallets-input{
              width: 40px;
              border: 0px solid #CCC;
        }
        input.f_h{
              width: 15px;
              border: none;
        }
        li.num{
              padding:0px;
              border: 1px solid #CCC;
              width: 70px; 
              margin-right: 30px;
        }
        li.num input{
              float: left;
        }
        
        input.j_suan{
         border:none;
         background:#F40;
         width: 60px;
         height:30px;
         font-size: 15px; 
         font-weight: bold; 
         padding-top: 5px; 
         display:block; 
         margin:5px auto;
         text-align: center;
         color:#FFF;
        }
        .head_chek{
          margin-left:10px;
          font-size: 12px;
          cursor: pointer;
        }
    </style>
   
   <script type="text/javascript">
   
	//购物车数量加减	
		$(function(){
		   var height = parseInt($(".main").css("height").replace("px", ""));
           if(height < 300) height = 300;//设置最小高度740
          if(window){
               window.parent.set_fheight("main", height + 20);
               window.parent.set_fheight("mpage", height + 20);
		   }else{
			   win.parent.set_fheight("main", height + 20);
			   win.parent.set_fheight("mpage", height + 20);
		   }
		   $(".num").each(function(){
		       $(this).children(".add").click(function(){
		           var num_obj = $(this).parent(".num");
		           var fid = $(this).parent(".num").children(".fid");
		           var num = $(this).parent(".num").children(".num-pallets-input");
		           num.val(parseInt(num.val())+1);
		           $.ajax({
				       type : "POST",
				       url : "car_addNum.action",
				       data : "fid=" + fid.val() + "&num=" + (parseInt(num.val())),
				       dataType : "text",
				       success : function(msg) {
					       var ms = msg.split(";");
					       num_obj.next().children().html(ms[1]);
					       $("#tm").html(ms[2]);
				       }
			       });
		       });
		       
		       $(this).children(".min").click(function(){
		           var num = $(this).parent(".num").children(".num-pallets-input");
		           var fid = $(this).parent(".num").children(".fid");
		           var num_obj = $(this).parent(".num");
		           num.val(parseInt(num.val())-1);
		           $.ajax({
				       type : "POST",
				       url : "car_addNum.action",
				       data : "fid=" + fid.val() + "&num=" + (parseInt(num.val())),
				       dataType : "text",
				       success : function(msg) {
				           if(msg == "-1"){
				              location.reload();//刷新本页面
				          }else{
				              var ms = msg.split(";");
					          num_obj.next().children().html(ms[1]);
					          $("#tm").html(ms[2]);
				          }
					       
				       }
			       });
		           
		       });
		   });
		   
		   $(".num-pallets-input").focus(function(){
		      $(this).select();
		   
		   });
		   
		   //全选
		   $(".head_chek").click(function(){
		       var checked = $(this).children("input").attr("checked");
		       $(this).children("input").attr("checked", !checked);
		       $(".t_m").each(function(){
		           $(this).children("input").attr("checked", !checked);
		       });
		   });
       });
       	   
      function changeNum(fid, event){
          var e = window.event || event;
          if(e.keyCode == 13){
              $("#text_box" + fid).blur();
              var money_reg=/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
              var num = $("#text_box" + fid).val();
              if(!money_reg.test(num)){
                  alert("请输入合法数量");
                  return false;
              }else{
                  $("#text_box" + fid).val(num + ".0");
                  $.ajax({
			  		  type : "POST",
			  		  url : "car_addNum.action",
			  		  data : "fid=" + fid + "&num=" + (parseInt($("#text_box" + fid).val())),
			  		  dataType : "text",
			  		  success : function(msg) {
				          if(msg == "-1"){
				              location.reload();//刷新本页面
				          }else{
				              var ms = msg.split(";");
				              $("#money" + ms[0]).html(ms[1]);
				              $("#tm").html(ms[2]);
				          }
			  		  }
                  });
              }
          }
      }
       
      //复选框选择 
     function cbox() 
      {
          var checkbox = document.getElementsByName("isBuy"); 
          var value="";    
          for(var i=0; i <checkbox.length;i++) 
          { 
            if(checkbox[i].checked)
            {
              value += checkbox[i].value +";";
            }         
          }
         var newSelect = value.substring(0, value.length - 1);
          if (newSelect.length > 0) 
            {
               document.getElementById("chkhidden").value = newSelect;     
            }else {
               alert("请选中一个商品，在进行结算!");
               return false;
            } 
         document.location.href="address_list.action?infoId="+value;   
      }
   
     
      //删除信息确认
      function delSure(infoId){
         var gnl=confirm("确认要删除该宝贝吗?");
         //var infoId = $("#infoid").val();
        // alert(infoId);
        if (gnl==true){
           $.ajax({
			  type : "POST",
			  url : "car_delInfoId.action",
			  data : "fid=" + infoId, 
			  dataType : "text",
		      success : function(msg){
			      if(msg == "-1")
			         location.reload();//刷新本页面
				   }
			});  
         }else{ 
            return false;
        }
      };

   </script> 
  </head>  
 <body> 
   <div class="main">
     <div>
       <div class="list_head" >             
           <ul style="font-weight: bold;">
             <li class="head_chek"><input type="checkbox" style="display:none;">全选</li>
             <li class="head_price"><p>商品名称</p></li>
             <li class="head_num"><p>图片</p></li>   
             <li class="head_t_m"><p>描述</p></li>
             <li class="head_g_oper"><p>单价</p></li>
             <li class="head_y_m"><p>数量</p></li>
             <li class="head_state"><p>金额</p></li>
             <li class="head_o_oper"><p>操作</p></li>
           </ul>
            <div style="clear: both;"></div>
         </div>
         <c:forEach items="${buygoods}" var="buygood" >  
              <div class="car_list">
                 <ul class="tr_body">
	                 <li class="t_m">
	                   <input id="chkhidden" name="isBuy"type="checkbox" value="${buygood.infoId}"/>
	                 </li>    
	                 <li class="n_m" >${buygood.good.goodName}</li> 
	                 <li class="img">
			             <a href="#">
			                 <!-- <img alt="" src="home_showImage.action?goodId=${buygood.good.goodId}"> -->
			                 <c:forEach items="${buygood.good.images}" var="image">
		                        <c:if test="${image.isDefault == 1}">
		                            <img alt="" src="${pageContext.request.contextPath}${image.imagePath}"/>
		                        </c:if>
		                    </c:forEach>
			             </a>
			         </li>
			         <li class="remark">
			             <span class="r">${buygood.good.specification}</span>
			             <span class="hv">${buygood.good.headValue}</span>
			         </li>
			         <c:forEach items="${buygood.good.prices}" var="price">
			             <c:if test="${price.grade.gradeId == user.grade.gradeId }">
			                <li class="p_m " id="price${buygood.infoId}" class="price-per-pallet"><span>${price.price}</span></li>
			             </c:if>
			         </c:forEach>
		             <li class="num">
		                 <input type="hidden" value="${buygood.infoId}" class="fid" id="infoid">
			             <input class="f_h min" type="button" value="-" />  
	                     <input class="num-pallets-input"  id="text_box${buygood.infoId}"  name="amount" type="text" value="${buygood.amount}" onkeyup="changeNum(${buygood.infoId});"/> 
	                     <input class="f_h add"  type="button" value="+" />      
			         </li>   
			         <li class="row_total">
			             <span class="money" id="money${buygood.infoId}">${buygood.money}</span>
			         </li>  
			         <li class="o_p"> 
			           <input type="button" value="移 除" onclick="delSure(${buygood.infoId});"/>
			         </li>
	             </ul>  
	          <div style="clear: both;"></div> 
              </div>
         </c:forEach><br/>     
         <div style="margin-left: 900px;">  
            <span style="font-weight: bold;">总 额:</span><span id="tm">${tmoney}</span>   
         </div><br/>
         <div style="margin-left: 830px;"> 
            <input class="j_suan" type="button" value="结   算" onclick="return cbox()"/>
         </div>         
       </div>
     </div>
 </body>
</html>
