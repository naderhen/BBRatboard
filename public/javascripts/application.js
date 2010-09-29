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
		
		
		
		$('.sale_handle').toggle(function() {
		  	var me = $(this);
			var my_row = $(this).closest(".ratgrade_row");
			var ratgrade_id = $(this).attr("data-ratgrade_id");
			var ratgrade_name = $(this).attr("data-ratgrade_name");
			var warehouse_name = $(this).attr("data-warehouse_name");
			var warehouse_id = $(this).attr("data-warehouse_id");
			var board_id = $(this).attr("data-board_id");
			
			$("#rightmenu h3").text("Sale of "+ratgrade_name+" out of "+warehouse_name);
			$("#sale_ratgrade_id").val(ratgrade_id);
			$("#sale_ratgrade_name").val(ratgrade_name);
			$("#sale_warehouse_id").val(warehouse_id);
			
			my_row.siblings().fadeTo('slow', .1);
			
			return false;
		}, function() {
		  	$(".ratgrade_row").fadeTo('fast', 1);
			$("#rightmenu h3").text("Quick Sale");
			$("#sale_ratgrade_id").val("");
			$("#sale_ratgrade_name").val("");
			$("#sale_warehouse_id").val("");
		});
		
		
		


		
		
		
});





