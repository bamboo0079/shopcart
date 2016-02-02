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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked).trigger('change');" /></td>
              <?php foreach($column_order as $col) { ?>
                <?php if (!empty($column_info[$col]['sort'])) { ?>
              <td class="<?php echo $column_info[$col]['align']; ?>"><a href="<?php echo $sorts[$col]; ?>"<?php echo ($sort == $column_info[$col]['sort']) ? ' class="' . strtolower($order) . '"' : ''; ?>><?php echo $columns[$col]; ?></a></td>
                <?php } else { ?>
              <td class="<?php echo $column_info[$col]['align']; ?>"><?php echo $columns[$col]; ?></td>
                <?php } ?>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <?php foreach($column_order as $col) {
                switch ($col) {
                    case 'status': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value="*"></option>
                  <option value="1"<?php echo ($filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $text_enabled; ?></option>
                  <option value="0"<?php echo (!is_null($filters[$col]) && !$filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $text_disabled; ?></option>
                </select>
              </td>
                        <?php break;
                    case 'manufacturer': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value=""></option>
                  <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected="selected"' : ''; ?>><?php echo $text_none; ?></option>
                  <?php foreach ($manufacturers as $m) { ?>
                  <option value="<?php echo $m['manufacturer_id']; ?>"<?php echo (!is_null($filters[$col]) && $m['manufacturer_id'] == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $m['name']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'store': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value=""></option>
                  <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected="selected"' : ''; ?>><?php echo $text_none; ?></option>
                  <?php foreach ($stores as $store_id => $s) { ?>
                  <option value="<?php echo $store_id; ?>"<?php echo (!is_null($filters[$col]) && (string)$store_id == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $s['name']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'category': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value=""></option>
                  <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected="selected"' : ''; ?>><?php echo $text_none; ?></option>
                  <?php foreach ($categories as $c) { ?>
                  <option value="<?php echo $c['category_id']; ?>"<?php echo (!is_null($filters[$col]) && $c['category_id'] == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $c['name']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'length_class': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value="*"></option>
                  <?php foreach ($length_classes as $lc) { ?>
                  <option value="<?php echo $lc['length_class_id']; ?>"<?php echo (!is_null($filters[$col]) && $lc['length_class_id'] == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $lc['title']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'weight_class': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value="*"></option>
                  <?php foreach ($weight_classes as $wc) { ?>
                  <option value="<?php echo $wc['weight_class_id']; ?>"<?php echo (!is_null($filters[$col]) && $wc['weight_class_id'] == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $wc['title']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'subtract':
                    case 'requires_shipping': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value="*"></option>
                  <option value="1"<?php echo ($filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                  <option value="0"<?php echo (!is_null($filters[$col]) && !$filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                </select>
              </td>
                        <?php break;
                    case 'stock_status': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value="*"></option>
                  <?php foreach ($stock_statuses as $ss) { ?>
                  <option value="<?php echo $ss['stock_status_id']; ?>"<?php echo (!is_null($filters[$col]) && $ss['stock_status_id'] == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $ss['name']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'tax_class': ?>
              <td class="<?php echo $column_info[$col]['align']; ?>">
                <select name="filter_<?php echo $col; ?>" class="filter <?php echo $col; ?>">
                  <option value=""></option>
                  <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected="selected"' : ''; ?>><?php echo $text_none; ?></option>
                  <?php foreach ($tax_classes as $tc) { ?>
                  <option value="<?php echo $tc['tax_class_id']; ?>"<?php echo (!is_null($filters[$col]) && $tc['tax_class_id'] == $filters[$col]) ? ' selected="selected"' : ''; ?>><?php echo $tc['title']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'action': ?>
              <td width="1" class="<?php echo $column_info[$col]['align']; ?>"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
                        <?php break;
                    default: ?>
                    <?php if ($column_info[$col]['filter']['show']) { ?>
              <td class="<?php echo $column_info[$col]['align']; ?>"><input type="text" name="filter_<?php echo $col; ?>" value="<?php echo $filters[$col]; ?>" class="filter <?php echo $col; ?>"<?php echo ($column_info[$col]['filter']['autocomplete']) ? ' placeholder="' . $text_autocomplete . '"' : ''; ?> /></td>
                    <?php } else { ?>
              <td></td>
                    <?php } ?>
                        <?php break;
                }
              } ?>
            </tr>
            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?></td>
              <?php foreach($column_order as $col) {
                switch ($col) {
                    case 'image': ?>
              <td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['qe_type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" data-id="<?php echo $product['product_id']; ?>" data-image="<?php echo $product['image']; ?>" />
              </td>
                        <?php break;
                    case 'view_in_store': ?>
              <td class="view_store <?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['qe_type'] : ''; ?>">
                <select onchange="((this.value !== '') ? window.open(this.value) : null); this.value = '';">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($product[$col] as $store) { ?>
                  <option value="<?php echo $store['href']; ?>"><?php echo $store['name']; ?></option>
                  <?php } ?>
                </select>
              </td>
                        <?php break;
                    case 'action': ?>
              <td class="<?php echo $column_info[$col]['align']; ?> action">
                <div class="act-cont">
                <div class="btn-group def">
                <?php foreach ($product['action'] as $action) { ?>
                <?php if (!$action['hide']) { ?>
                <a<?php echo (isset($action['click'])) ? ' onClick="window.open(\'' . $action['click'] . '\')"' : ''; echo (isset($action['href'])) ? ' href="' . $action['href'] . '"' : ''; ?> title="<?php echo $action['title']; ?>" id="<?php echo $action['name'] . "-" . $product['product_id']; ?>" class="btn btn-mini<?php echo ($action['btn']['class']) ? ' ' . $action['btn']['class']: ''; ?><?php echo ($action['edit']) ? ' ' . $action['edit']: ''; ?>"<?php echo ($action['ref']) ? ' data-ref="' . $action['ref'] . '-' . $product['product_id'] . '"' : ''; ?>><?php if ($action['btn']['icon']) {?><i class="<?php echo $action['btn']['icon']; ?>"></i><?php } else { ?><?php echo $action['text']; ?><?php } ?></a>
                <?php } ?>
                <?php } ?>
                </div>
                <div class="btn-group all">
                <?php foreach ($product['action'] as $action) { ?>
                <a<?php echo (isset($action['click'])) ? ' onClick="window.open(\'' . $action['click'] . '\')"' : ''; echo (isset($action['href'])) ? ' href="' . $action['href'] . '"' : ''; ?> title="<?php echo $action['title']; ?>" id="<?php echo $action['name'] . "-" . $product['product_id']; ?>" class="btn btn-mini<?php echo ($action['btn']['class']) ? ' ' . $action['btn']['class']: ''; ?><?php echo ($action['edit']) ? ' ' . $action['edit']: ''; ?>"<?php echo ($action['ref']) ? ' data-ref="' . $action['ref'] . '-' . $product['product_id'] . '"' : ''; ?>><?php if ($action['btn']['icon']) {?><i class="<?php echo $action['btn']['icon']; ?>"></i><?php } else { ?><?php echo $action['text']; ?><?php } ?></a>
                <?php } ?>
                </div>
                </div>
              </td>
                        <?php break;
                    default: ?>
              <td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['qe_type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
                        <?php break;
                }
              } ?>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="<?php echo count($column_order) + 1; ?>"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
$("td.action").hover(function(){
    $(".all", this).show();
  }, function(){
    $(".all", this).hide();
  });

function filter() {
	url = 'index.php?route=catalog/product_ext&token=<?php echo $token; ?>&sort=<?php echo $sort; ?>&order=<?php echo $order; ?>';

<?php foreach($column_info as $column => $val) {
    if ($val['filter']['show']) {
        if ($val['filter']['type'] == 0) { ?>
    var filter_<?php echo $column; ?> = $('input[name=\'filter_<?php echo $column; ?>\']').attr('value');

    if (filter_<?php echo $column; ?>) {
        url += '&filter_<?php echo $column; ?>=' + encodeURIComponent(filter_<?php echo $column; ?>);
    }

<?php } else if ($val['filter']['type'] == 1) { ?>
    var filter_<?php echo $column; ?> = $('select[name=\'filter_<?php echo $column; ?>\']').attr('value');
<?php if (in_array($column, array('manufacturer', 'category', 'tax_class', 'store'))) { ?>
    if (filter_<?php echo $column; ?>) {
<?php } else { ?>
    if (filter_<?php echo $column; ?> && filter_<?php echo $column; ?> != '*') {
<?php } ?>
        url += '&filter_<?php echo $column; ?>=' + encodeURIComponent(filter_<?php echo $column; ?>)<?php echo ($column == "category") ? " + '&filter_sub_category=" . ((isset($filters['sub_category'])) ? $filters['sub_category'] : '0') . "'" : ""; ?>;
    }

<?php }
    }
} ?>
	location = url;
}

$('#form input, #form select').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});

function update_image(field, callback) {
    $('#dialog').remove();

    $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

    $('#dialog').dialog({
        title: '<?php echo $text_image_manager; ?>',
        close: function (event, ui) {
            if ($.isFunction(callback)) {
                callback.call();
            }
        },
        bgiframe: false,
        width: 800,
        height: 400,
        resizable: false,
        modal: true,
    });
};
(function($) {
  $('input.filter.date_available').datepicker({dateFormat: 'yy-mm-dd', constrainInput: false});

  $(".quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
      placeholder : "",
      select    : true,
  });

 $(".image_quick_edit").editable(function(value, settings) {
    var params = {alt: $(this.revert).attr('alt')};
    return quick_update(this, value, settings, '<?php echo $update_url; ?>', params);
  }, {
      type      : "image_edit",
      indicator : '<img src="view/image/aqe/aqe_image_loading.gif" alt="<?php echo $text_saving; ?>" style="width: <?php echo $this->config->get('aqe_list_view_image_width'); ?>px; height: <?php echo $this->config->get('aqe_list_view_image_height'); ?>px; padding: 1px; border: 1px solid #DDDDDD;" />',
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "ignore",
      placeholder : "",
  });

 $(".cat_quick_edit, .store_quick_edit, .dl_quick_edit, .filter_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>', $("#aqe-popup-form").serializeHash());
  }, {
      type      : "multiselect_edit",
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "ignore",
      placeholder : "",
      loadurl   : "<?php echo $load_popup_url; ?>",
      loadtype  : "POST",
      loadtext  : "<?php echo $text_loading; ?>",
  });

 $(".attr_quick_edit, .dscnt_quick_edit, .images_quick_edit, .filters_quick_edit, .option_quick_edit, .profile_quick_edit, .related_quick_edit, .special_quick_edit, .descr_quick_edit").live('click', function(e) {
    e.preventDefault();
    var id = $(this).attr('id');
    var ref = $(this).attr('data-ref');
    load_popup_data("<?php echo $load_popup_url; ?>", {id:id}, function(data) {
      if (data.error) {
        show_message(data.error, $("#content"), true);
      } else {
        aqe_popup(data.title, data.popup, function(done_callback) {
          data = {id: id, old: "", new: ""}
          $.extend(data, $("#aqe-popup-form").serializeHash())
          aqe_popup_update('<?php echo $update_url; ?>', data, function(d) {
            if ((d === true || d.success) && ref && $("#" + ref).length) {
              update_cell_value('<?php echo $refresh_url; ?>', ref);
            }
            if ($.isFunction(done_callback)) {
              done_callback.call(null, d);
            }
          });
        })
      }
    })
 });

  $(".date_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      type      : "date_edit",
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
      placeholder : "",
      select    : true,
  });

  $(".status_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($status_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
  });
  $(".qty_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : function(value, settings) {
          return $.trim(value.replace(/<.*?>/g, ''));
      },
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
      placeholder : "",
      select    : true,
  });
  $(".price_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : function(value, settings) {
          var test = $("<div/>").html(value);
          if (test.children("span").length) {
              return test.children("span").first().text();
          } else
            return $.trim(value);
      },
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
      placeholder : "",
      select    : true,
  });
<?php if ($single_lang_editing) { ?>
  $(".name_quick_edit, .tag_quick_edit").editable(function(value, settings) {
    var params = {lang_id: <?php echo $language_id; ?>};
    return quick_update(this, value, settings, '<?php echo $update_url; ?>', params);
  }, {
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
      placeholder : "",
      select    : true,
  });
<?php } else { ?>
  $(".name_quick_edit, .tag_quick_edit").editable(function(value, settings) {
    var params = {lang_id: $('select', this).find(":selected").val()};
    return quick_update(this, value, settings, '<?php echo $update_url; ?>', params);
  }, {
      type      : 'multilingual_edit',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      onblur    : "cancel",
      placeholder : "",
      select    : true,
      loadurl   : "<?php echo $load_data_url; ?>",
      loadtype  : "POST",
      loadtext  : "<?php echo $text_loading; ?>",
      loaddata  : {lang_id: <?php echo $language_id; ?>}
  });
<?php } ?>
  $(".manufac_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($manufacturer_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      placeholder : "",
      onblur    : "cancel",
  });
  $(".length_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($length_class_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      placeholder : "",
      onblur    : "cancel",
  });
  $(".weight_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($weight_class_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      placeholder : "",
      onblur    : "cancel",
  });
  $(".yes_no_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($yes_no_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      placeholder : "",
      onblur    : "cancel",
  });
  $(".stock_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($stock_status_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      placeholder : "",
      onblur    : "cancel",
  });
  $(".tax_cls_quick_edit").editable(function(value, settings) {
    return quick_update(this, value, settings, '<?php echo $update_url; ?>');
  }, {
      data      : '<?php echo trim($tax_class_select); ?>',
      type      : 'select',
      indicator : "<?php echo $text_saving; ?>",
      tooltip   : "<?php echo ($this->config->get('aqe_quick_edit_on') == 'dblclick') ? $text_double_click_edit : $text_click_edit; ?>",
      event     : "<?php echo $this->config->get('aqe_quick_edit_on'); ?>",
      placeholder : "",
      onblur    : "cancel",
  });
})(jQuery);
<?php foreach($column_info as $column => $val) {
  if ($val['filter']['autocomplete']) {?>
$('input[name=\'filter_<?php echo $column; ?>\']').autocomplete({
  delay: 400,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product_ext/autocomplete&token=<?php echo $token; ?>&filter_<?php echo $column; ?>=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {
        response($.unique($.map(json, function(item) {
          <?php if (is_array($val['filter']['autocomplete']['return'])) { ?>
          return {
            <?php foreach($val['filter']['autocomplete']['return'] as $k => $v) { ?>
            <?php echo $k; ?>: item.<?php echo $v; ?>,
            <?php } ?>
          }
          <?php } else { ?>
          return item.<?php echo $val['filter']['autocomplete']['return']; ?>
          <?php } ?>
        })));
      }
    });
  },
  select: function(event, ui) {
    $('input[name=\'filter_<?php echo $column; ?>\']').val(ui.item.label);
    return false;
  },
  focus: function(event, ui) {
    $('input[name=\'filter_<?php echo $column; ?>\']').val(ui.item.label);
    return false;
  }
});
  <?php } ?>
<?php } ?>
//--></script>
<style type="text/css">
  .ui-dialog {
    width: 98% !important;
    /*height: 600px !important;*/
    top: 0px !important;
  }
  #aqe-dialog {
    height: 70% !important;
  }
</style>
<?php echo $footer; ?>