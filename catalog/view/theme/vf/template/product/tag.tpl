<?php echo $header; ?>

<div id="content" class="category"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <h1 itemprop="name"><a href="<?php echo $url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>
  <?php if ($thumb || $description) { ?>
  <div class="category-info-footer-change">
    <?php if ($description) { ?>
    <?php echo $description; ?>
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
    	<div class="right" <?php if(!($product['special'] && $product['percent'])){echo 'style="margin-top:35px"';}else{echo 'style="margin-top:58px"';}?>>
          <?php if ($product['price']) { ?>
          <p class="text" <?php if(!($product['special'] && $product['percent'])){echo 'style="margin-bottom: 3%;"';}?>>Giá Từ</p>
          <p class="price" <?php if(!($product['special'] && $product['percent'])){echo 'style="height:24px !important"';}?>>
          	<?php if (!$product['special']) { ?>
            <label><?php echo $product['price'];?></label>
            <?php } else { ?>
            <label><?php echo $product['special']; ?></label>
            <?php } ?>
          </p>
          <?php } ?>
          <div class="cart">
            <a href="<?php echo $product['href']; ?>" class="button" target="_blank"><?php if($product['product_type']==0){?><?php echo $button_view_more?><?php }else{?><?php echo $button_view_more_car?><?php }?></a>
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
        <div class="percent"><span><?php echo $text_percent; ?></span><span><?php echo '-'.$product['percent']; ?></span></div>
        <?php } ?>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <div class="category-info-footer"></div>
  <!--Comment-->
  <?php echo $comment?>
  <!--Comment-->
  <?php if (!$tags && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $footer; ?>