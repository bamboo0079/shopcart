<?php if ($comments) { ?>
<?php foreach ($comments as $comment) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $comment['name']; ?></b> <span>(<?php echo $comment['date_added']; ?>)</span></div>
  <div class="rating"><img src="/catalog/view/theme/default/image/stars-<?php echo $comment['rating'] . '.png'; ?>" alt="<?php echo $comment['comments']; ?>" /></div>
  <div class="text"><?php echo $comment['text']; ?></div>
  <div class="tool"><img src="view/image/desc.png"/> <a href="javascript:void(0)" class="reply" rel="<?php echo $comment['comment_id']; ?>"><?php echo $text_reply; ?></a></div>
</div>
<div class="form_comment"></div>
<?php if($comment['child']){?>
<?php foreach ($comment['child'] as $child) { ?>
<div class="review-list review-list-child">
  <div class="author"><b><?php echo $child['name']; ?></b> <span>(<?php echo $child['date_added']; ?>)</span></div>
  <div class="rating"><img src="/catalog/view/theme/default/image/stars-<?php echo $child['rating'] . '.png'; ?>"/></div>
  <div class="text"><?php echo $child['text']; ?></div>
</div>
<?php }?>
<?php }?>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.raty.js"></script> 
<script>
function ac(){
	$('#button-review-child').bind('click', function() {
		$.ajax({
			url: 'index.php?route=comment/write/child&token=<?php echo $token?>',
			type: 'post',
			dataType: 'json',
			data: 'name=' + encodeURIComponent($('.review-box-child input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('.review-box-child input[name=\'email\']').val()) + '&text=' + encodeURIComponent($('.review-box-child textarea[name=\'text\']').val()) + '&url=' + encodeURIComponent($('.review-box-child input[name=\'url\']').val()) + '&parent_id=' + encodeURIComponent($('.review-box-child input[name=\'parent_id\']').val()) + '&rating=' + encodeURIComponent($('.review-box-child input[name=\'rating\']').val()),
			beforeSend: function() {
				$('.success, .warning').remove();
				$('#button-review-child').attr('disabled', true);
				$('#review-title-child').after('<div class="attention"><img src="/catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
			},
			complete: function() {
				$('#button-review-child').attr('disabled', false);
				$('.attention').remove();
			},
			success: function(data) {
				if (data['error']) {
					$('#review-title-child').after('<div class="warning">' + data['error'] + '</div>');
				}
				
				if (data['success']) {
					$('#review-title-child').after('<div class="success">' + data['success'] + '</div>');
									
					$('.review-box-child input[name=\'name\']').val('');
					$('.review-box-child input[name=\'email\']').val('');
					$('.review-box-child textarea[name=\'text\']').val('');
					$('.review-box-child input[name=\'rating\']').val('');
					
					crerank();
					$('#review').fadeOut('slow');
					$('#review').load('index.php?route=comment/load&url=<?php echo $url?>&token=<?php echo $token?>');
					$('#review').fadeIn('slow');
				}
			}
		});
	});
};
function ht(url,parent_id){
	var html = '';
	html += '<div class="review-box review-box-child">';
	html += 	'<img src="/image/comment-default-avatar.jpg"/>&nbsp;';
	html += 	'<input type="hidden" name="url" value="'+url+'"/>';
	html += 	'<input type="hidden" name="parent_id" value="'+parent_id+'"/>';
	html += 	'<textarea name="text" class="review-input" placeholder="Mời bạn bình luận" onkeyup="autoGrow(this);"></textarea>';
	html += 	'<div class="review-extra">';
	html += 		'<div class="name"><input type="text" name="name" placeholder="Mời bạn nhập tên" value=""/></div>';
	html += 		'<div class="email"><input type="text" name="email" placeholder="Mời bạn nhập email" value=""/></div>';
	html += 		'<div id="rating-child"></div>';
	html += 		'<input type="hidden" name="rating" id="rating-input-child"/>';
	html += 		'<div class="but"><a id="button-review-child">Gởi trả lời</a></div>';
	html += 	'</div>';
	html += '</div>';
	html += '<h2 id="review-title-child"></h2>';
	return html;
}
$('.reply').bind({
	click:function(){
		var rel = $(this).attr('rel');
		var url = document.location.pathname.substring(1);
		var form_com = $(this).parent().parent().next();
		form_com.html(ht(url,rel));
		crerank();
		ac();
	},
	dblclick :function(){
		var form_com = $(this).parent().parent().next();
		form_com.html('');
	}
})

function crerank(){
	$('#rating-child').raty({
	  path: 'catalog/view/theme/vietfun_new/images',
	  size   : 24,
	  width: 110,
	  score: 0,
	  target : '#rating-input-child',
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
<?php } else { ?>
<div class="content"><?php echo $text_no_comments; ?></div>
<?php } ?>
