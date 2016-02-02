<?php if($category_current_info){?>
<div class="box">
  <h4 class="box-heading"><?php echo $category_current_info['name']; ?></h4>
  <div class="box-content">
    <ul class="box-category <?php if($check_box){?>box-news-category<?php }?>">
      <?php foreach ($category_current as $category_1) { ?>
      <li>
        <a href="<?php echo $category_1['href']; ?>" rel="<?php echo $category_1['rel']; ?>" <?php if ($category_1['category_id'] == $category_id) { ?>class="active"<?php } ?>><i class="fa fa-caret-right"></i> <?php echo $category_1['name']; ?></a>
        <?php if ($category_1['children']) { ?>
          <ul>
            <?php foreach($category_1['children'] as $category_2){?>
            <li><a href="<?php echo $category_2['href']; ?>" rel="<?php echo $category_2['rel']; ?>" <?php if ($category_2['category_id'] == $category_id) { ?>class="active"<?php } ?>><?php echo $category_2['name']; ?></a> </li>
            <?php } ?>
          </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<?php } ?>

<?php foreach ($categories as $category_1) { ?>
<div class="box">
  <h4 class="box-heading"><?php echo $category_1['name']; ?></h4>
  <div class="box-content">
    <ul class="box-category <?php if($category_1['check_box']){?>box-news-category<?php }?>">
      <?php foreach($category_1['children'] as $category_2){?>
      <li>
        <a href="<?php echo $category_2['href']; ?>" rel="<?php echo $category_2['rel']; ?>" <?php if ($category_2['category_id'] == $category_id) { ?>class="active"<?php } ?>><i class="fa fa-caret-right"></i> <?php echo $category_2['name']; ?></a>
        <?php if ($category_2['children']) { ?>
          <ul>
            <?php foreach($category_2['children'] as $category_3){?>
            <li><a href="<?php echo $category_3['href']; ?>" rel="<?php echo $category_3['rel']; ?>" <?php if ($category_3['category_id'] == $category_id) { ?>class="active"<?php } ?>><?php echo $category_3['name']; ?></a> </li>
            <?php } ?>
          </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<?php } ?>