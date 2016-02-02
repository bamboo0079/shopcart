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

                <span class="text-left"><?php echo $model; ?>: </span>

                <h1><a href="<?php echo $url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>

                <div class="left">

                    <?php if ($thumb) { ?>

                    <div class="image jcarousel" id="carousel-img-product">

                        <ul>

                            <li><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="nofollow"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

                            <?php foreach ($images as $image) { ?>

                            <li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="nofollow"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>

                            <?php } ?>

                        </ul>

                        <a class="jcarousel-control-prev" id="last-prev" rel="nofollow"></a>

                        <a class="jcarousel-control-next" id="last-next" rel="nofollow"></a>

                    </div>

                    <script>

                        $(function () {$('.jcarousel').jcarousel({wrap: 'circular'}).jcarouselAutoscroll({interval: 10000,target: '+=1',autostart: true});$('#last-prev').jcarouselControl({target: '-=1'});$('#last-next').jcarouselControl({target: '+=1'});});

                    </script>

                    <?php } ?>



                    <div class="button_ui" id="button-cart-dialog">

                        <a href="javascript:void(0)"><span><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></a>

                    </div>

                </div>

                <div class="right">

                    <?php if ($price) { ?>

                    <div class="price">

                        <div class="left">

                            <p><?php echo $text_price; ?></p><p style="text-align: center;">Từ</p><label><?php echo $price; ?></label>

                        </div>

                        <?php if ($special) { ?>

                        <div class="left">

                            <p class="text_special"><i class="fa fa-gift"></i> <?php echo $text_price_special; ?><span><?php echo $text_time_special?></span></p>
                          <!---  <p style="text-align: center;">Từ</p>--->

                            <label class="special special2"><?php if($special1){echo $special1;}else{echo $special;} ?></label>

                        </div>

                        <?php } ?>



                        <?php if($percent && $special){ ?>

                            <div class="sale-of">

                                <label style="font-size: 14px; line-height: 23px; text-align: center; margin-left: -11px" class="special special2 sale-price"> <?php echo $text_percent; ?></label>

                                <label style="font-size: 16px;text-align: left; margin-left: 2px;margin-top: -5px;" class="special special2 sale-price"><?php echo '-'.$percent;?></label>

                            </div>

                        <?php } ?>

                    </div>

                    <?php } ?>

                    <div class="description">

                        <div class="info">

                            <div class="info_title"> <?php if($schedule){ ?>

                                <span><i class="fa fa-location-arrow"></i></span> <span><?php echo $entry_schedule; ?></span> <?php echo $schedule?>

                                <?php }?></div>

                            <ul>

                                <li><i class="fa fa-key"></i> <span><?php echo $entry_model; ?></span> <?php echo $model?></li>

                                <?php if($transport){ ?>

                                <li><i class="fa fa-car"></i> <span><?php echo $entry_transport; ?></span> <?php echo $transport?></li>

                                <?php }?>

                                <?php if($duration){ ?>

                                <li><i class="fa fa-clock-o"></i> <span><?php echo $entry_duration; ?></span> <?php echo $duration?> <?php echo $sub_duration?></li>

                                <?php }?>

                                <?php if($location_from){ ?>

                                <li><i class="fa fa-map-marker"></i> <span><?php echo $entry_location_from; ?></span> <?php echo $location_from?></li>

                                <?php }?>

                                <?php if($start_time){ ?>

                                <li><i class="fa fa-calendar"></i> <span><?php echo $entry_start_time; ?></span> <?php echo $start_time?></li>

                                <?php }?>

                                <?php if(isset($product['start_time_holiday']) && $product['start_time_holiday']){ ?>

                                <li class="start_time_tet long"><i class="fa fa-calendar-o"></i> <span><?php echo $entry_start_time_holiday; ?></span> <?php echo $start_time_holiday?></li>

                                <?php }?>

                                <?php if($not_start_time){ ?>

                                <li class="not_start_time long"><i class="fa fa-calendar-o"></i> <span><?php echo $entry_not_start_time; ?></span> <?php echo $not_start_time?></li>

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

        <span style="float: right;" class="product_print_button">

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

                            <span>ĐẶT TOUR</span>

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

                        <div class="image_promotion_date">

                            <a href="http://www.vietfuntravel.com.vn" title="Tour Du Lịch 2/9/2015" target="_blank"><img border="0" src="<?php if(isset($linkbannergroup)){echo $linkbannergroup;}else{echo 'http://www.vietfuntravel.com.vn/image/data/banner-promotion/chi-tiet-noel.png';} ?>" alt="Tour Du Lịch 2015"></a>

                        </div>

                        <h2 class="title"><?php echo $text_desc?></h2>

                        <?php if($shortdescription){?>

                        <div class="short_desc content_introduction"><?php echo $shortdescription;?></div>

                        <?php } ?>

                        <?php if($highlights){?>

                        <p class="title title_highlight"><?php echo $text_highlights?></p>

                        <div class="highlights content_introduction"><?php echo $highlights; ?></div>

                        <?php } ?>

                        <?php if($product_details){?>

                        <div class="schedule_items">

                        <?php foreach($product_details as $item){?>

                        <div class="schedule_item">

                        <label class="schedule_item_label"><?php echo $item['label']?></label>

                        <div class="schedule_item_title"><?php echo $item['title']?></div>

                        <div class="schedule_item_text">

                        <?php if($item['thumb']){?><img src="<?php echo $item['thumb']?>" alt="<?php echo $heading_title; ?>" class="schedule_item_img"/><?php }?>

                        <?php echo $item['text']?>

                        <?php if($item['meals']){ ?>

                        <div class="meal">

                        <?php foreach($item['meals'] as $m){ ?>

                        <p><img src="<?php echo $m['image']?>" alt="<?php echo $m['name']?>"/><span><?php echo $m['name']?></span></p>

                        <?php }?>

                        </div>

                        <?php }?>

                        </div>

                        </div>

                        <?php }?>

                        </div>

                        <?php }else{ ?>

                        <?php if($description){ ?>

                        <p class="title"><?php echo $text_schedule?></p>

                        <div class="schedule content_introduction"><?php echo $description; ?></div>

                        <?php }?>

                        <?php }?>

                        <div class="button_ui button-cart-bottom" id="button-cart-dialog-bottom">

                            <a href="javascript:void(0)"><span><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></a>

                        </div>

                        <div class="info_suggest">

                            <?php echo $suggest;?>

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

                    <?php if ($check_menu) { ?>

                    <div id="tab-menu" class="tab-content">

                        <?php if($product_details){?>

                        <div class="menu_items">

                        <?php foreach($product_details as $item){?>

                        <div class="menu_item">

                        <label class="menu_item_label"><?php echo $item['label']?></label>

                        <div class="menu_item_title"><?php echo $item['title']?></div>

                        <div class="menu_item_text">

                        <?php echo $item['menu']?$item['menu']:$text_not_menu;?>

                        </div>

                        </div>

                        <?php }?>

                        </div>

                        <?php }?>

                    </div>

                    <?php } ?>

                    <?php if($options && $price){?>

                    <div id="tab-price" class="tab-content">

                    <div class="image_promotion_date">

                    <a href="http://www.vietfuntravel.com.vn" title="Tour Du Lịch 2/9/2015" target="_blank"><img border="0" src="<?php if(isset($linkbannergroup)){echo $linkbannergroup;}else{echo 'http://www.vietfuntravel.com.vn/image/data/banner-promotion/chi-tiet-noel.png';} ?>" alt="Tour Du Lịch 2015"></a>

                    </div>

                    <div class="price_details content_introduction">

                    <div class="detail_tour_price_detail_wrap" id="togglerone">

                <div class="price-detail-item">

                    <div class="title_table_price"><span>Bảng giá ngày thường </span></div>

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



                        <?php foreach ($options as $option)  { ?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

                        <th><?php echo $option['name']; ?></th>

                        <?php } ?>

                        <?php } ?>

                        </thead>

                        <tbody>

                        <tr>

                            <td class="in">

                                <?php foreach ($options as $option)  { ?>

                                <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

                                <?php foreach ($option['option_value'] as $option_value) { ?>

                                <table><tr><td><?php echo $option_value['name']; ?><label>&nbsp;</label></td></tr></table>

                                <?php }?>

                                <?php break;}?>

                                <?php }?>

                            </td>
        <?php  $v = 1; $i = 1; ?>
                            <?php foreach ($options as $option)  { ?>

                            <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

                            <td class="in">

                            <?php 
                            $count = count($option['option_value']);
                            foreach ($option['option_value'] as $option_value) { ?>

                            <table><tr><td class="pri <?php echo($count && $i<=$count ? 'event_price' : '' );?>"><?php echo $option_value['price']; ?><label><?php if(in_array($option['option_id'],$phuthu)){?><?php echo $option_value['name']; ?><?php }else{?>&nbsp;<?php }?></label></td></tr></table>

                            <?php $i++; } ?>

                            </td>

                            <?php }?>

                            <?php } ?>

                        </tr>

                        </tbody>

                    </table>

                </div>


                <!--Ve may bay-->

                <?php if($check_maybay){ ?>

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

                <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

                <th><?php echo $option['name']; ?></th>

                <?php } ?>

                <?php } ?>

                </thead>

                <tbody>

                <tr>

                    <td class="in">

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td><?php echo $option_value['name']; ?><label>&nbsp;</label></td></tr></table>

                        <?php }?>

                        <?php break;}?>

                        <?php }?>

                    </td>

                    <?php foreach ($options as $option)  {?>

                    <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

                    <td class="in">

                    <?php foreach ($option['option_value'] as $option_value) { ?>

                    <table><tr><td class="pri"><?php echo $option_value['price']; ?><label><?php if(in_array($option['option_id'],$phuthu)){?><?php echo $option_value['name']; ?><?php }else{?>&nbsp;<?php }?></label></td></tr></table>

                    <?php } ?>

                    </td>

                    <?php }?>

                    <?php } ?>

                </tr>

                </tbody>

                </table>

            </div>

            <?php }?>



            <!--Ve Tau-->

            <?php if($check_vetau){?>

            <div class="price-detail-item">

            <div class="title_table_price"><span>Vé Tàu</span></div>

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

            <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '3') { ?>

            <th><?php echo $option['name']; ?></th>

            <?php } ?>

            <?php } ?>

            </thead>

            <tbody>

            <tr>

                <td class="in">

                    <?php foreach ($options as $option)  {?>

                    <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '3') { ?>

                    <?php foreach ($option['option_value'] as $option_value) { ?>

                    <table><tr><td><?php echo $option_value['name']; ?><label>&nbsp;</label></td></tr></table>

                    <?php }?>

                    <?php break;}?>

                    <?php }?>

                </td>

                <?php foreach ($options as $option)  {?>

                <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '3') { ?>

                <td class="in">

                <?php foreach ($option['option_value'] as $option_value) { ?>

                <table><tr><td class="pri"><?php echo $option_value['price']; ?><label><?php if(in_array($option['option_id'],$phuthu)){?><?php echo $option_value['name']; ?><?php }else{?>&nbsp;<?php }?></label></td></tr></table>

                <?php } ?>

                </td>

                <?php }?>

                <?php } ?>

            </tr>

            </tbody>

            </table>

        </div>

        <?php }?>



    </div>

  </div>

