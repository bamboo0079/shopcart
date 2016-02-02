<?php $config_template = "TAL_vf";?>
<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<?php 
if (strpos($_SERVER['SERVER_NAME'],'vietfuntravel.com.vn') == false) {?>
<meta name="robots" content="noindex, follow">
<meta name="robots" content="index, nofollow">
<meta name="robots" content="noindex, nofollow">
<?php }?>

                    
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($meta as $item) { ?>
<meta name="<?php echo $item['name']?>" content="<?php echo $item['content']?>" />
<?php }?>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" >
<meta name="author" content="VietFunTravel" />
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config_template;?>/stylesheet/stylesheet.css?v=0804" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config_template;?>/stylesheet/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config_template;?>/stylesheet/slicknav.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config_template;?>/stylesheet/style.css?v=0804" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config_template;?>/stylesheet/responsive.css?v=0804" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" href="catalog/view/javascript/jquery/customscrollbar/jquery.mCustomScrollbar.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/animate.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/marquee.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/customscrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/easyTooltip.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.slicknav.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $("#atc-check").validate();
    });
</script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
</head>
<body>
<div id="main_header_top">
  <div class="cmn_head">
    <div class="content_flag"> <a href="<?php echo $home; ?>" title="Tiếng việt" rel="nofollow"><img alt="Tiếng việt" src="/image/flags/vn.gif"></a> <a href="http://vietfuntravel.com" title="Tiếng anh" target="_blank" rel="nofollow"><img alt="Tiếng anh" src="/image/flags/gb.gif"></a> </div>
    <ul class="mtab">
      <li><i class="fa fa-home"></i> <a href="<?php echo $home?>" title="<?php echo $text_home?>"><?php echo $text_home?></a></li>
      <li><i class="fa fa-globe"></i> <a href="<?php echo $news?>" title="<?php echo $text_news?>"><?php echo $text_news?></a></li>
      <li><i class="fa fa-list-alt"></i> <a href="<?php echo $about?>" title="<?php echo $text_about?>"><?php echo $text_about?></a></li>
      <li><i class="fa fa-bookmark"></i> <a href="<?php echo $guide_booking?>" rel="nofollow" title="<?php echo $text_guide_booking?>"><?php echo $text_guide_booking?></a></li>
      <li><i class="fa fa-share"></i> <a href="<?php echo $guide_payment?>" rel="nofollow" title="<?php echo $text_guide_payment?>"><?php echo $text_guide_payment?></a></li>
        <li class="check"><i class="fa fa-paste"></i> <a href="javascript:void(0)" rel="nofollow" title="<?php echo $text_guide_order?>"><?php echo $text_guide_order;?></a></li>
      <li><i class="fa fa-user"></i>
          <?php if (!$logged) { ?>
          <a href="<?php echo $account?>" rel="nofollow" title="<?php echo $text_account?>"><?php echo $text_account?></a>
          <?php } else { ?>
          <a class="user-active" href="<?php echo $account?>" rel="nofollow" title="<?php echo $text_user?>"><?php echo $text_user?></a>
          <?php } ?>
      </li>
    </ul>
  </div>
