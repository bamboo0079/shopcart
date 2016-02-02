<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content" class="category"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($tags) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="category-list">
    <?php if (count($tags) <= 5) { ?>
    <ul>
      <?php foreach ($tags as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($tags);) { ?>
    <ul>
      <?php $j = $i + ceil(count($tags) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($tags[$i])) { ?>
      <li><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
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
        	<?php if ($product['special'] || $product['price']) { ?>
            <?php if (!$product['special']) { ?>
            <label><?php echo $product['price'];?></label>
            <?php } else { ?>
            <label><?php echo $product['special']; ?></label>
            <?php } ?>
            <?php }else{ ?>
            <label><?php echo $text_contact;?></label>
            <?php } ?>
        </p>
        <div class="cart">
            <a href="<?php echo $product['href']; ?>#booking" class="button_booking"><?php echo $button_cart?></a> 
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
  <?php } ?>
  <?php if (!$tags && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
 <?php if ($products) { ?>
 <script>
 $(function(){
 	var $container = $('.product-list-box'); $container.imagesLoaded(function(){ $container.masonry({ boxSelector: '.item', columnWidth: 3 }); });$container.infinitescroll({debug : true, navSelector : '.pagination', nextSelector : '.pagination a', itemSelector : '.product-list-box .item', loading: { finishedMsg: 'Hoàn tất', img: 'http://i.imgur.com/6RMhx.gif' } }, function( newElements ) { var $newElems = $( newElements ).css({ opacity: 0 }); $newElems.imagesLoaded(function(){ $newElems.animate({ opacity: 1 }); $container.masonry( 'appended', $newElems, true ); }); } );
 });
 </script>
 <?php } ?>
<?php echo $footer; ?>