</div>

<?php }?>

<?php if ($attribute_groups) { ?>

<div id="tab-hotel" class="tab-content">

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

            <tr>

                <td rowspan="<?php echo $attribute_group['total']; ?>" class="pri"><?php echo $attribute_group['name']; ?></td>

                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>

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

<?php echo $content_bottom; ?></div></div>

<?php echo $column_left; ?><?php echo $column_right; ?>



<?php $c = 1;?>

<?php $check_child = $check_single_room = $check_foreign = false;?>

<?php foreach ($options as $option)  {?>

<?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

<?php if($c == 2){ $check_child = true;} ?>

<?php if($c == 3){ $check_single_room = true;} ?>

<?php if($c == 4){ $check_foreign = true;} ?>

<?php $c++;} ?>

<?php } ?>

<div id="cart-dialog">

    <?php if($options && $price){?>

    <div id="dialog">

    <div>

    <div class="header">THÔNG TIN ĐẶT TOUR<i class="light_close"></i></div>

    <div class="content">

    <div class="cart-dialog-content">

    <div class="step_title color3"><label>1</label><span>Ngày khởi hành</span></div>

    <div class="note">

    <p>

    <span></span>

    <label>Ngày thường</label>

    </p>

    <p class="active">

    <span></span>

    <label>Ngày được chọn</label>

    </p>

    <p class="special1">

    <span></span>

    <label>Ngày lễ</label>

    </p>

    </div>

    <div class="clear"></div>

    <div class="panel panel_date">

    <div class="list-datepicker"></div>



    </div>

    <div class="date_selected">

    Quý khách đã chọn ngày: <span>28/11/2014</span> <label>(<a href="javascript:void(0)" rel="nofollow">Thay đổi ngày</a>)</label>

    </div>

    <div class="clear"></div>

    <div class="right row2">

    <div class="step_title color2"><label>2</label><span>Chọn loại tour</span></div>

    <div class="panel">

    <?php foreach ($options as $option)  { ?>

    <?php if ($special && $option['type'] == 'checkbox' && $option['category'] == '1' && $option['class'] == '0') { ?>

    <select name="type_tour" size="0">

    <option value="0">--- Loại ---</option>

    <?php $count = 1;?>

    <?php foreach ($option['option_value'] as $option_value) { ?>

    <option value="<?php echo $count; ?>"><?php echo $option_value['name']; ?></option>

    <?php $count++;}?>

    </select>

    <?php break;}?>

    <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

    <select name="type_tour" size="0">

    <option value="0">--- Loại ---</option>

    <?php $count = 1;?>

    <?php foreach ($option['option_value'] as $option_value) { ?>

    <option value="<?php echo $count; ?>"><?php echo $option_value['name']; ?></option>

    <?php $count++;}?>

    </select>

    <?php break;}?>

    <?php }?>

