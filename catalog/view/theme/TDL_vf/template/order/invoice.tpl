<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><link href="http://www.vietfuntravel.com.vn/image/data/logo/favicon.ico" rel="icon" />
<title><?php echo $heading_title_text ;?></title>
<base href="<?php echo $base; ?>" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/order_view.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/checknumber.js"></script>
</head>
<script>
$(document).ready(function() {
	if(document.location.hash == '#pdf'){
		location = "//pdfcrowd.com/url_to_pdf/?height=-1&amp;pdf_name=<?php echo $heading_title_print?>.pdf&use_print_media=1";
	}
  var so = document.getElementById('Amount').value;
  so=so.replace(/,/g,"");
  so=so.replace(/\./g,"");
  var v_doc_so = docso(so);
  var stchu = v_doc_so.substring(2,1).toUpperCase()+v_doc_so.substring(2, v_doc_so.length)+" đồng chẵn";
  $('div#number_text').append(stchu);
});
</script>

<body>
<div class="body">
<div class="wrapper">
<?php echo $header?>
<div class="content">
    <h1 class="content_title"><?php echo $title?></h1>
    <div class="content_desc"><?php echo $title_welcome?></div>
    <?php 
    if(isset($user['id']) != 1){?>
      <div class="thumb_vfnv">
        <?php if($thumb_vf){?>
        <img src="<?php echo $thumb_vf?>" />
        <?php }?>
      </div>
      <?php }?>
    <table class="content_table">
        <tr>
          <th><?php echo $text_customer_info?></th>
          <th><?php echo $text_company_info?></th>
        </tr>
        <tr>
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
		      <li>
                <div><?php echo $text_address?></div>
                : <?php echo $customer['address']; ?></li>
            </ul></td>
          <td>
          <?php if($user) { ?>
            <ul>
                <li>
                  <div><?php echo $text_represent?></div>
                  : <strong><?php echo $user['name'];?></strong></li>
                <li>
                  <div><?php echo $text_telephone?></div>
                  : <?php echo $user['phone'];?></li>
                <li>
                  <div><?php echo $text_email?></div>
                  : <a href=""><?php echo $user['email'];?></a> </li>
                <li>
                  <div><?php echo $text_website?></div>
                  : <a href=""><?php echo $text_website_company?></a> </li>
              </ul>
            <?php 
            }else{ ?>
              <div style="color: red;font-weight: bold;text-align:center"><img width="169px" src="/image/order-status/order-status-1.png"></div>
            <?php }?>
            </td>
        </tr>
      </table>
    <table class="content_table">
        <tr class="head">
          <td class="day"><?php echo $text_date?></td>
          <td><?php echo $text_content?></td>
          <td class="quantity"><?php echo $text_quality?></td>
          <td class="price"><?php echo $text_price?></td>
        </tr>
          <?php $check = $ht = '';?>
          <?php $count = 0?>
          <?php foreach ($products as $product) { ?>
           <?php if($product['model']== $check){?>
          <script>

        var ht;

		var order_product = <?php echo $count?>;

		ht  = "<tr class='cont order_product"+order_product+"'>";

        ht +=	"<td>";

        		<?php foreach ($product['option'] as $option) { ?>

        		<?php if($option['type']=='date'){?>

        ht +=	"        <strong><?php echo $option['value']; ?></strong>";

                <?php } ?>

                <?php } ?>

        ht +=	"    </td>";

        ht +=	"    <td>";

            <?php foreach ($product['option'] as $option) { ?>

                <?php if($option['type']=='checkbox'){?>

                

                <?php $find1 = array('/Giá vé người lớn/','/Giá vé trẻ em/')?>

                <?php $replace = array('Người lớn','Trẻ em')?>

        

        ht +=	"        <div> <?php echo preg_replace($find1,$replace,$option['name']);?>: <strong><?php echo $option['value']; ?></strong></div>";

                <?php } ?>

                <?php } ?>

        ht +=	"    </td>";

        ht +=	"    <td><?php echo $product['quantity']; ?> </td>";

        ht +=	"  	<td><?php echo $product['price']; ?></td>";

        ht +=	"</tr> ";

		$('.order_product'+(order_product-1)+'').after(ht);

		order_product++;

	</script> 
            <?php echo $ht;?>
            <?php }else{?>
          <tr>
              <th colspan="4" style="font-size:18px;"><?php echo $product['model']; ?> : <?php echo $product['name']; ?></th>
            </tr>
          <tr class="cont order_product<?php echo $count?>">
          <td class="day"><?php foreach ($product['option'] as $option) { ?>
            <?php if($option['type']=='date'){?>
            <strong><?php echo $option['value']; ?></strong>
            <?php } ?>
            <?php } ?></td>
          <td><?php foreach ($product['option'] as $option) { ?>
            <?php if($option['type']=='checkbox'){?>
            <?php $find1 = array('/Giá vé người lớn/','/Giá vé trẻ em/')?>
            <?php $replace = array('Người lớn','Trẻ em')?>
            <?php echo preg_replace($find1,$replace,$option['name']);?>: <strong><?php echo $option['value']; ?></strong>
            <?php } ?>
            <?php } ?></td>
          <td class="quantity"><?php echo $product['quantity']; ?></td>
          <td class="price"><?php echo $product['price']; ?></td>
        </tr>
        <tr>
          <td colspan="4"><?php if($product['included']){?>
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
            <?php }?></td>
        </tr>
          <?php }?>
            <?php $check = $product['model'];?>
            <?php $count++;?>
            <?php }?>
        <tr>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_sub_total?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><?php echo $sub_total; ?></td>
        </tr>
        <?php if($promotion_total){?>    
        <tr>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_promotion_total?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><?php echo $format_promotion_total; ?></td>
        </tr>
        <?php }?>
        <tr>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_total?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><?php echo $total; ?></td>
        </tr>
        <?php if(!isset($order_deposite) || $order_deposite ==null){?>
        <tr>
          <input type="hidden" value="<?php echo $total_text; ?>"  name="Amount" id="Amount"/>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_total_number?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><div id="number_text"></div></td>
        </tr>
        <?php }?>
        <?php if($order_deposite){?>
        <tr>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_deposit?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><?php echo $order_deposite['format_deposit'];?></td>
        </tr>
        <?php if ($order_deposite['balance']==0){?>
        <tr>

          <input type="hidden" value="<?php echo $total_order_deposite_deposit; ?>"  name="Amount" id="Amount"/>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_total_number?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><div id="number_text"></div></td>
        </tr>
        <?php }?>
        <?php if($order_deposite['balance']){?>
        <tr>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_balance?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><?php echo $order_deposite['format_balance'];?></td>
        </tr>
         <tr>
          <input type="hidden" value="<?php echo $total_order_deposite_balance; ?>"  name="Amount" id="Amount"/>
          <td colspan="1" style="font-weight:bold;font-style:italic;" class="day"><?php echo $text_total_number?></td>
          <td colspan="3" style="font-weight:bold;text-align:right"><div id="number_text"></div></td>
        </tr>
        <?php }?>
        <?php if($order_deposite['note']){?>
        <tr>
          <td colspan="1" style="font-weight:bold;font-style:italic"><?php echo $text_note?></td>
          <td colspan="3" style="text-align:right;font-style:italic"><?php echo $order_deposite['note']?></td>
        </tr>
        <?php }?>
        <?php }?>
    </table>
    <div class="kyten">
        <div class="kyten_ngay"><?php echo $text_date_hcm?></div>
        <?php if ($user) { ?>
          <div class="title_kyten"><?php echo $text_signature?></div>
          <div class="kyten_place">
            <?php if($user['image']){?>
            <img src="<?php echo $user['image']?>" />
            <?php }?>
          </div>
          <div class="thumb_vfgd">
            <?php if($user['id'] == 1){?>
            <?php if($thumb_vf){?>
            <img src="<?php echo $thumb_vf?>" />
            <?php }?>
            <?php }?>
          </div>
          <div class="kyten_name"><?php echo $user['name']?></div>
        <?php }?>
      </div>
</div>
<?php echo $footer?>
</div>
</div>
<div class="print" title="<?php echo $text_print?>"><i class="icon_print"></i></div>
<div class="pdf" title="<?php echo $text_pdf?>"><a href="//pdfcrowd.com/url_to_pdf/?height=-1&amp;pdf_name=<?php echo $heading_title_print?>.pdf&use_print_media=1" class="icon_pdf"></a></div>
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