<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    
    <style type="text/css">
        body{
           overflow: hidden;
        }
        #all{
            width:100%;
        }
        table.add_tab{
            border-collapse: collapse;
            margin: 20px auto;
        }
        tr.bas_clo{
            height: 40px;
        }
        tr.hig_clo{
            height: 160px;
        }
        
        td.td_txt{
            width: 90px;
            text-align: right;
            padding-right:10px;
            font-size: 14px;
        }
        
        td.td_val{
            width: 220px;
        }
        
        td input{
            width: 200px;
            height: 23px;
            margin: 1px auto;
        }
        
        td select{
            width: 200px;
            height: 23px;
            margin: 1px auto;
        }
        
        td textarea{
            font-size: 18px;
            color: #113965;
		    height: 150px;
		    width: 945px;
		    border: 1px solid #ddd;
        }
        
        .sub{
            display: block;
			height: 30px;
			width: 80px;
			margin: 0px auto;
			border: none; 
			font-size: 14px;
			font-weight: bold;
			color: #FFF;
			background: #FF5700;
		}
    </style>
    
    <script type="text/javascript">
        $(function() {
            var height = document.body.scrollHeight;
            if(height < 740) height = 740;//设置最小高度740
            if(window) {
                window.parent.setframe_height(height);
                window.top.setframe_height(height + 100);
            } else {
                win.parent.setframe_height(height);
                win.top.setframe_height(height + 100);
            }
        });
        
        function goodAdd() {
             var goodName = $("#goodName").val().replace(/(^\s*)|(\s*$)/g, "");
             var calorificValue = $("#calorificValue").val().replace(/(^\s*)|(\s*$)/g, "");
             var pn0 = $("#price_name0").val().replace(/(^\s*)|(\s*$)/g, "");
             var pv0 = $("#price_val0").val().replace(/(^\s*)|(\s*$)/g, "");
             var pn1 = $("#price_name1").val().replace(/(^\s*)|(\s*$)/g, "");
             var pv1 = $("#price_val1").val().replace(/(^\s*)|(\s*$)/g, "");
             var pn2 = $("#price_name2").val().replace(/(^\s*)|(\s*$)/g, "");
             var pv2 = $("#price_val2").val().replace(/(^\s*)|(\s*$)/g, "");
             var pn3 = $("#price_name3").val().replace(/(^\s*)|(\s*$)/g, "");
             var pv3 = $("#price_val3").val().replace(/(^\s*)|(\s*$)/g, "");
             var money_reg = /^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
             var reg = /^[1-9]{1,}[0-9]{0,}$/;
             if(goodName == "") {
             	 alert("商品名称不能为空！");
             	 return false;
             }
             if(calorificValue == "") {
             	 alert("热值不能为空！");
             	 return false;
             }
             
             if(!reg.test(calorificValue)) {
                 alert("热值只能为正整数");
                 return false;
             }
             
             if(pn0 == pn1 || pn0 == pn2 || pn0 == pn3 || pn1 == pn2 || pn1 == pn3 || pn2 == pn3) {
                 alert("价格名称不能重复");
                 return false;
             }
             
             if(!money_reg.test(pv0) || !money_reg.test(pv1) || !money_reg.test(pv2) || !money_reg.test(pv3)) {
                 alert("价格格式错误");
                 return false;
             }
        
             $("#specification").val($("#specification").val().replace(/%/g, "...0..."));
             $("#headValue").val($("#headValue").val().replace(/%/g, "...0..."));
             $("#goodOrigin").val($("#goodOrigin").val().replace(/%/g, "...0..."));
             $("#goodOrigin").val($("#goodVendor").val().replace(/%/g, "...0..."));
             document.forms[0].submit();
        }
    </script>
  </head>
  
  <body>
      <div id="all">
          <font style="color: #F00;">${add_msg}</font>
          <form action="good_add.action" method="post" enctype="multipart/form-data">
              <table class="add_tab">
                  <tr class="bas_clo">
                      <td class="td_txt">商品类别:</td>
                      <td class="td_val">
                          <select name="c_type">
                              <c:forEach items="${types}" var="t">
                                  <option value="${t.typeId}">${t.typeName}</option>
                              </c:forEach>
                          </select>
                      </td>
                      <td class="td_txt">商品产地:</td>
                      <td class="td_val"><input type="text" name="c_goodOrigin" id="goodOrigin" value=""></td>
                      <td class="td_txt">供应商:</td>
                      <td class="td_val"><input type="text" name="c_goodVendor" id="goodVendor" value=""></td>
                  </tr>
                  <tr class="bas_clo">
                      <td class="td_txt">商品名称:</td>
                      <td><input type="text" name="c_goodName" id="goodName" value=""></td>
                      <td class="td_txt">行业属性:</td>
                      <td>
                          <select name="c_busyType">
							  <option value="0">工业</option>
							  <option value="1">民用</option>
						  </select>
                      </td>
                      <td class="td_txt">热值:</td>
                      <td><input type="text" name="c_calorificValue" id="calorificValue" value=""></td>
                  </tr>
                  <tr class="bas_clo">
                      <td class="td_txt">一类价格名:</td>
                      <td><input type="text" name="price_name1" id="price_name1"  value=""></td>
                      <td class="td_txt">一类价格值:</td>
                      <td><input type="text" name="price_val1" id="price_val1"  value=""></td>
                      <td></td><td></td>
                  </tr>
                  <tr class="bas_clo">
                      <td class="td_txt">二类价格名:</td>
                      <td><input type="text" name="price_name2" id="price_name2" value=""></td>
                      <td class="td_txt">二类价格值:</td>
                      <td><input type="text" name="price_val2" id="price_val2" value=""></td>
                      <td></td><td></td>
                  </tr>
                  <tr class="bas_clo">
                      <td class="td_txt">三类价格名:</td>
                      <td><input type="text" name="price_name3" id="price_name3" value=""></td>
                      <td class="td_txt">三类价格值:</td>
                      <td><input type="text" name="price_val3" id="price_val3" value=""></td>
                      <td></td><td></td>
                  </tr>
                  <tr class="bas_clo">
                      <td class="td_txt">默认价格名:</td>
                      <td><input type="text" name="price_name0" id="price_name0" value=""></td>
                      <td class="td_txt">默认价格值:</td>
                      <td><input type="text" name="price_val0" id="price_val0" value=""></td>
                      <td></td><td></td>
                  </tr>
                  <tr class="bas_clo">
                      <td class="td_txt">默认图片:</td>
                      <td><input type="file" name="uploadImage"></td>
                      <td class="td_txt">图片二:</td>
                      <td><input type="file" name="uploadImage"></td>
                      <td class="td_txt">图片三:</td>
                      <td><input type="file" name="uploadImage"></td>
                  </tr>
                  
                  <tr class="hig_clo">
                      <td class="td_txt">商品描述:</td>
                      <td colspan="5"><textarea name="c_specification" id="specification"></textarea></td>
                  </tr>
                  <tr class="hig_clo">
                      <td class="td_txt">商品参数:</td>
                      <td colspan="5"><textarea name="c_headValue" id="headValue"></textarea></td>
                  </tr>
              </table>
              <input class="sub" type="button" value="确认发布" onclick="goodAdd()"/>
          </form>
      </div>
  </body>
</html>
