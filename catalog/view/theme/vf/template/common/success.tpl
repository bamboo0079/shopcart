<?php echo $header; ?>
<?php 
if (isset($column_left)) {
  echo $column_left; 
}
if(isset($column_right)){
  echo $column_right; 
}
?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <div class="content-wrap">
  	<section class="article-content article-layout">
      <header>
      	<h2 itemprop="name"><?php echo $heading_title; ?></h2>
      </header>
      <article>
      	<div class="content-desc" itemprop="articleBody"><?php echo $text_message; ?></div>
      </article>
    </section>
    <div class="end_content_info">
        <div class="return_home"><i class="icon-home"></i><a href="/" title="Trang chủ Viet Fun Travel">Về Trang Chủ</a></div>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>