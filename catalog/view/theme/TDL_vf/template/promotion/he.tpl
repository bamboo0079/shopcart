<?php echo $header;?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content" class="category home"><?php echo $content_top; ?>
    <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
    <h1 itemprop="name" class="promotion_title"><a href="<?php echo $url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>
    <style type="text/css">
    .archor {
        margin-left: 28%;
    }
    </style>
    <div id="promotion_content_desc" class="promotion_content_desc">
        <?php echo $desc;?>
    </div>
    <div class="promotion_content">
        <div class="tool">
            <ul>
                <li><div class="top ico tooltips"><i class="fa fa-arrow-up"></i><span><?php echo $text_top;?></span></div></li>
                <li><div class="km ico tooltips"><i class="fa fa-newspaper-o"></i><span><?php echo $text_promotion;?></span></div></li>
                <li><div class="list_map ico tooltips"><i class="fa fa-map-marker"></i><span><?php echo $text_location;?></span></div></li>
                <li><div class="sg ico tooltips"><i class="char"><?php echo $text_sg;?></i><span><?php echo $text_saigon;?></span></div></li>
                <li><div class="pt ico tooltips"><i class="char"><?php echo $text_pt;?></i><span><?php echo $text_phanthiet;?></span></div></li>
                <li><div class="dn ico tooltips"><i class="char"><?php echo $text_dn;?></i><span><?php echo $text_danang;?></span></div></li>
            </ul>
        </div>
        
        <div id="tabs" class="htabs">
            <a href="#tab-product1" class="product1"><span class="headtitle">cụm điểm đến:</span>  <?php echo $text_local_start_1;?></a>
            <a href="#tab-product2" class="product2"><span class="headtitle">cụm điểm đến:</span>  <?php echo $text_local_start_2;?></a>
            <a href="#tab-product3" class="product3"><span class="headtitle">cụm điểm đến:</span>  <?php echo $text_local_start_3;?></a>
        </div>
        <div id="tab-product1">
            <div id="tabs1" class="htabs_1">

                <a href="#tab-product6" class="product6"><i class="fa fa-hand-o-right fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> hà nội | hạ long | sapa</span></a>
            </div>

            <div id="tab-product6">
                <ul class="product-promotion-col">
                    <li class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <p class="type">Loại Tour</p>
                        <p class="model">Mã Tour</p>
                        <p class="title"><?php echo $text_name?></p>
                        <p class="start_time">Giá Ngày Thường</p>
                        <p class="price"><?php echo $text_price?></p>
                    </li>
                    <?php $count = 1;?>
                    <?php foreach($products7 as $item){?>
                    <li <?php if($count % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count++;}?>

                    <?php $count1 = 1;?>
                    <?php foreach($products8 as $item){?>
                    <li <?php if($count1 % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count1++;}?>
                </ul>
            </div>
        </div>
        <div id="tab-product2">
            <div id="tabs2" class="htabs1">
                <a href="#tab-product8" class="product8"><i class="fa fa-hand-o-right fa-lg animated infinite slideOutLeft"></i><span class="atitle">  phan thiết | đà lạt | nha trang</span></a>
                <a href="#tab-product9" class="product9"><i class="fa fa-hand-o-right fa-lg animated infinite slideOutLeft"></i><span class="atitle">  đà nẵng | hội an | huế</span></a>
            </div>

            <div id="tab-product8">
                <ul class="product-promotion-col">
                    <li class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <p class="type">Loại Tour</p>
                        <p class="model">Mã Tour</p>
                        <p class="title"><?php echo $text_name?></p>
                        <p class="start_time">Giá Ngày Thường</p>
                        <p class="price"><?php echo $text_price?></p>
                    </li>
                    <?php $count = 1;?>
                    <?php foreach($products3 as $item){?>
                    <li <?php if($count % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count++;}?>
                    <?php $count1 = 1;?>
                    <?php foreach($products4 as $item){?>
                    <li <?php if($count1 % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count1++;}?>
                </ul>
            </div>
            <div id="tab-product9">
                <ul class="product-promotion-col">
                    <li class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <p class="type">Loại Tour</p>
                        <p class="model">Mã Tour</p>
                        <p class="title"><?php echo $text_name?></p>
                        <p class="start_time">Giá Ngày Thường</p>
                        <p class="price"><?php echo $text_price?></p>
                    </li>
                    <?php $count = 1;?>
                    <?php foreach($products5 as $item){?>
                    <li <?php if($count % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count++;}?>

                    <?php $count1 = 1;?>
                    <?php foreach($products6 as $item){?>
                    <li <?php if($count1 % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count1++;}?>
                </ul>
            </div>
        </div>
        <div id="tab-product3">
            <div id="tabs3" class="htabs1">
                <a href="#tab-product10" class="product10"><i class="fa fa-hand-o-right fa-lg animated infinite slideOutLeft"></i><span class="atitle">  sài gòn | miền tây | vũng tàu</span></a>
                <a href="#tab-product11" class="product11"><i class="fa fa-hand-o-right fa-lg animated infinite slideOutLeft"></i><span class="atitle">  phú quốc | côn đảo</span></a>
            </div>

            <div id="tab-product10">
                <ul class="product-promotion-col">
                    <li class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <p class="type">Loại Tour</p>
                        <p class="model">Mã Tour</p>
                        <p class="title"><?php echo $text_name?></p>
                        <p class="start_time">Giá Ngày Thường</p>
                        <p class="price"><?php echo $text_price?></p>
                    </li>
                    <?php $count = 1;?>
                    <?php foreach($products1 as $item){?>
                    <li <?php if($count % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count++;}?>

                    <?php $count1 = 1;?>
                    <?php foreach($products2 as $item){?>
                    <li <?php if($count1 % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count1++;}?>
                </ul>
            </div>
            <div id="tab-product11">
                   <ul class="product-promotion-col">
                    <li class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <p class="type">Loại Tour</p>
                        <p class="model">Mã Tour</p>
                        <p class="title"><?php echo $text_name?></p>
                        <p class="start_time">Giá Ngày Thường</p>
                        <p class="price"><?php echo $text_price?></p>
                    </li>
                    <?php $count = 1;?>
                    <?php foreach($products9 as $item){?>
                    <li <?php if($count % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count++;}?>

                    <?php $count1 = 1;?>
                    <?php foreach($products10 as $item){?>
                    <li <?php if($count1 % 2 == 0){ echo 'class="r"';}?>>
                        <p class="type"><?php echo $item['duration']?></p>
                        <p class="model"><?php echo $item['model']?></p>
                        <p class="title"><a href="<?php echo $item['href']?>" title="<?php echo $item['name']?>"><?php echo $item['name_title']?></a></p>
                        <p class="start_time" ><?php echo $item['price']?></p>
                        <p class="price"><?php echo $item['special']?></p>
                    </li>
                    <?php $count1++;}?>
                </ul>
            </div>
        </div>
    </div>    
    <div style="display:none">
        <div id="list_map">
            <p class="title"><?php echo $text_list_location;?></p>
            <?php for ($i = 0; $i < count($cats);) { ?>
            <ul class="list_map_promotion">
                <?php $j = $i + ceil(count($cats) / 4); ?>
                <?php for (; $i < $j; $i++) { ?>
                <?php if (isset($cats[$i])) { ?>
                <li><a href="<?php echo $cats[$i]['href']; ?>" rel="nofollow"><i class="fa fa-map-marker"></i> <?php echo $cats[$i]['name']; ?></a></li>
                <?php }?>
                <?php }?>
            </ul>
            <?php } ?>
        </div>
    </div>
    <!--Comment-->
    <div class="promotion_carousel">
        <div class="content_box jcarousel" id="carousel_promotion">
            <ul class="items">
            <?php foreach($cats as $item){?>
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
    <div id="promotion_content_news"></div>
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
    goToByScroll('.top','.promotion_content_desc');
    goToByScroll('.sg','#tabs','.product1');
    goToByScroll('.pt','#tabs','.product2');
    goToByScroll('.dn','#tabs','.product3');
    $(".list_map").colorbox({inline:true, width:"50%",height:"35%", href:"#list_map"});
});
</script>
<script>
$(function() {
//Header li
$('.product-promotion-col li').click(function(){
    window.open($(this).find('a').attr('href'));
    return false;
}) ;
//Fix title bar
var e = $(".bar_title"),
    t = $(window),
    n = e.offset(),
    r = 0,
    l = $(".promotion_content_desc");
    
    t.scroll(function() {
    if (t.scrollTop() > n.top && t.scrollTop() < l.offset().top) {
        e.stop().animate({top:t.scrollTop() - n.top},400);
        e.addClass("bar_title_fix");
        //
    }else{
        e.removeClass("bar_title_fix");
    }
})
//box content
$(".promotion_content_label,.km").colorbox({inline:true, width:"70%",height:"90%", href:"#promotion_content_desc"});

//tab
$('#tabs a').tabs(); $('#tabs1 a').tabs(); $('#tabs2 a').tabs(); $('#tabs3 a').tabs();

//click tab
if(document.location.hash == '#product1'){
    $('.product1').trigger('click');
    $('html,body').animate({scrollTop: $('.promotion_content').offset().top},100);     
}
if(document.location.hash == '#product2'){
    $('.product2').trigger('click');
    $('html,body').animate({scrollTop: $('.promotion_content').offset().top},100);     
}
if(document.location.hash == '#product3'){
    $('.product3').trigger('click');
    $('html,body').animate({scrollTop: $('.promotion_content').offset().top},100);     
}
});
</script>
<script type="text/javascript">$(function() { $('#carousel_promotion').jcarousel({ wrap: 'circular'}).jcarouselAutoscroll({interval: 8000,target: '+=4',autostart: true}); $('#last-prev').jcarouselControl({ target: '-=4' }); $('#last-next').jcarouselControl({ target: '+=4' });});</script>
<?php echo $footer; ?>
