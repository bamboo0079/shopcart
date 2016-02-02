
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
</head>
<body style="font-family:'Segoe UI', Tahoma, Geneva, sans-serif; font-size: 13px; line-height: 18px; color: #000000;">
<div style="width: 680px;">
  <h1 style="text-align:center;"><?php echo $text_h1?></h1>
  <p style="margin-top: 0px; margin-bottom: 5px;"><?php echo $text_hello; ?></p>
  <p style="margin-top: 0px; margin-bottom: 10px;"><?php echo $text_welcome; ?></p>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 10px;">
    <thead>
      <tr>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; padding: 7px; color: #fff; text-align:center; width: 50%;"><?php echo $text_info_order; ?></td>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; padding: 7px; color: #fff; text-align:center"><?php echo $text_info_customer; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
          <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
          <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br /></td>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">
          <b><?php echo $text_name_customer; ?></b> <?php echo $name_customer; ?><br />
          <b><?php echo $text_email; ?></b> <?php echo $email; ?><br />
          <b><?php echo $text_telephone; ?></b> <?php echo $telephone; ?><br /></td>
      </tr>
    </tbody>
    <?php if($comment_content){?>
    <tfoot>
    	<tr><td colspan="2" style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_new_comment; ?></b> <?php echo $comment_content;?></td></tr>
    </tfoot>
    <?php }?>
  </table>
  <?php if ($comment) { ?>
  <p style="margin-bottom:5px;"><?php echo $text_before_payment;?></p>
  <?php echo $comment?>
  <p style="color: #999;font-size: 11px;font-style: italic;margin-top: 5px;margin-bottom: 5px;"><?php echo $text_payment_link?></p>
  <?php } ?>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 10px;">
    <thead>
      <tr>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; padding: 7px; color: #fff; text-align:center; width: 50%;"><?php echo $text_guide_payment; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $text_pay_before; ?><?php echo $text_note_payment; ?></td>
      </tr>
    </tbody>
  </table>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 10px;">
    <thead>
      <tr>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; text-align: left; padding: 7px; color: #fff;"><?php echo $text_product; ?></td>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; text-align: right; padding: 7px; color: #fff;"><?php echo $text_quantity; ?></td>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; text-align: right; padding: 7px; color: #fff;"><?php echo $text_price; ?></td>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #00b050; font-weight: bold; text-align: right; padding: 7px; color: #fff;"><?php echo $text_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; width:60%"><b><?php echo $product['model']; ?> : <?php echo $product['name']; ?></b>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['quantity']; ?></td>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['price']; ?></td>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $key => $total) { ?>
      <?php if($total['value'] != 0){?>
      <?php if($key == 0){ ?>
      <tr>
        <td style="font-size: 13px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;" colspan="3"><b><?php echo $total['title']; ?>:</b></td>
        <td style="font-size: 17px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; color: #b00; font-weight:bold"><?php echo $total['text']; ?></td>
      </tr>
      <?php if(isset($total['salesoff']) && $total['salesoff'] != '0₫'){ ?>
      <tr>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;" colspan="3"><b>Giảm:</b></td>
        <td style="font-size: 17px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; color: #b00; font-weight:bold"><?php echo $total['salesoff']; ?></td>
      </tr>
      <?php } ?>
      <?php }else{ ?>
      <tr>
        <td style="font-size: 13px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;" colspan="3"><b><?php echo $total['title']; ?>:</b></td>
        <td style="font-size: 17px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; color: #b00; font-weight:bold"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </tfoot>
  </table>
  <?php echo $text_footer_company;?>
</div>
</body>
</html>
