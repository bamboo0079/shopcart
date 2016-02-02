<div id="reg-cpanle" class="divclear">
  <div class="left">
  	<span class="required">*</span> <?php echo $entry_password; ?><br />
  	<input type="password" name="password" value="" class="small-field" placeholder="<?php echo $text_placeholder_password; ?>"/><br />
  </div>
  <div class="right">
  	<span class="required">*</span> <?php echo $entry_confirm; ?> <br />
  	<input type="password" name="confirm" value="" class="small-field" placeholder="<?php echo $text_placeholder_confirm; ?>"/><br />
  </div>
  <div style="clear: both; padding-top: 15px;">
  <input type="checkbox" name="newsletter" value="1" id="newsletter"<?php if ($this->config->get('onecheckout_check_newsletter')) { ?> checked="checked"<?php } ?> />
  <label for="newsletter"><?php echo $entry_newsletter; ?></label>
  <br />
  <?php if ($shipping_required) { ?>
  <input type="checkbox" name="shipping_address" value="1" id="shipping"<?php if ($this->config->get('onecheckout_check_deliveryaddress')) { ?> checked="checked"<?php } ?> />
  <label for="shipping"><?php echo $entry_shipping; ?></label>
  <br />
  <?php } else { ?>
  <input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" style="display:none;" />
  <?php } ?>
  <br />
  </div>
<?php if ($text_agree) { ?>
<label><input type="checkbox" name="agree" value="1" /> <?php echo $text_agree; ?></label>
<?php } ?>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: '80%',
	height: '70%'
});

$('#payment-address input[name=\'password\']').live('blur', function() {
	valiform("payment","password","");
});

$('#payment-address input[name=\'password\']').live('focus', function() {
	errorremove("payment","password");
});

$('#payment-address input[name=\'confirm\']').live('blur', function() {
	valiform("payment","confirm",", #payment-address input[name=\'password\']");
});

$('#payment-address input[name=\'confirm\']').live('focus', function() {
	errorremove("payment","confirm");
});
//--></script> 
</div>