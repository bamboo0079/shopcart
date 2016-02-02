<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
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
      	<div class="content-desc-employee">
        	<div class="image"><img src="<?php echo $image?>" title="<?php echo $heading_title; ?>"/></div>
            <div class="desc">
            	<p><label><?php echo $heading_title; ?></label><br /><?php echo $short_description?></p>
            </div>
        </div>
        <div class="content-desc content-private" itemprop="articleBody"><?php echo $description?></div>
      </article>
    </section>
    <div class="end_content_info">
      <div class="return_home"><i class="icon-home"></i><a href="/" title="Trang chủ Viet Fun Travel">Về Trang Chủ</a></div>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>