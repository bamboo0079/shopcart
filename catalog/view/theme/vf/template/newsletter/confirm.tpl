<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <div class="content-wrap">
  	<section class="article-content article-layout">
      <article>
      	<div class="content-desc" itemprop="articleBody"><?php echo $text_desc_confirm; ?></div>
        <div class="end_content_info">
            <div class="return_home"><i class="icon-home"></i><a href="/" title="Trang chủ Viet Fun Travel">Về Trang Chủ</a></div>
        </div>
      </article>
    </section>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>