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
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
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
            <td>
              <input type="text" name="mail_template_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($mail_template_description[$language['language_id']]) ? $mail_template_description[$language['language_id']]['name'] : ''; ?>" size="50" id="name" />
              <br />
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_text; ?></td>
            <td><textarea name="mail_template_description[<?php echo $language['language_id']; ?>][text]" cols="100" rows="5" class="editor" id="mail_template_description_<?php echo $language['language_id']; ?>_text"><?php echo isset($mail_template_description[$language['language_id']]) ? $mail_template_description[$language['language_id']]['text'] : ''; ?></textarea></td>
          </tr>
        </table>
      </div>
      <?php }?>  
      <table class="form">
      	 <tr>
            <td><?php echo $entry_code; ?></td>
            <td><label id="code_label"><?php echo $code; ?></label><input type="hidden" name="code" value="<?php echo $code?>" id="code" /></td>
         </tr>
         <?php if(isset($id)){?>
         <tr>
            <td>Chèn code:</td>
            <td><label>?cm=<?php echo $code?>###id_custom###</label></td>
         </tr>
         <tr>
            <td><?php echo $entry_counter; ?></td>
            <td><label><?php echo $counter; ?></label></td>
         </tr>
         <tr>
            <td>Chèn link <?php echo $entry_counter; ?></td>
            <td><label><?php echo HTTP_CATALOG.'mail-template/counter?id='.$id?>###id_mail###</label></td>
         </tr>
         <tr>
            <td><?php echo $entry_click; ?></td>
            <td><label><?php echo $click; ?></label></td>
         </tr>
         <?php }?>
      	 <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
         </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
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
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
</script>
<?php if(!$id){?>
<script type="text/javascript" src="view/javascript/jquery/jquery.slug.js"></script>  
<script>
$("#code").slug({
	source: "#name",
	preview: '#code_label',
	replacement: "_"
});
$('#name').bind('blur change focus keyup mouseup', function() {
	var preview = $('#code_label').text();
	var source = $('#code').val();
	$('#code_label').text(preview.replace('.html',''));
	$('#code').val(source.replace('.html',''));
});
</script>
<?php }?>
<?php echo $footer; ?>