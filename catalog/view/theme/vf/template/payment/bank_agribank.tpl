<h2><?php echo $text_instruction; ?></h2>
<?php echo $bank; ?>
<p class="bank_note"><?php echo $text_payment; ?></p>
<div class="buttons">
  <div class="left">
    <input type="button" value="Quay lại" id="button-back" class="button" onclick="location.reload();" />
  </div>
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/bank_agribank/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script> 
