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
      <h1><img src="view/image/order.png" alt="" /> <?php echo $name_mail; ?> - Tổng lượt xem :<?php echo $total_view; ?></h1>
      <div class="buttons"><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a><a onclick="filter();" class="button">Lọc dữ liệu</a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="right"><?php echo $column_customer; ?></td>
              <td class="right"><?php echo $column_mail; ?></td>
              <td class="right"><?php echo $column_viewViews; ?></td>
              <td class="right"><?php echo $column_ip; ?></td>
              <td class="right"><?php echo $column_browser; ?></td>
              <td class="right"><?php echo $column_date; ?></td>
              <td class="right"><?php echo $column_modifile; ?></td>
            </tr>
          </thead>
          <tbody>
          <tr class="filter">
              <td></td>
              <td><input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" /></td>
              <td><input type="text" name="filter_email" value="<?php echo $filter_email; ?>" /></td>
              <td><input type="text" name="filter_viewViews" value="<?php echo $filter_viewViews; ?>" /></td>
              <td><input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" /></td>
              <td><input type="text" name="filter_browser" value="<?php echo $filter_browser; ?>" /></td>
              <td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" size="12" id="date" /></td>
              <td><input type="text" name="filter_date_modifile" value="<?php echo $filter_date_modifile; ?>" size="12" id="date_modifile" /></td>
            </tr>
            <?php if ($mail_templates) { ?>
            <?php foreach ($mail_templates as $mail_template) { ?>
            <tr>
              <td style="text-align: center;">
                <input type="checkbox" name="selected[]" value="<?php echo $mail_template['mail_view_id']; ?>" /></td>
              <td class="right"><?php echo $mail_template['name']; ?></td>
              <td class="right"><?php echo $mail_template['email']; ?></td>
              <td class="right"><?php echo $mail_template['view']; ?></td>
              <td class="right"><?php echo $mail_template['ip']; ?></td>
              <td class="right"><?php echo $mail_template['equipment']; ?></td>
              <td class="right"><?php echo $mail_template['date_added']; ?></td>
              <td class="right"><?php echo  $mail_template['date_modified'] ;?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div><script type="text/javascript"><!--
function filter() {
  url = 'index.php?route=sale/mail_template/viewViews&token=<?php echo $token; ?>&mail_template_id=<?php echo $mail_template_id?>';
  
  var filter_customer = $('input[name=\'filter_customer\']').attr('value');
  
  if (filter_customer) {
    url += '&filter_customer=' + encodeURIComponent(filter_customer);
  }
  
  var filter_email = $('input[name=\'filter_email\']').attr('value');
  
  if (filter_email) {
    url += '&filter_email=' + encodeURIComponent(filter_email);
  }
  
  var filter_viewViews = $('input[name=\'filter_viewViews\']').attr('value');
  
  if (filter_viewViews) {
    url += '&filter_viewViews=' + encodeURIComponent(filter_viewViews);
  }
  var filter_ip = $('input[name=\'filter_ip\']').attr('value');
  
  if (filter_ip) {
    url += '&filter_ip=' + encodeURIComponent(filter_ip);
  }
  var filter_browser = $('input[name=\'filter_browser\']').attr('value');
  
  if (filter_browser) {
    url += '&filter_browser=' + encodeURIComponent(filter_browser);
  }
  var filter_date_added = $('input[name=\'filter_date_added\']').attr('value');
  
  if (filter_date_added) {
    url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
  }
  var filter_date_modifile = $('input[name=\'filter_date_modifile\']').attr('value');
  
  if (filter_date_modifile) {
    url += '&filter_date_modifile=' + encodeURIComponent(filter_date_modifile);
  }
  location = url;
}
</script>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('#date').datepicker({dateFormat: 'yy-mm-dd'});
  $('#date_modifile').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?>