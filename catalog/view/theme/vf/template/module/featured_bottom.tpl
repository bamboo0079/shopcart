<div class="box box_featured_medium box_featured_medium_3">
  <h2 class="heading">DỊCH VỤ</h2>
  <div class="content_box">
  	<div class="items_tab">
    	<div id="tabs_bus" class="htabs_bus">
            <a href="#tab-xebus" rel="nofollow"><?php echo $text_category_featured_bottom?></a>
            <a href="#tab-thuexe" rel="nofollow"><?php echo $text_category_featured_bottom1?></a>
        </div>
    </div>
    <div class="items">
    	<div id="tab-xebus">
          <?php $count = 1;?>
          <?php foreach ($products as $product) { ?>
          <div class="item <?php if($count % 2 == 0){?>item2<?php }?>">
            <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
            <div class="info">
              <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
              <?php if($product['price']){ ?>
              <p class="price"><span><?php echo $product['price']; ?></span></p>
              <?php $count++;}?>
            </div>
          </div>
          <?php }?>
        </div>
        <div id="tab-thuexe">
          <?php $count = 1;?>
          <?php foreach ($products1 as $product) { ?>
          <div class="item <?php if($count % 2 == 0){?>item2<?php }?>">
            <div class="image"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
            <div class="info">
              <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
            </div>
          </div>
          <?php $count++;}?>
        </div>
    </div>
  </div>
</div>
<div class="box box_featured_medium box_featured_medium_4 news_carousel">
  <h2 class="heading"><a href="/blog" title="Blog cẩm nang du lịch">BLOG</a></h2>
  <div class="content_box">
  	<?php $count = 1;?>
  	<?php foreach ($news as $item) { ?>
    <?php if($count == 1){?>
  	<div class="item_news_bottom">
        <a href="<?php echo $item['href']; ?>" title="<?php echo $item['name']; ?>" class="item_img" rel="nofollow"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['name']; ?>"></a>
        <div class="info">
            <h3><a href="<?php echo $item['href']; ?>" class="title"><?php echo $item['name']; ?></a></h3>
            <ul class="extra">
                <li><i class="fa fa-clock-o"></i> <?php echo $item['date_added']; ?></li>
                <li><i class="fa fa-comments"></i> <?php echo $item['comment']; ?></li>
            </ul>
            <p class="summary"><?php echo $item['short_description']; ?></p>
        </div>
    </div>
    <?php } ?>
    <?php $count++;} ?>
  	<div class="jcarousel" id="carousel_news">
	  <ul class="items_news">
        <?php $count = 1;?>
        <?php foreach ($news as $item) { ?>
        <?php if($count > 1){?>
        <li class="item_news"> 
            <div class="box_item">
            <a href="<?php echo $item['href']; ?>" class="item_img" rel="nofollow"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['name']; ?>" /></a> <h3><a href="<?php echo $item['href']; ?>" class="item_title" title="<?php echo $item['full_name']; ?>"><?php echo $item['name']; ?></a></h3>
            </div>
        </li>
        <?php } ?>
        <?php $count++;} ?>
        
      </ul>
        <a class="jcarousel-control-prev" id="last-prev-news" rel="nofollow"></a> 
        <a class="jcarousel-control-next" id="last-next-news" rel="nofollow"></a> 
        <p class="jcarousel-pagination"></p>
     </div>
  </div>
</div>
<script type="text/javascript">
$('#tabs_bus a').tabs(); 
</script>
<script type="text/javascript">
$(function(){$("#carousel_news").jcarousel({wrap:"circular"}).jcarouselAutoscroll({interval:10000,target:"+=1",autostart:true});$("#last-prev-news").jcarouselControl({target:"-=1"});$("#last-next-news").jcarouselControl({target:"+=1"});$(".jcarousel-pagination").on("jcarouselpagination:active","a",function(){$(this).addClass("active")}).on("jcarouselpagination:inactive","a",function(){$(this).removeClass("active")}).on("click",function(e){e.preventDefault()}).jcarouselPagination({})})
//--></script>