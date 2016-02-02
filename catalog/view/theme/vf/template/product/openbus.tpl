<?php echo $header; ?>

<div id="content"> <?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <div class="product-info">
    <span itemscope itemtype="http://schema.org/Product">
    <meta itemprop="url" content="<?php echo $breadcrumb['href']; ?>" >
    <meta itemprop="name" content="<?php echo $heading_title; ?>" >
    <meta itemprop="model" content="<?php echo $model; ?>" >
    <meta itemprop="manufacturer" content="<?php echo $manufacturer; ?>" >
    
    <?php if ($thumb) { ?>
    <meta itemprop="image" content="<?php echo $thumb; ?>" >
    <?php } ?>
    
    <?php if ($images) { foreach ($images as $image) {?>
    <meta itemprop="image" content="<?php echo $image['thumb']; ?>" >
    <?php } } ?>
    
    <span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
    <meta itemprop="price" content="<?php echo ($special ? $special : $price); ?>" />
    <meta itemprop="priceCurrency" content="<?php echo $this->currency->getCode(); ?>" />
    <link itemprop="availability" href="http://schema.org/<?php echo (($quantity > 0) ? "InStock" : "OutOfStock") ?>" />
    </span>
    
    <span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
    <meta itemprop="reviewCount" content="<?php echo $review_no; ?>">
    <meta itemprop="ratingValue" content="<?php echo $rating; ?>">
    </span></span>
    
    <h1><?php echo $model; ?>: <a href="<?php echo $url?>"><?php echo $heading_title; ?></a></h1>
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
      <div class="image jcarousel" id="carousel-img-product">
          <ul>
          	<li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
          <?php foreach ($images as $image) { ?>
            <li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
          <?php } ?>
          </ul>
            <a class="jcarousel-control-prev" id="last-prev">&lsaquo;</a> 
            <a class="jcarousel-control-next" id="last-next">&rsaquo;</a> 
      </div>
      <script>
      	$(function () {$('.jcarousel').jcarousel({wrap: 'circular'}).jcarouselAutoscroll({interval: 10000,target: '+=1',autostart: true});$('#last-prev').jcarouselControl({target: '-=1'});$('#last-next').jcarouselControl({target: '+=1'});});
      </script>
      <?php } ?>
      <div class="button_ui" id="button-cart-dialog">
      	<a href="javascript:void(0)"><span><?php echo $button_car_rent; ?></span> <i class="fa fa-car"></i></a>
      </div>
    </div>
    <?php } ?>
    <div class="right">
      <?php if ($price) { ?>
      <div class="price">
        <p><?php echo $text_price; ?></p><p style="margin-left: 8%;">Từ</p><label><?php echo $price; ?></label>
        <?php if ($special) { ?>
        <p class="text_special"><i class="fa fa-gift"></i> <?php echo $text_price_special; ?><span><?php echo $text_time_special?></span></p>
        <label class="special"><?php echo $special; ?></label>
        <?php if($percent){?><p class="percent"><span><?php echo $text_percent; ?></span><span><?php echo $percent; ?></span></p><?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="description">
        <div class="info">
          <div class="info_title"> <span><?php echo $text_info?></span> </div>
          <ul>
            <?php if($duration){ ?>
            <li><i class="fa fa-clock-o"></i> <strong><?php echo $entry_duration; ?></strong> <?php echo $duration?></li>
            <?php }?>
            
            <?php if($location_from){ ?>
            <li><i class="fa fa-map-marker"></i> <strong><?php echo $entry_location_from; ?></strong> <?php echo $location_from?></li>
            <?php }?>
            <?php if($location_to){ ?>
            <li><i class="fa fa-paper-plane"></i> <strong><?php echo $entry_location_to; ?></strong> <?php echo $location_to?></li>
            <?php }?>
            <?php if($transport){ ?>
            <li><i class="fa fa-car"></i> <strong><?php echo $entry_transport; ?></strong> <?php echo $transport?></li>
            <?php }?>
            <?php if($departure){ ?>
            <li><i class="fa fa-calendar"></i> <strong><?php echo $entry_departure; ?></strong> <?php echo $departure?></li>
            <?php }?>
            <?php if($schedule){ ?>
            <li class="long"><i class="fa fa-location-arrow"></i> <strong><?php echo $entry_schedule; ?></strong> <?php echo $schedule?></li>
            <?php }?>
          </ul>
        </div>
      </div>
    </div>
    <?php if ($review_status) { ?>
    <div class="review">
      <div>
      <span class="addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_facebook_share" fb:share:layout="button_count"></a> <a class="addthis_button_google_plusone" g:plusone:size="medium"></a> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4e59e3d156e0481c"></script> </span>
      <img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="go_review"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fa fa-pencil"></i>&nbsp;<a href="javascript:void(0)" class="go_review"><?php echo $text_write; ?></a>
        <span style="float: right;">
            <!--<a class="email_to" href="#email_to"><i class="fa fa-envelope-o fa-2x"></i></a>-->
            &nbsp;
            <a href="<?php echo $print_product?>" target="_blank"><i class="fa fa-print fa-2x"></i></a>
          </span>
      </div>
    </div>
    <?php } ?>
    <div class="box-hotline">
    	<div class="tv">
            <div class="tag-box-hotline">
                 <span>TƯ VẤN</span>
                 <span class="arrow_hotline"></span>
              </div>
            <ul>
            </ul>
        </div>
		<div class="dt">
            <div class="tag-box-hotline">
                 <span>ĐẶT XE</span>
                 <span class="arrow_hotline"></span>
              </div>
            <ul>
            </ul>
        </div>
    </div>
    <div class="introduction">
    <div class="tool">
        <ul>
            <li><div class="schedule_tool ico tooltips"><i class="fa fa-list-alt"></i><span><?php echo $tab_schedule?></span></div></li>
            <li><div class="info_tool ico tooltips"><i class="fa fa-book"></i><span><?php echo $tab_info?></span></div></li>
            <?php if ($check_menu) { ?>
            <li><div class="menu_tool ico tooltips"><i class="fa fa-cutlery"></i><span><?php echo $tab_menu?></span></div></li>
            <?php }?>
            <?php if($options && $price){?>
            <li><div class="price_tool ico tooltips"><i class="fa fa-usd"></i><span><?php echo $tab_price?></span></div></li>
            <?php }?>
            <?php if ($attribute_groups) { ?><li><div class="hotel_tool ico tooltips"><i class="fa fa-hospital-o"></i><span><?php echo $tab_hotel?></span></div></li><?php } ?>
            <li><div class="payment_tool ico tooltips"><i class="fa fa-credit-card"></i><span><?php echo $tab_payment?></span></div></li>
            <?php if($terms){?><li><div class="terms_tool ico tooltips"><i class="fa fa-bullhorn"></i><span><?php echo $tab_terms?></span></div></li><?php } ?>
            <?php if ($review_status) { ?><li><div class="comment_tool ico tooltips"><i class="fa fa-comments-o"></i><span><?php echo $tab_review?></span></div></li><?php } ?>
        </ul>
    </div>
    <div id="tabs" class="htabs_tabs">
    	<a href="#tab-schedule" class="tab-schedule" rel="nofollow"><i class="fa fa-list-alt"></i> <span><?php echo $tab_schedule?></span></a>
        <?php if($options && $price){?>
        <a href="#tab-price" class="tab-price" rel="nofollow"><i class="fa fa-usd"></i> <span><?php echo $tab_price?></span></a>
        <?php } ?>
        <?php if ($check_menu) { ?>
        <a href="#tab-menu" class="tab-menu" rel="nofollow"><i class="fa fa-cutlery"></i> <span><?php echo $tab_menu?></span></a>
        <?php } ?>
        
        <?php if ($attribute_groups) { ?>
        <a href="#tab-hotel" class="tab-hotel" rel="nofollow"><i class="fa fa-building-o"></i> <span><?php echo $tab_hotel?></span></a>
        <?php } ?>
        <a href="#tab-payment" class="tab-payment" rel="nofollow"><i class="fa fa-credit-card"></i> <span><?php echo $tab_payment?></span></a>
        <?php if($policy){?>
        <a href="#tab-terms" class="tab-terms" rel="nofollow"><i class="fa fa-bullhorn"></i> <span><?php echo $tab_terms?></span></a>
        <?php } ?>
    </div> 
    <div id="tab-schedule" class="tab-content">
      <h2 class="title title_car"><?php echo $heading_title?></h2>
      <?php if($shortdescription){?>
      <div class="short_desc content_introduction"><?php echo $shortdescription;?></div>
      <?php } ?>
      <?php if($highlights){?>
      <p class="title title_highlight"><?php echo $text_highlights?></p>
      <div class="highlights content_introduction"><?php echo $highlights; ?></div>
      <?php } ?>
        <?php if($description){ ?>
        <div class="schedule content_introduction"><?php echo $description; ?></div>
        <?php }?>
      <div class="button_ui button-cart-bottom" id="button-cart-dialog-bottom">
            <a href="javascript:void(0)"><span><?php echo $button_car_rent; ?></span> <i class="fa fa-car"></i></a>
          </div>
      <div class="info_details content_introduction">
      	<?php if ($included) { ?>
        <p class="title_child included_title"><?php echo $entry_included?></p>
        <div class="included content_introduction_child"><?php echo $included?></div>
        <?php } ?> 
        <?php if ($notincluded) { ?>
        <p class="title_child notincluded_title"><?php echo $entry_notincluded?></p>
        <div class="included content_introduction_child"><?php echo $notincluded?></div>
        <?php } ?>
        <?php if ($info) { ?>
        <p class="title_child info_extra_title"><?php echo $entry_info_extra?></p>
        <div class="included content_introduction_child"><?php echo $info?>
        <ul>
            <li>Mọi thắc mắc xin vui lòng liên hệ với chúng tôi qua số điện thoại và email:
            <ul>
                <li><span class="bluebold">Di động:</span> +84 (0) 903 550 236, +84 (0) 903 779 759</li>
                <li><span class="bluebold">Cố định:</span> +84 (08) 6651 6366 - 2240 6473 - 2210 2465 - 360 226 49 - 2240 6474 - 6651 8167</li>
                <li><span class="bluebold">Email:</span> <a href="mailto:sales@vietfuntravel.com.vn">sales@vietfuntravel.com.vn</a></li>
            </ul>
            </li>
        </ul>
        </div>
        <?php } ?>
        <?php if ($meeting) { ?>
        <p class="title_child meeting_title"><?php echo $entry_meeting?></p>
        <div class="included content_introduction_child"><?php echo $meeting?></div>
        <?php } ?>
      </div>
      
    </div>
    <?php if($options){ $count_total =0;?>
    <div id="tab-price" class="tab-content">
      <div class="price_details content_introduction">
        <div class="detail_tour_price_detail_wrap" id="togglerone">
		  <?php foreach ($options as $option)  {?>
          <?php if ($option['type'] == 'checkbox') { $count_total = $count_total + count($option['product_option_id']);?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
            <span class="required">*</span>
            <?php } ?>
            <span><i class="fa fa-angle-double-right"></i> <?php echo $option['name']; ?>:</span>
            <table class="table_style table_payment">
              <thead>
                <tr>
                  <th scope="col"><?php echo $text_type?></th>
                  <th scope="col"><?php echo $text_price_list?></th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <tr>
                  <td><?php echo $option_value['name']; ?></td>
                  <td class="pri"><?php echo $option_value['price']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
          <?php }?>
          <?php }  
          if ($count_total == 1) {?>
           <style type="text/css">
              .price_details .option{
                    width: 100% !important;
              }
           </style>
         <?php } ?>
        </div>
      </div>
    </div>  
    <?php }?>
    <div id="tab-payment" class="tab-content">
        <?php echo $payment_content;?>
    </div>
    <?php if($policy){?>
    <div id="tab-terms" class="tab-content">
    <?php if($policy){?>
    	<?php echo $policy['description'];?>
    <?php }else{ ?>
    	<div class="terms_details content_introduction"><?php echo $terms; ?></div>
    <?php }?>
    </div>
    <?php } ?> 
    </div>
    
    <?php echo $payment_menu; ?>
    <?php if ($review_status) { ?>
    <!--Comment-->
      <?php echo $comment?>
      <!--Comment-->
    <?php } ?> 
     
    <?php if ($products_orther) { ?>
    <div class="box_product">
    	<div class="items">
        	<?php $count = 1;?>
        	<?php foreach ($products_orther as $product) { ?>
              <div class="item <?php if($count % 2 == 0){?>item2<?php }?>">
                <div class="img"><a href="<?php echo $product['href']; ?>" rel="nofollow"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
                <div class="info">
                  <h3 class="tit"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['full_name']; ?>"><?php echo $product['name']; ?></a></h3>
                  <?php if($product['duration']){ ?>
                  <p class="time"><?php echo $entry_duration; ?> <span><?php echo $product['duration']; ?></span></p>
                  <?php }?>
                  <?php if($product['price']){ ?>
                  <p class="pri"><span><?php echo $product['price']; ?></span></p>
                  <?php }?>
                </div>
              </div>
            <?php $count++;}?>
        </div>
    </div>
    <?php } ?> 
     
    <?php if($tags){?>
    <div class="tag"><i class="fa fa-tags"></i><?php echo $entry_tag?>
    <?php foreach($tags as $item){?>                    
    <a href="<?php echo $item['href']?>" title="Tag: <?php echo $item['name']?>"><?php echo $item['name']?></a>
    <?php }?>
    </div>
    <?php }?>
    <?php echo $content_bottom; ?></div></div>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="cart-dialog">
    <div id="dialog">
        <div>
            <div class="header">THÔNG TIN ĐẶT XE<i class="light_close"></i></div>
            <div class="content">
            <div class="cart-dialog-content">
            <div class="left">
                <div class="step_title color1"><label>1</label><span>Số lượng khách</span></div>
                <div class="panel panel_option">
                	<div class="col_group">
                        <label>Số lượng vé</label>
                        <select class="ticket">
                        <?php for($i = 1; $i <= 30; $i++){?>
                        <option value="<?php echo $i?>"><?php echo $i?></option>
                        <?php }?>
                        </select>
                    </div>
                    
                </div>
            </div>
            <div class="right">
                <div class="step_title color2"><label>2</label><span>Loại vé</span></div>
                <div class="panel">
                	<label>Chọn loại vé</label>
                    <select name="type_ticket_option" size="0">
                    <?php foreach ($options as $option)  {?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                    <option value="<?php echo $option['option_id']; ?>"><?php echo $option['name']; ?></option>
                    <?php }?>
                    <?php }?>
                    </select>
                    <?php foreach ($options as $option)  {?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                    <select name="type_ticket_option_value_<?php echo $option['option_id']; ?>" class="type_ticket_option_value type_ticket_option_value_<?php echo $option['option_id']; ?>" size="0" style="display:none">
                    <?php foreach ($option['option_value'] as $option_value) { ?>
                    <option value="option[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]"><?php echo $option_value['name']; ?></option>
                    <?php }?>
                    </select>
                    <?php }?>
                    <?php }?>
                </div>
            </div>
            <div class="clear" style="margin-bottom:10px;"></div>
            <div class="step_title color3"><label>3</label><span>Ngày khởi hành</span></div>
            <div class="note">
                <p>
                    <span></span>
                    <label>Ngày thường</label>
                </p>
                <p class="active">
                    <span></span>
                    <label>Ngày được chọn</label>
                </p>
                <p class="special">
                    <span></span>
                    <label>Ngày khuyến mại</label>
                </p>
            </div>
            <div class="clear"></div>
            <div class="panel panel_date">
                <?php foreach ($options as $option) { ?>
                    <?php if ($option['type'] == 'date') { ?>
                    <div id="option-<?php echo $option['product_option_id']; ?>" class="option_date">
                    <div class="list-datepicker"></div>
                    <input type="hidden" class="departure" name="option[<?php echo $option['product_option_id']; ?>]" />
                    </div>
                    <?php } ?>
                <?php } ?>
            </div>
            
            <div class="button_ui" id="button-cart">
          		<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                <a href="javascript:void(0)"><span>Đặt Ngay</span> <i class="fa fa-shopping-cart"></i></a>
            </div>
        </div>
            <i class="light_header"></i>
            </div>
            <div class="action"><button class="btnCancel">Đóng</button></div>
        </div>
    </div>
