<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"> <?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <section class="category-info article-content article-layout article-information">
      <header>
        <h1 itemprop="name"><?php echo $heading_title; ?></h1>
      </header>
  </section>
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
  <div class="category-info-footer">
    <?php echo $description; ?>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>