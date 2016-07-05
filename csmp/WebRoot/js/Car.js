
var j=0,i=-1,k=-1,len=$("#trMaster td").size();//数据和模板的td 都可以自定义，格式正确即可

$.each(product,function(index,prod){

    i++;

    k++;

    if(i%len==0){

        j++;

         CloneTR(j);//根据模板来克隆行

    }

    if(k==len)

        k=0;

    setTD(j,k,prod.prodId,prod.prodName,prod.price,prod.description);//给克隆行的td 赋值

});

//根据模板来克隆行

function CloneTR(id){

    $("#trMaster").clone(true).css("display","block").attr("id","tr"+id).appendTo("#tblProduct");

    $("#tr"+id+" td span").empty();

}

//给克隆行的td 赋值

function setTD(trId,index,prodId,prodName,price,description){

    var tr=$("#tr"+trId);           

    $(tr).find("td:eq("+index+")").find("span:eq(0)").html(prodId);

    $(tr).find("td:eq("+index+")").find("span:eq(1)").html(prodName);

    $(tr).find("td:eq("+index+")").find("span:eq(2)").html(price);   

    $(tr).find("td:eq("+index+")").find("span:eq(3)").html(description);   

}

var tempId="";

var num=0;

//点击buy

$("input[name='btnBuy']").click(function(){

var elem=$(this).parent().parent();//获取点击的button 的td

    var prodId=$(elem).find("span:eq(0)").html();

    var prodName=$(elem).find("span:eq(1)").html();

    var price=$(elem).find("span:eq(2)").html();

    var description=$(elem).find("span:eq(3)").html();

    if(prodId==""||prodId==null||prodId==undefined){

        alert("请点击其他产品");

    }else{       

        if(tempId.indexOf(prodId)!=-1){

            if(confirm('已存在，确定数量+1 吗?')){

                $("#tblOrder tr:gt(1)").each(function(){

                    if($(this).find("td:eq(1)").html()==prodId){

                        var num=$(this).find("td:eq(4)").find("input[name='txtNum']").attr("value");                   

                        $(this).find("td:eq(4)").find("input[name='txtNum']").attr("value",+num+1);//相当于parseInt(num)+1;

                    }

                });

            }

        }else{

            num++;

            CloneOrder(num,prodId,prodName,price,description);

        }

        tempId+=prodId+",";   

        $("#tdTotal").html("<font color='#FF0000' size='+1' face='Arial, Helvetica, sans-serif'>"+GetTotalPrice().toFixed(2)+"</font>");

    }

});

//根据订单模板来clone 订单

function CloneOrder(id,prodId,prodName,price,description){

    $("#orderMarter").clone(true).css("display","block").attr("id","tro"+id).appendTo("#tblOrder");

    var tr=$("#tro"+id);   

    $(tr).find("td:eq(0)").html(num);

    $(tr).find("td:eq(1)").html(prodId);

    $(tr).find("td:eq(2)").html(prodName);

    $(tr).find("td:eq(3)").html(description);   

    $(tr).find("td:eq(4)").find("input[name='txtNum']").attr("value","1");

    $(tr).find("td:eq(5)").html(price);

    $(tr).find("td:eq(6)").html("<font color='red'>"+price+"</font>");

}

//获取总共价格

function GetTotalPrice(){

    var totalNum=0;

    $("#tblOrder tr:gt(1)").each(function(){

            var value=parseFloat($(this).find("td:eq(6)").text());           

            totalNum+=value;

    });

    return totalNum;

}

$(function(){

    $("#tblOrder input[name='txtNum']").bind("propertychange change blur",function(){

        var value=$(this).val();

        var tr=$(this).parent().parent();

        if(value==0){

            if(confirm('确定要删除该商品吗?')){

            var prodId=$(tr).find("td:eq(1)").html();               

                tempId=tempId.replace(prodId+",","");

                $(tr).remove();

            }

        }else{

            var price=$(tr).find("td:eq(5)").html();

            var total=value*price;

            $(tr).find("td:eq(6)").html("<font color='red'>"+total.toFixed(2)+"</font>");       

            $("#tdTotal").html("<font color='#FF0000' size='+1' face='Arial, Helvetica, sans-serif'>"+GetTotalPrice().toFixed(2)+"</font>");

        }

    });

    //加1

    $("#tblOrder input[name='btnAdd']").click(function(){

        var txtBox=$(this).parent().parent().find("td:eq(4)").find("input[name='txtNum']");

        var value=$(txtBox).attr("value");

            value=+value+1;

            $(txtBox).attr("value",value)

       

    });

    //减1

    $("#tblOrder input[name='btnCut']").click(function(){

        var txtBox=$(this).parent().parent().find("td:eq(4)").find("input[name='txtNum']");       

        var tr=$(this).parent().parent();

        var value=$(txtBox).attr("value");

        if(value>1){

            value=+value-1;

            $(txtBox).attr("value",value)

        }else{

            if(confirm('确定要删除该商品吗?')){

                var prodId=$(tr).find("td:eq(1)").html();               

                tempId=tempId.replace(prodId+",","");               

                $(tr).remove();

                $("#tdTotal").html("<font color='#FF0000' size='+1' face='Arial, Helvetica, sans-serif'>"+GetTotalPrice().toFixed(2)+"</font>");

            }

        }

    });

   

    //删除btnRemove

    $("#tblOrder input[name='btnRemove']").click(function(){

        var tr=$(this).parent().parent();

        if(confirm('确定要删除该商品吗?')){

        var prodId=$(tr).find("td:eq(1)").html();   

        tempId=tempId.replace(prodId+",","");

                $(tr).remove();

                $("#tdTotal").html("<font color='#FF0000' size='+1' face='Arial, Helvetica, sans-serif'>"+GetTotalPrice().toFixed(2)+"</font>");

        }

    });

});

 