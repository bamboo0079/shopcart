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
  <?php if ($categories) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="category-list">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
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
            <a href="<?php echo $product['href']; ?>" class="button" /><?php echo $button_view_more?></a>
          </div>
        </div>
        <div class="left">
        	<div class="name"><?php echo $product['model']; ?>: <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php if ($product['thumb']) { ?>
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
              </div>
              <?php } ?>
              <div class="description">
              	<?php if ($product['rating']) { ?><p class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></p><?php } ?>
            <?php if($product['duration']){ ?><p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p><?php }?>
            <?php if($product['transport']){ ?><p class="transport"><?php echo $entry_transport; ?> <span><?php echo $product['transport']; ?></span></p><?php }?>
            <?php if($product['departure']){ ?><p class="departure"><?php echo $entry_departure; ?> <span><?php echo $product['departure']; ?></span></p><?php }?>
              	<?php if($product['schedule']){ ?><p class="schedule"><?php echo $entry_schedule; ?> <span><?php echo $product['schedule']; ?></span></p><?php }?>
                <div class="extra_info">
                    <?php if($product['location_from']){ ?><p class="location_from"><?php echo $entry_location_from; ?> <span><?php echo $product['location_from']; ?></span></p><?php }?>
                    <?php if($product['location_to']){ ?><p class="location_to"><?php echo $entry_location_to; ?> <span><?php echo $product['location_to']; ?></span></p><?php }?>
                </div>
              </div>
        </div>
        <?php if ($product['special']) { ?>
        <div class="percent"><span><?php echo $text_percent; ?></span><span><?php echo $product['percent']; ?></span></div>
        <?php } ?>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <div class="category-info">
    <?php if ($desc_footer) { ?>
    <?php echo $desc_footer; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
 
<?php echo $footer; ?>