</div>

</div>

<?php /* Nhut sua update loai ngay 24/11 */?>
<script>
    $(function(){
        $('body').delegate('.ui-state-default','click',function(){
            var html = '<option value="0">--- Loại ---</option>';
            $('select[name=type_tour]').find('option').remove();
            if($(this).parent().hasClass('highlight1')){
                html += '<?php foreach($options[0]["option_value"] as $key=>$items){  $count = $key+1; echo "<option value=\"$count\">".$items['name']."</option>";}?>';
                $('select[name=type_tour]').html(html);
            }else{
                html += '<?php foreach($options[1]["option_value"] as $key=>$items){ $count = $key+1; echo "<option value=\"$count\">".$items['name']."</option>";}?>';
                $('select[name=type_tour]').html(html);
            }
        });
    })
</script>
<?php /* end sua update loai ngay 24/11 */ ?>

<div class="clear"></div>

<div class="left">

    <div class="step_title color1"><label>3</label><span>Số lượng khách</span></div>

    <div class="panel panel_option">

        <div class="col_group">

            <label>Người lớn (9 - 99)</label>

            <select class="adults">

                <?php for($i = 0; $i <= 30; $i++){?>

                <option value="<?php echo $i?>"><?php echo $i?></option>

                <?php }?>

            </select>

            <span></span>

        </div>

        <?php if($check_child){?>

        <div class="col_group">

        <label> Trẻ em (5 - <9) </label>

        <select class="children">

        <?php for($i = 0; $i <= 5; $i++){?>

        <option value="<?php echo $i?>"><?php echo $i?></option>

        <?php }?>

        </select>

        <span></span>

        </div>

        <?php } ?>

        <?php if($check_single_room){?>

        <div class="col_group col_single_room">

        <label>Phòng đơn</label>

        <select class="single_room">

        <?php for($i = 0; $i <= 5; $i++){?>

        <option value="<?php echo $i?>"><?php echo $i?></option>

        <?php }?>

        </select>

        <span></span>

        </div>

        <?php } ?>

        <?php if($check_foreign){?>

        <div class="col_group col_foreign">

        <label>Ngoại quốc</label>

        <select class="foreign">

        <?php for($i = 0; $i <= 5; $i++){?>

        <option value="<?php echo $i?>"><?php echo $i?></option>

        <?php }?>

        </select>

        <span></span>

        </div>

        <?php } ?>

    </div>

