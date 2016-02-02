<?php if($coupon_status) { ?>
<div class="cart-module" style="display:none">
  <div class="cart-heading"><?php echo $coupon_heading_title; ?></div>
  <div class="cart-content" id="coupon"><?php echo $entry_coupon; ?>&nbsp;<br />
    <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
    &nbsp;<a id="button-coupon" class="button"><span><?php echo $button_coupon; ?></span></a></div>
</div>
<?php } ?>
<?php if($reward_status) { ?>
<div class="cart-module" style="display:none">
  <div class="cart-heading"><?php echo $reward_heading_title; ?></div>
  <div class="cart-content" id="reward"><?php echo $entry_reward; ?>&nbsp;<br />
  <input type="text" name="reward" value="<?php echo $reward; ?>" />
  &nbsp;<a id="button-reward" class="button"><span><?php echo $button_reward; ?></span></a></div>
</div>
<?php } ?>
<?php if($voucher_status) { ?>
<div class="cart-module" style="display:none">
  <div class="cart-heading"><?php echo $voucher_heading_title; ?></div>
  <div class="cart-content" id="voucher"><?php echo $entry_voucher; ?>&nbsp;<br />
    <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
    &nbsp;<a id="button-voucher" class="button"><span><?php echo $button_voucher; ?></span></a></div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('.cart-module .cart-heading').bind('click', function() {
	if ($(this).hasClass('active')) {
		$(this).removeClass('active');
	} else {
		$(this).addClass('active');
	}
		
	$(this).parent().find('.cart-content').slideToggle('slow');
});
//--></script>