<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    
    <title></title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
  <style type="text/css">
   
    a{
       text-decoration:none;
      }
      
    input.a_d{
      border:none; 
      background:#FC9; 
      width: 60px; 
      height:30px; 
      text-align: center; 
      font-size: 15px; 
      font-weight: bold; 
      padding-top: 1px; 
      display:block; 
      margin: 5px auto;
    }
     div.h4{
      text-align:center;
      padding-top: 50px;
      padding-right:150px; 
    }
    div.di_zhi{
      text-align: center;
    }
    input.address{
      width: 400px;
      height: 67px;
      text-align: center;
    }
    input.bian_ma{
       width: 80px;
      height: 25px;
      padding-right:400px;
    }
    
    table.b_dan{
      height: 100px; 
      width: 753px; 
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
         HEIGHT: 30px; 
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
         HEIGHT: 20px; 
         width:400px;
         LINE-HEIGHT: normal;  
      }
    
     input.name{
         background: #ffffff;
         border-bottom-color: #ff6633;
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
         HEIGHT: 20px; 
         width:414px;
         LINE-HEIGHT: normal;
     }
    
     input.bot{
         border:none;
         background:#FC9;
         width: 60px;
         height:30px;
         font-size: 15px; 
         font-weight: bold; 
         padding-top: 10px; 
         display:block; 
         margin: 5px auto;

        }
      
 </style>

  <script type="text/javascript">
  
    //删除信息确认
      function delSure(addre){
       
         var gnl=confirm("确定删除该地址?");
        
         alert(addre);
        if (gnl==true){
           
           $.ajax({
			  type : "POST",
			  url : "address_delect.action",
			  data : "addressId=" + addre, 
			  dataType : "text",
		      success : function(msg) {
			   // alert(msg);
			   if(msg=="-1"){
			    alert("删除成功")
			     location.reload();//刷新本页面
			    } 
		      }
			}); 
        
        }else{
           return false;
        }
      };
   
       //修改地址
    
			function upAddres(addresId,addres ,code,name,phone) {
			
				$.ajax({
					url : "address_updateAddress.action",
					data : "addresId=" + addresId + "&address=" + addres + "&postCode=" + code + "&consigneName=" + name + "&consignePhone=" + phone,
					type : "post",
					cache : false,
					dataType : "text",
					success : function(msg) {
					  if(msg=="-1"){
					  alert("修改成功")
						location.reload();//刷新本页面
					  }	
					}
				});
			}

			//添加地址
			function save() {

				var code_reg = /^[0-9]{6}$/;
				var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;//手机号码验证规则
				var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;   //座机验证规则
				var addres = $("#addres").val().replace(/(^\s*)|(\s*$)/g, "");
				var code = $("#code").val().replace(/(^\s*)|(\s*$)/g, "");
				var name = $("#name").val().replace(/(^\s*)|(\s*$)/g, "");
				var phone = $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");

				if (addres == "") {
					alert("地址不能为空");
					return false;
				}
				if (!code_reg.test(code)) {
					alert("邮政编码不合法");
					return false;
				}
				if (code == "") {
					alert("邮政编码不能为空");
					return false;
				}
				if (name == "") {
					alert("收货人姓名不能为空");
					return false;
				}
				if (phone == "") {
					alert("收货人电话不能为空");
					return false;
				}
				if(!isMobile.test(phone)&& !isPhone.test(phone)){ //如果用户输入的值不同时满足手机号和座机号的正则
        	       alert("请填写正确电话号码!");//就弹出提示信息
        	       $("#phone").focus();//输入框获得光标
        	       return false;
                 }  
				$.ajax({
					url : "address_add.action",
					data : "address=" + addres + "&postCode=" + code
							+ "&consigneName=" + name + "&consignePhone="
							+ phone,
					type : "post",
					cache : false,
					dataType : "text",
					success : function(msg) {				
						location.reload();//刷新本页面
					}
				});
			}
		</script>
  </head>
  
 <body>
 <form action="address_add.action" method="post" >
 
   <div class="h4"> 
     <h4><font color="red">新增收货地址</font>&nbsp;&nbsp;&nbsp;&nbsp; 注意：以下带<font color='red'>*</font>都是必填项</span></h4><br/>
  </div>   
       <div class="di_zhi">
     
             收货地址 <font color='red'>*</font>
                  <input id="addres" class="address" type="text"  name="address" value="${addres.address}" ><br/><br/>
                  
             邮政编码 <font color='red'>*</font>
                   <input id="code" class="bian_ma" type="text" name="postCode" value="${addres.postCode}"><br/><br/>
                   
             收货人姓名 <font color='red'>*</font>
                   <input id="name" class="name" type="text" name="consigneName" value="${addres.consigneName}"><br/><br/>
                   
             收货人电话 <font color='red'>*</font>
                   <input id="phone" class="name" type="text" name="consignePhone" value="${addres.consignePhone}"><br/><br/>      
         </div>      
      <input class="a_d" type="button" value="保 存" onclick ="save();"/>
  </form>
  
   <table align="center" class="b_dan">
     <thead>
      <tr style="background:#FFCC99; margin: auto; height: 100px;width: 753px; margin-left: 600px; text-align: center;">
        <td>收货人</td>
        <td>详细地址</td>
        <td>邮编</td>
        <td>电话/手机</td>
        <td>操作</td>
      </tr>
     </thead>
     <tbody>      
     <c:forEach items="${address}" var="addre">
       <div class="num"><input type="hidden" value="${addre.addressId}" class="addressId" ></div>
          <tr>
            <td>${addre.consigneName }</td>
            <td>${addre.address }</td>
            <td>${addre.postCode}</td>
            <td>${addre.consignePhone }</td>
            <td>
             <a href="javascript:void(0);" onclick="upAddres('${addre.addressId};${addre.consigneName };${addre.address };${addre.postCode};${addre.consignePhone }')">修改</a> |
             <a href="javascript:void(0);" onclick="delSure('${addre.addressId}')">删除</a></td>
          </tr>        
      </c:forEach>
     </tbody>
    </table>
   </body>
</html>
