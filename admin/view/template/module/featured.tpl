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
          <!--featured-->
          <tr>
            <td>Tab 1</td>
            <td><input type="text" name="product" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>

            <div id="featured-product" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($products as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="featured_product" value="<?php echo $featured_product; ?>" />
              <br /><input type="text" name="featured_text_product"  value="<?php echo $featured_text_product; ?>" size="90" />
              </td>
          </tr>
          
          <!--featured 1-->
          <tr>
            <td>Tab 2</td>
            <td><input type="text" name="product1" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="featured-product1" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($products1 as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="featured_product1" value="<?php echo $featured_product1; ?>" />
              <br /><input type="text" name="featured_text_product1"  value="<?php echo $featured_text_product1; ?>" size="90" />
              </td>
          </tr>
          
          <!--featured 2-->
          <tr>
            <td>Tab 3</td>
            <td><input type="text" name="product2" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="featured-product2" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($products2 as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="featured_product2" value="<?php echo $featured_product2; ?>" />
              <br /><input type="text" name="featured_text_product2"  value="<?php echo $featured_text_product2; ?>" size="90" />
              </td>
          </tr>
          
          <!--featured 3-->
          <tr>
            <td>Tab 4</td>
            <td><input type="text" name="product3" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="featured-product3" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($products3 as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="featured_product3" value="<?php echo $featured_product3; ?>" />
              <br /><input type="text" name="featured_text_product3"  value="<?php echo $featured_text_product3; ?>" size="90" />
              </td>
          </tr>
          
          <!--featured 4-->
          <tr>
            <td>Tab 5</td>
            <td><input type="text" name="product4" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="featured-product4" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($products4 as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="featured_product4" value="<?php echo $featured_product4; ?>" />
              <br /><input type="text" name="featured_text_product4"  value="<?php echo $featured_text_product4; ?>" size="90" />
              </td>
          </tr>
          
          <!--featured 5-->
          <tr>
            <td>Tab 6</td>
            <td><input type="text" name="product5" value="" size="90"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="featured-product5" class="scrollbox">
                <?php $class = 'odd'; ?>
                <?php foreach ($products5 as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" alt="" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="featured_product5" value="<?php echo $featured_product5; ?>" />
              <br /><input type="text" name="featured_text_product5"  value="<?php echo $featured_text_product5; ?>" size="90" />
              </td>
          </tr>
          <tr>
             <td></td>
             <td>
                 <input type="radio" name="featured_module[0][type]" value="0" <?php echo( isset($modules[0][type]) && $modules[0][type] == 0 ? 'checked="checked"' : '' );?> > Sắp xếp theo tour được chọn | <input type="radio" name="featured_module[0][type]" value="1" <?php echo( isset($modules[0][type]) && $modules[0][type] == 1 ? 'checked="checked"' : '' );?> > Sắp xếp theo tour mua nhiều
             </td>
          </tr>
        </table>
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_limit; ?></td>
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
              <td class="left"><input type="text" name="featured_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="1" /></td>
              <td class="left"><input type="text" name="featured_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
                <input type="text" name="featured_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
                <?php if (isset($error_image[$module_row])) { ?>
                <span class="error"><?php echo $error_image[$module_row]; ?></span>
                <?php } ?></td>
              <td class="left"><select name="featured_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="featured_module[<?php echo $module_row; ?>][position]">
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
                  
                </select></td>
              <td class="left"><select name="featured_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="featured_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<!--featured-->
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product' + ui.item.value).remove();
		
		$('#featured-product').append('<div id="featured-product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product div:odd').attr('class', 'odd');
		$('#featured-product div:even').attr('class', 'even');
		
		data = $.map($('#featured-product input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product div:odd').attr('class', 'odd');
	$('#featured-product div:even').attr('class', 'even');

	data = $.map($('#featured-product input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product\']').attr('value', data.join());	
});
//--></script> 
<!--featured-->
<script type="text/javascript"><!--
$('input[name=\'product1\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product1' + ui.item.value).remove();
		
		$('#featured-product1').append('<div id="featured-product1' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product1 div:odd').attr('class', 'odd');
		$('#featured-product1 div:even').attr('class', 'even');
		
		data = $.map($('#featured-product1 input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product1\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product1 div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product1 div:odd').attr('class', 'odd');
	$('#featured-product1 div:even').attr('class', 'even');

	data = $.map($('#featured-product1 input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product1\']').attr('value', data.join());	
});
//--></script> 
<!--featured 1-->
<script type="text/javascript"><!--
$('input[name=\'product2\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product2' + ui.item.value).remove();
		
		$('#featured-product2').append('<div id="featured-product2' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product2 div:odd').attr('class', 'odd');
		$('#featured-product2 div:even').attr('class', 'even');
		
		data = $.map($('#featured-product2 input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product2\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product2 div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product2 div:odd').attr('class', 'odd');
	$('#featured-product2 div:even').attr('class', 'even');

	data = $.map($('#featured-product2 input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product2\']').attr('value', data.join());	
});
//--></script> 
<!--featured 2-->
<script type="text/javascript"><!--
$('input[name=\'product2\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product2' + ui.item.value).remove();
		
		$('#featured-product2').append('<div id="featured-product2' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product2 div:odd').attr('class', 'odd');
		$('#featured-product2 div:even').attr('class', 'even');
		
		data = $.map($('#featured-product2 input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product2\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product2 div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product2 div:odd').attr('class', 'odd');
	$('#featured-product2 div:even').attr('class', 'even');

	data = $.map($('#featured-product2 input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product2\']').attr('value', data.join());	
});
//--></script> 
<!--featured 3-->
<script type="text/javascript"><!--
$('input[name=\'product3\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product3' + ui.item.value).remove();
		
		$('#featured-product3').append('<div id="featured-product3' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product3 div:odd').attr('class', 'odd');
		$('#featured-product3 div:even').attr('class', 'even');
		
		data = $.map($('#featured-product3 input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product3\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product3 div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product3 div:odd').attr('class', 'odd');
	$('#featured-product3 div:even').attr('class', 'even');

	data = $.map($('#featured-product3 input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product3\']').attr('value', data.join());	
});
//--></script> 
<!--featured 4-->
<script type="text/javascript"><!--
$('input[name=\'product4\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product4' + ui.item.value).remove();
		
		$('#featured-product4').append('<div id="featured-product4' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product4 div:odd').attr('class', 'odd');
		$('#featured-product4 div:even').attr('class', 'even');
		
		data = $.map($('#featured-product4 input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product4\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product4 div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product4 div:odd').attr('class', 'odd');
	$('#featured-product4 div:even').attr('class', 'even');

	data = $.map($('#featured-product4 input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product4\']').attr('value', data.join());	
});
//--></script> 
<!--featured 5-->
<script type="text/javascript"><!--
$('input[name=\'product5\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						model: item.model,
						name: item.name,
						label: item.model + ' - ' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product5' + ui.item.value).remove();
		
		$('#featured-product5').append('<div id="featured-product5' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product5 div:odd').attr('class', 'odd');
		$('#featured-product5 div:even').attr('class', 'even');
		
		data = $.map($('#featured-product5 input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product5\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product5 div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product5 div:odd').attr('class', 'odd');
	$('#featured-product5 div:even').attr('class', 'even');

	data = $.map($('#featured-product5 input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product5\']').attr('value', data.join());	
});
//--></script> 


<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="featured_module[' + module_row + '][limit]" value="5" size="1" /></td>';
	html += '    <td class="left"><input type="text" name="featured_module[' + module_row + '][image_width]" value="80" size="3" /> <input type="text" name="featured_module[' + module_row + '][image_height]" value="80" size="3" /></td>';	
	html += '    <td class="left"><select name="featured_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="featured_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="featured_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="featured_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>