$(document).ready(function() {
	//$('.date').datepicker({dateFormat: 'dd-mm-yy'});
});
function update_order_product(){
	//input
	$('#messagebox').show();
	var ID = $(".order_product_id_input").val();
	var model_input = $(".order_product_model_input");
	var name_input = $(".order_product_name_input");
	var quantity_input = $(".order_product_quantity_input");
	var price_input = $(".order_product_price_input");
	var total_input = $(".order_product_total_input");
	
	var price_input_text = $(".order_product_price_input_text");
	var total_input_text = $(".order_product_total_input_text");
	
	var start_time_input = $(".order_product_start_time_input");
	var meeting_input = $(".order_product_meeting_input");
	var included_input = $("#order_product_included_input");
	var notincluded_input = $("#order_product_notincluded_input");
	var terms_input = $("#order_product_terms_input");
	
	var checkbox_name_input = $(".order_product_order_option_checkbox_name_input");
	var checkbox_value_input = $(".order_product_order_option_checkbox_value_input");
	var date_name_input = $(".order_product_order_option_date_name_input");
	var date_value_input = $(".order_product_order_option_date_value_input");
	
	
	//total
	var name_total_text = $(".order_total_"+ID+"_name_text");
	var quantity_total_text = $(".order_total_"+ID+"_quantity_text");
	var price_total_text = $(".order_total_"+ID+"_price_text");
	var total_total_text = $(".order_total_"+ID+"_total_text");
	
	//data
	var model = $(".order_product_"+ID+"_model");
	var name = $(".order_product_"+ID+"_name");
	var quantity = $(".order_product_"+ID+"_quantity");
	var price = $(".order_product_"+ID+"_price");
	var total = $(".order_product_"+ID+"_total");
	
	var name_text = $(".order_product_"+ID+"_name_text");
	var quantity_text = $(".order_product_"+ID+"_quantity_text");
	var price_text = $(".order_product_"+ID+"_price_text");
	var total_text = $(".order_product_"+ID+"_total_text");
	
	var start_time = $(".order_product_"+ID+"_start_time");
	var meeting = $(".order_product_"+ID+"_meeting");
	var included = $(".order_product_"+ID+"_included");
	var notincluded = $(".order_product_"+ID+"_notincluded");
	var terms = $(".order_product_"+ID+"_terms");
	
	
	
	
	$(model).val($(model_input).val());
	$(name).val($(name_input).val());
	$(quantity).val($(quantity_input).val());
	$(price).val($(price_input).val());
	$(total).val($(total_input).val());
	
	$(start_time).val($(start_time_input).val());
	$(meeting).val($(meeting_input).val());
	
	$(included).html(CKEDITOR.instances.order_product_included_input.getData());
	$(notincluded).html(CKEDITOR.instances.order_product_notincluded_input.getData());
	$(terms).html(CKEDITOR.instances.order_product_terms_input.getData());
	
	$(name_text).text($(model_input).val()+' : '+$(name_input).val());
	$(quantity_text).text($(quantity_input).val());
	$(price_text).text($(price_input_text).text());
	$(total_text).text($(total_input_text).text());
	
	$(name_total_text).text($(model_input).val()+' : '+$(name_input).val());
	$(quantity_total_text).text($(quantity_input).val());
	$(price_total_text).text($(price_input_text).text());
	$(total_total_text).text($(total_input_text).text());
	
	update_total();
	$(".deposit").trigger('change');
	
	$("#product-row"+ID+" input[class*='type']").each(function(index, element) {
		if($(this).attr('value')=='checkbox')
		{
			name_text = $(this).prev().prev().prev().prev().prev().prev().prev();
			name_option = $(this).prev().prev();
			value_option = $(this).prev();
			$(name_text).text($(checkbox_name_input).val()+': '+$(checkbox_value_input).val());
			$(name_option).val($(checkbox_name_input).val());
			$(value_option).val($(checkbox_value_input).val());
		}
		if($(this).attr('value')=='date')
		{
			name_text = $(this).prev().prev().prev().prev().prev().prev().prev();
			name_option = $(this).prev().prev();
			value_option = $(this).prev();
			$(name_text).text($(date_name_input).val()+': '+$(date_value_input).val());
			$(name_option).val($(date_name_input).val());
			$(value_option).val($(date_value_input).val());
		}
		
    });
	
	$('#colorpop').hide();
	$('.addproduct').show();
	$('#messagebox').show();
	$('#form').submit();
}
function update_order(e){
	$('.addproduct').hide();
	$('#colorpop').show();
	var ID=$(e).parent().parent().attr('data-id');
	
	//data
	var model = $(".order_product_"+ID+"_model");
	var name = $(".order_product_"+ID+"_name");
	var quantity = $(".order_product_"+ID+"_quantity");
	var price = $(".order_product_"+ID+"_price");
	var total = $(".order_product_"+ID+"_total");
	
	var price_text = $(".order_product_"+ID+"_price_text");
	var total_text = $(".order_product_"+ID+"_total_text");
	
	var start_time = $(".order_product_"+ID+"_start_time");
	var meeting = $(".order_product_"+ID+"_meeting");
	var included = $(".order_product_"+ID+"_included");
	var notincluded = $(".order_product_"+ID+"_notincluded");
	var terms = $(".order_product_"+ID+"_terms");
	
	//input
	var id_input = $(".order_product_id_input");
	var model_input = $(".order_product_model_input");
	var name_input = $(".order_product_name_input");
	var quantity_input = $(".order_product_quantity_input");
	var price_input = $(".order_product_price_input");
	var total_input = $(".order_product_total_input");
	
	var price_input_text = $(".order_product_price_input_text");
	var total_input_text = $(".order_product_total_input_text");
	
	var start_time_input = $(".order_product_start_time_input");
	var meeting_input = $(".order_product_meeting_input");
	var included_input = $("#order_product_included_input");
	var notincluded_input = $("#order_product_notincluded_input");
	var terms_input = $("#order_product_terms_input");
	
	$(id_input).val(ID);
	$(model_input).val($(model).val());
	$(name_input).val($(name).val());
	$(quantity_input).val($(quantity).val());
	$(price_input).val(parseInt($(price).val()));
	$(total_input).val(parseInt($(total).val()));
	$(price_input_text).text($(price_text).text());
	$(total_input_text).text($(total_text).text());
	
	
	$(quantity_input).bind('change keyup', function() {
		var s = $(price_input).val();
		var q = $(this).val();
		$(total_input).val(s*q);
		$(total_input).trigger('change');
	});
	$(price_input).bind('change keyup', function() {
		var s = $(this).val();
		var q = $(quantity_input).val();
		$(this).next().text(showNumber(s)+'₫');
		$(total_input).val(s*q);
		$(total_input).trigger('change');
	});
	$(total_input).bind('change keyup', function() {
		var s = $(this).val();
		$(this).next().text(showNumber(s)+'₫');
	});
	
	$(start_time_input).val($(start_time).val());
	$(meeting_input).val($(meeting).val());
	$(included_input).html($(included).html());
	$(notincluded_input).html($(notincluded).html());
	$(terms_input).html($(terms).html());
	
	CKEDITOR.instances.order_product_included_input.setData($(included).val());
	CKEDITOR.instances.order_product_notincluded_input.setData($(notincluded).val());
	CKEDITOR.instances.order_product_terms_input.setData($(terms).val());
	
	$("#product-row"+ID+" input[class*='type']").each(function(index, element) {
		if($(this).attr('value')=='checkbox')
		{
			name_option = $(this).prev().prev();
			value_option = $(this).prev();
			$('.order_product_order_option_checkbox_name_input').val($(name_option).val());
			$('.order_product_order_option_checkbox_value_input').val($(value_option).val());
		}
		if($(this).attr('value')=='date')
		{
			name_option = $(this).prev().prev();
			value_option = $(this).prev();
			$('.order_product_order_option_date_name_input').val($(name_option).val());
			$('.order_product_order_option_date_value_input').val($(value_option).val());
		}
		
    });
		
}
function update_total(){
	var tt_total = $('.order_total_1');
	var total_total = $('.order_total_9');
	var tt_total_text = $('.order_total_1_text');
	var total_total_text = $('.order_total_9_text');
	var tt_total_text_text = $('.order_total_1_text_text');
	var total_total_text_text = $('.order_total_9_text_text');
	
	//
	var sub_total = sub_person = sub_child = 0;
	var sub_person_total = $('.order_total_7');
	var sub_child_total = $('.order_total_8');
	if(sub_person_total.val()){
		sub_person = parseInt(sub_person_total.val());
	}
	if(sub_child_total.val()){
		sub_child = parseInt(sub_child_total.val());
	}
	sub_total = sub_person + sub_child;
	//console.log(sub_person,sub_child);
	var product_tt = 0;
	$("input[id^='order_product_total']").each(function(index, element) {
		product_tt = parseInt(product_tt + parseInt($(element).val()));
    });
	//console.log(product_tt);
	//console.log(product_tt+ sub_total);
	var product_tt_str = product_tt.toString();
	var product_tt_str_t = (product_tt - sub_total).toString();
	
	$(tt_total).val(product_tt);
	$(total_total).val(product_tt - sub_total);
	$(tt_total_text).val(showNumber(product_tt_str)+'₫');
	$(total_total_text).val(showNumber(product_tt_str_t)+'₫');
	$(tt_total_text_text).text(showNumber(product_tt_str)+'₫');
	$(total_total_text_text).text(showNumber(product_tt_str_t)+'₫');
}
function update_total_row(e){
	e.hide();
	e.next().show();
	var ID=$(e).parent().parent().parent().attr('data-id');
	var text = $(".order_total_"+ID+"_text_text");
	var input = $(".order_total_"+ID+"_text_input");
	text.hide();
	input.show();
}
function update_total_row_up(e){
	var ID=$(e).parent().parent().parent().attr('data-id');
	var text = $(".order_total_"+ID+"_text_text");
	var input = $(".order_total_"+ID+"_text_input");
	
	var text_t = $(".order_total_"+ID+"_text");
	var input_t = $(".order_total_"+ID);
	
	text.show();
	input.hide();
	
	//
	text.text('-'+showNumber(input.val())+'₫');
	input_t.val(input.val());
	text_t.val('-'+showNumber(input.val())+'₫');
	
	e.prev().show();
	e.hide();
	update_total();
	$('#messagebox').show();
	$('#form').submit();
}