<?php if($this->detect->isMobile() || $this->detect->isTablet()){ ?>
<div id="banner<?php echo $module; ?>">
  <?php foreach ($banners_mobile as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div><a href="<?php echo $banner['link']; ?>"><img class="mobile-banner" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
  <?php } else { ?>
  <div><img class="mobile-banner" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
  <?php } ?>
  <?php } ?>
</div>
<style type="text/css">
   .mobile-banner {
    width: auto;
    max-width: 100%;
    height: auto;
    outline: 0;
    width: auto !important;
    max-width: 100% !important;

   }
</style>
<?php }else{ ?>
<div id="banner<?php echo $module; ?>" class="bannernotification">
  <?php foreach ($banners_mobile as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div><a href="<?php echo $banner['link']; ?>"><img class="mobile-banner" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
  <?php } else { ?>
  <div><img class="mobile-banner" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
  <?php } ?>
  <?php } ?>
</div>
<style type="text/css">
   .mobile-banner {
    width: auto;
    max-width: 100%;
    height: auto;
    outline: 0;
    width: auto !important;
    max-width: 100% !important;

   }
</style>
<script type="text/javascript">
  var x = $(window).width();
  if(x > 1280){
    $('.bannernotification').attr('style', 'display:none');
  }
</script>
<?php } ?>