</div>
<div id="container">
<div id="header">
  <!--<?php if($this->request->server['QUERY_STRING'] == 'route=common/home' || $this->request->server['QUERY_STRING'] == ''){ ?>
  <h1 id="logo"><a href="<?php echo $home; ?>" title="Tour Du Lịch Việt Nam 2015 - Viet Fun Travel - Du Lịch Việt Vui"><img src="http://www.vietfuntravel.com.vn/image/tour-du-lich-viet-nam-viet-fun-travel.png" alt="Tour Du Lịch Việt Nam - Viet Fun Travel - Du Lịch Việt Vui" /><strong>Tour Du Lịch Việt Nam 2015 - Viet Fun Travel - Du Lịch Việt Vui</strong></a></h1>
  <?php }else{ ?>
  <div id="logo"><a href="<?php echo $home; ?>" title="Tour Du Lịch Việt Nam 2015 - Viet Fun Travel - Du Lịch Việt Vui"><img src="<?php echo $logo; ?>" alt="Logo Du Lịch Việt Vui - Viet Fun Travel" /></a></div>
  <?php }?>-->
    <h1 id="logo"><a href="<?php echo $home; ?>" title="Tour Du Lịch Việt Nam 2015 - Viet Fun Travel - Du Lịch Việt Vui"><img src="<?php echo $logo;?>" alt="Tour Du Lịch Việt Nam - Viet Fun Travel - Du Lịch Việt Vui" /><strong>Tour Du Lịch Việt Nam 2015 - Viet Fun Travel - Du Lịch Việt Vui</strong></a></h1>
  <div class="hotline_content">
  <!--    <ul class="tv"></ul>
      <ul class="dt"></ul> dành cho số điện thoại di động random--->
        <div class="spt-w"><img src="<?php echo (isset($image_support) ? $image_support : '');?>" title="Vietfuntravel Support"></div>
  </div>
  <div class="open_door">
      <label class="hours">GIỜ</label>
      <span class="tim">Mở cửa - 7:00</span>
      <span class="tim">Đóng cửa - 21:00</span>
      <label class="desc">(Hoạt động cả chủ nhật và ngày lễ)</label>
  </div>
    <div class="order-check">
        <div class="empty check-oder">
            <span><?php echo $text_guide_order_title;?></span>
            <form name="atc-check" id="atc-check" action="<?php echo $action;?>" method="POST">
                <ul class="account_list check_content">
                    <li><i class="fa fa-qrcode"></i>
                        <input data-rule-required="true" data-msg-required="<?php echo $text_guide_order_code_error;?>" placeholder="<?php echo $text_guide_order_code;?>" type="text" name="order_code" >
                    </li>
                    <li><i class="fa fa-phone"></i><input data-rule-required="true" data-rule-number="true" data-msg-number="<?php echo $text_guide_order_phone_number_error;?>" data-msg-required="<?php echo $text_guide_order_phone_error;?>" placeholder="<?php echo $text_guide_order_phone;?>" type="text" name="phone">
                    </li>
                    <li><input type="submit" value="Xem Đơn Hàng"></li>
                </ul>
            </form>
        </div>
    </div>
    <div class="top-cart-content">
        <div class="empty">
            <ul class="account_list">
                <li><a href="<?php echo $edit; ?>"><i class="fa fa-info-circle"></i> <?php echo $text_edit; ?></a></li>
                <li><a href="<?php echo $password; ?>"><i class="fa fa-eye-slash"></i> <?php echo $text_password; ?></a></li>
                <li><a href="<?php echo $order; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o"></i> <?php echo $text_newsletter; ?></a></li>
                <li><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i> <?php echo $text_logout_header; ?></a></li>
            </ul>
        </div>
    </div>
  <div id="search">
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" autocomplete="off" />
    <span class="button-search"><i class="iconw-search"></i></span>
  </div>
  <?php echo $language; ?> <?php echo $currency; ?> <?php echo $cart; ?><span class="call_button_mobile"></span>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php $count = 1;?>
    <?php foreach ($categories as $category_1) { ?>
    <li<?php if ($category_1['children']) { ?> class="arrow"<?php } ?>><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
      <?php if ($category_1['children']) { ?>
      <div class="<?php if ($category_1['children'][0]['children']) { ?>col<?php } ?>">
        <ul>
          <?php foreach($category_1['children'] as $category_2){?>
          <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
            <?php if ($category_2['children']) { ?>
            <div>
              <ul>
                <?php foreach($category_2['children'] as $category_3){?>
                <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a> </li>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>
          </li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
    </li>
    <?php if($count == 2){?>
    <li class="arrow"><a href="<?php echo $tour_xv?>"><?php echo $text_tour_xv?></a>
      <div class="col">
          <ul>
              <li><a href="javascript:void(0)" rel="nofollow"><?php echo $text_tour_dkh?></a>
                  <div>
                      <ul>
                          <?php foreach($tour_dkh as $item){?>
                            <li><a href="<?php echo $item['href']?>" rel="nofollow"><?php echo $item['name']?></a></li>
                            <?php }?>
                        </ul>
                    </div>
                </li>
                <li><a href="javascript:void(0)" rel="nofollow"><?php echo $text_tour_xv1?></a>
                  <div>
                      <ul>
                          <?php foreach($tour_xv1 as $item){?>
                            <li><a href="<?php echo $item['href']?>" rel="nofollow"><?php echo $item['name']?></a></li>
                            <?php }?>
                        </ul>
                    </div>
                </li>
                <li><a href="javascript:void(0)" rel="nofollow"><?php echo $text_tour_xv2?></a>
                  <div>
                      <ul>
                          <?php foreach($tour_xv2 as $item){?>
                            <li><a href="<?php echo $item['href']?>" rel="nofollow"><?php echo $item['name']?></a></li>
                            <?php }?>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </li>
    <li class="arrow"><a href="javascript:void(0)" rel="nofollow"><?php echo $text_tour_date?></a>
      <div class="col coltn">
          <ul>
              <?php foreach($tour_tn as $key => $item_1){?>
              <li><a href="<?php echo $item_1['href']?>" <?php if($key>3){echo 'rel="nofollow"';}?> ><?php echo $item_1['name']?></a>
                  <div>
                      <ul>
                          <?php foreach($item_1['level_2_data'] as $item_2){?>
                            <li><a href="<?php echo $item_2['href']?>" rel="nofollow"><?php echo $item_2['name']?></a></li>
                            <?php }?>
                        </ul>
                    </div>
                </li>
                <?php }?>
            </ul>
        </div>
    </li>
    <?php }?>
    <?php if($count == 4){?>
    <li><a href="javascript:void(0)" style="font-style: italic;"><?php echo $text_tour_promotion?> <span class="img_km"></span></a>
      <div style="margin-left:2px;">
          <ul>
              <?php foreach($tour_promotion as $k => $i){?>
                  <li class="even-he"><a href="<?php echo $i; ?>" target="_blank"><?php echo $k; ?></a> </li>
                <?php }?>
            </ul>
        </div>
    </li>
    <?php }?>
    <?php $count++;} ?>
  </ul>
</div>
<div id="menu-mobile">
</div>
<?php } ?>
<?php if ($error) { ?>
<div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<div id="notification"></div>
<script>
  (function() {
    var cx = '009449943754805903444:j-fpcqjiphk';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.user-active').on('hover',function(){
            $('.top-cart-content').show();
            $('.order-check').hide();
        });
        $('.top-cart-content').on('mouseleave',function(){
            $(this).hide();
        });
        $('.check').on('click',function(){
            $('.top-cart-content').hide();
            $('.order-check').toggle();
        });
        $('form[name=atc-check]').on('submit',function(){
            var input =  $('input[name=order_code]');
            var phone = $('input[name=phone]');
            if(input.val() == '' && phone.val() == ''){
                input.addClass('error');
                phone.addClass('error');
                return false;
            }else {
                if (input.val() == '') {
                    input.addClass('error');
                    input.css('border-color', 'red');
                    return false;
                } else {
                    input.removeClass('error');
                    input.addClass('valid');
                    input.css('border-color', '#96b796');
                }
                if (phone.val() == '' || phone.val().length < 9 || phone.val().length > 12 || (!intRegex.test(phone.val()))) {
                    phone.addClass('error');
                    phone.css('border-color', 'red');
                    return false;
                } else {
                    phone.removeClass('error');
                    phone.addClass('valid');
                    phone.css('border-color', '#96b796');
                }
            }
        });
    });
</script>
<div class="box-thongbao">
  <marquee scrollamount="2" onmouseover="this.stop()" onmouseout="this.start()" class="mar-thongbao">Công ty TNHH Du lịch Việt Vui - Viet Fun Travel có <span class="bold">trụ sở duy nhất</span> tại số <span class="bold">28/13 Bùi Viện, P.Phạm Ngũ Lão, Quận 1, TP. Hồ Chí Minh</span>. Ngoài địa chỉ giao dịch trên, Viet Fun Travel <span class="bold">không có bất kỳ chi nhánh</span> hay văn phòng nào khác. Vậy Quý khách hết sức lưu ý để <span class="bold">tránh nhầm lẫn</span> hoặc làm việc với các đối tượng <span class="bold">mạo danh Viet Fun Travel</span>. </marquee>    
</div>
<div class="box-search">
  <gcse:search></gcse:search>
</div>

