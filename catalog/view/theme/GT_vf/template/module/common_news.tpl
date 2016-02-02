<div class="box listpost">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content" id="newpost">
        <?php $count = 0?>
        <?php foreach ($news as $news) { ?>
        <div class="item <?php if($count%2 == 0){?>ittow<?php }?>">
            <a href="<?php echo $news['href']; ?>" class="item_img" title="<?php echo $news['name']; ?>" rel="nofollow"><img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" title="<?php echo $news['name']; ?>"/></a>
            <p class="item_title"><a href="<?php echo $news['href']; ?>" title="<?php echo $news['name']; ?>" rel="nofollow"><?php echo $news['name']; ?></a></p>
        </div>
        <?php $count++;} ?>
    </div>
</div>