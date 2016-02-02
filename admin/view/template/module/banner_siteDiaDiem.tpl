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
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_banner; ?></td>
              <td class="left"><?php echo $entry_title; ?></td>
              <td class="left"><?php echo $entry_link; ?></td>
              <td class="left"><?php echo $entry_img; ?></td>
              <!-- <td class="left"><span class="required">*</span> <?php echo $entry_dimension; ?></td> -->
              <td class="left"><?php echo $entry_status; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left">
                <select name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][name]">
                  <?php if ($module['name'] == 'hometop') { ?>
                  <option value="hometop" selected="selected">Home Top [970x250]</option>
                  <option value="SiteBar">SiteBar [330x391]</option>
                  <option value="ChiTietNew">Chi Tiết News [738x182]</option>
                  <option value="Slide">Slide [745x300]</option>
                  <option value="Slide Header">Slide Header [728x90]</option>
                  <?php } elseif ($module['name'] == 'SiteBar') { ?>
                  <option value="hometop">Home Top [970x250]</option>
                  <option value="SiteBar" selected="selected">SiteBar [330x391]</option>
                  <option value="ChiTietNew">Chi Tiết News [738x182]</option>
                  <option value="Slide">Slide [745x300]</option>
                  <option value="Slide Header">Slide Header [728x90]</option>
                  <?php } elseif ($module['name'] == 'ChiTietNew') { ?>
                  <option value="hometop">Home Top [970x250]</option>
                  <option value="SiteBar">SiteBar [330x391]</option>
                  <option value="ChiTietNew" selected="selected">Chi Tiết News [738x182]</option>
                  <option value="Slide">Slide [745x300]</option>
                  <option value="Slide Header">Slide Header [728x90]</option>
                  <?php } elseif ($module['name'] == 'Slide') { ?>
                  <option value="hometop">Home Top [970x250]</option>
                  <option value="SiteBar">SiteBar [330x391]</option>
                  <option value="ChiTietNew">Chi Tiết News [738x182]</option>
                  <option value="Slide" selected="selected">Slide [745x300]</option>
                  <option value="Slide Header">Slide Header [728x90]</option>
                  <?php } elseif ($module['name'] == 'Slide Header') { ?>
                  <option value="hometop">Home Top [970x250]</option>
                  <option value="SiteBar">SiteBar [330x391]</option>
                  <option value="ChiTietNew">Chi Tiết News [738x182]</option>
                  <option value="Slide">Slide [745x300]</option>
                  <option value="Slide Header" selected="selected">Slide Header [728x90]</option>
                  <?php } ?>
                </select>
              </td>
              <td><input type="text" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][title]" value="<?php echo $module['title']; ?>" size="50" /></td>
              <td><input type="text" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][link]" value="<?php echo $module['link']; ?>" /></td>
              <td>
                <div class="image"><img src="<?php echo $module['thumb']; ?>" alt="" id="thumb<?php echo $module_row; ?>" />
                  <input type="hidden" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][image]" value="<?php echo $module['image']; ?>" id="image<?php echo $module_row; ?>" />
                  <br />
                  <a onclick="image_upload('image<?php echo $module_row; ?>', 'thumb<?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                  <a onclick="$('#thumb<?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $module_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div>
              </td>
              <!-- <td class="left"><input type="text" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
                <input type="text" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3" />
                <?php if (isset($error_dimension[$module_row])) { ?>
                <span class="error"><?php echo $error_dimension[$module_row]; ?></span>
                <?php } ?></td> -->
                <td class="left"><select name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="5"></td>
              <td class="left"><a onclick="addModule()" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {  
  html  = '<tbody id="module-row' + module_row + '">';
  html += '  <tr>';
  html += '<td><select name="banner_siteDiaDiem_module[' + module_row + '][name]"><option value="hometop" selected="selected">Home Top [970x250]</option><option value="SiteBar">SiteBar [330x391]</option><option value="ChiTietNew">Chi Tiết News [738x182]</option><option value="Slide">Slide [745x300]</option><option value="Slide Header">Slide Header [728x90]</option></select>';
  html += '<td><input type="text" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][title]" value="" size="50" /></td>';
  html += '<td><input type="text" name="banner_siteDiaDiem_module[<?php echo $module_row; ?>][link]" value="" /></td>';
  html += '<td><div class="image"><img src="" alt="" id="thumb'+module_row+'" /><input type="hidden" name="banner_siteDiaDiem_module[' + module_row + '][image]" value="" id="image'+module_row+'" /><br />';
  html += '<a onclick="image_upload(\'image'+module_row+'\', \'thumb'+module_row+'\');"><?php echo $text_browse; ?></a>';
  html += '&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb'+module_row+'\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image'+module_row+'\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
  /*html += '    <td class="left"><input type="text" name="banner_siteDiaDiem_module[' + module_row + '][width]" value="" size="3" /> <input type="text" name="banner_siteDiaDiem_module[' + module_row + '][height]" value="" size="3" /></td>'; */

  html += '    <td class="left"><select name="banner_siteDiaDiem_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
  html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';
  html += '</tbody>';
  
  $('#module tfoot').before(html);
  
  module_row++;
}
//--></script> 
<?php echo $footer; ?>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
  $('#dialog').remove();
  
  $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

  $('#dialog').dialog({
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