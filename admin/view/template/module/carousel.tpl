<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	<table class="form">
          <!--carousel-->
          <tr>
            <td>Product:</td>
            <td><input type="text" name="product" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
            <div id="carousel-product" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php $count = 1;?>
                <?php foreach ($products as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="carousel-product<?php echo $product['product_id']; ?>" class="carousel-product <?php echo $class; ?>">
                <label><b><?php echo $count;?>.</b></label>
                <input type="text" name="num" size="1" />
                <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?>  <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $count++;} ?>
              </div>
              <input type="hidden" name="carousel_product" value="<?php echo $carousel_product; ?>" />
              </td>
          </tr>
        </table>
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_banner; ?></td>
              <td class="left"><?php echo $entry_limit; ?></td>
              <td class="left"><?php echo $entry_scroll; ?></td>
              <td class="left"><?php echo $entry_image; ?></td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="carousel_module[<?php echo $module_row; ?>][banner_id]">
                  <?php foreach ($banners as $banner) { ?>
                  <?php if ($banner['banner_id'] == $module['banner_id']) { ?>
                  <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><input type="text" name="carousel_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="1" /></td>
              <td class="left"><input type="text" name="carousel_module[<?php echo $module_row; ?>][scroll]" value="<?php echo $module['scroll']; ?>" size="3" /></td>
              <td class="left"><input type="text" name="carousel_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
                <input type="text" name="carousel_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3" />
                <?php if (isset($error_image[$module_row])) { ?>
                <span class="error"><?php echo $error_image[$module_row]; ?></span>
                <?php } ?></td>
              <td class="left"><select name="carousel_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="carousel_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                <?php if ($module['position'] == 'footer_top') { ?>
                <option value="footer_top" selected="selected"><?php echo $text_footer_top; ?></option>
                <?php } else { ?>
                <option value="footer_top"><?php echo $text_footer_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'footer_bottom') { ?>
                <option value="footer_bottom" selected="selected"><?php echo $text_footer_bottom; ?></option>
                <?php } else { ?>
                <option value="footer_bottom"><?php echo $text_footer_bottom; ?></option>
                <?php } ?>
                </select></td>
              <td class="left"><select name="carousel_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="carousel_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="8"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<!--carousel-->
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model +' - '+ item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#carousel-product' + ui.item.value).remove();
		
		var row = $('.carousel-product').length + 1;
		
		$('#carousel-product').append('<div id="carousel-product' + ui.item.value + '"><label><b>'+ row +'.</b></label> <input type="text" name="num" size="1" /> <strong style="text-decoration:underline">'+ ui.item.model +'</strong> '+' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
		
		//$('#carousel-product').append('<div id="carousel-product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#carousel-product div:odd').attr('class', 'odd');
		$('#carousel-product div:even').attr('class', 'even');
		$('#carousel-product div').addClass("carousel-product");
		
		data = $.map($('#carousel-product input[type=\'hidden\']'), function(element){
			return $(element).attr('value');
		});				
		$('input[name=\'carousel_product\']').attr('value', data.join());		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#carousel-product div img').live('click', function() {
	$(this).parent().remove();
	
	$('#carousel-product div:odd').attr('class', 'odd');
	$('#carousel-product div:even').attr('class', 'even');
	$('#carousel-product div').addClass("carousel-product");

	data = $.map($('#carousel-product input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'carousel_product\']').attr('value', data.join());	
});

function num(){
	$('input[name=num]').on('blur', function(){
	  var pos = $(this).val() - 1;
		if (pos >= 0 && pos <= $("input[name=num]").length - 1) {
			if ($(this).parents('.carousel-product').index() > pos) {
				//move up
				$(this).parents('.carousel-product').insertBefore($("#carousel-product div:eq(" + pos + ")"));
			}
			if ($(this).parents('.carousel-product').index() < pos) {
				//move down
				$(this).parents('.carousel-product').insertAfter($("#carousel-product div:eq(" + pos + ")"));
			}
		}
		$("input[name=num]").val('');
		data = $.map($('#carousel-product input[type=hidden]'), function(element){
			return $(element).attr('value');
		});			
		$('input[name=\'carousel_product\']').attr('value', data.join());	
	})
}
num();
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="carousel_module[' + module_row + '][banner_id]">';
	<?php foreach ($banners as $banner) { ?>
	html += '      <option value="<?php echo $banner['banner_id']; ?>"><?php echo addslashes($banner['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';	
	html += '    <td class="left"><input type="text" name="carousel_module[' + module_row + '][limit]" value="5" size="1" /></td>';
	html += '    <td class="left"><input type="text" name="carousel_module[' + module_row + '][scroll]" value="3" size="1" /></td>';
	html += '    <td class="left"><input type="text" name="carousel_module[' + module_row + '][width]" value="80" size="3" /> <input type="text" name="carousel_module[' + module_row + '][height]" value="80" size="3" /></td>'; 
	html += '    <td class="left"><select name="carousel_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';	
	html += '    <td class="left"><select name="carousel_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="carousel_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="carousel_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>