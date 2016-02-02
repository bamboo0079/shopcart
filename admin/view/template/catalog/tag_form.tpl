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
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-product"><?php echo $text_product?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">
              <tr>
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="tag_description[<?php echo $language['language_id']; ?>][name]" id="tag_description_<?php echo $language['language_id']; ?>_name" size="100" value="<?php echo isset($tag_description[$language['language_id']]) ? $tag_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_name_menu; ?></td>
                <td><input type="text" name="tag_description[<?php echo $language['language_id']; ?>][name_menu]" size="100" value="<?php echo isset($tag_description[$language['language_id']]) ? $tag_description[$language['language_id']]['name_menu'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_custom_title; ?></td>
                <td><input type="text" name="tag_description[<?php echo $language['language_id']; ?>][custom_title]" size="100" value="<?php echo isset($tag_description[$language['language_id']]) ? $tag_description[$language['language_id']]['custom_title'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="tag_description[<?php echo $language['language_id']; ?>][meta_description]" cols="100" rows="5"><?php echo isset($tag_description[$language['language_id']]) ? $tag_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="tag_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="100" rows="5"><?php echo isset($tag_description[$language['language_id']]) ? $tag_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr> 
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="tag_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($tag_description[$language['language_id']]) ? $tag_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>        
            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_parent; ?></td>
              <td><select name="parent_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($tags as $tag) { ?>
                  <?php if ($tag['tag_id'] == $parent_id) { ?>
                  <option value="<?php echo $tag['tag_id']; ?>" selected="selected"><?php echo $tag['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $tag['tag_id']; ?>"><?php echo $tag['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $tag_store)) { ?>
                    <input type="checkbox" name="tag_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="tag_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $tag_store)) { ?>
                    <input type="checkbox" name="tag_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="tag_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
			<tr>
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" id="seo_keyword" value="<?php echo $keyword; ?>" size="100"/></td>
            </tr>
            <tr>
              <td><?php echo $entry_image; ?></td>
              <td valign="top"><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                <br /><a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
		<div id="tab-design" style="display:none">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_store; ?></td>
                <td class="left"><?php echo $entry_layout; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $text_default; ?></td>
                <td class="left"><select name="cat_layout[0][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($cat_layout[0]) && $cat_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php foreach ($stores as $store) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $store['name']; ?></td>
                <td class="left"><select name="cat_layout[<?php echo $store['store_id']; ?>][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($cat_layout[$store['store_id']]) && $cat_layout[$store['store_id']] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div>
        <div id="tab-product">
        	 <table id="tag" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $text_product?></td>
                  <td><?php echo $entry_sort_order; ?></td>
                  <td></td>
              </tr>
            </thead>
            <?php $tags_row = 0; ?>
            <?php foreach ($tag_products as $tag_product) { ?>
            <tbody id="tags-row<?php echo $tags_row; ?>">
              <tr>
                <td class="left"><?php echo $tag_product['model']; ?>: <?php echo $tag_product['name']; ?> 
                <input type="hidden" name="tag_product[<?php echo $tags_row; ?>][product_id]" value="<?php echo $tag_product['product_id']; ?>" /></td>
				<td class="left"><input type="text" name="tag_product[<?php echo $tags_row; ?>][sort_order]" value="<?php echo $tag_product['sort_order']; ?>" size="1" class="tag_product_sort_order_<?php echo $tags_row; ?>" /></td>
                <td class="left"><a onclick="$('#tags-row<?php echo $tags_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $tags_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="2"></td>
                <td class="left"><a onclick="addTag();" class="button"><?php echo $button_add_product; ?></a></td>
              </tr>
            </tfoot>
          </table>
			
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 960,
		height: 580,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs();
//--></script>
<script type="text/javascript"><!--
var tags_row = <?php echo $tags_row; ?>;

function addTag() {
	var sort_order_max = $('.tag_product_sort_order_'+(tags_row-1)).val();
	
	if(sort_order_max){
		sort_order_max = parseInt(sort_order_max) + 1;
	}else{
		sort_order_max = 1;
	}
	
	html  = '<tbody id="tags-row' + tags_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="tag_product[' + tags_row + '][name]" value="" size="100" /><input type="hidden" name="tag_product[' + tags_row + '][product_id]" value="" /></td>';
	html += '    <td class="left"><input type="text" name="tag_product[' + tags_row + '][sort_order]" value="' + sort_order_max + '" size="1" class="tag_product_sort_order_' + tags_row + '" /></td>';
	html += '    <td class="left"><a onclick="$(\'#tags-row' + tags_row + '\').remove();" class="button"><span>Xóa</span></a></td>';
	html += '  </tr>';	
	html += '</tbody>';
	
	$('#tag tfoot').before(html);
	
	autocomplete(tags_row);
	
	tags_row++;
}

$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

function autocomplete(tags_row) {
		$('input[name=\'tag_product[' + tags_row + '][name]\']').catcomplete({
		delay: 0,
		source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model + ':' + item.name,
						value: item.product_id
					}
				}));
			}
		});
	   }, 
		select: function(event, ui) {
			$('input[name=\'tag_product[' + tags_row + '][name]\']').attr('value', ui.item.label);
			$('input[name=\'tag_product[' + tags_row + '][product_id]\']').attr('value', ui.item.value);
			
			return false;
		}
	});
}

$('#tag tbody').each(function(index, element) {
	autocomplete(index);
});
//--></script>
<?php if(!$id){?>
<script type="text/javascript" src="view/javascript/jquery/jquery.slug.js"></script>  
<script>
$("#seo_keyword").slug({
	source: "#tag_description_2_name",
	replacement: "-"
});
</script>
<?php }?>
<?php echo $footer; ?>