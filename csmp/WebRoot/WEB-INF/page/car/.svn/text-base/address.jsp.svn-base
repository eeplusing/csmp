<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>我的购物车</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
   <style type="text/css">
   body{
       overflow: hidden;
       text-align: center;
   }
   
   #main{
    width: 1300px;
    margin: 0px auto;	
   }

   a{
       text-decoration:none;
   }
    
    input.ti_jiao{
     border:none; 
     background:#F40;
     width: 80px; 
     height:30px;  
     font-size: 15px; 
     font-weight: bold; 
     padding-top: 1px; 
     display:block; 
     margin: 5px auto;
     color: #FFF; 
    }
    div.h4{
     height: 20px;
     width: 500px;
     padding-top: 30px;
     padding-left: 0px;
    }
    
    h4.h4{
      height: 20px;
      width: 400px;
      padding-top: 30px;
      padding-left: 0px;
    }
    table.b_g{
       text-align:center;
       border-collapse: collapse;
       border: 0px solid #DDD;
       height:60px;
       width: 900px;
       font-size: 14px;
       margin: 0px auto;
     
    }   
    img{
        width: 129px;
        height: 107px;
        border: 0px solid #F40;
    } 
    div.shou_h{
       padding-top: 30px;  
    }
     .fullbg{
            background: #BFBFBF; 
            left: 0; 
            opacity: 0.5; /*CSS标准.该属性支持Firefox, Safari和 Opera.0.5表示透明度为50%*/
            position: absolute; 
            top: 0; 
            z-index: 3; 
            filter: alpha(opacity=50); /*透明度兼容IE6*/
            -moz-opacity: 0.5; /*透明度兼容老版本的Mozilla浏览器*/
            -khtml-opacity: 0.5; /*透明度兼容老版本的Safari浏览器*/
        }
        .dialog { 
	        background-color: #fff; 
	        border: 5px solid #999; 
	        width:800px;
	        height: 400px; 
	        left: 40%; 
	        margin: -200px 0 0 -200px; 
	        padding: 0px; 
	        position: fixed !important; /* 浮动对话框 */ 
	        position: absolute; 
	        top: 50%; 
	        z-index: 5; 
	        border-radius: 5px; 
	        display: none; 
	    }
	     .dialog { 
	        background-color: #fff; 
	        border: 5px solid #999; 
	        width:600px;
	        height: 300px; 
	        left: 40%; 
	        margin: -200px 0 0 -200px; 
	        padding: 0px; 
	        position: fixed !important; /* 浮动对话框 */ 
	        position: absolute; 
	        top: 50%; 
	        z-index: 5; 
	        border-radius: 5px; 
	        display: none; 
	    }
	    .dialog p.close {
	        margin: 0 0 12px; 
	        height: 24px;
	        line-height: 24px;
	        background: #CCC;
	        text-align: right;
	        padding-right: 10px;
        } 
        .dialog p.close a { 
	        color: #fff;
	        text-decoration: none;
        } 
        
        input.address{
        background:#ffffff;
         border-bottom-color:#ff6633; 
         border-bottom-width:1px;
         border-top-width:0px;
         border-left-width:0px;
         border-right-width:0px; 
         solid: #ff6633; 
         color: #000000;  
         FONT-SIZE: 9pt; 
         FONT-STYLE: normal; 
         FONT-VARIANT: normal; 
         FONT-WEIGHT: normal; 
         HEIGHT: 40px; 
         width:400px;
         LINE-HEIGHT: normal;
    
    }
    input.bian_ma{
         background:#ffffff;
         border-bottom-color:#ff6633; 
         border-bottom-width:1px;
         border-top-width:0px;
         border-left-width:0px;
         border-right-width:0px; 
         solid: #ff6633; 
         color: #000000; 
         FONT-SIZE: 9pt; 
         FONT-STYLE: normal; 
         FONT-VARIANT: normal; 
         FONT-WEIGHT: normal; 
         HEIGHT: 18px; 
         width:400px;
         LINE-HEIGHT: normal;
         
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
       label.ra{
          line-height: 150%;
          width: 900px;
          
        }
        label.ra:HOVER{
          background: #F40;
          display: block;
          width: 100%;
          color: #FFF;
        }
        label.ra_link{
            background: #F40;
            display: block;
            width: 100%;
            color: #FFF;
        }
         #footer {
         position:fixed;
         left:0px;
         bottom:0px;
         height:30px;
         width:100%;
         background:#FFCC99;
         }
   
   </style>
   <script type="text/javascript">
       $(function(){
           var height = parseInt($("#main").css("height").replace("px", ""));
           if(height < 300) height = 300;//设置最小高度740
          if(window){
               window.parent.set_fheight("main", height + 50);
               window.parent.set_fheight("mpage", height + 50);
		   }else{
			   win.parent.set_fheight("main", height + 50);
			   win.parent.set_fheight("mpage", height + 50);
		   }
       });
       function showBg() {
            var dh = document.body.scrollHeight;
            var bw = $("body").width();
            $("#fullbg").css({ 
                height:dh, 
                width:bw, 
                display:"block" 
            });
            $("#dialog").show();
        }
     
   
      //关闭灰色 jQuery 遮罩 
       function closeBg() { 
            $("#fullbg,#dialog").hide();
            $(".di_zhi input").each(function(){
                $(this).val("");
            });
            $("#addres").val("建议您如实填写详细收货地址");
            $("#bton").val("确   定");
        }
        
        function save(){
            var code_reg = /^[0-9]{6}$/;
            var addres = $("#addre").val().replace(/(^\s*)|(\s*$)/g, "");
            
             if (addres == '建议您如实填写详细收货地址') {
		 	    addres = "";
		      }
            var code = $("#code").val().replace(/(^\s*)|(\s*$)/g, "");
            var name = $("#name").val().replace(/(^\s*)|(\s*$)/g, "");
            var phone= $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");
            var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;//手机号码验证规则
           var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;   //座机验证规则
	         if(addres == ""){
	          alert("请输入收货地址");
	           $("#phone").focus();//输入框获得光标
	          return false;
	           }
	         if(!code_reg.test(code)){
	            alert("邮政编码吧不合法");
	             $("#phone").focus();//输入框获得光标
	           return false;
	          }
	          if(code==""){
	            alert("请输入邮政编码");
	             $("#phone").focus();//输入框获得光标
	           return false;
	          }
	         if(name==""){
	            alert("请输入收货人姓名");
	             $("#phone").focus();//输入框获得光标
	            return false;
	         }
	         if(phone==""){
	            alert("请输入收货人电话");
	             $("#phone").focus();//输入框获得光标
	            return false;
	         }
	        if(!isMobile.test(phone) && !isPhone.test(phone)){ 
        	  alert("请填写正确电话号码!");
        	  $("#phone").focus();//输入框获得光标
        	   return false;
         }  
	        $.ajax({
			    url:"address_add.action" ,
			    data: "address=" + addres + "&postCode=" + code + "&consigneName=" + name + "&consignePhone=" + phone,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				    closeBg();
				    location.reload();//刷新本页面
				}
			});
        }
        
        function buttion(){
            var radio = "";
            $(".rad_address").each(function(){
                if($(this).attr("checked") == true){
                    radio = $(this).val();
                }
            });
            if(null == radio || radio == ""){
                  alert("送货地址未选择");
                  return false;
            }
            var payInfo = $("#id").val();
            var infoId = $("#infoid").val();
	        $.ajax({
			    url:"order_add.action" ,
			    data: "payInfo=" + payInfo + "&adderssId=" + radio + "&infoId=" + infoId ,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    if(msg == "error"){
				        alert("订单生成失败");
				    }else{
				        document.location.href="order_info.action?orderId=" + msg;
				    }
				}
		    });
        }
        $(function(){
	        $(".ra").each(function(){
	             $(this).click(function(){
	                 $(".ra").each(function(){
	                     $(this).removeClass("ra_link");
	                 });
	                 $(this).addClass("ra_link");
	             });
	        });
        });
   </script>
  </head>
 <body>
  <div id="main" style="margin: 20px auto; padding: 0px; border-top: 20px solid #F40;">
      <table style="padding-top: 20px; width:100%;">
        <tr>
          <td align="left"><h4 class="h4" style="text-align: left;">请选择收货地址</h4></td>
          <td align="right"><a href="javascript:void(0);" onclick="CsmpJS.login('address_select',null,null);" style="text-align: right;">管理收货地址</a></td>
        </tr>
      </table>
      <hr>
      <table style="padding-top: 20px; width:100%; font-size: 14px;">
        <tr>
          <td>
            <c:forEach items="${addresss}" var="user">                    
             <label class="ra">            
               <input type="radio" class="rad_address" name="address" value="${user.addressId}" checked="checked"/>
                ${user.consigneName}  |   ${user.address}   |   ${user.consignePhone}   |  ${user.postCode}  <br/>
             </label>
            </c:forEach> 
          </td>
        </tr>
      </table>
     <table style="padding-top: 20px; width:100%;">
        <tr>
          <td align="right"><a href="javascript:void(0);" onclick="showBg();">使用新地址</a></td>
        </tr>
     </table>     
     <hr>      
      <div class="h4">
         <h3>确认订单信息</h3>
      </div>       
      <table class="b_g">
        <thead>
          <tr>
             <td></td>
             <td>商品名称</td>
             <td>单价</td>
             <td>数量</td>
             <td>价格</td>        
           </tr>
         </thead>        
         <tbody>
          <c:forEach items="${goods}" var="good">
              <tr>
                 <td>
                     <c:forEach items="${good.images}" var="image">
		                 <c:if test="${image.isDefault == 1}">
		                     <img alt="" src="${pageContext.request.contextPath}${image.imagePath}"/>
		                 </c:if>
		             </c:forEach>
                 </td>
                 <td style="height:41px;width:150px;">${good.goodName}</td>
                 <td style="height: 41px; width: 113px; ">${good.price }</td>
                 <td style="height: 41px; width: 113px;"id="amount">${good.amount}</td>
                 <td style="height: 41px; width: 113px;" id="money">${good.money}</td>
               </tr>
           </c:forEach>     
         </tbody>   
      </table>
        <input type="hidden" value=" ${payInfo}" id="id"/>
        <input type="hidden" value="${isBuy}" id="infoid"/>
       <div style="padding-left: 1000px;">
         <span style="font-weight: bold;">实付款:${tmoney}</span>      
       </div><br/>      
       <div style="padding-left: 730px;">
         <input type="button"  class="ti_jiao" value="提交订单"  onclick="buttion()">
       </div>      
       <div>
		  <div id="fullbg" class="fullbg"></div>
			 <div id="dialog" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>	
		      <div class="di_zhi" id="dialog_text">
		        <span style="margin-right:150px;"></span><p class="eva_title"> <h4>添加地址</h4></p> 
		        
                <span style="margin-left: 18px;"></span>收货地址 <font color='red'>*</font>
                <input id="addre" class="address" type="text" name="addre" value="${empty value ? '建议您如实填写详细收货地址':value}" onfocus="this.value='';" onblur="if(this.value==''){this.value='建议您如实填写详细收货地址'}"/><br/><br/>
                 
                <span style="margin-left: 18px;"></span>邮政编码 <font color='red'>*</font>
                   <input id="code" class="bian_ma" type="text" name="postCode" value=""><br/><br/>
                   
                 收货人姓名 <font color='red'>*</font>
                   <input id="name" class="bian_ma" type="text" name="consigneName" value=""><br/><br/>
                    
                 收货人电话 <font color='red'>*</font>
                   <input id="phone" class="bian_ma" type="text" name="consignePhone" value=""><br/><br/>
                   
                  <input class="bot" type="button" value="确   定" id="bton" onclick="save();">
		      </div>
		  </div>
		</div>

	</div>
   </body>
</html>
