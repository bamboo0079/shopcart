<div class="product_carousel">
  <div class="content_box jcarousel" id="carousel<?php echo $module; ?>">
    <ul class="items">
      <?php $count = 1;?>
      <?php foreach($products as $result){?>
      <li class="item item<?php echo $count;?>">
        <div class="box_item"> 
        <a href="<?php echo $result['href']; ?>" class="item_img" rel="nofollow"><img src="<?php echo $result['thumb']; ?>" alt="<?php echo $result['name']; ?>"></a>
        <span class="item_duration"><?php echo $result['duration']; ?></span>
        <div class="info">
        <h3><a href="<?php echo $result['href']; ?>" title="<?php echo $result['name']; ?>"><?php echo $result['name']; ?></a></h3>
        <div class="pgia clear">
        	<?php /*fix isset*/ ?>
        	<p class="price"><span><?php if(isset($special) && $special == false){ echo $result['special'];}else{ echo $result['price']; } ?></span></p>
        	<?php /*end fix isset*/ ?>
            <a class="button_booking" href="<?php echo $result['href']; ?>" target="_blank"><?php echo $button_view_more?></a>
        </div>
        </div>
        </div>
      </li>
      <?php if($count == 4) $count = 0;?>
      <?php $count++;}?>
    </ul>
    <a class="control-prev" id="last-prev"></a> 
    <a class="control-next" id="last-next"></a>
  </div>
</div>
<script type="text/javascript">$(function() { $('#carousel<?php echo $module; ?>').jcarousel({ wrap: 'circular'}).jcarouselAutoscroll({interval: 10000,target: '+=<?php echo $scroll?>',autostart: true}); $('#last-prev').jcarouselControl({ target: '-=<?php echo $scroll?>' }); $('#last-next').jcarouselControl({ target: '+=<?php echo $scroll?>' });});</script>