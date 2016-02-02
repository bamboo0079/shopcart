<?php echo $header; ?>
<style>
    .sortable { list-style-type: none; margin: 0; padding: 0; width:300px}
    .sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1em; height: 18px; }
    .sortable li.ui-state-disabled { height: 34px; }
    span.handle { position: absolute; margin-left: -1.3em; cursor: move; }
    span.param {float:right; width:50px; text-align:center;}
    .ui-state-deselected, .ui-widget-content .ui-state-deselected {border: 1px solid #d3d3d3; background: #e6e6e6 url(view/javascript/ui/themes/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png) 50% 50% repeat-x; color: #888888; }
    .ui-state-deselected a, .ui-widget-content .ui-state-deselected a { color: #363636; }
    .ui-state-deselected .ui-icon {background-image: url(view/javascript/ui/themes/smoothness/images/ui-icons_888888_256x240.png); }
    .column_name{margin-top:19px;display:inline-block;}
</style>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } else if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-catalog-products"><?php echo $tab_catalog_products; ?></a><a href="#tab-about"><?php echo $tab_about; ?></a></div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
     <input type="hidden" name="aqe_installed" value="1" />
     <div id="tab-general">
      <table class="form">
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="admin_quick_edit_status">
              <?php if ($admin_quick_edit_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_match_anywhere; ?></td>
          <td><input type="checkbox" name="aqe_match_anywhere" <?php echo ($aqe_match_anywhere) ? ' checked="checked"': ''; ?> />&nbsp;<?php echo $text_match_anywhere; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_alternate_row_colour; ?></td>
          <td><input type="checkbox" name="aqe_alternate_row_colour" <?php echo ($aqe_alternate_row_colour) ? ' checked="checked"': ''; ?> />&nbsp;<?php echo $text_alternate_row_colour; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_row_hover_highlighting; ?></td>
          <td><input type="checkbox" name="aqe_row_hover_highlighting" <?php echo ($aqe_row_hover_highlighting) ? ' checked="checked"': ''; ?> />&nbsp;<?php echo $text_row_hover_highlighting; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_highlight_status; ?></td>
          <td><input type="checkbox" name="aqe_highlight_status" <?php echo ($aqe_highlight_status) ? ' checked="checked"': ''; ?> />&nbsp;<?php echo $text_highlight_status; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_interval_filter; ?></td>
          <td><input type="checkbox" name="aqe_interval_filter" <?php echo ($aqe_interval_filter) ? ' checked="checked"': ''; ?> />&nbsp;<?php echo $text_interval_filter; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_list_view_image_size; ?></td>
          <td><input type="text" name="aqe_list_view_image_width" value="<?php echo $aqe_list_view_image_width; ?>" size="4" />&nbsp;<input type="text" name="aqe_list_view_image_height" value="<?php echo $aqe_list_view_image_height; ?>" size="4" /></td>
        </tr>
        <tr>
          <td><?php echo $entry_quick_edit_on; ?></td>
          <td>
            <select name="aqe_quick_edit_on">
              <option value="click"<?php echo ($aqe_quick_edit_on == 'click' || $aqe_quick_edit_on != 'dblclick') ? 'selected="selected"': ''; ?>><?php echo $text_single_click; ?></option>
              <option value="dblclick"<?php echo ($aqe_quick_edit_on == 'dblclick') ? 'selected="selected"': ''; ?>><?php echo $text_double_click; ?></option>
            </select>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_single_language_editing; ?></td>
          <td><input type="checkbox" name="aqe_single_language_editing" <?php echo ($aqe_single_language_editing) ? ' checked="checked"': ''; ?> /></td>
        </tr>
      </table>
    </div>
    <div id="tab-catalog-products">
        <table class="form">
          <tr>
            <td><?php echo $entry_catalog_products_status; ?></td>
            <td><select name="aqe_catalog_products_status">
                <?php if ($aqe_catalog_products_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_fields; ?></td>
            <td>
              <ul id="aqe_catalog_products" class="sortable">
                <li class="ui-state-disabled"><span class="column_name"><?php echo $text_column_name; ?></span><span class="param"><input type="checkbox" class="editable_all" title="<?php echo $text_select_all; ?>" /><?php echo $text_editable; ?></span><span class="param"><input type="checkbox" class="show_all" title="<?php echo $text_select_all; ?>" /><?php echo $text_show; ?></span></li>
              <?php foreach($aqe_catalog_products as $k => $col) { ?>
                <li class="<?php echo ($col['sortable']) ? 'sort' : ''; ?> <?php echo ($col['display']) ? 'ui-state-default' : 'ui-state-deselected'; ?>" id="aqe_catalog_products-<?php echo $k; ?>">
                  <?php if ($col['sortable']) { ?><span class="handle ui-icon ui-icon-arrowthick-2-n-s"></span><?php } ?>
                  <?php echo $col['name']; ?>
                  <span class="param">
                    <input type="checkbox" name="quick_edit[aqe_catalog_products][<?php echo $k; ?>]" <?php echo ($col["qe_status"]) ? ' checked="checked"': ''; ?><?php echo ($col["editable"]) ? '' : ' disabled="disabled"'; ?> />
                  </span>
                  <span class="param">
                    <input type="checkbox" name="display[aqe_catalog_products][<?php echo $k; ?>]" class="column_display" <?php echo ($col["display"]) ? 'checked="checked"': ''; ?><?php echo ($k != "action") ? '' : ' disabled="disabled"'; ?> />
                      <?php if ($k == "action") { ?><input type="hidden" name="display[aqe_catalog_products][<?php echo $k; ?>]" value="1" /><?php } ?>
                  </span>
                </li>
              <?php } ?>
              </ul>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_actions; ?></td>
            <td>
              <ul id="aqe_catalog_products_actions" class="sortable">
                <li class="ui-state-disabled"><span class="column_name"><?php echo $text_button; ?></span><span class="param"><input type="checkbox" class="show_all" title="<?php echo $text_select_all; ?>" /><?php echo $text_show; ?></span></li>
              <?php foreach($aqe_catalog_products_actions as $k => $col) { ?>
                <li class="sort <?php echo ($col['display']) ? 'ui-state-default' : 'ui-state-deselected'; ?>" id="aqe_catalog_products_actions-<?php echo $k; ?>">
                  <span class="handle ui-icon ui-icon-arrowthick-2-n-s"></span>
                  <?php echo $col['name']; ?>
                  <span class="param">
                    <input type="checkbox" name="display[aqe_catalog_products_actions][<?php echo $k; ?>]" class="column_display" <?php echo ($col["display"]) ? ' checked="checked"': ''; ?> />
                  </span>
                </li>
              <?php } ?>
              </ul>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_catalog_products_filter_sub_category; ?></td>
            <td><input type="checkbox" name="aqe_catalog_products_filter_sub_category" <?php echo ($aqe_catalog_products_filter_sub_category) ? ' checked="checked"': ''; ?> /></td>
          </tr>
        </table>
    </div>
    <div id="tab-about">
      <table class="form">
       <tr>
        <td style="min-width:200px;"><?php echo $text_ext_name; ?></td>
        <td style="min-width:400px;"><?php echo $ext_name; ?></td>
        <td rowspan="7" style="width:440px;border-bottom:0px;"><img src="view/image/aqe/extension_logo.png" /></td>
       </tr>
       <tr>
        <td><?php echo $text_ext_version; ?></td>
        <td><b><?php echo $ext_version; ?></b> [ <?php echo $ext_type; ?> ]</td>
       </tr>
       <tr>
        <td><?php echo $text_ext_compat; ?></td>
        <td><?php echo $ext_compatibility; ?></td>
       </tr>
       <tr>
        <td><?php echo $text_ext_url; ?></td>
        <td><a href="<?php echo $ext_url; ?>" target="_blank"><?php echo $ext_url ?></a></td>
       </tr>
       <tr>
        <td><?php echo $text_ext_support; ?></td>
        <td>
          <a href="mailto:<?php echo $ext_support; ?>?subject=<?php echo $ext_subject; ?>"><?php echo $ext_support; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="<?php echo $ext_support_forum; ?>"><?php echo $text_forum; ?></a>
          <a href="view/static/bull5i_aqe_extension_help.htm" id="help_notice" style="float:right;"><?php echo $text_asking_help; ?></a>
        </td>
       </tr>
       <tr>
        <td><?php echo $text_ext_legal; ?></td>
        <td>Copyright &copy; 2011 Romi Agar. <a href="view/static/bull5i_aqe_extension_terms.htm" id="legal_notice"><?php echo $text_terms; ?></a></td>
       </tr>
       <tr>
        <td style="border-bottom:0px;"></td>
        <td style="border-bottom:0px;"></td>
       </tr>
      </table>
     </div>
    </form>
  </div>
</div>
<div id="legal_text" style="display:none"></div>
<div id="help_text" style="display:none"></div>
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#aqe_catalog_products, #aqe_catalog_products_actions').sortable({
    handle : 'span.ui-icon',
    opacity : 0.8,
    items: 'li.sort',
    update: function(evt, ui){
        var id = $(ui.item).parent().attr("id");
        $.ajax({
            type: 'POST',
            url: '<?php echo $update_url; ?>',
            dataType: 'json',
            data: {page: id, data : $("#" + id).sortable('toArray')},
            success: function(data) {
                if (data.error) {
                    if ($("div.warning").length == 0) {
                        var e = $('<div/>').addClass("warning").html(data.error).hide()
                        $("div.breadcrumb").after(e)
                        e.slideDown('slow');
                    }
                }
                if (data.success) {
                    $("div.warning").slideUp("slow");
                }
            }
        });
    }
});
$("input[type=checkbox].editable_all").change(function () {
    $("input[name^='quick_edit']", $(this).parents('ul').first()).not(":disabled").attr('checked', $(this).is(':checked'));
});
$("input[type=checkbox].show_all").change(function () {
    $("input[name^='display']", $(this).parents('ul').first()).not(":disabled").attr('checked', $(this).is(':checked')).trigger('change');
});
$('#aqe_catalog_products, #aqe_catalog_products_actions').disableSelection();
$('input[type=checkbox].column_display').change(function () {
    if ($(this).is(':checked')) {
        $(this).parents('li').first().removeClass('ui-state-deselected').addClass('ui-state-default');
    } else {
        $(this).parents('li').first().removeClass('ui-state-default').addClass('ui-state-deselected');
    }
});
$("#legal_notice").click(function(e) {
    e.preventDefault();
    $("#legal_text").load(this.href, function() {
        $(this).dialog({
            title: '<?php echo $text_terms; ?>',
            width:  800,
            height:  600,
            minWidth:  500,
            minHeight:  400,
            modal: true,
        });
    });
    return false;
});
$("#help_notice").click(function(e) {
    e.preventDefault();
    $("#help_text").load(this.href, function() {
        $(this).dialog({
            title: '<?php echo $text_help_request; ?>',
            width:  800,
            height:  600,
            minWidth:  500,
            minHeight:  400,
            modal: true,
        });
    });
    return false;
});
//--></script>
<?php echo $footer; ?>