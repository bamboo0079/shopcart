<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $heading_title?></title>
<base href="<?php echo $base; ?>" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/order_view.css" />
<meta name="robots" content="noindex, nofollow">
</head>
<script>
$(document).ready(function() {
	if(document.location.hash == '#pdf'){
		location = "//pdfcrowd.com/url_to_pdf/?height=-1&amp;pdf_name=<?php echo $heading_title?>.pdf&use_print_media=1";
	}
	
});
</script>
<body>
<div class="body">
  <?php $check = $check_date = $ht = '';?>
  <?php $count = 0?>
  <?php foreach ($products as $product) { ?>
  <?php foreach ($product['option'] as $option) { ?>
      <?php if($option['type']=='date'){?>
      <?php $check_date_cur = $option['value'];?>
      <?php }?>
      <?php }?>
      <?php if($product['model']==$check){?>
      <?php foreach ($product['option'] as $option) { ?>
      <?php if($check_date_cur!=$check_date){?>
      <?php if($option['type']=='date'){?>
      <?php $ht .= "<li><div>{$option['name']}</div>: <strong>{$option['value']}</strong></li>";?>
      <?php }?>
      <?php }?>
      <?php if($option['type']=='checkbox'){?>
      <?php $find2 = array('/Giá vé người lớn/','/Giá vé trẻ em/','/Vé người lớn/','/Vé trẻ em/')?>
      <?php $replace2 = array('Người lớn','Trẻ em','Người lớn','Trẻ em')?>
      <?php $t = preg_replace($find2,$replace2,$option['name']);?>
      <?php $ht .= "<li class='option_value{$count}'><div style='width:160px'>{$t}</div>: {$product['quantity']} Khách - <strong>{$option['value']}</strong></li>";?>
      <?php } ?>
      <?php } ?>
      <script>
		var order_product = <?php echo $count?>;
		$('.option_value'+(order_product-1)+'').after("<?php echo $ht?>");
		order_product++;
      </script>
      <?php $ht = "";?>
      <?php }else{?>
  <div class="wrapper"> <?php echo $header?>
    <div class="content">
      <h1 class="content_title"><?php echo $title?></h1>
      <div class="content_desc"><?php echo $title_welcome?></div>
      <div class="thumb_vfnv"><img src="<?php echo $thumb_vf?>" /></div>
      <table class="content_table">
        <tr>
          <th><?php echo $text_booking_info?></th>
          <th><?php echo $text_customer_info?></th>
        </tr>
        <tr>
          <td><ul>
          	  <li>
                <div><?php echo $text_booking_date?></div>
                : <?php echo $date_added?></li>
              <li>
                <div><?php echo $text_website?></div>
                : <a href=""><?php echo $text_website_company?></a> </li>
              <li>
                <div><?php echo $text_payment_method?></div>
                : <strong><?php echo $payment_method?></strong></li>
            </ul></td>
          <td><ul>
              <li>
                <div><?php echo $text_customer?></div>
                : <strong><?php echo $customer['customer_name'];?> </strong></li>
              <li>
                <div><?php echo $text_telephone?></div>
                : <?php echo $customer['telephone']; ?></li>
              <li>
                <div><?php echo $text_email?></div>
                : <a href=""><?php echo $customer['email']; ?></a></li>
            </ul></td>
        </tr>
      </table>
      
      
      <!--PRODUCT-->
      <table class="content_table">
        <tr>
          <th colspan="2" style="font-size:18px;"><?php echo $product['model']; ?> : <?php echo $product['name']; ?></th>
        </tr>
        <tr>
          <td width="50%"><ul>
              <?php foreach ($product['option'] as $option) { ?>
              <?php if($option['type']=='date'){?>
              <li>
                <div><?php echo $option['name']; ?></div>
                : <strong><?php echo $option['value']; ?></strong></li>
              <?php } ?>
              <?php } ?>
              <?php foreach ($product['option'] as $option) { ?>
              <?php if($option['type']=='checkbox'){?>
              <?php $find1 = array('/Giá vé người lớn/','/Giá vé trẻ em/','/Vé người lớn/','/Vé trẻ em/');?>
              <?php $replace = array('Người lớn','Trẻ em','Người lớn','Trẻ em')?>
              <li class="option_value<?php echo $count?>">
                <div style="width:160px"><?php echo preg_replace($find1,$replace,$option['name']);?></div>
                : <?php echo $product['quantity']; ?> Khách - <strong><?php echo $option['value']; ?></strong></li>
              <?php } ?>
              <?php } ?>
            </ul></td>
          <td><ul>
              <?php if($product['duration']){?>
              <li>
                <div><?php echo $text_duration; ?></div>
                : <?php echo $product['duration']; ?> </li>
              <?php }?>
              <?php if($product['start_time']){?>
              <li>
                <div><?php echo $text_start_time; ?></div>
                : <?php echo $product['start_time']; ?></li>
              <?php }?>
              <?php if($product['meeting']){ ?>
              <li>
                <div><?php echo $text_meeting; ?></div>
                : <?php echo $product['meeting']; ?> </li>
              <?php }?>
            </ul></td>
        </tr>
      </table>
      <!--END PRODUCT-->
      
      <!--INFO-->
      <?php if($product['model']!=$check){?>
      <?php if($product['included']){?>
      <ul class="content_note">
        <div><?php echo $text_included?>:</div>
        <?php echo $product['included']?>
      </ul>
      <?php }?>
      <?php if($product['notincluded']){?>
      <ul class="content_note">
        <div><?php echo $text_notincluded?>:</div>
        <?php echo $product['notincluded']?>
      </ul>
      <?php }?>
      <?php if($product['terms']){?>
      <ul class="content_note">
        <div><?php echo $text_terms?>:</div>
        <?php echo $product['terms'];?>
      </ul>
      <?php }?>
      <?php }?>
      <!--END INFO-->
      <ul class="content_note">
        <div><?php echo $text_notice?>:</div>
        <?php echo $notice?>
      </ul>
    </div>
    <?php echo $footer?> </div>
    
    <?php }?>
      <?php $check = $product['model'];?>
      <?php foreach ($product['option'] as $option) { ?>
      <?php if($option['type']=='date'){?>
      <?php $check_date = $option['value'];?>
      <?php }?>
      <?php }?>
  	  <?php $count++;?>
    <?php }?>
</div>
<div class="print" title="<?php echo $text_print?>"><i class="icon_print"></i></div>
<div class="pdf" title="<?php echo $text_pdf?>"><a href="//pdfcrowd.com/url_to_pdf/?height=-1&amp;pdf_name=<?php echo $heading_title?>.pdf&use_print_media=1" class="icon_pdf"></a></div>
<div class="home" title="<?php echo $text_home?>"><a href="<?php echo $base?>"><i class="icon_home"></i></a></div>
<script>
function printPage(){
	window.print();
};
$('.print').bind('click',function(){
	printPage();
})

</script>
</body>
</html>