<div class="comment_main_box" id="comment_details">
  <?php if($heading_title){?>
  <h2 id="review-title"><i class="fa fa-comments-o fa-2x"></i> Mời quý khách đánh giá hay góp ý về <?php echo $heading_title;?></h2>
  <?php }else{?>
  <h2 id="review-title"><i class="fa fa-comments-o fa-2x"></i> Mời quý khách đánh giá, góp ý</h2>
  <?php }?>
  <div class="review-box">
    <?php $u = ltrim($this->request->server['REQUEST_URI'], "/");?>
    <input type="hidden" name="url" value="<?php echo $u?>"/>
    <textarea name="text" class="review-input" placeholder="Mời quý khách đánh giá, góp ý" onkeyup="autoGrow(this);"></textarea>
    <div class="review-extra">
     <div class="input-box">
         <div class="input">
            <input type="text" name="name" placeholder="Mời nhập tên (bắt buộc)" value="<?php echo $customer_name?>" autocomplete="off"/>
          </div>
          <div class="input">
            <input type="text" name="email" placeholder="Mời nhập email (bắt buộc)" value="<?php echo $customer_email?>" autocomplete="off"/>
          </div>
          <div class="input">
            <input type="text" name="phone" placeholder="Mời nhập số điện thoại" value="<?php echo $customer_phone?>" autocomplete="off" maxlength="11"/>
          </div>
          <div class="input">
            <input type="text" name="date" placeholder="Mời nhập ngày đã đi tour" value="" class="date" readonly="readonly" autocomplete="off"/>
          </div>
     </div>
     <p class="review-note"><label>*</label> Nhập đầy đủ các trường thông tin giúp chúng tôi hỗ trợ Quý khách tốt hơn.</p>
      <div class="tool-review"><label>Đánh giá:</label><div id="rating"> </div><input type="hidden" name="rating" id="rating-input"/></div>
      <div class="but"><a id="button-review">Gửi bình luận</a><a class="button-review-close">Đóng</a> </div>
    </div>
  </div>
  <div id="review">
    <?php if ($comments) { ?>
    <?php foreach ($comments as $comment) { ?>
    <div class="review-list">
      <div class="author"><b><?php echo $comment['name']; ?></b> <span>(<?php echo $comment['date_added']; ?>) </span> </div>
      <?php if($comment['rating']){?><div class="rating"><img alt="<?php echo $comment['rating']?>" src="catalog/view/theme/default/image/stars-<?php echo $comment['rating'] . '.png'; ?>" alt="<?php echo $comment['comments']; ?>" /> </div><?php }?>
      <div class="text"><?php echo $comment['text']; ?> </div>
      <div class="tool-kit"><a href="javascript:void(0)" class="reply" rel="<?php echo $comment['comment_id']; ?>"><i class="icon-edit"></i><?php echo $text_reply; ?></a> </div>
    </div>
    <div class="form_comment"> </div>
    <?php if($comment['child']){?>
    <?php foreach ($comment['child'] as $child) { ?>
    <div class="review-list review-list-child">
      <div class="author"><b><?php echo $child['name']; ?></b> <span>(<?php echo $child['date_added']; ?>) </span> <?php if($child['rank']){?><label class="review-qtv"><?php echo $text_qtv;?></label><?php }?></div>
      <?php if($child['rating']){?><div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $child['rating'] . '.png'; ?>"/> </div><?php }?>
      <div class="text"><?php echo $child['text']; ?> </div>
    </div>
    <?php }?>
    <?php }?>
    <?php } ?>
    <?php } else { ?>
    <div class="content"><?php echo $text_no_comments; ?> </div>
    <?php } ?>
  </div>
</div>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.raty.js"></script> 
<script>
$('.review-input').live('click',function(){
	$(this).next().show();
});
$('.button-review-close').live('click',function(){
	$(this).parent().parent().hide();
});
$('.review-extra input[name="phone"]').keyup(function () {     
    this.value = this.value.replace(/[^0-9\.]/g,'');
  });
function ac() {
    $('#button-review-child')
        .bind('click', function() {
            $.ajax({
                url: 'index.php?route=comment/write/child',
                type: 'post',
                dataType: 'json',
                data: 'name=' + encodeURIComponent($('.review-box-child input[name=\'name\']')
                    .val()) + '&email=' + encodeURIComponent($('.review-box-child input[name=\'email\']')
                    .val()) + '&text=' + encodeURIComponent($('.review-box-child textarea[name=\'text\']')
                    .val()) + '&url=' + encodeURIComponent($('.review-box-child input[name=\'url\']')
                    .val()) + '&parent_id=' + encodeURIComponent($('.review-box-child input[name=\'parent_id\']')
                    .val()) + '&rating=' + encodeURIComponent($('.review-box-child input[name=\'rating\']')
                    .val()),
                beforeSend: function() {
                    $('.success, .warning')
                        .remove();
                    $('#button-review-child')
                        .attr('disabled', true);
                    $('#review-title-child')
                        .after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
                },
                complete: function() {
                    $('#button-review-child')
                        .attr('disabled', false);
                    $('.attention')
                        .remove();
                },
                success: function(data) {
                    if (data['error']) {
                        $('#review-title-child').after('<div class="warning">' + data['error'] + '</div>');
                    }
                    if (data['success']) {
                        $('#review-title-child').after('<div class="success">' + data['success'] + '</div>');
						$('.review-box-child').hide();
                        $('.review-box-child input[name=\'name\']').val('');
                        $('.review-box-child input[name=\'email\']').val('');
                        $('.review-box-child textarea[name=\'text\']').val('');
                        $('.review-box-child input[name=\'rating\']').val('');
                        crerank();
                    }
                }
            });
        });
};

function ht(url, parent_id) {
    var html = '';
	html += '<div id="review-title-child"></div>';
    html += '<div class="review-box review-box-child">';
    html += '<input type="hidden" name="url" value="' + url + '"/>';
    html += '<input type="hidden" name="parent_id" value="' + parent_id + '"/>';
    html += '<textarea name="text" class="review-input" placeholder="Mời Quý khách bình luận" onkeyup="autoGrow(this);"></textarea>';
    html += '<div class="review-extra">';
	html += '<div class="input-box">';
    html += '<div class="input"><input type="text" name="name" placeholder="Mời nhập tên" value=""/></div>';
    html += '<div class="input"><input type="text" name="email" placeholder="Mời nhập email" value=""/></div>';
	html += '</div>';
	html += '<div class="tool-review">';
	html += '<label>Đánh giá:</label><div id="rating-child"></div>';
    html += '<input type="hidden" name="rating" id="rating-input-child"/>';
	html += '</div>';
    html += '<div class="but"><a id="button-review-child">Gởi trả lời</a><a class="button-review-close">Đóng</a></div>';
    html += '</div>';
    html += '</div>';
    return html;
}


function crerankchild() {
    $('#rating-child')
        .raty({
            path: 'catalog/view/theme/vf/images',
            size: 24,
            width: 110,
            score: 0,
            target: '#rating-input-child',
            targetType: 'number',
            targetKeep: true
        });
}
crerankchild();
$('.reply')
    .bind({
        click: function() {
			$('.form_comment').hide().html('');
            var rel = $(this)
                .attr('rel');
            var url = document.location.pathname.substring(1);
            var form_com = $(this)
                .parent()
                .parent()
                .next();
			form_com.show();
            form_com.html(ht(url, rel));
            crerank();
            ac();
            crerankchild();
        },
        dblclick: function() {
            var form_com = $(this)
                .parent()
                .parent()
                .next();
			form_com.hide();
            form_com.html('');
        }
    })
</script>
<script>
function crerank() {
    $('#rating')
        .raty({
            path: 'catalog/view/theme/vf/images',
            size: 24,
            width: 110,
            score: 0,
            target: '#rating-input',
            targetType: 'number',
            targetKeep: true
        });
}
crerank();

function autoGrow(e) {
    if (e.scrollHeight > e.clientHeight) {
        if (e.scrollHeight < 100) {
            e.style.height = e.scrollHeight + "px";
        }
    }
}
</script>
<script type="text/javascript">
<!--
$('#review .pagination a')
    .live('click', function() {
        $('#review')
            .load(this.href);
        return false;
    });
//$('#review').load('index.php?route=comment/load&url=<?php echo $u?>');
$('#button-review')
    .bind('click', function() {
        $.ajax({
            url: 'index.php?route=comment/write&url=<?php echo $u?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('.review-box input[name=\'name\']')
                .val()) + '&email=' + encodeURIComponent($('.review-box input[name=\'email\']')
				.val()) + '&phone=' + encodeURIComponent($('.review-box input[name=\'phone\']')
				.val()) + '&date=' + encodeURIComponent($('.review-box input[name=\'date\']')
                .val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']')
                .val()) + '&rating=' + encodeURIComponent($('.review-box input[name=\'rating\']')
                .val()),
            beforeSend: function() {
                $('.success, .warning')
                    .remove();
                $('#button-review')
                    .attr('disabled', true);
                $('#review-title')
                    .after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
            },
            complete: function() {
                $('#button-review')
                    .attr('disabled', false);
                $('.attention')
                    .remove();
            },
            success: function(data) {
                if (data['error']) {
                    $('#review-title')
                        .after('<div class="warning">' + data['error'] + '</div>');
                }
                if (data['success']) {
                    $('#review-title').after('<div class="success">' + data['success'] + '</div>');
                    $('.review-box input[name=\'name\']').val('');
                    $('.review-box input[name=\'email\']').val('');
					$('.review-box input[name=\'phone\']').val('');
					$('.review-box input[name=\'date\']').val('');
                    $('.review-box textarea[name=\'text\']').val('');
                    $('.review-box input[name=\'rating\']').val('');
                    crerank();
                    $('#review').fadeOut('slow');
                    $('#review').load('index.php?route=comment/load&url=<?php echo $u?>');
                    $('#review').fadeIn('slow');
                }
            }
        });
    });
//-->
</script>
<?php if (!isset($this->request->get['product_id'])) {?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/i18n/jquery.ui.datepicker-vi.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'dd/mm/yy'});
	$('.datetime').datetimepicker({
		dateFormat: 'dd/mm/yy',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
</script>
<?php }?>