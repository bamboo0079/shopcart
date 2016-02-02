<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-viewall">Xem tất cả</a></div>
      <div id="tab-viewall">
      		<!--Comment-->
            <div class="comment_main_box" id="comment_details">
              <div class="review-box">
              <input type="hidden" name="url" value="<?php echo $url?>"/>
                <textarea name="text" class="review-input" placeholder="Mời bạn bình luận" onkeyup="autoGrow(this);"></textarea>
                <div class="review-extra">
                  <div class="name">
                    <input type="text" name="name" placeholder="Mời bạn nhập tên" value=""/>
                  </div>
                  <div class="email">
                    <input type="text" name="email" placeholder="Mời bạn nhập email" value=""/>
                  </div>
                  <div id="rating"></div>
                  <input type="hidden" name="rating" id="rating-input"/>
                  <div class="but"><a id="button-review">Gởi bình luận</a></div>
                </div>
              </div>
              <div id="review">
              <?php if ($comments) { ?>
                <?php foreach ($comments as $comment) { ?>
                <div class="review-list <?php if(!$comment['status']){?>review-list-unapproval<?php }?>">
                  <div class="author"><b><?php echo $comment['name']; ?></b> <span>(<?php echo $comment['date_added']; ?>)</span> 
                  <?php if(!$comment['status']){?><label class="review-text-unapproval"><?php echo $text_text_unapproval?></label><?php }?></div>
                  <div class="info">
                  	<?php if($comment['email']){?>
                  	<span class="email"><label>Email:</label> <a href="<?php echo $comment['link_customer']?>" target="_blank"><?php echo $comment['email']?></a></span>
                    <?php }?>
                  	<?php if($comment['phone']){?>
                  	<span class="phone"><label>Phone:</label> <?php echo $comment['phone']?></span>
                    <?php }?>
                    <?php if($comment['date']){?>
                    <span class="date_tour"><label>Ngày đi tour:</label> <?php echo $comment['date']?></span>
                    <?php }?>
                    <?php if($comment['rating']){?>
                    <span class="rating"><label>Đánh giá:</label> <img src="/catalog/view/theme/default/image/stars-<?php echo $comment['rating'] . '.png'; ?>"/></span>
                    <?php }?>
                  </div>
                  <span class="review-tool">
                  	<?php if(!$comment['status']){?>
                      <i class="review-approval" data-id="<?php echo $comment['comment_id']; ?>">[<?php echo $text_approval?>]</i>
                      <?php }else{?>
                      <i class="review-unapproval" data-id="<?php echo $comment['comment_id']; ?>">[<?php echo $text_unapproval?>]</i>
                      <?php }?>
                      -
                      <i class="review-update" data-id="<?php echo $comment['comment_id']; ?>">[<?php echo $text_update?>]</i>
                      -
                      <i class="review-delete" data-id="<?php echo $comment['comment_id']; ?>">[<?php echo $text_delete?>]</i>
                  </span>
                  <div class="text"><?php echo $comment['text']; ?></div>
                  <div class="tool"><img src="view/image/desc.png"/> <a href="javascript:void(0)" class="reply" rel="<?php echo $comment['comment_id']; ?>"><?php echo $text_reply; ?></a>
                  </div>
                </div>
                <div class="form_comment"></div>
                <?php if($comment['child']){?>
                <?php foreach ($comment['child'] as $child) { ?>
                <div class="review-list review-list-child <?php if(!$child['status']){?>review-list-unapproval<?php }?>">
                  <div class="author"><b><?php echo $child['name']; ?></b> <span>(<?php echo $child['date_added']; ?>)</span> <?php if($child['rank']){?><label class="review-qtv"><?php echo $text_qtv;?></label><?php }?>
                  <?php if(!$child['status']){?><label class="review-text-unapproval"><?php echo $text_text_unapproval?></label><?php }?>
                  </div>
                  <span class="review-tool">
                  	<?php if(!$child['status']){?>
                      <i class="review-approval" data-id="<?php echo $child['comment_id']; ?>">[<?php echo $text_approval?>]</i>
                      <?php }else{?>
                      <i class="review-unapproval" data-id="<?php echo $child['comment_id']; ?>">[<?php echo $text_unapproval?>]</i>
                      <?php }?>
                      -
                      <i class="review-update" data-id="<?php echo $child['comment_id']; ?>">[<?php echo $text_update?>]</i>
                      -
                      <i class="review-delete" data-id="<?php echo $child['comment_id']; ?>">[<?php echo $text_delete?>]</i>
                  </span>
                  <?php if($child['rating']){?><div class="rating"><img src="/catalog/view/theme/default/image/stars-<?php echo $child['rating'] . '.png'; ?>" /></div><?php }?>
                  <div class="text"><?php echo $child['text']; ?></div>
                </div>
                <?php }?>
                <?php }?>
                <?php } ?>
                <div class="pagination"><?php echo $pagination_comment; ?></div>
                <?php } else { ?>
                <div class="content"><?php echo $text_no_comments; ?></div>
                <?php } ?>

              </div>
            </div>
            <!--Comment-->
      </div>
    </div>
  </div>
