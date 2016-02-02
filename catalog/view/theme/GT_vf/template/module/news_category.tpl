<div class="box"> <div class="box-heading"><?php echo $heading_title; ?></div> <div class="box-content" style="display:block;"> <ul class="box-category box-news-category"> <?php foreach ($categories as $category) { ?> <li> <?php if ($category['news_category_id'] == $news_category_id) { ?> <a href="<?php echo $category['href']; ?>" class="active"><i class="fa fa-caret-right"></i> <?php echo $category['name']; ?></a> <?php } else { ?> <a href="<?php echo $category['href']; ?>"><i class="fa fa-caret-right"></i> <?php echo $category['name']; ?></a> <?php } ?> <ul> <?php foreach ($category['children'] as $child) { ?> <li> <?php if ($child['news_category_id'] == $child_id) { ?> <a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a> <?php } else { ?> <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a> <?php } ?> </li> <?php } ?> </ul> </li> <?php } ?> </ul> </div></div>