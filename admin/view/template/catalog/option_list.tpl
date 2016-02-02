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
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"  /></td>
              <td class="left"><?php if ($sort == 'od.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'o.sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="right">Dạng</td>
              <td class="right">Thuộc tính</td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
            <tr class="filter">
              <td></td>
              <td><input type="text" name="filter_name" value="<?php echo $filter_name?>" size="80%"/></td>
              <td></td>
              <td class="right">
              	<select name="filter_class">
                  <option value="*"></option>
                  <?php foreach($class_option as $k=>$item){?>
                    <?php if ($filter_class == $k && isset($filter_class)) { ?>
                    <option value="<?php echo $k?>" selected><?php echo $item?></option>
                    <?php } else { ?>
                    <option value="<?php echo $k?>"><?php echo $item?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
              </td>
                <td class="right"><select name="filter_category">
                  <option value="*"></option>
                  <?php foreach($class_category as $k=>$item){?>
                    <?php if ($filter_category == $k && isset($filter_category)) { ?>
                    <option value="<?php echo $k?>" selected><?php echo $item?></option>
                    <?php } else { ?>
                    <option value="<?php echo $k?>"><?php echo $item?></option>
                    <?php } ?>
                    <?php } ?>
                </select></td>
              <td align="right"><a onclick="filter();" class="button"><span><?php echo $button_filter; ?></span></a></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($options) { ?>
            <?php foreach ($options as $option) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($option['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $option['option_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $option['option_id']; ?>" />
                <?php } ?></td>
              <td class="left"><a href="<?php echo $option['hrefedit']; ?>"><?php echo $option['name']; ?></a></td>
              <td class="right"><?php echo $option['sort_order']; ?></td>
              <td class="right">
              <?php foreach($class_option as $k=>$item){?>
                <?php if ($option['class'] == $k) { ?>
                <?php echo $item;?>
                <?php } ?>
                <?php } ?>
              </td>
              <td class="right">
              <?php foreach($class_category as $k=>$item){?>
                <?php if ($option['category'] == $k) { ?>
                <span class="colortext<?php echo $k?>"><?php echo $item;?></span>
                <?php } ?>
                <?php } ?>
              </td>
              <td class="right"><?php foreach ($option['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
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
function filter() {
	url = 'index.php?route=catalog/option&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_class = $('select[name=\'filter_class\']').attr('value');
	
	if (filter_class != '*') {
		url += '&filter_class=' + encodeURIComponent(filter_class);
	}
	
	var filter_category = $('select[name=\'filter_category\']').attr('value');
	
	if (filter_category != '*') {
		url += '&filter_category=' + encodeURIComponent(filter_category);
	}	

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<?php echo $footer; ?>