</div>

<div class="clear"></div>

<?php if($check_maybay){?>

<div class="box_air">

<div class="left">

<div class="panel panel_air">

<div class="col_group">

<label>Người lớn (>12)</label>

<select class="air1">

<?php for($i = 0; $i <= 30; $i++){?>

<option value="<?php echo $i?>"><?php echo $i?></option>

<?php }?>

</select>

<span></span>

</div>

<div class="col_group">

<label> Trẻ em (2 - 12) </label>

<select class="air2">

<?php for($i = 0; $i <= 5; $i++){?>

<option value="<?php echo $i?>"><?php echo $i?></option>

<?php }?>

</select>

<span></span>

</div>

<div class="col_group">

<label> Em bé (0 - 2) </label>

<select class="air3">

<?php for($i = 0; $i <= 5; $i++){?>

<option value="<?php echo $i?>"><?php echo $i?></option>

<?php }?>

</select>

<span></span>

</div>

</div>

</div>

<div class="right">

<div class="panel panel_air">

<label>Chọn loại vé</label>

<select name="type_air" style="width: 150px;">

<?php $count = 1;?>

<?php foreach ($options as $option)  {?>

<?php if ($option['type'] == 'checkbox' && $option['class'] == '1') { ?>

<option value="<?php echo $count; ?>"><?php echo $option['name']; ?></option>

<?php $count++;}?>

<?php }?>



</select>



</div>

</div>

</div>

<?php }?>

<div class="clear"></div>

<?php if($check_single_room){?>

<div class="col_single_room_check col_check"><input type="checkbox" name="col_single_room_check" id="col_single_room_check"/><label for="col_single_room_check">Ở phòng đơn <i class="more_info minitip" title="Nếu Quý khách có nhu cầu muốn ở phòng đơn?"></i></label></div>

<?php }?>



<?php if($check_foreign){?>

<div class="col_foreign_check col_check"><input type="checkbox" name="col_foreign_check" id="col_foreign_check"/><label for="col_foreign_check">Có người ngoại quốc <i class="more_info minitip" title="Nếu trong trong đoàn của Quý khách có người nước ngoài? Vui lòng chọn tùy chọn này!"></i></label></div>

<?php }?>



<?php if($check_maybay){?>

<div class="col_air_check col_check"><input type="checkbox" name="col_air_check" id="col_air_check"/><label for="col_air_check">Kèm vé máy bay <i class="more_info minitip" title="Nếu Quý khách có nhu cầu mua vé máy bay? Vui lòng chọn tùy chọn này để mua kèm vé máy bay"></i></label></div>

<?php }?>

<div class="clear"></div>

<div class="total_panel">

    Tổng tiền: <label></label>

</div>

<!--<div class="note-order"><b>Lưu ý:</b> Giá trên chưa áp dụng giảm giá theo <label>Chương trình khuyến mại Tết Nguyên đán</label>.</div>-->

