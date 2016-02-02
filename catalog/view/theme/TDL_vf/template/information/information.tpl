<?php echo $header; ?>

<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <div class="content-wrap">
    <section class="article-content article-layout article-information">
      <header>
        <h1 itemprop="name"><?php echo $heading_title; ?></h1>
      </header>
      <article>
        <div class="content-desc" itemprop="articleBody"><?php echo $description?></div>
        <?php if($employee){?>
        <div class="employee-list">
        	<?php $count=1;?>
        	<?php foreach($employee as $item){?>
        	<div class="box <?php echo ($count % 2 == 0)?'box2':''?>" data-id='<?php echo $item['id']?>'>
            	<div class="bg">
                	<div class="img"><img src="<?php echo $item['thumb']?>" title="<?php echo $item['name']?>"/></div>
                   	<div class="extra">
                    <a href="<?php echo $item['href']?>" class="title"><?php echo $item['name']?></a>
                    <p class="rank"><?php echo $item['rank']?></p>
                    <p class="info"><?php echo $item['intro']?></p>
                    </div>
                </div>
            </div>
            <?php $count++;}?>
        </div>
        <script>
		$(function() {
			$('.employee-list .box').click(function(){
				location.href = $(this).find('a').attr('href');
			}) ;
		});
		</script>
        <?php }?>
      </article>
    </section>
    <div class="end_content_info">
      <div class="return_home"><i class="icon-home"></i><a href="/" title="Trang chủ Viet Fun Travel">Về Trang Chủ</a></div>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?><?php echo $column_right; ?>
<?php echo $footer; ?>