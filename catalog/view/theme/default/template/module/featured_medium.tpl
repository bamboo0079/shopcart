<div class="box box_featured_medium">
  <h2 class="heading">TOUR TRONG NƯỚC</h2>
  <div class="content_box">
  	<div class="items_tab items_tab_promotion">
      <div id="tabs_featured_medium" class="htabs_bus htabs_promotion">
      	  <a href="#tab-nam" rel="nofollow"><?php echo $text_category_featured_medium?></a>
          <a href="#tab-trung" rel="nofollow"><?php echo $text_category_featured_medium1?></a>
          <a href="#tab-bac" rel="nofollow"><?php echo $text_category_featured_medium2?></a>
      </div>
    </div>
    <div class="items">
		<div id="tab-nam">
        	<?php $count = 1;?>
        	<?php foreach ($products as $product) { ?>
              <div class="item <?php if($count % 2 == 0){?>item2<?php }?>">
                <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
                <div class="info">
                  <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['full_name']; ?>"><?php echo $product['name']; ?></a></h3>
                  <?php if($product['duration']){ ?>
                  <p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p>
                  <?php }?>
                  <?php if($product['price']){ ?>
                  <p class="price"><span><?php echo $product['price']; ?></span></p>
                  <?php }?>
                </div>
              </div>
            <?php $count++;}?>
        </div>
        <div id="tab-trung">
        	<?php $count = 1;?>
        	<?php foreach ($products1 as $product) { ?>
              <div class="item <?php if($count % 2 == 0){?>item2<?php }?>">
                <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
                <div class="info">
                  <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['full_name']; ?>"><?php echo $product['name']; ?></a></h3>
                  <?php if($product['duration']){ ?>
                  <p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p>
                  <?php }?>
                  <?php if($product['price']){ ?>
                  <p class="price"><span><?php echo $product['price']; ?></span></p>
                  <?php }?>
                </div>
              </div>
            <?php $count++;}?>
        </div>
        <div id="tab-bac">
        	<?php $count = 1;?>
        	<?php foreach ($products2 as $product) { ?>
              <div class="item <?php if($count % 2 == 0){?>item2<?php }?>">
                <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
                <div class="info">
                  <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['full_name']; ?>"><?php echo $product['name']; ?></a></h3>
                  <?php if($product['duration']){ ?>
                  <p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p>
                  <?php }?>
                  <?php if($product['price']){ ?>
                  <p class="price"><span><?php echo $product['price']; ?></span></p>
                  <?php }?>
                </div>
              </div>
            <?php $count++;}?>
        </div>
    </div>
  </div>
</div>
<div class="box box_featured_medium box_featured_medium_2">
  <div class="heading">VÌ SAO CHỌN CHÚNG TÔI</div>
  <div class="content_box">
  	<?php echo $text_featured_medium_why?>
  </div>
</div>
<div class="box box_featured_medium box_featured_medium_2">
  <div class="heading">CAM KẾT CHẤT LƯỢNG</div>
  <div class="content_box">
  	<?php echo $text_featured_medium_camket?>
  </div>
</div>
<script type="text/javascript">
$('#tabs_featured_medium a').tabs();
</script>