<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="display:block">
    <ul class="box-category box-news-category">
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><i class="fa fa-caret-right"></i> <?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
