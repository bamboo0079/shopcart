<?php echo $header; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <div class="content" style="display:none">
  <h1><?php echo $heading_title; ?></h1>
  	<table align="center">
        <tr>
          <td><?php echo $entry_search; ?></td>
          <td><?php if ($search) { ?>
            <input type="text" name="search" value="<?php echo $search; ?>" id="keyword" />
            <?php } else { ?>
            <input type="text" name="search" value="<?php echo $search; ?>" id="keyword" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
            <?php } ?> &raquo; <a id="goGoogle" href="javascript:void(0);">Tìm trên Google</a></td>
        </tr>
        
        <tr>
          <td></td>
          <td>
            <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
            <?php } ?>
            <label for="description"><?php echo $entry_description; ?></label></td>
        </tr>
        <tr>
          <td></td>
          <td><a id="button-search" class="button"><span><?php echo $button_search; ?></span></a></td>
        </tr>
      </table>
  </div>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  
  <div class="product-list">
  	<?php foreach ($products as $product) { ?>
  	<div>
    	<div class="right">
          <?php if ($product['price']) { ?>
          <p class="price">
          	<?php if (!$product['special']) { ?>
            <label><?php echo $product['price'];?></label>
            <?php } else { ?>
            <label><?php echo $product['special']; ?></label>
            <?php } ?>
          </p>
          <?php } ?>
          <div class="cart">
            <a href="<?php echo $product['href']; ?>" class="button" target="_blank"/><?php if($product['product_type']==0){?><?php echo $button_view_more?><?php }else{?><?php echo $button_view_more_car?><?php }?></a>
          </div>
        </div>
        <div class="left">
        	<h3 class="name"><?php echo $product['model']; ?>: <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
            <?php if ($product['thumb']) { ?>
              <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
              </div>
              <?php } ?>
              <div class="description">
              	<?php if ($product['rating']) { ?><p class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></p><?php } ?>
            <?php if($product['duration']){ ?><p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p><?php }?>
            <?php if($product['transport']){ ?><p class="transport"><?php echo $entry_transport; ?> <span><?php echo $product['transport']; ?></span></p><?php }?>
            <?php if($product['start_time']){ ?><p class="start_time"><?php echo $entry_start_time; ?> <span><?php echo $product['start_time']; ?></span></p><?php }?>
            <?php if($product['start_time_tet']){ ?><p class="start_time_tet"><?php echo $entry_start_time_tet; ?> <span><?php echo $product['start_time_tet']; ?></span></p><?php }?>
            <?php if($product['not_start_time']){ ?><p class="not_start_time"><?php echo $entry_not_start_time; ?> <span><?php echo $product['not_start_time']; ?></span></p><?php }?>
              	<?php if($product['schedule']){ ?><p class="schedule"><?php echo $entry_schedule; ?> <span><?php echo $product['schedule']; ?></span></p><?php }?>
              </div>
        </div>
        <?php if ($product['special'] && $product['percent']) { ?>
        <div class="percent"><span><?php echo $text_percent; ?></span><span><?php echo $product['percent']; ?></span></div>
        <?php } ?>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?><?php echo $column_right; ?>
<script type="text/javascript"><!--

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#goGoogle').click(function(){
	var answer = confirm('Bạn có muốn tìm trên Google');
	if (answer){
		var keyword = $('#keyword').val();
		window.open('http://www.google.com/search?hl=vi&sitesearch=http://'+location.hostname+'&q=' + keyword, '_blank');
	}
});

$('#content input[name=\'search\']')
    .keydown(function(e) {
        if (e.keyCode == 13) {
            $('#button-search')
                .trigger('click');
        }
    });
$('#button-search')
    .bind('click', function() {
        url = 'tim-kiem';
        var search = $('#content input[name=\'search\']')
            .attr('value');
        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }
        var filter_category_id = $('#content select[name=\'filter_category_id\']')
            .attr('value');
        if (filter_category_id > 0) {
            url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
        }
        var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked')
            .attr('value');
        if (filter_sub_category) {
            url += '&filter_sub_category=true';
        }
        var filter_description = $('#content input[name=\'filter_description\']:checked')
            .attr('value');
        if (filter_description) {
            url += '&filter_description=true';
        }
        location = url;
    });

//--></script> 
<?php echo $footer; ?>