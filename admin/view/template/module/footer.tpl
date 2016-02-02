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
            <td>Footer:</td>
            <td><textarea name="footer_content" id="footer_content" class="editor"><?php echo $footer_content; ?></textarea></td>
          </tr>
          <tr>
            <td>Footer Product:</td>
            <td><textarea name="footer_product_content" id="footer_product_content" class="editor"><?php echo $footer_product_content; ?></textarea></td>
          </tr>
          <tr>
            <td>Footer Category:</td>
            <td><textarea name="footer_category_content" id="footer_category_content" class="editor"><?php echo $footer_category_content; ?></textarea></td>
          </tr>
          <tr>
            <td>Footer Tag:</td>
            <td><textarea name="footer_tag_content" id="footer_tag_content" class="editor"><?php echo $footer_tag_content; ?></textarea></td>
          </tr>
          <tr>
            <td>Footer Top Tag:</td>
            <td><textarea name="footer_top_tag_content" id="footer_top_tag_content" class="editor"><?php echo $footer_top_tag_content; ?></textarea></td>
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