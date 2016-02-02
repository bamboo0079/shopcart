<div class="box box_featured">
  <h2 class="heading">TOUR NỔI BẬT</h2>
  <div class="content_box">
  	<div class="items_tab items_tab_promotion">
      <div id="tabs_featured" class="htabs_bus htabs_promotion">
      	  <?php if($text_category_featured){?>
      	  <a href="#tab-tab1" rel="nofollow"><?php echo $text_category_featured?></a>
          <?php }?>
      </div>
    </div>
    <div class="items">
      <?php if($products){?>
      <div id="tab-tab1">
          <?php $count = 1;?>
          <?php foreach ($products as $product) { ?>
          <div class="item">
            <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
            <div class="info">
              <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['full_name']; ?>"><?php echo $product['name']; ?></a></h3>
              <?php if($product['duration']){ ?>
              <p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p>
              <?php }?>
              <?php if($product['special']){ ?>
              <p class="price"><span class="price-old"><?php echo $product['price']; ?></span> <span><?php echo $product['special']; ?></span></p>
              <?php }else{?>
              <p class="price"><span><?php echo $product['price']; ?></span></p>
              <?php }?>
            </div>
          </div>
          <?php $count++;}?>
      </div>
      <?php }?>
    </div>
    
  </div>
</div>

<script type="text/javascript">
$('#tabs_featured a').tabs();
</script>