</div> 
<div id="box-update" style="display:none">
	<div id="dialog_popup">
        <div>
            <div class="header">CẬP NHẬT<i class="light_close"></i></div>
            <div class="content">
            	<input type="hidden" name="url_input" value="" class="url_input" />
                <input type="hidden" name="id_input" value="" class="id_input" />
            	<div class="row">
                	<div class="left">
                        <label>Name:</label>
                        <input type="text" name="name_input" value="" class="name_input" size="40" />
                    </div>
                    <div class="right">
                        <label>Email:</label>
                        <input type="text" name="email_input" value="" class="email_input" size="45" />
                    </div>
                </div>
                <div class="row">
                	<div class="left">
                        <label>Phone:</label>
                        <input type="text" name="phone_input" value="" class="phone_input" size="40" maxlength="11" />
                    </div>
                    <div class="right">
                        <label>Ngày đi tour :</label>
                        <input type="text" name="date_input" value="" class="date_input date" size="45" />
                    </div>
                </div>
            	<div class="row">
                	<div class="left">
                        <label>Ngày tạo:</label>
                        <input type="text" name="date_added_input" value="" class="date_added_input datetime" size="40" />
                    </div>
                    <div class="right">
                        <label>Ngày cập nhật:</label>
                        <input type="text" name="date_modified_input" value="" class="date_modified_input datetime" size="45" />
                    </div>
                </div>
                
                <div class="row">
                	<label>Nội dung:</label>
                    <textarea name="text_input" class="text_input" id="text_input" style="width:100%;height:100px"></textarea>
                </div>
                <div class="row">
                	<div class="left">
                    	<label>Đánh giá:</label>
                    	<input type="text" name="rating_input" value="" class="rating_input" size="20" />
                    </div>
                	<div class="right">
                    	<label>Tình trạng:</label>
                    	<select class="status_input" name="status_input">
                            <option value="1">Bật</option>
                            <option value="0">Tắt</option>
                      	</select>
                    </div>
                    <div class="right">
                    	<a href="javascript:void(0)" id="update_button" class="button" style=" margin-top: 17px; ">Cập nhật</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$('.phone_input').keyup(function () {     
	this.value = this.value.replace(/[^0-9\.]/g,'');
});
$(document).ready(function() {
	$('#dialog_popup .header > i, #dialog_popup .action > .btnCancel').bind('click',function(){
		$('#box-update').hide();
	})
});
function reset_review_form(){
	$('#box-update input').val();
	$('#box-update textarea').text();
	$('#box-update select').prop('selected', false);
}
$('.review-update').bind('click', function() {
	var id = $(this).attr('data-id');
	reset_review_form();
	$.ajax({
		url: 'index.php?route=catalog/comment/update_input&id='+encodeURIComponent(id)+'&token=<?php echo $token?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#messagebox').show();
		},
		complete: function() {
			$('#messagebox').hide();
		},
		success: function(data) {
			console.log(data.status);
			$('.url_input').val(data.url);
			$('.id_input').val(data.id);
			$('.name_input').val(data.name);
			$('.email_input').val(data.email);
			$('.phone_input').val(data.phone);
			$('.date_input').val(data.date);
			$('.date_added_input').val(data.date_added);
			$('.date_modified_input').val(data.date_modified);
			$('.rating_input').val(data.rating);
			$('.text_input').text(data.text);
			$(".status_input option").filter(function() {
				return $(this).attr('value') == data.status; 
			}).prop('selected', true);
			$('#box-update').show();
			
		}
	});
});
$('#update_button').bind('click', function() {
	var id = $('.id_input').val();
	$.ajax({
		url: 'index.php?route=catalog/comment/update_comment&id='+encodeURIComponent(id)+'&token=<?php echo $token?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('#box-update input[name=\'name_input\']').val()) + '&email=' + encodeURIComponent($('#box-update input[name=\'email_input\']').val()) + '&phone=' + encodeURIComponent($('#box-update input[name=\'phone_input\']').val()) + '&date=' + encodeURIComponent($('#box-update input[name=\'date_input\']').val()) + '&text=' + encodeURIComponent($('#box-update textarea[name=\'text_input\']').val()) + '&url=' + encodeURIComponent($('#box-update input[name=\'url_input\']').val()) + '&rating=' + encodeURIComponent($('#box-update input[name=\'rating_input\']').val()) + '&status=' + encodeURIComponent($('#box-update select[name=\'status_input\'] option:selected').val()) + '&date_added=' + encodeURIComponent($('#box-update input[name=\'date_added_input\']').val()) + '&date_modified=' + encodeURIComponent($('#box-update input[name=\'date_modified_input\']').val()),
		beforeSend: function() {
			$('#box-update').hide();
			$('#messagebox').show();
			$('#update_button').attr('disabled', true);
		},
		complete: function() {
			$('#update_button').attr('disabled', false);
		},
		success: function(data) {
			reset_review_form();
			setTimeout(function(){
				$('#messagebox').hide();
				location.reload();
			}, 1000);
			
		}
	});
});
</script>
<script type="text/javascript" src="/catalog/view/javascript/jquery/jquery.raty.js"></script> 
<script>
$('.review-approval').bind('click', function() {
	var id = $(this).attr('data-id');
	$.ajax({
		url: 'index.php?route=catalog/comment/approval&id='+encodeURIComponent(id)+'&token=<?php echo $token?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('.success, .warning').remove();
			$('.review-delete').attr('disabled', true);
		},
		complete: function() {
			$('.review-delete').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			
			$('#messagebox').show();
			setTimeout(function(){
				$('#messagebox').hide();
				location.reload();
			;}, 1000);
		}
	});
});

