<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"> <?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <div class="box_left_content_info">
    <table align="center">
      <tr>
        <td>Từ khóa:</td>
        <td><?php if ($filter_name_news) { ?>
          <input type="text" name="filter_name_news" value="<?php echo $filter_name_news; ?>" id="keyword" />
          <?php } else { ?>
          <input type="text" name="filter_name_news" value="<?php echo $filter_name_news; ?>" id="keyword" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
          <?php } ?>
          &raquo; <a id="goGoogle" href="javascript:void(0);">Tìm trên Google</a></td>
      </tr>
      <tr>
        <td></td>
        <td><?php if ($filter_description) { ?>
          <input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="filter_description" value="1" id="description" />
          <?php } ?>
          <label for="description"><?php echo $entry_description; ?></label></td>
      </tr>
      <tr>
        <td></td>
        <td><br />
          <a id="button-search" class="button"><span><?php echo $button_search; ?></span></a></td>
      </tr>
    </table>
  </div>
  <?php if($news){?>
  <div class="filter">
    <div class="limit"> <span><?php echo $text_limit; ?></span>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <section class="cate_content">
    <?php foreach ($news as $item) { ?>
    <article> <a href="<?php echo $item['href']; ?>" title="<?php echo $item['name']; ?>" class="cover" rel="nofollow"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['name']; ?>" title="<?php echo $item['name']; ?>"/></a>
      <header>
        <h3><a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a></h3>
        <ul class="extra">
          <li><i class="fa fa-clock-o"></i> <?php echo $item['date_added']; ?></li>
          <li><i class="fa fa-comments"></i> <?php echo $item['comment']; ?></li>
        </ul>
        <p class="summary"><?php echo $item['short_description']; ?></p>
      </header>
    </article>
    <?php } ?>
    <div class="pagination"><?php echo $pagination; ?></div>
  </section>
  <?php }?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#content input[name=\'filter_name_news\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').bind('click', function() {
	url = 'index.php?route=news/search';
	
	var filter_name_news = $('#content input[name=\'filter_name_news\']').attr('value');
	
	if (filter_name_news) {
		url += '&filter_name_news=' + encodeURIComponent(filter_name_news);
	}

	var filter_news_category_id = $('#content select[name=\'filter_news_category_id\']').attr('value');
	
	if (filter_news_category_id > 0) {
		url += '&filter_news_category_id=' + encodeURIComponent(filter_news_category_id);
	}
	
	var filter_sub_news_category = $('#content input[name=\'filter_sub_news_category\']:checked').attr('value');
	
	if (filter_sub_news_category) {
		url += '&filter_sub_news_category=true';
	}
		
	var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&filter_description=true';
	}

	location = url;
});
$('#goGoogle').click(function(){
	var answer = confirm('Bạn có muốn tìm trên Google');
	if (answer){
		var keyword = $('#keyword').val();
		window.open('http://www.google.com/search?hl=vi&sitesearch=http://'+location.hostname+'&q=' + keyword, '_blank');
	}
});
//--></script> 
<?php echo $footer; ?>