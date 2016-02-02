<?php
/* Khoa them CDN IMAGES*/
define('CDN_IMAGES', '');

// HTTP
define('HTTP', $_SERVER['HTTP_HOST'].'/');
define('HTTP_SERVER', 'http://'.HTTP);
// HTTPS
define('HTTPS_SERVER', 'http://'.HTTP);
 
// DIR
define('BASE_DIR', realpath(dirname(__FILE__)));
define('DIR_APPLICATION', BASE_DIR.'/catalog/');
define('DIR_SYSTEM', BASE_DIR.'/system/');
define('DIR_DATABASE', BASE_DIR.'/system/database/');
define('DIR_LANGUAGE', BASE_DIR.'/catalog/language/');
// define('DIR_TEMPLATE', BASE_DIR.'/catalog/view/theme/amlich_');
define('DIR_CONFIG', BASE_DIR.'/system/config/');
define('DIR_IMAGE', BASE_DIR.'/image/');
define('DIR_CACHE', BASE_DIR.'/system/cache/');
define('DIR_DOWNLOAD', BASE_DIR.'/download/');
define('DIR_LOGS', BASE_DIR.'/system/logs/');

include_once('database.php');
?>