<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

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
      <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
      <div class="button_ui" id="button-cart-dialog">
      	<input type="hidden" name="product_id" size="1" value="<?php echo $product_id; ?>" />
      	<a href="javascript:void(0)"><span><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></a>
      </div>
    </div>
    <?php } ?>
    <div class="right">
      <?php if ($price) { ?>
      <div class="price">
        <p><?php echo $text_price; ?></p><label><?php echo $price; ?></label>
        <?php if ($special) { ?>
        <p class="text_special"><i class="fa fa-gift"></i> <?php echo $text_price_special; ?><span><?php echo $text_time_special?></span></p>
        <label class="special"><?php echo $special; ?></label>
        <p class="percent"><span><?php echo $text_percent; ?></span><span><?php echo $percent; ?></span></p>
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
            <?php if($departure){ ?>
            <li><i class="fa fa-calendar"></i> <strong><?php echo $entry_departure; ?></strong> <?php echo $departure?></li>
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
            <?php if($schedule){ ?>
            <li class="long"><i class="fa fa-location-arrow"></i> <strong><?php echo $entry_schedule; ?></strong> <?php echo $schedule?></li>
            <?php }?>
          </ul>
        </div>
        <?php if ($review_status) { ?>
        <div class="review">
          <div><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fa fa-pencil"></i>&nbsp;<a href="javascript:void(0)" class="comment_tool"><?php echo $text_write; ?></a></div>
          <div class="share">
            <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a> <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_google_plusone" g:plusone:size="medium"></a> 
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4e59e3d156e0481c"></script> 
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php if ($images) { ?>
    <div class="btnLaunchSlideshow"><i class="icon-fullscreen"></i><span><?php echo $text_slideshow;?></span></div>
      <div class="image-additional">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
    <div class="introduction">
    <div id="tabs" class="htabs">
    	<a href="#tab-schedule"><i class="fa fa-list-alt"></i> Chương trình</a>
        <a href="#tab-price"><i class="fa fa-usd"></i> Bảng giá</a>
        <?php if ($attribute_groups) { ?>
        <a href="#tab-hotel"><i class="fa fa-building-o"></i> Khách sạn</a>
        <?php } ?>
        <a href="#tab-payment"><i class="fa fa-credit-card"></i> Thanh toán</a>
        <?php if($terms){?>
        <a href="#tab-terms"><i class="fa fa-bullhorn"></i> Điều khoản</a>
        <?php } ?>
    </div> 
    <div id="tab-schedule" class="tab-content">
      <?php if($shortdescription){?>
      <p class="title"><?php echo $text_desc?></p>
      <div class="short_desc content_introduction"><?php echo $shortdescription;?></div>
      <?php } ?>
      <?php if($highlights){?>
      <p class="title"><?php echo $text_highlights?></p>
      <div class="highlights content_introduction"><?php echo $highlights; ?></div>
      <?php } ?>
      
      	<?php if($product_details){?>
        <div class="schedule_items">
        <?php foreach($product_details as $item){?>
        <div class="schedule_item">
            <label class="schedule_item_label"><?php echo $item['label']?></label>
            <div class="schedule_item_title"><?php echo $item['title']?></div>
            <div class="schedule_item_text">
            <img src="<?php echo $item['thumb']?>" class="schedule_item_img"/>
            <?php echo $item['text']?>
            <?php if($item['meals']){?>
            <div class="meal">
                <?php foreach($item['meals'] as $m){?>
                <p><img src="<?php echo $m['image']?>" /><span><?php echo $m['name']?></span></p>
                <?php }?>
            </div>
            <?php }?>
            </div>
        </div>
        <?php }?>
        </div>
      	<?php }else{?>
        <p class="title"><?php echo $text_schedule?></p>
      	<div class="schedule content_introduction"><?php echo $description; ?></div>
      	<?php }?>
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
        <div class="included content_introduction_child"><?php echo $info?></div>
        <?php } ?>
        <?php if ($meeting) { ?>
        <p class="title_child meeting_title"><?php echo $entry_meeting?></p>
        <div class="included content_introduction_child"><?php echo $meeting?></div>
        <?php } ?>
      </div>
      
    </div>
    <div id="tab-price" class="tab-content">
      <div class="price_details content_introduction">
        <div class="detail_tour_price_detail_wrap" id="togglerone">
          <?php if ($special) { ?>
          <div class="price-detail-item">
          	<div class="title_table_price"><span>Bảng giá ngày lễ</span></div>
            <table class="table_style table_price">
                <thead>
                    <th class="line">
                        <table>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Giá</td>
                            </tr>
                            <tr>
                                <td>Loại</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </th>
                    <?php foreach ($options as $option)  {?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                    <?php if ($option['category'] == '1') { ?>
                    <?php if ($option['class'] == '0') { ?>
                    <th><?php echo $option['name']; ?></th>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                </thead>
                <tbody>
                    <tr>
                    	<td class="in">
                        <?php $option_name = $options[0]; ?>
                        <?php if ($option_name['type'] == 'checkbox') { ?>
                        <?php if ($option_name['category'] == '1') { ?>
                        <?php if ($option['class'] == '0') { ?>
                        <?php foreach ($option_name['option_value'] as $option_value) { ?>
                        <table><tr><td><?php echo $option_value['name']; ?></td></tr></table>
                        <?php }?>
                        <?php }?>
                        <?php } ?>
                        <?php } ?>
                         </td>
                        <?php foreach ($options as $option)  {?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <?php if ($option['category'] == '1') { ?>
                        <?php if ($option['class'] == '0') { ?>
                        <td class="in">
                        <?php foreach ($option['option_value'] as $option_value) { ?>
                        <table><tr><td class="pri"><?php echo $option_value['price']; ?></td></tr></table>
                        <?php } ?>
                        </td>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </tr>
                </tbody>
            </table>
            
          </div>
          <?php } ?>
          
          <div class="price-detail-item">
          	<div class="title_table_price"><span>Bảng giá ngày thường</span></div>
            <table class="table_style table_price">
                <thead>
                    <th class="line">
                        <table>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Giá</td>
                            </tr>
                            <tr>
                                <td>Loại</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </th>
                    
                    <?php foreach ($options as $option)  {?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                    <?php if ($option['category'] == '0') { ?>
                    <?php if ($option['class'] == '0') { ?>
                    <th><?php echo $option['name']; ?></th>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                </thead>
                <tbody>
                    <tr>
                    	<td class="in">
                        <?php $option_name = $options[0]; ?>
                        <?php if ($option_name['type'] == 'checkbox') { ?>
                        <?php if ($option_name['category'] == '0') { ?>
                        <?php if ($option['class'] == '0') { ?>
                        <?php foreach ($option_name['option_value'] as $option_value) { ?>
                        <table><tr><td><?php echo $option_value['name']; ?></td></tr></table>
                        <?php }?>
                        <?php }?>
                        <?php } ?>
                        <?php } ?>
                         </td>
                        <?php foreach ($options as $option)  {?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <?php if ($option['category'] == '0') { ?>
                        <?php if ($option['class'] == '0') { ?>
                        <td class="in">
                        <?php foreach ($option['option_value'] as $option_value) { ?>
                        <table><tr><td class="pri"><?php echo $option_value['price']; ?></td></tr></table>
                        <?php } ?>
                        </td>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </tr>
                </tbody>
            </table>
          </div>
          
        <?php echo $check_maybay = false;?> 
        <?php foreach ($options as $option)  {?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <?php if ($option['category'] == '0') { ?>
        <?php if ($option['class'] == '1') { ?>
        <?php $check_maybay = true;?>
        <?php }?>
        <?php }?>
        <?php }?>
        <?php }?>
          <?php if($check_maybay){?>
          <div class="price-detail-item">
          	<div class="title_table_price"><span>Vé Máy Bay</span></div>
            <table class="table_style table_price">
                <thead>
                    <th class="line">
                        <table>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Giá</td>
                            </tr>
                            <tr>
                                <td>Loại</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </th>
                    <?php foreach ($options as $option)  {?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                    <?php if ($option['category'] == '0') { ?>
                    <?php if ($option['class'] == '1') { ?>
                    <th><?php echo $option['name']; ?></th>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                </thead>
                <tbody>
                    <tr>
                    	<td class="in">
                        <?php foreach ($options as $option)  {?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <?php if ($option['category'] == '0') { ?>
                        <?php if ($option['class'] == '1') { ?>
                        <?php foreach ($option['option_value'] as $option_value) { ?>
                        <table><tr><td><?php echo $option_value['name']; ?></td></tr></table>
                        <?php }?>
                        <?php break;}?>
                        <?php }?>
                        <?php }?>
                        <?php }?>
                         </td>
                        <?php foreach ($options as $option)  {?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <?php if ($option['category'] == '0') { ?>
                        <?php if ($option['class'] == '1') { ?>
                        <td class="in">
                        <?php foreach ($option['option_value'] as $option_value) { ?>
                        <table><tr><td class="pri"><?php echo $option_value['price']; ?></td></tr></table>
                        <?php } ?>
                        </td>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </tr>
                </tbody>
            </table>
          </div>
          <?php }?>
        </div>
      </div>
    </div>  
    <?php if ($attribute_groups) { ?>
    <div id="tab-hotel" class="tab-content">
      <p class="title" id="hotel_details"><?php echo $text_hotel_details?></p>
      <div class="hotel_details content_introduction">
        <table class="table_style table_payment">
          
          <thead>
            <tr>
              <th scope="col"><?php echo $text_location; ?></th>
              <th scope="col"><?php echo $text_type; ?></th>
              <th scope="col"><?php echo $text_hotel; ?></th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($attribute_groups as $attribute_group) { ?>
            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
            <tr>
              <td align="center"><?php echo $attribute_group['name']; ?></td>
              <td align="center"><?php echo $attribute['name_type']; ?></td>
              <td align="center"><?php echo $attribute['name']; ?></td>
            </tr>
            <?php } ?>
            <?php } ?>
          </tbody>
          
        </table>
      </div>
    </div>
    <?php } ?> 
    <div id="tab-payment" class="tab-content">
        <?php echo $payment_content;?>
    </div>
    <?php if($terms){?>
    <div id="tab-terms" class="tab-content">
      <p class="title" id="terms_details"><?php echo $text_terms?></p>
      <div class="terms_details content_introduction"><?php echo $terms; ?></div>
    </div>
    <?php } ?> 
    </div>
    <?php echo $payment_menu; ?>
    <?php if ($review_status) { ?>
    <div class="comment_main_box" id="comment_details">
      <h2 id="review-title"><?php echo $text_write; ?></h2>
      <div class="review-box"> <img src="catalog/view/theme/vf/images/comment-default-avatar.jpg"/>
        <textarea name="text" class="review-input" placeholder="Mời bạn đánh giá về sản phẩm này" onkeyup="autoGrow(this);"></textarea>
        <div class="review-extra">
          <div class="name">
            <input type="text" name="name" placeholder="Mời bạn nhập tên" value="<?php echo $customer_name?>"/>
          </div>
          <div id="rating"></div>
          <input type="hidden" name="rating" id="rating-input"/>
          <div class="but"><a id="button-review"><?php echo $button_continue; ?></a></div>
        </div>
      </div>
      <div id="review"></div>
    </div>
    <?php } ?>
    <div style="display:none">
		<div id="payment_tool">
    		<?php echo $payment_content;?>
            <?php echo $payment_menu; ?>
        </div>
        
    </div>
	
    <?php echo $content_bottom; ?></div></div>
    <div id="cart-dialog">
            <div id="dialog">
                <div>
                    <div class="header">THÔNG TIN ĐẶT TOUR<i class="light_close"></i></div>
                    <div class="content">
                    <div class="cart-dialog-content">
                    <div class="left">
                    	<div class="step_title color1"><h3>1</h3><span>Ngày khởi hành</span></div>
                        <div class="panel">
                            <?php foreach ($options as $option) { ?>
                                <?php if ($option['type'] == 'date') { ?>
                                <div id="option-<?php echo $option['product_option_id']; ?>" class="option_date">
                                <i class="img_datepicket"></i>
                                <input type="text" class="departure list-datepicker" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" readonly="readonly"/>
                                </div>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="right">
                    	<div class="step_title color2"><h3>2</h3><span>Loại tour</span></div>
                        <div class="panel">
                            <?php $option_name = $options[0]; ?>
                            <?php if ($option_name['type'] == 'checkbox') { ?>
                            <?php if ($option_name['category'] == '1') { ?>
                            <?php if ($option['class'] == '0') { ?>
                            <select name="type_tour" size="0">
                            <?php foreach ($option_name['option_value'] as $option_value) { ?>
                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                            <?php }?>
                            </select>
                            <?php }?>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                    
                    <div class="step_title color3"><h3>3</h3><span>Số lượng hành khách</span></div>
                    <div class="panel">
                    	<div id="tabs-booking" class="htabs">
                       	 	<a href="#tab-booking-day">Ngày thường</a>
                        	<?php if ($special) { ?>
                        	<a href="#tab-booking-holiday">Ngày lễ</a>
                            <?php } ?>
                        	
                        </div>
                        <div id="tab-booking-day" class="tab-content">
                        <?php foreach ($options as $option) { ?>
                            <?php if ($option['type'] == 'checkbox') { ?>
                            <?php if ($option['category'] == '0') { ?>
                            <?php if ($option['class'] == '0') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                              <b><?php echo $option['name']; ?>:</b><br />
                              <?php foreach ($option['option_value'] as $option_value) { ?>
                              <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                <?php if ($option_value['price']) { ?>
                                (<?php echo $option_value['price']; ?>)
                                <?php } ?>
                              </label>
                              <br />
                              <?php } ?>
                            </div>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        <?php } ?>
                        </div>
                        <?php if ($special) { ?>
                        <div id="tab-booking-holiday" class="tab-content">
                        <?php foreach ($options as $option) { ?>
                            <?php if ($option['type'] == 'checkbox') { ?>
                            <?php if ($option['category'] == '1') { ?>
                            <?php if ($option['class'] == '0') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                              <b><?php echo $option['name']; ?>:</b><br />
                              <?php foreach ($option['option_value'] as $option_value) { ?>
                              <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                <?php if ($option_value['price']) { ?>
                                (<?php echo $option_value['price']; ?>)
                                <?php } ?>
                              </label>
                              <br />
                              <?php } ?>
                            </div>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        <?php } ?>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                	<i class="light_header"></i>
                    </div>
                    <div class="action"><button class="btnCancel">Đóng</button></div>
                </div>
            </div>
            
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
	data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
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
			$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
			$('.success').fadeIn('slow');
				
			$('.cart-heading').html('<i class="fa fa-shopping-cart"></i> '+json['total']);
			
			//$('html, body').animate({ scrollTop: 0 }, 'slow'); 
		}	
	}
});
});
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.raty.js"></script> 
<script>
function crerank(){
	$('#rating').raty({
	  path: 'catalog/view/theme/vf/images',
	  size   : 24,
	  width: 110,
	  score: 0,
	  target : '#rating-input',
	  targetType : 'number',
	  targetKeep : true
	});
}
crerank();
function autoGrow (e) {
  if (e.scrollHeight > e.clientHeight) {
	  if(e.scrollHeight < 100){
    	e.style.height = e.scrollHeight + "px";
		$('.review-extra').css('border-top','1px solid #ccc');
	  }
  }
}
</script> 
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').load(this.href);
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/ini/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']').val('');
				
				crerank();
				
				$('#review').fadeOut('slow');
				$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
				$('#review').fadeIn('slow');
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
<script type="text/javascript"><!--
jQuery(function($){ 
	$.datepicker.regional['vi'] = {
		closeText: 'Đóng',
		prevText: '&#x3C;Trước',
		nextText: 'Tiếp&#x3E;',
		currentText: 'Hôm nay',
		monthNames: ['Tháng Một', 'Tháng Hai', 'Tháng Ba', 'Tháng Tư', 'Tháng Năm', 'Tháng Sáu',
		'Tháng Bảy', 'Tháng Tám', 'Tháng Chín', 'Tháng Mười', 'Tháng Mười Một', 'Tháng Mười Hai'],
		monthNamesShort: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
		'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
		dayNames: ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy'],
		dayNamesShort: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
		dayNamesMin: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
		weekHeader: 'Tu',
		dateFormat: 'dd/mm/yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['vi']); 
}); 
$(document).ready(function() {
	$('.img_datepicket').click(function(){
		$(this).parent().find('input').first().focus();
	});
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
	
	var dates = ['06/14/2014', '06/15/2014']; //
            //tips are optional but good to have
    var tips  = ['some description','some other description'];      
	
	var date_current = new Date;
	var current = new Date(date_current.getMonth()+1+"/"+date_current.getDate()+"/"+date_current.getFullYear());
	var maxdate=new Date("12/01/"+(date_current.getFullYear()+3));
	$(".list-datepicker").datepicker({gotoCurrent:!0,changeMonth:!0,changeYear:!0,minDate:current,maxDate:maxdate,numberOfMonths:2,beforeShowDay: highlightDays})
	function highlightDays(date) {
        for (var i = 0; i < dates.length; i++) {
            if (new Date(dates[i]).toString() == date.toString()) {              
                return [true, 'highlight', tips[i]];
            }
        }
        return [true, ''];
     } 
});
//--></script>
 
<script>
$('#button-cart-dialog').bind('click',function(){
	showShopCart();
})
$('#dialog .header > i, #dialog .action > .btnCancel').bind('click',function(){
	$('#cart-dialog').hide();
})


showShopCart();

function showShopCart(){
  $('#cart-dialog').show();
}
</script>

<?php echo $footer; ?>