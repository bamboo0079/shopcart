<div>
	<p><b><?php echo $text_checkout_option; ?></b></p>
    <p><input type="text" name="email" value="" placeholder="Email người dùng" size="30"/></p>
    <p><input type="password" name="password" value="" placeholder="Mật khẩu" size="20"/></p>
    <p><a id="button-login" class="button"><?php echo $button_login; ?></a></p>
    <p><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></p>
</div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-login').click();
	}
});
//--></script>   