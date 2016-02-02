<?php echo (isset($footer_top) ? $footer_top : ''); ?>
<?php echo $footer_top_tag_content; ?>
<script type="text/javascript">
    $(function(){

        var arr = [];
        var div = $('.scroll');
        var i = -1;
        div.each(function(){
            i++;
            var scroll_height = $(this).offset().top;
            arr[i] = scroll_height;
        });
        var footer_top = $('.footer_top').offset().top;
        $(window).scroll(function(){
            var height_top = $(this).scrollTop();
            var j = -1;
            var e = 0;
            div.each(function(){
                j++;
                var div_height = $(this).offset().top;
                var height_one = $(this).height();
                if(j == 0){
                    e = 0;
                }else{
                    e = e + $(this).prev().height() + 10;
                }
                if(height_top >= (arr[j] - e - height_one)){
                    $(this).css('position','fixed');
                    $(this).css('top', e);
                    $(this).css('width','15.7%');
                    $(this).css('z-index','10');
                    $(this).css('background','#fff');
                }else{
                    if(parseInt(height_top) <= div_height ){
                        $(this).removeAttr('style');
                    }
                }
            });
            var footer = $('.clear').offset().top;
            if(height_top >= footer - 200){
                $('.scroll').css('z-index','-1');
            }

        });
    });
</script>
<div class="footer_top clear">
	<div class="col">
    	<label class="tit"><?php echo $text_service?></label>
    	<ul>
        	<li><a href="<?php echo $payment?>" rel="nofollow"><?php echo $text_payment?></a></li>
            <li><a href="<?php echo $tuts?>" rel="nofollow"><?php echo $text_tuts?></a></li>
            <li><a href="<?php echo $policy_protect?>" rel="nofollow"><?php echo $text_policy_protect?></a></li>
            <li><a href="<?php echo $policy_cancel?>" rel="nofollow"><?php echo $text_policy_cancel?></a></li>
        </ul>
    </div>
    <div class="col">
    	<label class="tit"><?php echo $text_information?></label>
    	<ul>
        	<li><a href="<?php echo $about?>"><?php echo $text_about?></a></li>
            <li><a href="<?php echo $work?>" rel="nofollow"><?php echo $text_work?></a></li>
            <li><a href="<?php echo $sitemap?>"><?php echo $text_sitemap?></a></li>
            <li><a href="<?php echo $contact?>"><?php echo $text_contact?></a></li>
        </ul>
    </div>
    <div class="col">
    	<label class="tit"><?php echo $text_list_promotion?></label>
    	<ul>
        	<?php foreach ($tour_promotion as $name => $url) { ?>
            <li><a href="<?php echo $url; ?>" target="_blank" rel="nofollow"><?php echo $name; ?></a></li>
            <?php } ?>
        </ul>
    </div>
    <div class="col">
    	<label class="tit"><?php echo $text_feedback?></label>
    	<?php echo $text_feedback_content?>
    </div>
</div>
<div class="footer_top_newsleter clear">
	<i class="icon-letter"></i>
	<div class="newsletter_title">
    	<label><?php echo $text_newsletter_title_label?></label>
        <span><?php echo $text_newsletter_title_em?></span>
    </div>
    <form name="newsletter" method="POST" class="newsletter" action="newsletter/confirm">
        <input type="text" name="name" id="newsletter_name" placeholder="Tên Quý khách là...">
        <input type="text" name="email" id="newsletter_email" placeholder="Email">
        <i class=" sprites button_register hover_opa" id="dangky"><?php echo $text_newsletter_button?></i>
    </form>
</div>
<div id="messagebox">
    <p id="messagebox-heading"> Đang chuyển đổi...</p>
    <p id="messagebox-description"> Vui lòng chờ trong giây lát</p>
    <span class="icon_loading"></span>
</div>

<script>
function modRegisterMailInt() {
    $("#dangky").click(function () {
        re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!re.test($('#newsletter_email').val())) {
            alert('Vui lòng điền Email');
            $("#newsletter_email").val("");
            return;
        }
		if ($('#newsletter_name').val() < 1) {
            alert('Vui lòng điền Tên');
            $("#newsletter_name").val("");
            return;
        }
        document.newsletter.submit();
    });

}
modRegisterMailInt();
</script>
<div id="footer">
  <div id="footer_left">
    <div class="footer-title"><?php echo $store?></div>
    <ul class="footer_list">
      <li><span class="bold"><?php echo $text_address?></span> : <?php echo $address?></li>
      <li><span class="bold"><?php echo $text_phone?></span> : <?php echo $telephone?></li>
      <li><span class="bold"><?php echo $text_fax?></span> : <?php echo $fax?> - <span class="bold"><?php echo $text_email?></span> : <?php echo $config_email?></li>
      <li><span class="bold"><?php echo $text_copy?></span><h2><a href="<?php echo $home?>" title="Tour Du Lịch Việt Nam 2015 - Viet Fun Travel - Du Lịch Việt Vui" target="_blank"><?php echo $text_copy2 ?></a></h2></li>
    </ul>
  </div>
  <div id="footer_center"><a href="http://www.dmca.com/Protection/Status.aspx?ID=024d99c3-0895-4582-9666-fc09f74a37d4" rel="nofollow"><img src="/image/data/logo/dmca.png" title="Bản quyền chống copy DMCA" alt="Bản quyền chống copy DMCA" width="200" /></a></div>
  <div id="footer_right"><a href="<?php echo $home?>" rel="nofollow"><img src="<?php echo $logo; ?>" title="<?php echo $store; ?>" alt="<?php echo $store; ?>" /></a></div>
  <div class="clear"></div>
  <div id="footer-link">
  <?php echo $footer_content?>
  </div>
</div>
<div class="phone_contact">
<div class="tv">
    <div class="tag_hotline">
         <span>TƯ VẤN</span>
         <span class="arrow_hotline"></span>
      </div>
    <ul>
    </ul>
</div>
<div class="dt">
    <div class="tag_hotline">
         <span>ĐẶT TOUR</span>
         <span class="arrow_hotline"></span>
      </div>
    <ul>
    </ul>
</div>
</div>
<div id="scrolltop"></div>
<?php echo $footer_bottom; ?>
</div>
<?php if($display_float_ads){?>
<?php if($float_left_ads){?>
<div class="float_left_ads" style="top:<?php echo $float_ads_top?>px"><?php echo $float_left_ads?></div>
<?php }?>
<?php if($float_right_ads){?>
<div class="float_right_ads" style="top:<?php echo $float_ads_top?>px"><?php echo $float_right_ads?></div>
<?php }?>
<?php }?>
<noscript>
<div class="alert-javascript">
<p>Quý khách vui lòng bật chức năng <span>Javascript</span> trên trình duyệt và tải lại trang để truy cập và sử dụng dịch vụ.
<br /><br />
<a href="http://javascripton.com/vi/enable-javascript-internet-explorer/" target="_blank" rel="nofollow">Xem hướng dẫn <span>Bật Javascript</span></a>
</p>
</div>
</noscript>
</body></html>