<?php foreach ($options as $option) { ?>

<?php if ($option['type'] == 'date') { ?>

<div id="option-<?php echo $option['product_option_id']; ?>" class="option_date">

    <input type="hidden" class="departure" name="option[<?php echo $option['product_option_id']; ?>]" />

</div>

<?php } ?>

<?php } ?>

<div class="button_ui" id="button-cart">

    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />

    <!-----------kiem tra co phai la event khong------------>
    <?php
        if(isset($event)){
    ?>
    <input type="hidden" name="checkevent" size="2" value="<?php echo $event; ?>" />
    <?php } ?>
    <!-----------ket thuc kiem tra co phai la event khong------------>

    <a href="javascript:void(0)"><span>THANH TOÁN</span></a>

</div>

</div>

</div>

<div class="action"><button class="btnCancel">Đóng</button></div>

</div>

</div>

<div id="choose-tour">
    <div class="normal">

        <?php foreach ($options as $option) { ?>

        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

        <div id="option-<?php echo $option['product_option_id']; ?>">

            <b><?php echo $option['name']; ?>:</b><br />

            <?php foreach ($option['option_value'] as $option_value) { ?>

            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" id="option-value-<?php echo $option_value['product_option_value_id']; ?>"/>

            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['price']; ?></label>

            <?php } ?>

        </div>

        <?php } ?>

        <?php } ?>

    </div>

    <?php if ($special) { ?>

    <div class="holy1">

        <?php foreach ($options as $option) { ?>

        <?php if ($option['type'] == 'checkbox' && $option['category'] == '2' && $option['class'] == '0') { ?>

        <div id="option-<?php echo $option['product_option_id']; ?>">

            <b><?php echo $option['name']; ?>:</b><br />

            <?php foreach ($option['option_value'] as $option_value) { ?>

            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" id="option-value-<?php echo $option_value['product_option_value_id']; ?>"/>

            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['price']; ?></label>

            <?php } ?>

        </div>

        <?php } ?>

        <?php } ?>

    </div>

    <?php }?>

    <?php if ($check_maybay) { ?>

    <div class="list_air">

        <?php foreach ($options as $option) { ?>

        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

        <div id="option-<?php echo $option['product_option_id']; ?>">

            <b><?php echo $option['name']; ?>:</b><br />

            <?php foreach ($option['option_value'] as $option_value) { ?>

            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][<?php echo $option_value['product_option_value_id']; ?>]" id="option-value-<?php echo $option_value['product_option_value_id']; ?>"/>

            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['price']; ?></label><br />

            <?php } ?>

        </div>

        <?php } ?>

        <?php } ?>

    </div>

    <?php }?>

</div>

<?php }else{?>

<script>

var phonenum_dt = ["6651 6366", "2240 6473", "2210 2465", "3602 2649", "2240 6474", "6651 8167"];

var cellphonenum_dt = ["903 550 236", "903 779 759"];

shuffle(phonenum_dt);

shuffle(cellphonenum_dt);

$(document).ready(function() {

html_phonenum = html_cellphonenum = '';

$.each(phonenum_dt, function( k, v ) {

html_phonenum += '<li><p><i class="fa fa-phone"></i> <span>+84 <i>(08)</i></span> <lable>'+v+'</lable></p></li>';

});

  $.each(cellphonenum_dt, function( k, v ) {

    html_cellphonenum += '<li><p><i class="fa fa-mobile"></i> <span>+84 <i>(0)</i></span> <lable>'+v+'</lable></p></li>';

});

$('#phonenum_dt ul').html(html_phonenum);

$('#cellphonenum_dt ul').html(html_cellphonenum);

});

</script>

<div id="dialog">

<div>

<div class="header">THÔNG TIN LIÊN HỆ<i class="light_close"></i></div>

<div class="content">

Quý khách vui lòng liên hệ theo thông tin sau để đặt tour

<div class="box_phone" id="phonenum_dt">

<ul>

</ul>

</div>

Liên hệ tư vấn về thông tin tour

<div class="box_phone" id="cellphonenum_dt">

<ul>

</ul>

</div>

Mọi thắc mắc vui lòng gửi về địa chỉ email:

        <div class="box_phone" style="text-align: center;">

<a href="mailto:sales@vietfuntravel.com.vn">sales@vietfuntravel.com.vn</a>

</div>

<i class="light_header"></i>

</div>

<div class="action"><button class="btnCancel">Đóng</button></div>

</div>

</div>

<?php }?>

</div>