$('.review-unapproval').bind('click', function() {
	var id = $(this).attr('data-id');
	$.ajax({
		url: 'index.php?route=catalog/comment/unapproval&id='+encodeURIComponent(id)+'&token=<?php echo $token?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('.success, .warning').remove();
			$('.review-delete').attr('disabled', true);
		},
		complete: function() {
			$('.review-delete').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			
			$('#messagebox').show();
			setTimeout(function(){
				$('#messagebox').hide();
				location.reload();
			;}, 1000);
		}
	});
});
$('.review-delete').bind('click', function() {
	if (!confirm("Do you want to delete")){ return false; }
	var id = $(this).attr('data-id');
	$.ajax({
		url: 'index.php?route=comment/delete&token=<?php echo $token?>',
		type: 'post',
		dataType: 'json',
		data: 'id=' + encodeURIComponent(id),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('.review-delete').attr('disabled', true);
		},
		complete: function() {
			$('.review-delete').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			
			if (data['success']) {
				$('#messagebox').show();
				setTimeout(function(){
					$('#messagebox').hide();
					location.reload();
				;}, 1000);
			}
		}
	});
});
function ac(){
	$('#button-review-child').bind('click', function() {
		$.ajax({
			url: 'index.php?route=comment/write/child&token=<?php echo $token?>',
			type: 'post',
			dataType: 'json',
			data: 'name=' + encodeURIComponent($('.review-box-child input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('.review-box-child input[name=\'email\']').val()) + '&text=' + encodeURIComponent($('.review-box-child textarea[name=\'text\']').val()) + '&url=' + encodeURIComponent($('.review-box-child input[name=\'url\']').val()) + '&parent_id=' + encodeURIComponent($('.review-box-child input[name=\'parent_id\']').val()) + '&rating=' + encodeURIComponent($('.review-box-child input[name=\'rating\']').val()) + '&send_mail=' + encodeURIComponent($('.review-box-child input[name=\'send_mail\']:checked').val()),
			beforeSend: function() {
				$('.success, .warning').remove();
				$('#button-review-child').attr('disabled', true);
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
					$('#messagebox').show();
					setTimeout(function(){
						$('#messagebox').hide();
						location.reload();
					;}, 2000);
				}
			}
		});
	});
};
function ht(url,parent_id){
	var html = '';
	html += '<div class="review-box review-box-child">';
	html += 	'<input type="hidden" name="url" value="'+url+'"/>';
	html += 	'<input type="hidden" name="parent_id" value="'+parent_id+'"/>';
	html += 	'<textarea name="text" class="review-input" placeholder="Mời bạn bình luận" onkeyup="autoGrow(this);"></textarea>';
	html += 	'<div class="review-extra">';
	html += 		'<div class="name"><input type="text" name="name" readonly="readonly" value="<?php echo $name_display?>" style="background:#eee"/></div>';
	html += 		'<div class="email" style="display:none"><input type="text" name="email" value=""/></div>';
	html += 		'<span style=" line-height: 30px; margin-left: 30px; "><label><input type="checkbox" name="send_mail" checked="checked"/> Gởi mail?</label></span>';
	html += 		'<div id="rating-child"></div>';
	html += 		'<input type="hidden" name="rating" id="rating-input-child"/>';
	html += 		'<div class="but"><a id="button-review-child">Gởi trả lời</a></div>';
	html += 	'</div>';
	html += '</div>';
	html += '<h2 id="review-title-child"></h2>';
	return html;
}
function crerankchild(){
	$('#rating-child').raty({
	  path: '/catalog/view/theme/vf/images',
	  size   : 24,
	  width: 110,
	  score: 0,
	  target : '#rating-input-child',
	  targetType : 'number',
	  targetKeep : true
	});
}
crerankchild();
$('.reply').bind({
	click:function(){
		var rel = $(this).attr('rel');
		var url = '<?php echo $url?>';
		var form_com = $(this).parent().parent().next();
		form_com.html(ht(url,rel));
		crerank();
		ac();
		crerankchild();
	},
	dblclick :function(){
		var form_com = $(this).parent().parent().next();
		form_com.html('');
	}
})

</script>
<script>
function crerank(){
	$('#rating').raty({
	  path: '/catalog/view/theme/vf/images',
	  size   : 24,
	  width: 110,
	  score: 0,
	  target : '#rating-input',
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
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').load(this.href);
	return false;
});			

//$('#review').load('index.php?route=comment/load&url=<?php echo $url?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=comment/write&url=<?php echo $url?>&token=<?php echo $token?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']').val('');
				
				crerank();
				$('#messagebox').show();
					setTimeout(function(){
						$('#messagebox').hide();
						location.reload();
					;}, 2000);
			}
		}
	});
});
//--></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m:s'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script> 
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script>
$('textarea.editor').each(function() {
CKEDITOR.replace($(this).attr('id'), {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
});
</script>
<?php echo $footer; ?>