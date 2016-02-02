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
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="center" width="50px"><?php echo $column_link?></td>
              <td class="left"><?php if ($sort == 'url') { ?>
                <a href="<?php echo $sort_url; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_url; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_url; ?>"><?php echo $column_url; ?></a>
                <?php } ?></td>
              <td class="center" width="70px"><?php echo $column_unapproval?></td>
              <td class="center" width="70px"><?php echo $column_count?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($comments) { ?>
            <?php foreach ($comments as $comment) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($comment['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $comment['url']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $comment['url']; ?>" />
                <?php } ?></td>
              <td class="center"><a href="<?php echo 'http://'.HTTP.'/'.$comment['url']; ?>" target="_blank"><img src="view/image/external_link.png" /></a></td>
              <td class="left"><a href="<?php echo $comment['href']; ?>"><?php echo $comment['url']; ?></a></td>
              <td class="center"><?php if($comment['count_off']){?><label class="text_total_comment"><?php echo $comment['count_off']; ?></label><?php }?></td>
              <td class="center"><?php echo $comment['count_all']; ?></td>
              <td class="right"><?php foreach ($comment['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-approval').bind('click', function() {
	var data = $('#button-approval').attr('data-submit');
	$('#form').attr('action',data);
	$('#form').submit();
	
});
$('#button-unapproval').bind('click', function() {
	var data = $('#button-unapproval').attr('data-submit');
	$('#form').attr('action',data);
	$('#form').submit();
	
});
//--></script> 
<?php echo $footer; ?>