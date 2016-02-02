<?php if($tour_tn_current){?>
<?php foreach ($tour_tn_current as $item_1) { ?>
<div class="box">
  <h4 class="box-heading"><?php echo $item_1['name']; ?></h4>
  <div class="box-content">
    <ul class="box-category box-news-category">
      <?php foreach($item_1['level_2_data'] as $item_2){?>
      <li>
        <a href="<?php echo $item_2['href']; ?>" <?php if ($item_2['tag_id'] == $tag_id) { ?>class="active"<?php } ?>><i class="fa fa-caret-right"></i> <?php echo $item_2['name']; ?></a>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<?php } ?>
<?php } ?>

<?php foreach ($tour_tn as $item_1) { ?>
<div class="box">
  <h4 class="box-heading"><?php echo $item_1['name']; ?></h4>
  <div class="box-content">
    <ul class="box-category box-news-category">
      <?php foreach($item_1['level_2_data'] as $item_2){?>
      <li>
        <a href="<?php echo $item_2['href']; ?>" <?php if ($item_2['tag_id'] == $tag_id) { ?>class="active"<?php } ?>><i class="fa fa-caret-right"></i> <?php echo $item_2['name']; ?></a>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<?php } ?>