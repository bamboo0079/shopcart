<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>



<div id="content"> <?php echo $content_top; ?>

  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>

    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>

    <?php } ?>

  </div>

  <div class="content-wrap">

    <section class="article-content article-layout article-news">

      <header>

        <h1 itemprop="name"><a href="<?php echo $current_url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>

        <ul class="extra">

          <li><i class="fa fa-clock-o"></i> <?php echo $date_added; ?></li>

          <li><i class="fa fa-comments"></i> <?php echo $total_comments; ?></li>

          <li class="share"> <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_facebook_share" fb:share:layout="button_count"></a> <a class="addthis_button_google_plusone" g:plusone:size="medium"></a> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4e59e3d156e0481c"></script> 

          </li>

        </ul>

        <div class="image_promotion_date">

        <!-- <a href="http://www.vietfuntravel.com.vn/tour-du-lich-ngay-le-2-9.html" title="Tour Du Lịch 2/9/2015"><img border="0" src="http://www.vietfuntravel.com.vn/image/data/banner-promotion/2-9/tour-du-lich-le-2-9.jpg" alt="Tour Du Lịch 2/9/2015" width="100%"></a>  -->

      </div>

        <?php if ($news) { ?>

        <ul class="related">

          <?php foreach ($news as $item) { ?>

          <li><a href="<?php echo $item['href']; ?>" title="<?php echo $item['name']; ?>"><?php echo $item['name']; ?></a></li>

          <?php } ?>

        </ul>

        <?php } ?>

        <?php if($short_description){ ?>

        <div class="summary">

          <p itemprop="description"><?php echo $short_description; ?></p>

        </div>

        <?php }?>

      </header>

      <article>

        <?php if ($images) { ?>

        <div class="btnLaunchSlideshow"><i class="icon-fullscreen"></i><span>Click here to view photos as a slide show project ("slideshow")</span></div>

        <div class="image-additional">

          <?php foreach ($images as $image) { ?>

          <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

          <?php } ?>

        </div>

        <?php } ?>

        <div class="content-desc" itemprop="articleBody"><?php echo $description; ?></div>

        <?php if ($tags) { ?>

        <div class="tag"><i class="fa fa-tags"></i><?php echo $text_tags; ?>

          <?php foreach ($tags as $tag) { ?>

          <a href="<?php echo $tag['href']; ?>" title="Tag: <?php echo $tag['tag']; ?>" > <?php echo $tag['tag']; ?></a>

          <?php } ?>

        </div>

        <?php } ?>

        <?php if ($allow_comment) { ?>

        <!--Comment-->

      <?php echo $comment?>

      <!--Comment-->

        <?php } ?>

      </article>

      <?php if ($other_news) { ?>

      <footer>

        <div class="orther-title"><i class="fa fa-file-text-o"></i> <?php echo $tab_others; ?></div>

        <ul class="orther">

          <?php $count=0;?>

          <?php foreach ($other_news as $item) { ?>

          <li <?php if($count % 2 == 1){?>class="i2"<?php }?>>

          	<a href="<?php echo $item['href']; ?>" title="<?php echo $item['name']; ?>" class="cover"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['name']; ?>" /></a> 

            <h3><a href="<?php echo $item['href']; ?>" title="<?php echo $item['name']; ?>"><?php echo $item['name']; ?></a> </h3>

            <span>(<?php echo $item['date_added']; ?>)</span>

          </li>

          <?php $count++;} ?>

        </ul>

      </footer>

      <?php } ?>

    </section>

  </div>

  <?php echo $content_bottom; ?></div>

<?php if ($allow_comment) { ?>

<script>

function autoGrow (e) {

  if (e.scrollHeight > e.clientHeight) {

	  if(e.scrollHeight < 100){

    	e.style.height = e.scrollHeight + "px";

		$(e).next().css('border-top','1px solid #ccc');

	  }

  }

}

</script> 

<script type="text/javascript"><!--

$('#comment .pagination a').live('click', function() {

	$('#comment').load(this.href);

	

	return false;

});			



$('#comment').load('index.php?route=news/news/comment&news_id=<?php echo $news_id; ?>');



$('#button-comment').bind('click', function() {

	$.ajax({

		type: 'POST',

		url: 'index.php?route=news/news/write&news_id=<?php echo $news_id; ?>&approved=<?php echo $approved; ?>',

		dataType: 'json',

		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),

		beforeSend: function() {

			$('.success, .warning').remove();

			$('#button-comment').attr('disabled', true);

			$('#comment-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');

		},

		complete: function() {

			$('#button-comment').attr('disabled', false);

			$('.attention').remove();

		},

		success: function(data) {

			if (data.error) {

				$('#comment-title').after('<div class="warning">' + data.error + '</div>');

			}

			

			if (data.success) {

				$('#comment-title').after('<div class="success">' + data.success + '</div>');

								

				$('input[name=\'name\']').val('');

				$('input[name=\'email\']').val('');

				$('textarea[name=\'text\']').val('');

				$('input[name=\'captcha\']').val('');

				

				$('#comment').fadeOut('slow');

				$('#comment').load('index.php?route=news/news/comment&news_id=<?php echo $news_id; ?>');

				$('#comment').fadeIn('slow');

			}

		}

	});

});

//--></script> 

<script type="text/javascript"><!--

jQuery(document).ready(function($) {

 

	$(".scroll").click(function(event){		

		event.preventDefault();

		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

	});

});

//--></script> 

<script type="text/javascript"><!--

$(document).ready(function() {

	$('.btnLaunchSlideshow').click(function(){

		$('.colorbox').colorbox({

			open:true

		});

	});

	$('.colorbox').colorbox({

		slideshow: true,

		slideshowSpeed: 10000,

		slideshowAuto: true,

		overlayClose: true,

		opacity: 0.5,

		rel: "colorbox"

	});

});

//--></script>

<?php } ?>

<?php echo $footer; ?>