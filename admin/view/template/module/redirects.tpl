<?php echo $header; ?>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
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
              <td class="left"><?php echo $entry_old_keyword;?></td>
              <td class="left"><?php echo $entry_new_keyword;?></td>
              <td class="left"><?php echo $entry_type;?></td>
              <td class="left"></td>
            </tr>
          </thead>
          <?php $link_row = 0; ?>
          <?php foreach ($redirects as $redirect) { ?>
          <tbody id="link-row<?php echo $link_row; ?>">
            <tr>
              <td class="left"><input type="text" name="redirects[<?php echo $link_row; ?>][okeyword]" value="<?php echo $redirect['okeyword']; ?>" size="70"/></td>
              <td class="left"><input type="text" name="redirects[<?php echo $link_row; ?>][nkeyword]" value="<?php echo $redirect['nkeyword']; ?>" size="70"/></td>
              <td class="left"><select name="redirects[<?php echo $link_row; ?>][type]">
                  <?php $rtype = ($redirect['type']=='302'?'302':'301'); ?>
                  <option value="301" <?php if ($rtype == '301') echo 'selected="selected"'; ?>>Permanent</option>
                  <option value="302" <?php if ($rtype == '302') echo 'selected="selected"'; ?>>Temporary</option>
                </select></td>
              <td class="left"><a onclick="$('#link-row<?php echo $link_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $link_row++; } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var link_row = <?php echo $link_row; ?>;

function addModule() {
	html  = '<tbody id="link-row' + link_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input class="form-control input-normal" type="text" name="redirects[' + link_row + '][okeyword]" value="" size="70"/></td>';
	html += '    <td class="left"><input class="form-control input-normal" type="text" name="redirects[' + link_row + '][nkeyword]" value="" size="70"/></td>';
	html += '     <td class="left">';
	html += '			<select class="form-control input-normal" name="redirects[' + link_row + '][type]">';
    html += '                            <option value="301">Permanent</option>';
    html += '                            <option value="302">Temporary</option>';
    html += '            </select></td>';
	html += '    <td class="left"><a onclick="$(\'#link-row' + link_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);
        $('#noresults').remove();

	link_row++;
}
//--></script> 
<?php echo $footer; ?>