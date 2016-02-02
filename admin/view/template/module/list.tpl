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
      <div id="tabs" class="htabs"><a href="#tab-tour">Danh sách tour</a><a href="#tab-config">Cấu hình</a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	<div id="tab-tour">
        
        <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          <table class="form">
            <tr>
              <td>Tiêu đề:</td>
              <td><input type="text" name="list_product[<?php echo $module_row; ?>][title]" value="<?php echo $module['title']; ?>" size="100" />
                <?php if (isset($error_title[$module_row])) { ?>
                	<span class="error"><?php echo $error_title[$module_row]; ?></span>
                <?php } ?>
              </td>
            </tr>
            <tr>
              <td>Danh sách tour:</td>
              <td><input type="text" name="list_product[<?php echo $module_row; ?>][product]" size="100" class="product" id="product_<?php echo $module_row; ?>" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="list-product-<?php echo $module_row; ?>" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cn = 1;?>
                <?php foreach ($list_product_box[$module_row] as $k=>$product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="list-product-<?php echo $module_row; ?>-<?php echo $product['product_id']; ?>" class="list-row-<?php echo $module_row; ?> <?php echo $class; ?>">
                  <label><b><?php echo $cn;?>.</b></label>
                  <input type="text" name="list-<?php echo $module_row; ?>" class="list-input" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cn++;} ?>
              </div>
              <input type="hidden" name="list_product[<?php echo $module_row; ?>][list_product]" value="<?php echo $module['list_product']; ?>" /></td>
            </tr>
          </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
        
        </div>
        <div id="tab-config">
        	<table class="form">
                <tr>
                    <td>Title:</td>
                    <td><input type="text" name="banggia[customtitle]" value="<?php echo $banggia['customtitle']; ?>" size="100" /></td>
                  </tr>
                  <tr>
                    <td>Name:</td>
                    <td><input type="text" name="banggia[title]" value="<?php echo $banggia['title']; ?>" size="100"/></td>
                  </tr>
                  <tr>
                    <td>Meta Keyword:</td>
                    <td><textarea name="banggia[metakey]" cols="80" rows="5"><?php echo $banggia['metakey']; ?></textarea></td>
                  </tr>
                  <tr>
                    <td>Meta Description:</td>
                    <td><textarea name="banggia[metadesc]" cols="80" rows="5"><?php echo $banggia['metadesc']; ?></textarea></td>
                  </tr>
                  <tr>
                    <td>Description:</td>
                    <td><textarea name="banggia[desc]" id="banggia_desc" class="editor"><?php echo $banggia['desc']; ?></textarea></td>
                  </tr>
            </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
$( 'textarea.editor').each( function() {
 CKEDITOR.replace( $(this).attr('id'),{
	 filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
 });
});
//--></script>  
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';

	html += '  <table class="form">';
	html += '    <tr>';
	html += '      <td>Tiêu đề</td>';
	html += '      <td><input type="text" name="list_product[' + module_row + '][title]" value="" size="100" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td>Danh sách</td>';
	html += '      <td><input type="text" name="list_product[' + module_row + '][product]" value="" size="100" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td>&nbsp;</td>';
	html += '      <td><div id="list-product-' + module_row + '" class="scrollbox" style="width:80%"></div>';
    html += '  		<input type="hidden" name="list_product[' + module_row + '][list_product]"/></td>';
	html += '    </tr>';
	html += '  </table>'; 
	html += '</div>';
	
	$('#form').append(html);
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + module_row).trigger('click');
	
	auto(module_row);
	
	module_row++;
}
function auto(row){
	$('input[name=\'list_product[' + row + '][product]\']').autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
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
            $('#list-product-' + row + '-' + ui.item.value).remove();
            var rown = $('.list-row-' + row).length + 1;
            $('#list-product-' + row).append('<div id="list-product-' + row + '-' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="list-' + module_row + '" class="list-input" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#list-product-' + row + ' div:odd').attr('class', 'odd');
            $('#list-product-' + row + ' div:even').attr('class', 'even');
            $('#list-product-' + row + ' div').addClass('list-row-' + row);
            data = $.map($('#list-product-' + row + ' input:hidden'), function(element) {
                return $(element).attr('value');
            });
			//console.log(data);
            $('input[name=\'list_product[' + row + '][list_product]\']').attr('value', data.join());
            list(row);
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
	remove_row(row);
}
function remove_row(row) {
	$('#list-product-' + row + ' div img').live('click', function() {
		$(this).parent().remove();
		$('#list-product-' + row + ' div:odd').attr('class', 'odd');
		$('#list-product-' + row + ' div:even').attr('class', 'even');
		$('#list-product-' + row + ' div').addClass('list-row-' + row);
		data = $.map($('#list-product-' + row + ' input:hidden'), function(element) {
			return $(element).attr('value');
		});
		$('input[name=\'list_product[' + row + '][list_product]\']').attr('value', data.join());
	});
}
function list(row) {
	
	$('input[name=list-'+ row +']').on('keydown', function() {
			
			var pos = $(this).val() - 1;
			
			if (pos >= 0 && pos <= $('input[name=list-'+ row +']').length - 1) {
					
				if ($(this).parents('.list-row-'+ row).index() > pos) {
					//move up
					$(this).parents('.list-row-'+ row).insertBefore($('#list-product-' + row + ' div:eq(' + pos + ')'));
				}
				if ($(this).parents('.list-row-'+ row).index() < pos) {
					//move down
					$(this).parents('.list-row-'+ row).insertAfter($('#list-product-' + row + ' div:eq(' + pos + ')'));
				}
			}
			$('input[name=list-'+ row +']').val('');
			data = $.map($('#list-product-' + row + ' input:hidden'), function(element) {
				return $(element).attr('value');
			});
			$('input[name=\'list_product[' + row + '][list_product]\']').attr('value', data.join());
		})
}
$('.product').focus(function(){
	var id = $(this).attr('id');
	var row = id.replace('product_','');
	auto(row);
});
$('.list-input').focus(function(){
	var name = $(this).attr('name');
	var row = name.replace('list-','');
	list(row);
});
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
$('#tabs a').tabs(); 
//--></script>  
<?php echo $footer; ?>