</div>

<div id="messagebox">
    <h2 id="messagebox-heading"> Đang chuyển đổi...</h2>
    <p id="messagebox-description"> Vui lòng chờ trong giây lát</p>
    <span class="icon_loading"></span>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
$('.btnLaunchSlideshow').click(function(){
	$('.colorbox').colorbox({
		open:true
	});
});
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5,
	rel: "colorbox"
});
});
//--></script> 
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
$.ajax({
	url: 'index.php?route=product/product/getRecurringDescription',
	type: 'post',
	data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
	dataType: 'json',
	beforeSend: function() {
		$('#profile-description').html('');
	},
	success: function(json) {
		$('.success, .warning, .attention, information, .error').remove();
		
		if (json['success']) {
			$('#profile-description').html(json['success']);
		}	
	}
});
});

$('#button-cart').bind('click', function() {
$.ajax({
	url: 'index.php?route=checkout/cart/add',
	type: 'post',
	data: $('.cart-dialog-content input[type=\'text\'], .cart-dialog-content input[type=\'hidden\'], .cart-dialog-content input[type=\'radio\']:checked, .cart-dialog-content input[type=\'checkbox\']:checked, .cart-dialog-content select, .cart-dialog-content textarea'),
	dataType: 'json',
	success: function(json) {
		$('.success, .warning, .attention, information, .error').remove();
		
		if (json['error']) {
			if (json['error']['option']) {
				for (i in json['error']['option']) {
					$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
				}
			}
			
			if (json['error']['profile']) {
				$('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
			}
		} 
		
		if (json['success']) {
			
			$('#messagebox').show();
			window.location.href = '/thanh-toan';
			
		}	
	}
});
});
//--></script> 
 
 
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#tabs-booking a').tabs();
//--></script> 

<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/i18n/jquery.ui.datepicker-vi.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'dd/mm/yy'});
	$('.datetime').datetimepicker({
		dateFormat: 'dd/mm/yy',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
	var monthProduct = 2;
	if(getWidthBrowser() < 767){
		var monthProduct = 1;
	}
	var date_current = new Date;
	var current = new Date(date_current.getMonth()+1+"/"+(date_current.getDate() + <?php echo $delay_book?>)+"/"+date_current.getFullYear());
	var maxdate=new Date("12/01/"+(date_current.getFullYear()+3));
	$(".list-datepicker").datepicker({gotoCurrent:!0,changeMonth:!0,changeYear:!0,minDate:current,maxDate:maxdate,numberOfMonths:monthProduct, dateFormat: 'dd/mm/yy',altField: ".departure"})
	
});
//--></script>
<script>

