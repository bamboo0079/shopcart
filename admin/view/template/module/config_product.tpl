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
            <td>Tiêu đề khuyến mại Tết dương</td>
            <td><input type="text" name="promotion_title" value="<?php echo $promotion_title; ?>" size="100" /></td>
          </tr>
          <tr>
            <td>Tiêu đề khuyến mại Tết âm</td>
            <td><input type="text" name="promotion_title2" value="<?php echo $promotion_title2; ?>" size="100" /></td>
          </tr>
          <tr>
            <td>Text Seach Desc</td>
            <td><textarea name="text_search_desc_content" class="editor" id="text_search_desc_content"><?php echo $text_search_desc_content; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_payment_content?></td>
            <td><textarea name="payment_content" class="editor" id="payment_content"><?php echo $payment_content; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_payment_menu?></td>
            <td><textarea name="payment_menu" class="editor" id="payment_menu"><?php echo $payment_menu; ?></textarea></td>
          </tr>
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
<?php echo $footer; ?>