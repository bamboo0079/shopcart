<?php echo $header; ?>

<div id="content" class="category home"><?php echo $content_top; ?>
	<div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  	<h1 itemprop="name" class="promotion_title"><a href="<?php echo $url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>
	<div class="promotion_carousel">
    	<div class="content_box jcarousel" id="carousel_promotion">
        	<ul class="items">
            <?php foreach($cats_gioto as $item){?>
            <li>
            <a href="<?php echo $item['href']; ?>" rel="nofollow"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['name']; ?>"></a>
            <span><?php echo $item['name']; ?></span>
            </li>
            <?php }?>
            </ul>
            <a class="control-prev" id="last-prev"></a> 
    		<a class="control-next" id="last-next"></a>
        </div>
    </div>
    <div class="promotion_content">
    	<!--<p class="promotion_content_label"><span><?php echo $text_promotion_content_label?></span></p>-->
        <div class="tool">
        	<ul>
            	<li><div class="top ico tooltips"><i class="fa fa-arrow-up"></i><span><?php echo $text_top;?></span></div></li>
                <li><div class="km ico tooltips"><i class="fa fa-newspaper-o"></i><span><?php echo $text_promotion;?></span></div></li>
            	<li><div class="list_map ico tooltips"><i class="fa fa-map-marker"></i><span><?php echo $text_location;?></span></div></li>
                <li><div class="sg ico tooltips"><i class="char"><?php echo $text_sg;?></i><span><?php echo $text_saigon;?></span></div></li>
                <li><div class="dn ico tooltips"><i class="char"><?php echo $text_dn;?></i><span><?php echo $text_danang;?></span></div></li>
                <li><div class="hn ico tooltips"><i class="char"><?php echo $text_hn;?></i><span><?php echo $text_hanoi;?></span></div></li>
            </ul>
        </div>
    	<div class="promotion_col">
        	<p class="title"><?php echo $name_title_gioto?></p>
            <ul class="product-promotion-list">
                <?php $count = 1;?>
                <?php foreach($products as $item){?>
                <li <?php if($count % 2 == 0){ echo 'class="r"';}?>>
                    <h3 class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['model']?>: <?php echo $item['name']?></a></h3>
                    <a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>" class="img" rel="nofollow"><img src="<?php echo $item['thumb']?>" alt="<?php echo $item['name']?>"/>
                    </a>
                    <?php if($item['start_time_holiday']){?><p><i class="fa fa-calendar"></i> <?php echo $entry_start_time?> <?php echo $item['start_time_holiday']?></p><?php }?>
                    <?php if($item['special']){?><p class="price"><span><?php echo $item['special']?></span></p><?php }?>
                </li>
                <?php $count++;}?>
            </ul>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    	<div class="desc"><?php echo $description?></div>
    </div>
    <div style="display:none">
    	<div id="promotion_content_desc">
        	<?php echo $desc_duonglich;?>
        </div>
        <div id="list_map">
        	<p class="title"><?php echo $text_list_location;?></p>
        	<?php for ($i = 0; $i < count($cats_gioto);) { ?>
        	<ul class="list_map_promotion">
            	<?php $j = $i + ceil(count($cats_gioto) / 4); ?>
          		<?php for (; $i < $j; $i++) { ?>
                <?php if (isset($cats_gioto[$i])) { ?>
            	<li><a href="<?php echo $cats_gioto[$i]['href']; ?>" rel="nofollow"><i class="fa fa-map-marker"></i> <?php echo $cats_duonglich[$i]['name']; ?></a></li>
                <?php }?>
                <?php }?>
            </ul>
            <?php } ?>
        </div>
    </div>
    <!--Comment-->
      <?php echo $comment?>
      <!--Comment-->
<?php echo $content_bottom; ?></div>
<script>
$(document).ready(function() {
	var e = $(".tool"),
	t = $(window),
	n = e.offset(),
	r = 0;
	t.scroll(function () {
		if (t.scrollTop() > n.top) {
			e.addClass("fixed-scroll")
		} else {
			e.removeClass("fixed-scroll")
		}
	})
	function goToByScroll(e,s,t){
		$(e).click(function(e) { 
			$(t).trigger('click');
			$('html,body').animate({scrollTop: $(s).offset().top},100);           
		});
	}
	goToByScroll('.top','.promotion_carousel');
	url = '<?php echo $link_promotion_gioto?>';
	$('.sg').click(function(){location = url+'#product1';});
	$('.dn').click(function(){location = url+'#product2';});
	$('.hn').click(function(){location = url+'#product3';});
	$(".list_map").colorbox({inline:true, width:"50%",height:"35%", href:"#list_map"});
});
</script>
<script>
$(function() {
//box content
$(".promotion_content_label,.km").colorbox({inline:true, width:"70%",height:"90%", href:"#promotion_content_desc"});

});
</script>
<script type="text/javascript">$(function() { $('#carousel_promotion').jcarousel({ wrap: 'circular'}).jcarouselAutoscroll({interval: 8000,target: '+=4',autostart: true}); $('#last-prev').jcarouselControl({ target: '-=4' }); $('#last-next').jcarouselControl({ target: '+=4' });});</script>

<?php echo $footer; ?>