<div class="slideshow clear">
  <div class="imgSliderContainer">
    <div class="imgSlider">
      <div class="imgSliderC">
        <?php
        $count_t = 0;
        foreach ($banners as $banner) {
           if($banner['start_date'] <= date('Y-m-d')){
        ?>
            <?php if ($banner['link']) { ?>
            <div> <a href="<?php echo $banner['link']; ?>" target="_blank"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" style="width: auto;max-width: 100%;height:auto;outline: 0;"/></a> </div>
            <?php } else { ?>
            <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></div>
            <?php } ?>
            <?php $count_t++; } ?>
        <?php }?>
      </div>
      <!--imgSliderC--> <a class="imgSliderPrev" href="javascript:void(0)" rel="nofollow">Prev</a> <a class="imgSliderNext" href="javascript:void(0)" rel="nofollow">Next</a>
     <?php
        if($count_t > 1){
     ?>
          <div class="imgSliderPaginationContainer clear">
            <div class="imgSliderPaginationContainerCenter">
              <ul class="imgSliderPagination clear">
                <?php $count_bn = count($banners);?>
                <?php if($count_bn > 1){ ?>
                <?php foreach ($banners as $banner) { ?>
                <li class="<?php if($count==0){ ?>imgSliderCurrent<?php }?>"><a href="#<?php echo $count?>" rel="nofollow"></a></li>
                <?php $count++;}?>
                <?php }?>
              </ul>
            </div>
          </div>
      <?php }?>
      <!--imgSliderPaginationContainer--> </div>
    <!--imgSlider--> </div>
</div>
<script >$(".imgSlider").slides({preload: true,preloadImage: '/catalog/view/theme/vf/images/loader.gif',container: 'imgSliderC',next: 'imgSliderNext',prev: 'imgSliderPrev',paginationClass: 'imgSliderPagination',currentClass: 'imgSliderCurrent',generateNextPrev: false,generatePagination: false,slideSpeed: 700,play: 5000});</script>