<script>
    $(function(){

        var event = $('.event_price');
        if(event.length > 0 && $('.check_event_class').length > 0 ){
            var event_price = 0;
            event.each(function(){
                var str = $(this).text();
                    str = str.split("₫");
                var price = str[0].replace('.','');
                    price = parseInt(price.replace('.',''));

                    if( event_price == 0){
                        event_price = price;
                    }else{
                        if(event_price > price){
                            event_price = price;
                        }
                    }
            });

            var left = $('.price').find('div.left').first();
            var event_get = left.find('label').text();

            var html = '<div class="left"><p>Giá ngày Tết <br>(chưa giảm):</p><p style="text-align: center;"></p><label>'+ event_get +'</label></div>';

            left.find('label').text(showNumber(String(event_price)) +'₫');

            left.after(html);

            $('.product-info .price >.left').attr('style','margin: 2px !important');
            $('.product-info .price >.left').find('label').attr('style','font-size: 16px;');
            $('.sale-of').attr('style','margin-left: 7px;');
        }
    })
</script>

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

        var type_tour = $('select[name="type_tour"]');

        if(type_tour.find(":selected").val() == 0){

            alert('Vui lòng chọn loại dịch vụ!');

            return false;

        }

        var adults = $('.adults');

        if(adults.find(":selected").val() == 0){

            alert('Vui lòng chọn ít nhất 1 người lớn!');

            return false;

        }
        $.ajax({

            url: 'index.php?route=checkout/cart/add',

            type: 'post',

            data: $('.cart-dialog-content input[type=\'text\'], .cart-dialog-content input[type=\'hidden\'], .cart-dialog-content input[type=\'radio\']:checked, .cart-dialog-content input[type=\'checkbox\']:checked, .cart-dialog-content select, .cart-dialog-content textarea'),

            dataType: 'json',

            success: function(json) {
//                console.log(json);return false;

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

<?php if($options && $price){?>

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



  <?php if ($special) { ?>

var dates1 = [<?php while (strtotime($promotion_date_start) <= strtotime($promotion_date_end)) {

  echo '"'.$promotion_date_start.'",';

  $promotion_date_start = date ("m/d/Y", strtotime("+1 day", strtotime($promotion_date_start)));}?>];

<?php }else{?>

var dates1 = [];

<?php }?>

var monthProduct = 2;

if(getWidthBrowser() < 767){

var monthProduct = 1;

}

var date_current = new Date;

var current = new Date(date_current.getMonth()+1+"/"+(date_current.getDate() + <?php echo $delay_book?>)+"/"+date_current.getFullYear());

var maxdate=new Date("12/01/"+(date_current.getFullYear()+3));

$(".list-datepicker").datepicker({gotoCurrent:!0,changeMonth:!0,changeYear:!0,minDate:current,maxDate:maxdate,numberOfMonths:monthProduct,beforeShowDay: highlightDays,onSelect: chooseDay, dateFormat: 'dd/mm/yy', altField: ".departure"})

function highlightDays(date) {

for (var i = 0; i < dates1.length; i++) {

if (new Date(dates1[i]).toString() == date.toString()) {

return [true, 'highlight1'];

}

}



return [true, ''];

}

chooseDay($('.departure').val());

function chooseDay(date) {

//console.log(date);

var res = date.split("/");

var dateChoose = res[1]+"/"+res[0]+"/"+res[2];

setCookie('type-tour','.normal',24*60*60*1000);

setCookie('date-choose',date,24*60*60*1000);

for (var i = 0; i < dates1.length; i++) {

if (dates1[i].toString() == dateChoose.toString()) {

setCookie('type-tour','.holy1',24*60*60*1000);

setCookie('date-choose',date,24*60*60*1000);

break;

}

}

//console.log(getCookie('type-tour'));

$('select[name="type_tour"]').trigger('change');

$('select[name="type_air"]').trigger('change');

$(".panel_date").toggle();

$(".note").toggle();

$(".date_selected").toggle();

$("#button-cart").toggle();

$(".total_panel").toggle();

$(".note-order").toggle()

$(".date_selected span").text(date);

}

$(".panel_date").show();

$(".note").show();

$(".date_selected").hide();

$("#button-cart").hide();

$(".total_panel").hide();

$(".note-order").hide();



$(".date_selected label a").click(function(){

$(".panel_date").toggle();

$(".note").toggle();

$(".note-order").toggle();

$(".date_selected").toggle();

$("#button-cart").toggle();

$(".total_panel").toggle();

})

});

//--></script>

<?php }?>



<script>

function showElement(e){

    $(e).fadeIn('fast');

}

function hideElement(e){

    $(e).fadeOut('fast');

    $(e).find('select option').prop("selected", false);

}

function ConvertToNumb(e){

    for (var i = 0, t = e.length; i < t; i++) {

        e = e.replace('.','');

        e = e.replace('₫','');

    }

    return e;

}

function total_panel(){

    /***Khai Bao***/

    //

    var pri_adults = pri_children = pri_single_room = pri_foreign = pri_air1 = pri_air2 = pri_air3 = total_pri = total_pri_air = 0;

    var adults = $('.adults');
    var children = $('.children');

    var single_room = $('.single_room');

    var foreign = $('.foreign');

    //

    var air1 = $('.air1');

    var air2 = $('.air2');

    var air3 = $('.air3');



    /***Tính***/

    /***kiem tra nhom tren 5 khach va duoi 5 khach***/
//    var product_id = $('input[name=product_id]').val();
    var checkevent = $('input[name=checkevent]').val();
    var sum_down   = 0;
    var date = getCookie('date-choose').split('/');
    var date_ch = Date.parse(date[2]+'-'+date[1]+'-'+date[0]);
    if(date_ch >= Date.parse('2015-12-23') && date_ch <= Date.parse('2016-01-03')){
        if(checkevent && (parseInt(adults.find(":selected").val()) >= 5)){
            
            var value_down = '<?php echo $end; ?>';
            
            var pri_adults = ConvertToNumb((adults.find(":selected").val()) * ConvertToNumb(adults.next().text()) - (ConvertToNumb(adults.find(":selected").val()) * ConvertToNumb(value_down)));
                var html_down = '<table style="width:100%">';
                    html_down += '<tr style="line-height: 20px">';
                    html_down += '<td style="text-align: right; width:40%;">Tổng tiền: </td>';
                    html_down += '<td style="text-align:left"><label class="default_price"> ' + showNumber(String(sum_down)) + '₫ </label></td>';
                    html_down += '</tr>';
                    html_down += '<tr style="line-height: 20px">';
                    html_down += '<td style="text-align: right; width:40%;">Giảm: </td>';
                    html_down += '<td style="text-align:left"><strong> '+ showNumber(String(adults.find(":selected").val() * '<?php echo $end; ?>'))+ '₫' + '</strong></td>';
                    html_down += '</tr>';
                    html_down += '<tr style="line-height: 20px">';
                    html_down += '<td style="text-align: right; width:40%;">Tổng tiền thanh toán: </td>';
                    html_down += '<td style="text-align:left"><label> ' + showNumber(String(pri_adults)) + '₫ </label></td>';
                    html_down += '</tr>';
                    html_down +='</table>';
            $('.total_panel').html(html_down);
             sum_down = parseInt(adults.find(":selected").val()) * parseInt(value_down);
        }else {
            if (checkevent && (parseInt(adults.find(":selected").val()) < 5)){
                var value_down = '<?php echo $start; ?>';
                var pri_adults = ConvertToNumb((adults.find(":selected").val()) * ConvertToNumb(adults.next().text()) - (ConvertToNumb(adults.find(":selected").val()) * ConvertToNumb(value_down)));
                var html_down = '<table style="width:100%">';
                    html_down += '<tr style="line-height: 20px">';
                    html_down += '<td style="text-align: right; width:40%;">Tổng tiền: </td>';
                    html_down += '<td style="text-align:left"><label class="default_price"> ' + showNumber(String(sum_down)) + '₫ </label></td>';
                    html_down += '</tr>';
                    html_down += '<tr style="line-height: 20px">';
                    html_down += '<td style="text-align: right; width:40%;">Giảm: </td>';
                    html_down += '<td style="text-align:left"><strong> '+ showNumber(String(adults.find(":selected").val() * '<?php echo $start; ?>'))+ '₫' + '</strong></td>';
                    html_down += '</tr>';
                    html_down += '<tr style="line-height: 20px">';
                    html_down += '<td style="text-align: right; width:40%;">Tổng tiền thanh toán: </td>';
                    html_down += '<td style="text-align:left"><label> ' + showNumber(String(pri_adults)) + '₫ </label></td>';
                    html_down += '</tr>';
                    html_down +='</table>';
                $('.total_panel').html(html_down);
                sum_down = parseInt(adults.find(":selected").val()) * parseInt(value_down);

            }else{
                $('.note_down').remove();
                var pri_adults = parseInt(adults.find(":selected").val()) * ConvertToNumb(adults.next().text());
            }
        }
    }else{
        var pri_adults = parseInt(adults.find(":selected").val()) * ConvertToNumb(adults.next().text());
        $('.total_panel').html('Tổng tiền: <label>'+pri_adults+'</label>');
    }
    /***ket thuc kiem tra nhom tren 5 khach va duoi 5 khach***/

//    var pri_adults = parseInt(adults.find(":selected").val()) * ConvertToNumb(adults.next().text()); // tinh gia nguoi lon nguyen thuy

    var pri_children = parseInt(children.find(":selected").val()) * ConvertToNumb(children.next().text());

    if(single_room.next().text()){

        var pri_single_room = parseInt(single_room.find(":selected").val()) * ConvertToNumb(single_room.next().text());

        console.log(pri_single_room);

    }

    if(foreign.next().text()){

        var pri_foreign = parseInt(foreign.find(":selected").val()) * ConvertToNumb(foreign.next().text());

    }

    //

    if(air1.next().text()){

        var pri_air1 = parseInt(air1.find(":selected").val()) * ConvertToNumb(air1.next().text());

    }

    if(air2.next().text()){

        var pri_air2 = parseInt(air2.find(":selected").val()) * ConvertToNumb(air2.next().text());

    }

    if(air3.next().text()){

        var pri_air3 = parseInt(air3.find(":selected").val()) * ConvertToNumb(air3.next().text());

    }

    /***Tổng***/

    total_pri = parseInt(pri_adults) + parseInt(pri_children) + parseInt(pri_single_room) + parseInt(pri_foreign);

    total_pri_air = parseInt(pri_air1) + parseInt(pri_air2) + parseInt(pri_air3);

    total = total_pri + total_pri_air;

    default_price = total + sum_down;

    // alert(default_price);
    if(total > 0) {
        
        $('.total_panel label').text(showNumber(String(total)) + '₫');
    }else{
        $('.total_panel label').text(showNumber(String(0)) + '₫');
    }

    $('.default_price').html(showNumber(String(default_price)) + '₫');

}

$(document).ready(function() {

    $('#col_foreign_check').change(function(){

        var foreign = '.col_foreign';

        $(this).prop("checked")?showElement(foreign):hideElement(foreign);

        total_panel();

    });



    $('#col_single_room_check').change(function(){

        var single_room = '.col_single_room';

        $(this).prop("checked")?showElement(single_room):hideElement(single_room);

        total_panel();

    });



    $('#col_air_check').change(function(){

        var single_room = '.box_air';

        $(this).prop("checked")?showElement(single_room):hideElement(single_room);

        total_panel();

    });



    $('select[name="type_tour"]').bind('change',function(){

        var index = $(this).find(":selected").index() - 1;

        var Choose = $('#choose-tour > '+ getCookie('type-tour') +' > div');

        //adults

        if(index >= 0){

            var NameAdults = Choose.eq(0).find('input').eq(index).attr('name');

            var spanNameAdults = Choose.eq(0).find('input').eq(index).next().text();

            $('.adults').attr('name',NameAdults);

            $('.adults').next().text(spanNameAdults);


            //children

            var NameChildren = Choose.eq(1).find('input').eq(index).attr('name');

            var spanNameChildren = Choose.eq(1).find('input').eq(index).next().text();

            $('.children').attr('name',NameChildren);

            $('.children').next().text(spanNameChildren);



            //SingleRoom

            var NameSingleRoom = Choose.eq(2).find('input').eq(index).attr('name');
            var SingleRoomCount = Choose.eq(2).find('input').length;
            if(NameSingleRoom){

                var spanNameSingleRoom = Choose.eq(2).find('input').eq(index).next().text();

            }else{

                var spanNameSingleRoom = Choose.eq(2).find('label').text();

            }
            if(typeof NameSingleRoom == 'undefined' && SingleRoomCount > 1){
                var spanNameSingleRoom = 0;
            }
            $('.single_room').attr('name',NameSingleRoom);

            $('.single_room').next().text(spanNameSingleRoom);



            //Foreign

            var NameForeign = Choose.eq(3).find('input').eq(index).attr('name');
            var ForeignCount = Choose.eq(3).find('input').length;
            if(NameForeign){

                var spanNameForeign = Choose.eq(3).find('input').eq(index).next().text();

            }else{

                var spanNameForeign = Choose.eq(3).find('label').text();

            }
            if(typeof NameForeign == 'undefined' && ForeignCount > 1){
                var spanNameForeign = 0;
            }
            $('.foreign').attr('name',NameForeign);

            $('.foreign').next().text(spanNameForeign);



        }else{

            $('.adults').attr('name','');

            $('.adults').next().text(0);



            $('.children').attr('name','');

            $('.children').next().text(0);



            $('.single_room').attr('name','');

            $('.single_room').next().text(0);



            $('.foreign').attr('name','');

            $('.foreign').next().text(0);

        }

        total_panel();

    });



    $('.adults,.children,.single_room,.foreign,.air1,.air2,.air3').change(function(){

        total_panel();

    })



    $('select[name="type_tour"]').trigger('change');



    $('select[name="type_air"]').bind('change',function(){

        var index = $(this).find(":selected").index();

        var Choose = $('#choose-tour > .list_air > div');



        //air1

        var Air1 = Choose.eq(index).find('input').eq(0).attr('name');

        var spanAir1 = Choose.eq(index).find('input').eq(0).next().text();

        $('.air1').attr('name',Air1);

        $('.air1').next().text(spanAir1);



        //air2

        var Air2 = Choose.eq(index).find('input').eq(1).attr('name');

        var spanAir2 = Choose.eq(index).find('input').eq(1).next().text();

        $('.air2').attr('name',Air2);

        $('.air2').next().text(spanAir2);



        //air3

        var Air3 = Choose.eq(index).find('input').eq(2).attr('name');

        var spanAir3 = Choose.eq(index).find('input').eq(2).next().text();

        $('.air3').attr('name',Air3);

        $('.air3').next().text(spanAir3);



    });



    $('select[name="type_air"]').trigger('change');



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