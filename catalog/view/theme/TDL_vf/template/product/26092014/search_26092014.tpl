<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="content">
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
          <td><a id="btn-search" class="button"><span><?php echo $button_search; ?></span></a></td>
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
  
  <div class="product-list-box transitions-enabled">
  	<?php foreach ($products as $product) { ?>
  	<div class="item">
    	<?php if ($product['thumb']) { ?><p class="img"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></p><?php } ?>
        <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
        <div class="desc">
        	<?php if ($product['rating']) { ?><p class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></p><?php } ?>
            <?php if($product['transport']){ ?><p class="transport"><b><?php echo $entry_transport; ?></b> <?php echo $product['transport']; ?></p><?php }?>
            <?php if($product['departure']){ ?><p class="departure"><b><?php echo $entry_departure; ?></b> <?php echo $product['departure']; ?></p><?php }?>
            <?php if($product['schedule']){ ?><p class="schedule"><b><?php echo $entry_schedule; ?></b> <?php echo $product['schedule']; ?></p><?php }?>
        </div>
        <p class="price">
            <?php if (!$product['special']) { ?>
            <label><?php echo $product['price'];?></label>
            <?php } else { ?>
            <label><?php echo $product['special']; ?></label>
            <?php } ?>
        </p>
        <div class="cart">
            <button onclick="window.location='<?php echo $product['href']; ?>';" class="button_booking"><?php echo $button_cart?></button> 
        </div>
        <?php if ($product['special'] && $product['percent']) { ?>
        <div class="percent"><span><?php echo $text_percent; ?></span><span><?php echo $product['percent']; ?></span></div>
        <?php } ?>
        <span class="model"><?php echo $product['model']; ?></span>
        <?php if($product['duration']){ ?><span class="time"><?php echo $product['duration']; ?></span><?php }?>
    </div>
    <?php } ?>
  </div>
  <div class="clear"></div>
  <div class="pagination" style="display:none"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#btn-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'tim-kiem';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '?search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});
$('#goGoogle').click(function(){
	var answer = confirm('Bạn có muốn tìm trên Google');
	if (answer){
		var keyword = $('#keyword').val();
		window.open('http://www.google.com/search?hl=vi&sitesearch=http://'+location.hostname+'&q=' + keyword, '_blank');
	}
});
//--></script> 
<script>
 $(function(){
 	var $container = $('.product-list-box');
    $container.imagesLoaded(function(){
      $container.masonry({
        boxSelector: '.item',
        columnWidth: 3
      });
    });
	
	$container.infinitescroll({
      navSelector  : '.pagination',  
      nextSelector : '.pagination a',
      itemSelector : '.product-list-box .item',
      loading: {
          finishedMsg: 'Hoàn tất',
          img: 'http://i.imgur.com/6RMhx.gif'
        }
      },
      function( newElements ) {
        var $newElems = $( newElements ).css({ opacity: 0 });
        $newElems.imagesLoaded(function(){
          $newElems.animate({ opacity: 1 });
          $container.masonry( 'appended', $newElems, true ); 
        });
      }
    );
	
	
 });
 </script>
<?php echo $footer; ?>