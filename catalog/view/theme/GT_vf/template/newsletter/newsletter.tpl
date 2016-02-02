<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="content_info"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <div class="content-wrap">
  	<div class="box_left_newsletter">
	<h3>Đăng ký nhận thông tin</h3>
	<form name="newsletter_box" id="newsletter_box" method="POST" action="index.php?route=newsletter/confirm">
    	<input type="text" id="name_newsletter" name="name" placeholder="Tên bạn là..." data-validation="required" data-validation-error-msg="Vui lòng nhập Tên">
        <input type="text" id="email_newsletter" name="email" placeholder="Email" data-validation="email" data-validation-error-msg="Vui lòng nhập Email hợp lệ">
        <div class="button" id="submit_newsletter">ĐĂNG KÝ NGAY</div>
    </form>
</div>
    <div class="box_right_newsletter">
        <h3>Viet Fun Travel cam kết</h3>
        <ul>
            <li>Chỉ gởi tối đa 2 email mỗi tuần.</li>
            <li>Không tiết lộ thông tin với bất kỳ bên thứ 3 nào.</li>
            <li>Bất cứ khi nào bạn không muốn nhận tin ưu đãi nữa, bạn có thể hủy đăng ký nhận tin bằng cách nhấn vào nút unsubscribe dưới mỗi email.</li>
        </ul>
        <div class="bg_newsletter_form"><img src="<?php echo HTTP_SERVER?>image/data/banner_newsletter_form.jpg"/></div>
    </div>
    <div class="end_content_info">
        <div class="return_home"><i class="icon-home"></i><a href="/" title="Trang chủ Viet Fun Travel">Về Trang Chủ</a></div>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript" src="catalog/view/javascript/jquery/form-validator/jquery.form-validator.min.js"></script>
<script>
$.validate({
	validateOnBlur : false, // disable validation when input looses focus
    errorMessagePosition : 'top', // Instead of 'element' which is default
    scrollToTopOnError : false // Set this property to true if you have a long form
  });
$('#submit_newsletter').click(function(){
	$('#newsletter_box').submit();
});
</script>
<?php echo $footer; ?>