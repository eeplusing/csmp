<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/form/jquery.form.js"></script>
	<style type="text/css">
		.img_global{
			width: 1180px;
			height: 540px;
			border:1px solid #DDD;
			
		}
		/***/
		.img_main {
			background: #F9F9F9;
			height: 28px;
			line-height: 28px;
			}
			
		.img_main li {
			float: left;
			display: block;
			cursor: pointer;
			width: 90px;
			text-align: center;
			color: #333; /*蓝色*/
			font-weight: bold;
			border: 0px solid #F00;/**开发暂时保留 */
			}
			
		.content{
			border:0px solid #F00;
			height:500px;
			width:1170px;
		}	
		
		#addImg{
			height:480px;
			width:100%;
		    display:none;
		    border: 0px solid #F00;
            margin: 0px;
            padding: 0px;
 		}
		
		.sonTitle{
			height:25px;
		   	width:80px;
		    background:#FC9;
		    border:none;
		    
		}
		
		#img_path li{
		   height:25px;
		   float: left;
		   background: #CCC;
		   margin: 5px 10px;
		}
		
		#img_path li span{
		   font-size:20px;
		}
		.close{
		   width:20px;
		   text-align:right;
		   float: right;
		   cursor: pointer;
		}
		
		.btnSave{
			height:25px;
		   	width:80px;
		    background:#FC9;
		    border:none;
		    margin-bottom: 5px;
		    margin-left:550px;
		}
		#form{
		    width: 100%;
		    height: 460px;
		}
		
		.file{
		    width:260px;
			margin-left:28px;
			margin-top:10px;
			border:1px solid #CCC;
		}
		
	</style>
	
	<script type="text/javascript">
	    var index = 1;
	    function s_close(sid){
	        var pid = "#image_path_" + sid.substring(sid.lastIndexOf("_") + 1);
	        $(pid).remove();
	        $("#" + sid).parent(".abc").remove();
	    }
		function addImg(){
			$("#addImg").css("display", "block");
			$("#scanImg").css("display", "none");
		}
		
	 	function add_img(){
	    	 if($("#image_path_" + index).val() != ""){
	            var files = $("#form input");
	            $("#form").html("<input type='file' name='uploadImage' value='' class='file' id='image_path_" + (++index) + "' onchange='add_img();'>");
	            for(var i = 0; i < files.length; i++){
	                $("#form").append(files[i]);
	            }
	         }
	     }
	    
	     function annex_close(oid){
		     document.getElementById(oid).innerHTML="";
		     document.getElementById(oid).style.display = "none";
	     }
	     //添加商品图片路径END
	   	
	   	 
		
		//设值默认图片
		function defaultImg(){
		    var ids = new Array();
		    var mids = "";
		    var index = 0;
	        $(":checkbox").each(function(){
	            if($(this).attr("checked") == true){
	                ids[index++] = $(this).val();
	            }
    	        mids += $(this).val() + ",";
	        });
	        
	        if(index == 0){
	            alert("请选择一个图片");
	            return false;
	        }else if(index > 1){
	            alert("你只能设值一个为默认图片");
	            return false;
	        }else{
	            $.ajax({
					type : "POST",
					url : "good_setImage.action",
					data : "defaultId=" + ids[--index] + "&mids=" + mids,
					dataType : "text",
					success : function(msg) {
					    if(msg == "ok"){
					        alert("操作成功");
					        location.reload();//刷新本页面
						    window.parent.location.reload();//刷新父页面
					    }else{
					        alert("操作失败");
					    }
					}
				});
	        }
		}
		
		//删除图片
		function delImg(){
		    var mids = "";
	        $(":checkbox").each(function(){
	            if($(this).attr("checked") == true){
	                mids += $(this).val() + ",";
	            }  
	        });
	        
	        if(mids.indexOf(",") > 0){
	            $.ajax({
					type : "POST",
					url : "good_delImage.action",
					data : "mids=" + mids,
					dataType : "text",
					success : function(msg) {
					    if(msg == "ok"){
					        alert("操作成功");
						     //location.reload();//刷新本页面
						     location.href="good_image.action?goodId="+${goodId};
					    }else{
					        alert("操作失败");
					    }
					}
				});
	        }else{
	        	return false;
	        }
		}
		
		
	</script>
  </head>
  <body>
  	<div class="img_global">
  		
  		<!--标题栏  -->
	    <div class="img_main">
			<ul>
			   <li><input id="one1" class="sonTitle" type="button"  value="添加图片" onclick="addImg();" ></li>
			   <li><input id="one2" class="sonTitle" type="button"  value="设为默认" onclick="defaultImg();" ></li>
			   <li><input id="one3" class="sonTitle" type="button"  value="删除图片" onclick="delImg();" ></li>
			</ul>
			<div style="clear: both;"></div>
	    </div>
	    
	    <!--添加图片 --> 
	    <div id="addImg" class="content">
	              <div>
	                  <form action="good_image_upload.action" method="post" enctype="multipart/form-data" id="form1">
	                       <div id="form">
   		                       <input type="file" class="file" name="uploadImage" id="image_path_1" value="" onchange="add_img();">
	                       </div>
	                       <input type="hidden" name="goodId" value="${goodId}"> 
	                       <input type="submit" class="btnSave" value="保 存" >
	                  </form>
	              </div>
				 <!-- 底部操作按钮 -->
				
				 
			     <div style="clear: both;"></div>
	    </div>
	    
	    <!--显示图片  -->
	    <div id="scanImg" class="content">
	    	<ul>
	    		<li>
	    		   <c:forEach items="${images}" var="image">
	    		        <div style="height:110px; width:110px; margin:10px; padding:5px;float:left; border:0px solid #F00;">
	    		            <ul>
	    		               <li>
	    		                   <!-- <img src="home_showImage.action?showPath=${image.imagePath}" style="width: 100px; height: 100px;"/> -->
	    		                   <img alt="" src="${pageContext.request.contextPath}${image.imagePath}" style="width: 100px; height: 100px;" />
	    		               </li>
	    		               <li>
	    		                   <input type="checkbox" value="${image.imageId}" style="margin-left:42px;margin-top:5px;">
	    		               </li>
	    		            </ul>
	    		        	<div style="clear: both;"></div>
	    		        </div>
	    		   </c:forEach>	
                </li>
	    	</ul>
	    </div>
    </div>
  </body>
</html>
