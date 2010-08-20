function remove_fields(link) {  
    $(link).prev("input[type=hidden]").val("1");  
    $(link).closest(".fields").hide();  
}  
  
function add_fields(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().before(content.replace(regexp, new_id));  
	$(".to_be_hidden").hide();
}

function add_rows(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().parent().before(content.replace(regexp, new_id));  
	$(".to_be_hidden").hide();
}



$(function() {
		$(".hide_me").hide()
		$(".datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
		
		$("#tabs, #tabs2").tabs();
		$('.rat_date').live('focus', function() {
		  $(this).datepicker({dateFormat: 'yy-mm-dd'});
		});
		
		$(".to_be_hidden").hide();
		$('.trend_selector').live('click', function() {
		 	$(this).parent().parent().next("td").children().val($(this).attr("title"));
			$(this).siblings().removeClass("current")
			$(this).addClass("current");
		});
});