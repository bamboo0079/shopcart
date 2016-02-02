<div class="box listpost <?php echo($result['scroll'] == 1 ? 'scroll' : '')?>">
    <div class="box-heading"><?php echo $result['name']; ?></div>
    <div id="newpost" class="box-content">
        <?php if(isset($menu_news_description) && !empty($menu_news_description)){
            $i = 1;
            foreach($menu_news_description as $_items){
        ?>
        <div class="item <?php if(is_int($i/2)){ echo 'ittow'; } ?>">
            <a title="<?php echo $_items['content'];?>" href="<?php echo (isset($_items['link']) && !empty($_items['link']) ? $_items['link'] : 'javascript:void(0)')?>" class="item_img"><img style="max-width: 65px" title="<?php echo $_items['content'];?>" alt="<?php echo $_items['content'];?>" src="<?php echo $this->model_tool_image->onesize($_items['img'],100,100);?>"></a>
            <p class="item_title"><a title="<?php echo $_items['content'];?>" href="<?php echo (isset($_items['link']) && !empty($_items['link']) ? $_items['link'] : 'javascript:void(0)')?>" class="item_img"><?php echo $_items['content'];?></a></p>
        </div>
        <?php $i++; } }?>
    </div>
</div>