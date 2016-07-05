$(function() {
	var height = parseInt($("#footer").css("height").replace("px", ""));
    if(window){
          window.parent.set_fheight("footer", height + 10);
          window.parent.set_fheight("fpage", height + 10);
    }else{
          win.parent.set_fheight("footer", height + 10);
          win.parent.set_fheight("fpage", height + 10);
    }
    
    var u_w = 0;
    $(".f_u li").each(function(){
    	u_w += $(this).css("width").replace("px", "")*1 + 5;
    });
    $("ul.f_u").css("width", u_w).css("margin-left", (1350-u_w)*0.5);
});