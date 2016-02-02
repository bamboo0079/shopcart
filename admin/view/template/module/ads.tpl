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
      <h1><img src="view/image/module.png" alt="" /><?php echo $heading_title?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td>Display Float Ads:</td>
            <td>
                <select name="display_float_ads">
                    <?php if($display_float_ads){ ?>
                        <option value="1" selected="selected"><?php echo $text_enabled?></option>
                        <option value="0"><?php echo $text_disabled?></option>
                    <?php }else{ ?>
                        <option value="1"><?php echo $text_enabled?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled?></option>
                    <?php } ?>
                </select>
            </td>
          </tr>
          <tr>
            <td>Float Ads Top:</td>
            <td><input name="float_ads_top" value="<?php echo $float_ads_top; ?>" /></td>
          </tr>
          <!-- <tr>
            <td>Float Left Ads :</td>
            <td><textarea name="float_left_ads" id="float_left_ads" class="editor"><?php echo $float_left_ads; ?></textarea></td>
          </tr>
          <tr>
            <td>Float Right Ads :</td>
            <td><textarea name="float_right_ads" id="float_right_ads" class="editor"><?php echo $float_right_ads; ?></textarea></td>
          </tr> -->
        </table>
         <table id="ads" class="list">
              <thead>
                <tr>
                  <td style="width:15%">Float Left Ads :</td>
                  <td class="left" style="width:15%">Float Right Ads :</td>
                  <td class="left" style="width:15%">Start Day :</td>
                  <td class="left" style="width:15%">Start Day :</td>
                  <td class="left" style="width:10%">Event</td>
                  <td></td>
                </tr>
              </thead>
              <?php $ads_row = 0; ?>
              <?php if(isset($ads)){ ?>
              <?php foreach ($ads as $ad) { ?>
              <tbody id="ad-row<?php echo $ads_row; ?>">
                <tr>
                  <td><div class="image"><img src="<?php echo $ad['thumb_left']; ?>" alt="" id="thumb_left<?php echo $ads_row; ?>" />
                  <input type="hidden" name="ad[<?php echo $ads_row; ?>][image_left]" value="<?php echo $ad['image_left']; ?>" id="image_left<?php echo $ads_row; ?>"  />
                  <br />
                  <a onclick="image_upload('image_left<?php echo $ads_row; ?>', 'thumb_left<?php echo $ads_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb_left<?php echo $ads_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image_left<?php echo $ads_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
                  
                  <td><div class="image"><img src="<?php echo $ad['thumb_right']; ?>" alt="" id="thumb_right<?php echo $ads_row; ?>" />
                  <input type="hidden" name="ad[<?php echo $ads_row; ?>][image_right]" value="<?php echo $ad['image_right']; ?>" id="image_right<?php echo $ads_row; ?>"  />
                  <br />
                  <a onclick="image_upload('image_right<?php echo $ads_row; ?>', 'thumb_right<?php echo $ads_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb_right<?php echo $ads_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image_right<?php echo $ads_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
                  <td><input type="text" name="ad[<?php echo $ads_row; ?>][start_date]" value="<?php echo $ad['start_date']; ?>" class="date" /></td>
                <td><input type="text" name="ad[<?php echo $ads_row; ?>][end_date]" value="<?php echo $ad['end_date']; ?>" class="date" /></td>
                  <td><select name="ad[<?php echo $ads_row; ?>][event]">
                        <option value="0">Ngày Thường</option>
                        <?php if(isset($event)) { ?>
                            <?php foreach ($event as $value) { ?>
                                <option value="<?php echo $value['id'] ?>" <?php if($ad['event_id'] == $value['id']){echo 'selected';} ?>><?php echo $value['event_name'] ?></option>
                            <?php } ?>
                        <?php } ?>
                  </select></td>
                  <td><a onclick="$('#ad-row<?php echo $ads_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                </tr>
              </tbody>
              <?php $ads_row++; ?>
              <?php } ?>
              <?php } ?>
              <tfoot>
                <tr>
                  <td colspan="5"></td>
                  <td class="left"><a onclick="addOptionValue();" class="button">Thêm Left Right Image</a></td>
                </tr>
              </tfoot>
            </table>
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
var ads_row = <?php echo $ads_row; ?>;

function addOptionValue() {
  html  = '<tbody id="ad-row' + ads_row + '">';
  html += '  <tr>';
  html += '<td><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb_left'+ads_row+'" /><input type="hidden" name="ad['+ads_row+'][image_left]" value="" id="image_left'+ads_row+'"  /><br /><a onclick="image_upload(\'image_left'+ads_row+'\', \'thumb_left'+ads_row+'\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb_left'+ads_row+'\').attr(\'src\','+ads_row+');$(\'#image_left'+ads_row+'\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';

  html += '<td><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb_right'+ads_row+'" /><input type="hidden" name="ad['+ads_row+'][image_right]" value="" id="image_right'+ads_row+'"  /><br /><a onclick="image_upload(\'image_right'+ads_row+'\', \'thumb_right'+ads_row+'\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb_right'+ads_row+'\').attr(\'src\','+ads_row+');$(\'#image_right'+ads_row+'\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
  html += '<td><input type="text" name="ad['+ads_row+'][start_date]" value="" class="date" /></td>';
  html += '<td><input type="text" name="ad['+ads_row+'][end_date]" value="" class="date" /></td>';
  html += '<td><select name="ad['+ads_row+'][event]"><option value="0">Ngày Thường</option><?php if(isset($event)) { ?><?php foreach ($event as $value) { ?><option value="<?php echo $value['id'] ?>"><?php echo $value['event_name'] ?></option><?php } ?><?php } ?></select></td>';
  html += '<td><a onclick="$(\'#ad-row'+ads_row+'\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';  
    html += '</tbody>';

  $('#ads tfoot').before(html);
  
  ads_row++;
}
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
          url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
          dataType: 'text',
          success: function(data) {
            $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
          }
        });
      }
    },  
    bgiframe: false,
    width: 980,
    height: 530,
    resizable: false,
    modal: false
  });
};
//--></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
    $(document).ready(function(){
        $('.date').live('lick focus',function(){
            $('.date').datepicker({dateFormat: 'yy-mm-dd'});
        });
    });
    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'h:m'
    });
    $('.time').timepicker({timeFormat: 'h:m'});
    //--></script> 
<?php echo $footer; ?>