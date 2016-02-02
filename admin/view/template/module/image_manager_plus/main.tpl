<?php echo $header; ?>
<style>
body{overflow:hidden;}</style>		
		<link rel="stylesheet" type="text/css" media="screen" href="view/template/module/image_manager_plus/css/jquery-ui.css">
		<!-- elFinder CSS (REQUIRED) -->
		<link rel="stylesheet" type="text/css" media="screen" href="view/template/module/image_manager_plus/css/elfinder.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="view/template/module/image_manager_plus/css/theme.css">

		<!-- elFinder JS (REQUIRED) -->
		<script type="text/javascript" src="view/template/module/image_manager_plus/js/elfinder.min.js"></script>

		<!-- elFinder translation (OPTIONAL) -->
		<script type="text/javascript" src="view/template/module/image_manager_plus/js/i18n/elfinder.ru.js"></script>

		<!-- elFinder initialization (REQUIRED) -->
		<script type="text/javascript" charset="utf-8">
			$().ready(function() {
				var elf = $('#elfinder').elfinder({
					url : 'index.php?route=module/image_manager_plus/main&token=<?php echo $token; ?>'  // connector URL (REQUIRED)
					// lang: 'ru',             // language (OPTIONAL)
				}).elfinder('instance');
			});
		</script>
        
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box" style="margin-bottom:0;">
    <div class="heading">
      <h1><img src="view/template/module/image_manager_plus/img/image.png" alt="" /> <?php echo $heading_title; ?></h1> 
    </div>
    </div>
    <div class="content" id="elfinder" style="min-height:400px;">
    </div>
  </div>
</div>
<?php echo $footer; ?>