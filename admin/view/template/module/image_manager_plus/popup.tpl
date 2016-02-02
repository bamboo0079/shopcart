<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo $title;?> Plus</title>

<!-- jQuery and jQuery UI (REQUIRED) -->
		<link rel="stylesheet" type="text/css" media="screen" href="view/template/module/image_manager_plus/css/jquery-ui.css">

		<script type="text/javascript" src="view/template/module/image_manager_plus/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="view/template/module/image_manager_plus/js/jquery-ui.min.js"></script>

		<!-- elFinder CSS (REQUIRED) -->
		<link rel="stylesheet" type="text/css" media="screen" href="view/template/module/image_manager_plus/css/elfinder.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="view/template/module/image_manager_plus/css/theme.css">

		<!-- elFinder JS (REQUIRED) -->
		<script type="text/javascript" src="view/template/module/image_manager_plus/js/elfinder.min.js"></script>

		<!-- elFinder translation (OPTIONAL) -->
		<script type="text/javascript" src="view/template/module/image_manager_plus/js/i18n/elfinder.ru.js"></script>
<?php $http_image=(isset($request->server['HTTPS'])&&(($request->server['HTTPS']=='on')||($request->server['HTTPS']=='1'))?HTTPS_CATALOG.'image/':HTTP_CATALOG.'image/'); ?>
        <script type="text/javascript" charset="utf-8">
	$().ready(function() {
		var elf = $('#elfinder').elfinder({
			url : 'index.php?route=module/image_manager_plus/popup&token=<?php echo $token; ?>',  // connector URL (REQUIRED)
			lang : 'en',
			container: '',
			dirimage: '<?php echo $http_image;?>',
			 <?php if (isset($_GET['field'])==true){?>
			 <?php  $field = $_GET['field']; ?>
			getFileCallback: function (a) {
			   var b = decodeURIComponent(a.replace('<?php echo $http_image;?>',''));
        		parent.$('#<?php echo $field;?>').attr('value', b);
        		parent.$('#dialog').dialog('close');        		
        		parent.$('#dialog').remove();        					   
			}<?php }?>
			 <?php if (isset($_GET['CKEditorFuncNum'])==true){?>
			getFileCallback: function (a) {
			   var b = decodeURIComponent(a.replace('<?php echo $http_image;?>',''));
        		        		window.opener.CKEDITOR.tools.callFunction(<?php echo $_GET['CKEditorFuncNum'];?>, a);        		
        		self.close();	        					   
			}
		<?php }?>
		}).elfinder('instance');
	});
</script>
<style>
iframe{overflow:hidden;}
</style>
	</head>
	<body>

		<!-- Element where elFinder will be created (REQUIRED) -->
		<div id="elfinder"></div>

	</body>
</html>