function showElement(e){
	$(e).fadeIn('fast');
}
function hideElement(e){
	$(e).fadeOut('fast');
	$(e).find('select option').prop("selected", false);
}
function selElement(e){
	e.bind('change',function(){
		var NameTicket = e.find(":selected").val();
		$('.ticket').attr('name',NameTicket);
	});
}
$(document).ready(function() {
	
	$('select[name="type_ticket_option"]').bind('change',function(){
		$('.type_ticket_option_value').hide();
		var index = $(this).find(":selected").val();
		var Choose = $('.type_ticket_option_value_'+index);
		Choose.show();
		var NameTicket = Choose.find(":selected").val();
		$('.ticket').attr('name',NameTicket);
		selElement(Choose);
	});
	$('select[name="type_ticket_option"]').trigger('change');
});
</script>

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
	goToByScroll('.go_review','#review-title');
	goToByScroll('.schedule_tool','.introduction','.tab-schedule');
	goToByScroll('.price_tool','.introduction','.tab-price');
	goToByScroll('.info_tool','.info_details','.tab-schedule');
	goToByScroll('.payment_tool','.introduction','.tab-payment');
	
	<?php if ($check_menu) { ?>
	goToByScroll('.menu_tool','.introduction','.tab-menu');
	<?php }?>
	<?php if ($attribute_groups) { ?>
	goToByScroll('.hotel_tool','.introduction','.tab-hotel');
	<?php }?>
	<?php if($terms){?>
	goToByScroll('.terms_tool','.introduction','.tab-terms');
	<?php }?>
	<?php if($review_status){ ?>
	goToByScroll('.comment_tool','#comment_details');
	<?php }?>
	
	if(document.location.hash == '#booking'){showShopCart();}
	$('.minitip').miniTip({anchor: 'e',delay:0});
});
//showShopCart();
$('#button-cart-dialog,#button-cart-dialog-bottom').bind('click',function(){
	showShopCart();
})
$('#dialog .header > i, #dialog .action > .btnCancel').bind('click',function(){
	$('#cart-dialog').hide();
})
function showShopCart(){
  $('#cart-dialog').show();
}
</script>

<?php echo $footer; ?>