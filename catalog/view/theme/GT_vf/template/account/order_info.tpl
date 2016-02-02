<?php echo $header; ?>
<?php
if (isset($column_left)) {
  echo $column_left;
}
if(isset($column_right)){
  echo $column_right;
}
?>
<script type="text/javascript" src="catalog/view/javascript/jquery/checknumber.js"></script>
<script>
$(document).ready(function() {
  if(document.location.hash == '#pdf'){
    location = "//pdfcrowd.com/url_to_pdf/?height=-1&amp;pdf_name=<?php echo $heading_title?>.pdf&use_print_media=1";
  }
  var so = document.getElementById('Amount').value - Number(<?php echo $giagiam; ?>);
 /* so=so.replace(/,/g,"");
  so=so.replace(/\./g,"");*/
  var v_doc_so = docso(so);
  var stchu = v_doc_so.substring(2,1).toUpperCase()+v_doc_so.substring(2, v_doc_so.length)+" đồng chẵn";
  $('span#number_text').append(stchu);
});
</script>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="content-wrap">
    <section class="article-content article-layout article-information article-order">
      <header>
        <h1 itemprop="name"><?php echo $heading_title; ?></h1>
      </header>
      <?php if($order_info['order_status_id'] == 5){?>
      <div class="tool_order">
      	<a href="<?php echo $link_invoice?>" class="invoice" target="_blank"><span><?php echo $text_invoice; ?></span></a>
        <a href="<?php echo $link_confirm?>" class="confirm" target="_blank"><span><?php echo $text_confirm; ?></span></a>
      </div>
      <?php }?>
      <div class="order_status"><img src="/image/order-status/order-status-<?php echo $order_info['order_status_id']?>.png" /></div>
      <article>
      	<table class="table_style">
        <thead>
          <tr>
            <th class="left"><?php echo $text_info_order; ?></th>
            <th class="left"><?php echo $text_info_customer; ?></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
              <?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?>
              <?php } ?>
              </td>
            <td class="left" style="width: 50%;">
              <b><?php echo $entry_name_customer?></b> <?php echo $name_customer; ?><br />
              <b><?php echo $entry_email?></b> <?php echo $order_info['email']; ?><br />
              <b><?php echo $entry_telephone?></b> <?php echo $order_info['telephone']; ?><br />
            </td>
          </tr>
        </tbody>
      </table>

          <table class="table_style">
            <thead>
              <tr>
                <th class="left" width="65%"><?php echo $column_name; ?></th>
                <th class="right" width="5%"><?php echo $column_quantity; ?></th>
                <th class="right" width="15%"><?php echo $column_price; ?></th>
                <th class="right" width="15%"><?php echo $column_total; ?></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="left"><b><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['model']; ?> : <?php echo $product['name']; ?></a></b>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?></td>
                <td class="right"><?php echo $product['quantity']; ?></td>
                <td class="right">
                  <?php echo $product['price']; ?>
                </td>
                <td class="right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td class="left"><?php echo $voucher['description']; ?></td>
                <td class="left"></td>
                <td class="right">1</td>
                <td class="right"><?php echo $voucher['amount']; ?></td>
                <td class="right"><?php echo $voucher['amount']; ?></td>
                <?php if ($products) { ?>
                <td></td>
                <?php } ?>
              </tr>
              <?php } ?>
            </tbody>
            <tfoot>
              <?php foreach ($totals as $key => $total) { ?>
              <?php if($total['value'] != 0){
                      if ($key==0) {
                ?>
                <tr>
                  <td colspan="2"><input type="hidden" value="<?php echo $total['value']; ?>"  name="Amount" id="Amount"/></td>
                  <td class="right"><b><?php echo $total['title']; ?>:</b></td>
                  <td class="right"><?php echo $total['text']; ?></td>
                </tr>
                <?php /* start -- them dong da giam by coder: tranminh*/ ?>
                <?php if(isset($total['salesoff']) && $total['salesoff'] != '0₫'){ ?>
                <tr>
                  <td colspan="2"><input type="hidden" value="<?php echo $total['value']; ?>" /></td>
                  <td class="right"><b>Giảm:</b></td>
                  <td class="right"><?php echo $total['salesoff']; ?></td>
                </tr>
                <?php } ?>
                <?php /*end -- them dong da giam by coder: tranminh*/ ?>
              <?php }else{?>
                 <tr>
                  <td colspan="2"></td>
                  <td class="right"><b><?php echo $total['title']; ?>:</b></td>
                  <td class="right"><?php echo $total['text']; ?></td>
                </tr>
                 <tr>
                  <td colspan="4" class="right"><b>Bằng Chữ:&nbsp;&nbsp;</b><span id="number_text"></span></td>
                </tr>
              <?php }}} ?>
            </tfoot>
          </table>
          <?php if ($comment) { ?>
          <table class="table_style">
            <thead>
              <tr>
                <th class="left"><?php echo $text_comment; ?></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $comment; ?></td>
              </tr>
            </tbody>
          </table>
          <?php } ?>
          <?php if ($histories) { ?>
          <h2><?php echo $text_history; ?></h2>
          <table class="table_style table_style_history">
            <thead>
              <tr>
                <th class="left"><?php echo $column_date_added; ?></th>
                <th class="left"><?php echo $column_status; ?></th>
                <th class="left"><?php echo $column_comment; ?></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($histories as $history) { ?>
              <tr>
                <td class="left"><?php echo $history['date_added']; ?></td>
                <td class="left"><?php echo $history['status']; ?></td>
                <td class="left"><?php echo $history['comment']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <?php } ?>
          <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_return; ?></a></div>
          </div>
      </article>
    </section>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>