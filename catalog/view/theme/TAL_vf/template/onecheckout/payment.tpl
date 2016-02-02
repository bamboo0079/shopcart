<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<div class="payment_method">

<div class="tab_payment_method_box">
	<p>
    	<input type="radio" name="tab_payment_method" id="tab_payment_method_cash" checked="checked" />
	    <label for="tab_payment_method_cash"><i></i>Bằng tiền mặt</label>
    </p>
    <p>
    	<input type="radio" name="tab_payment_method" id="tab_payment_method_bank" />
	    <label for="tab_payment_method_bank"><i></i>Bằng chuyển khoản</label>
    </p>
</div>
<div class="payment_method_img_box">
<?php $count = 0;?>
<?php foreach ($payment_methods as $payment_method) { ?>
	<div class="payment_method_img <?php echo ($count==0)?'cash':'bank'?>" <?php echo ($count==0)?'style="display:none"':''?>>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
      <?php $code = $payment_method['code']; ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked"/>
      <?php } else { ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
      <?php } ?>
    <label for="<?php echo $payment_method['code']; ?>" style="background-image:url('/image/nganhang/<?php echo $payment_method['code']; ?>.gif');"><?php echo $payment_method['title']; ?></label>
    </div>
<?php $count++;} ?>
</div>

</div>

<?php } ?>
<h2 class="onecheckout-heading onecheckout-note"><?php echo $text_checkout_comment; ?> <span>(<?php echo $text_comments; ?>)</span> <i class="fa fa-plus-square-o"></i> <i class="fa fa-minus-square-o"></i></h2>
<textarea name="comment" rows="8" class="comment"><?php echo $comment; ?></textarea>
<script type="text/javascript"><!--
$('.onecheckout-note').bind('click',function(){
	$('.onecheckout-note .fa').toggle();
	$('.comment').toggle();
});
$('#payment-method textarea[name=\'comment\']').live('blur', function() {
	jQuery.post('index.php?route=onecheckout/payment/savecomment',$('#payment-method textarea[name=\'comment\']'));
});

$('.cash > input:checked').each(function(index, element) {
	$('#tab_payment_method_bank').removeAttr('checked');
    $('#tab_payment_method_cash').attr('checked','checked');
	$('.payment_method_img_box').hide();
});

$('.bank > input:checked').each(function(index, element) {
	$('#tab_payment_method_cash').removeAttr('checked');
    $('#tab_payment_method_bank').attr('checked','checked');
});


$('#tab_payment_method_cash').live('click', function() {
	$('.payment_method_img > input').removeAttr('checked');
	$('.cash > input').attr('checked','checked').change();
	$('.payment_method_img_box').slideUp();
});
$('#tab_payment_method_bank').live('click', function() {
	$('.payment_method_img > input').removeAttr('checked');
	$('.bank').eq(0).find('input').attr('checked','checked').change();
	$('.payment_method_img_box').slideDown();
});
//--></script> 