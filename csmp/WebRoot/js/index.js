$(function() {
	var can_open = true;
	$("li.h_show").hover(function() {
		if(can_open){
			$(".m_t", this).slideDown('fast');
			can_open = false;
		}else{
			return false;
		}
		setTimeout(function(){
			can_open = true;
		}, 1000);
		
	}, function() {
		$(".m_t", this).slideUp('fast');
	});
	
	$("li.m_li").hover(function() {
		$(this).addClass("hver");
	}, function() {
		$(this).removeClass("hver");
	});

	$("li.m_li").click(function() {
		$("li.m_li").each(function() {
			$(this).removeClass("cick");
		});
		$("li.fous").each(function() {
			$(this).removeClass("cick");
		});
		$(this).addClass("cick");
	});
	
	$("li.fous").click(function() {
		$("li.m_li").each(function() {
			$(this).removeClass("cick");
		});
		$(this).addClass("cick");
	});
});