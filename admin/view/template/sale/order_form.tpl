<?php echo $header; ?>
<style>
.list tbody td {
padding: 0;
}
.list tbody td a{
	text-decoration:none;
}
.ui-datepicker .ui-datepicker-title {
line-height: 26px;
}
.departure{
	display:none
}
.salehandle{
      text-decoration: none;
    color: #000;
    text-align: center;
    font-weight: bolder;
    display: inline-block;
    margin-top: 7px;
    margin-left: 10%;
    padding: 5px 15px 5px 15px;
    width: 40%;
    background: #C55151;
    -webkit-border-radius: 10px 10px 10px 10px;
    -moz-border-radius: 10px 10px 10px 10px;
    -khtml-border-radius: 10px 10px 10px 10px;
    border-radius: 10px 10px 10px 10px;
}
#notification {
  position: fixed;
  right: 0;
  bottom: 0;
  z-index: 99;
  width: 50%;
  height: 25px;
  text-align: center;
  font-size: 15px !important;
  text-transform: uppercase;

  margin: 0 auto;
  overflow: hidden;
  white-space: nowrap;
  box-sizing: border-box;
  animation: marquee 10s linear infinite;
}
/* Make it move */
@keyframes marquee {
    0%   { text-indent: 27.5em }
    100% { text-indent: -105em }
}
</style>
<div id="notification">
<?php
if (isset($_GET['order_id'])) {
    $query = $this->getUserNameByOrder($_GET['order_id']);
    if (!empty($query)) {
       echo "<strong>Nhân viên đang xử lí đơn hàng:   ".$query->row['user']."</strong>";
    }
}?>
</div>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <?php if($this->user->getUserGroupID() == 1) {?>

      <?php
      if (isset($_GET['order_id'])) {
        echo '<span class="salehandle">Nhân viên phụ trách đơn hàng: &nbsp;&nbsp;&nbsp;&nbsp;';
          $query = $this->user->getUserLog($_GET['order_id']);
          if(!empty($query)) {
            echo $query;
          } else {
            echo "chưa có NV xử lí";
          }
        echo '</span>';
      }
      ?>

      <?php } ?>
      <div class="buttons">

      <?php if(isset($invoice)){?>
      <a href="<?php echo $invoice?>" class="button" target="_blank"><?php echo $text_invoice; ?></a>
      <?php }?>
      <?php if(isset($confirm)){?>
      <a href="<?php echo $confirm?>" class="button" target="_blank"><?php echo $text_confirm; ?></a>
      <?php }?>
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="vtabs" class="vtabs">
      	<a href="#tab-product"><?php echo $tab_product; ?></a>
        <a href="#tab-customer"><?php echo $tab_customer; ?></a>
        <?php if($order_id){?>
        <a href="#tab-history"><?php echo $tab_history; ?></a>
        <?php }?>
        <?php if(in_array($this->user->getId(),$array_admin)){?>
        <a href="#tab-log"><?php echo $tab_log; ?></a>
        <?php }?>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	<div id="tab-product" class="vtabs-content">
          <table class="list">
            <thead>
              <tr>
                <td></td>
                <td class="left"><?php echo $column_product; ?></td>
                <td class="right"><?php echo $column_quantity; ?></td>
                <td class="right"><?php echo $column_price; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <?php $product_row = 0; ?>
            <?php $option_row = 0; ?>
            <?php $download_row = 0; ?>
            <?php $total_row = 0; ?>
            <tbody id="product">
              <?php if ($order_products) { ?>
              <?php foreach ($order_products as $order_product) { ?>
              <tr id="product-row<?php echo $product_row; ?>" data-id="<?php echo $product_row; ?>">
                <td class="center" style="width: 3px;">
                <img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$('#product-row<?php echo $product_row; ?>').remove(); $('#button-update').trigger('click');" />
                <img src="view/image/product.png" onclick="update_order($(this))" class="pop" style="cursor: pointer;width: 17px;margin-top:10px"/>
                </td>
                <td class="left"><?php echo $order_product['model']; ?> : <?php echo $order_product['name']; ?><br />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_product_id]" value="<?php echo $order_product['order_product_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][product_id]" value="<?php echo $order_product['product_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][name]" value="<?php echo $order_product['name']; ?>" class="order_product_<?php echo $product_row; ?>_name"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][model]" value="<?php echo $order_product['model']; ?>" class="order_product_<?php echo $product_row; ?>_model"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][duration]" value="<?php echo $order_product['duration']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][start_time]" value="<?php echo $order_product['start_time']; ?>" class="order_product_<?php echo $product_row; ?>_start_time"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][meeting]" value="<?php echo $order_product['meeting']; ?>" class="order_product_<?php echo $product_row; ?>_meeting" />
                  <textarea name="order_product[<?php echo $product_row; ?>][included]" class="order_product_<?php echo $product_row; ?>_included" style="display:none"><?php echo $order_product['included']; ?></textarea>
                  <textarea name="order_product[<?php echo $product_row; ?>][notincluded]" class="order_product_<?php echo $product_row; ?>_notincluded" style="display:none"><?php echo $order_product['notincluded']; ?></textarea>
                  <textarea name="order_product[<?php echo $product_row; ?>][terms]" class="order_product_<?php echo $product_row; ?>_terms" style="display:none"><?php echo $order_product['terms']; ?></textarea>
                  <?php foreach ($order_product['option'] as $option) { ?>
                  - <small class="order_tour_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_name_text"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][order_option_id]" value="<?php echo $option['order_option_id']; ?>" class="order_product_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_order_option_id"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][product_option_id]" value="<?php echo $option['product_option_id']; ?>" class="order_product_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_product_option_id"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][product_option_value_id]" value="<?php echo $option['product_option_value_id']; ?>" class="order_product_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_product_option_value_id"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][name]" value="<?php echo $option['name']; ?>" class="order_product_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_name"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][value]" value="<?php echo $option['value']; ?>" class="order_product_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_value"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][type]" value="<?php echo $option['type']; ?>" class="order_product_<?php echo $product_row; ?>_order_option_<?php echo $option_row; ?>_type"/>
                  <?php $option_row++; ?>
                  <?php } ?>
                  <?php foreach ($order_product['download'] as $download) { ?>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][order_download_id]" value="<?php echo $download['order_download_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][name]" value="<?php echo $download['name']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][filename]" value="<?php echo $download['filename']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][mask]" value="<?php echo $download['mask']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][remaining]" value="<?php echo $download['remaining']; ?>" />
                  <?php $download_row++; ?>
                  <?php } ?></td>
                <td class="right">
                  <label class="order_product_<?php echo $product_row; ?>_quantity_text"><?php echo $order_product['quantity']; ?></label>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][quantity]" value="<?php echo $order_product['quantity']; ?>" class="order_product_<?php echo $product_row; ?>_quantity"/></td>
                <td class="right">
                  <label class="order_product_<?php echo $product_row; ?>_price_text"><?php echo $order_product['price_text']; ?></label>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][price]" value="<?php echo $order_product['price']; ?>" class="order_product_<?php echo $product_row; ?>_price"/></td>
                <td class="right">
                  <label class="order_product_<?php echo $product_row; ?>_total_text"><?php echo $order_product['total_text']; ?></label>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][total]" value="<?php echo $order_product['total']; ?>" id="order_product_total_<?php echo $product_row; ?>" class="order_product_<?php echo $product_row; ?>_total"/>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][tax]" value="<?php echo $order_product['tax']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][reward]" value="<?php echo $order_product['reward']; ?>" /></td>
              </tr>
              <?php $product_row++; ?>
              <?php } ?>
              <?php $t =1; foreach ($order_totals as $order_total) { ?>
              <tr id="total-row<?php echo $total_row; ?>" class="total-row" data-id="<?php echo $order_total['sort_order']; ?>">
                <td class="right" colspan="4">
                <?php if(!in_array($order_total['sort_order'],array(1,9))){ ?>
                <span style="float:left">
                <img src="view/image/product.png" onclick="update_total_row($(this))" class="update_total_edit_btn" style="cursor: pointer;width: 17px;"/><img src="view/image/success.png" onclick="update_total_row_up($(this))" class="update_total_up_btn" style="cursor: pointer;width: 17px;display:none;"/>
                </span>
                <?php }?>
                <?php echo $order_total['title']; ?>:
              <input type="hidden" name="order_total[<?php echo $total_row; ?>][order_total_id]" value="<?php echo $order_total['order_total_id']; ?>" />
              <input type="hidden" name="order_total[<?php echo $total_row; ?>][code]" value="<?php echo $order_total['code']; ?>" />
              <input type="hidden" name="order_total[<?php echo $total_row; ?>][title]" value="<?php echo $order_total['title']; ?>" />
              <input type="hidden" name="order_total[<?php echo $total_row; ?>][text]" value="<?php echo $order_total['text']; ?>" class="order_total_<?php echo $order_total['sort_order']; ?>_text" />
              <input type="hidden" name="order_total[<?php echo $total_row; ?>][value]" value="<?php echo abs($order_total['value']); ?>" class="order_total_<?php echo $order_total['sort_order']; ?>"/>
              <input type="hidden" name="order_total[<?php echo $total_row; ?>][sort_order]" value="<?php echo $order_total['sort_order']; ?>" /></td>
                <td class="right <?php echo ($t == count($order_totals) ? 'total' : '');?>"><label class="order_total_<?php echo $order_total['sort_order']; ?>_text_text"><?php echo $order_total['text']; ?></label>
                <input type="text" value="<?php echo abs($order_total['value']); ?>" class="order_total_<?php echo $order_total['sort_order']; ?>_text_input" size="10" style="display:none" onkeypress="return isNumberKey(event)"/>
                </td>
              </tr>
              <?php if(isset($order_total['saleoff']) && $order_total['saleoff'] != '0₫') { ?>
              <tr class="cl_saleoff">
                  <td class="right" colspan="4">Đã Giảm:</td>
                  <td class="right"><?php echo $order_total['saleoff']; ?>
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][saleoff]" value="<?php echo $order_total['saleoff']; ?>" />
                  </td>
              </tr>
              <?php $t++; } ?>

              <?php $total_row++;} ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        <!--  <div class="note"><a id="reload-promotion" class="button">Tính lại giảm giá</a></div>-->

          <div id="colorpop" style="display:none">
                  <a onclick="CKupdate();update_order_product()" class="button" style=" position: absolute; right: 0; ">Cập nhật</a>
            <div id="tabs" class="htabs"><a href="#tab-productpop">Tour</a><a href="#tab-infoproductpop">Thông tin</a></div>
            <div id="tab-productpop">
              <table class="list">
                <tr>
                  <td class="left">Choose tour:</td>
                  <td class="left"><input type="text" name="order_product_model_input" size="5" class="order_product_model_input">
                    &nbsp;&nbsp;
                    <input type="text" name="order_product_name_input" size="80" class="order_product_name_input">
                    <input type="hidden" name="order_product_id_input" class="order_product_id_input"></td>
                </tr>
                <tr>
                  <td class="left">Choose Option(s):</td>
                  <td class="left">
                    <input type="text" name="checkbox_name" size="50" class="order_product_order_option_checkbox_name_input">
                    &nbsp;&nbsp;
                    <input type="text" name="checkbox_value" size="30" class="order_product_order_option_checkbox_value_input">
                    <br />
                    <input type="text" name="date_name" size="50" class="order_product_order_option_date_name_input">
                    &nbsp;&nbsp;
                    <input type="text" name="date_value" size="30" class="order_product_order_option_date_value_input date"></td>
                </tr>
                <tr>
                  <td class="left">Quantity:</td>
                  <td class="left"><input type="text" name="order_product_quantity_input" size="5" class="order_product_quantity_input" onkeypress="return isNumberKey(event)"></td>
                </tr>
                <tr>
                  <td class="left">Price:</td>
                  <td class="left"><input type="text" name="order_product_price_input" size="15" class="order_product_price_input" onkeypress="return isNumberKey(event)">&nbsp;&nbsp;&nbsp;<label class="order_product_price_input_text"></label></td>
                </tr>
                <tr>
                  <td class="left">Total:</td>
                  <td class="left"><input type="text" name="order_product_total_input" size="15" class="order_product_total_input" onkeypress="return isNumberKey(event)">&nbsp;&nbsp;&nbsp;<label class="order_product_total_input_text"></label></td>
                </tr>
              </table>
            </div>
            <div id="tab-infoproductpop">
              <table class="list">
                <tr>
                  <td class="left">Thời gian tập trung:</td>
                  <td class="left"><input type="text" name="order_product_start_time_input" size="100" class="order_product_start_time_input"></td>
                </tr>
                <tr>
                  <td class="left">Điểm đón khách:</td>
                  <td class="left"><input type="text" name="order_product_meeting_input" size="100" class="order_product_meeting_input"></td>
                </tr>
                <tr>
                  <td class="left">Included:</td>
                  <td class="left"><textarea name="order_product_included_input" class="editor" id="order_product_included_input"></textarea></td>
                </tr>
                <tr>
                  <td class="left">Not Included:</td>
                  <td class="left"><textarea name="order_product_notincluded_input" class="editor" id="order_product_notincluded_input"></textarea></td>
                </tr>
                <tr>
                  <td class="left">Terms:</td>
                  <td class="left"><textarea name="order_product_terms_input" class="editor" id="order_product_terms_input"></textarea></td>
                </tr>
              </table>
            </div>

          </div>
          <a href="javascript:void(0)" class="display_deposit"><i class="desc"></i><i class="asc"></i> Thêm đặt cọc</a>
          <table class="list list_deposit">
          	<input type="hidden" name="status_deposit" class="status_deposit" value="<?php echo $status_deposit;?>">
          	<thead>
                <tr>
                    <td class="left" width="60%"><?php echo $entry_note?></td>
                    <td class="right" width="20%"><?php echo $entry_deposit?></td>
                    <td class="right" width="20%"><?php echo $entry_balance?></td>
                </tr>
            </thead>
            <tbody>
            	<tr>
                    <td class="left"><textarea name="note_deposit" style="width:98%;"><?php echo $note_deposit;?></textarea></td>
                    <td class="right"><label></label> <input type="text" name="deposit" class="deposit" value="<?php echo $deposit;?>" size="9" style="text-align:right" onkeypress="return isNumberKey(event)"></td>
                    <td class="right"><label></label> <input type="text" name="balance" class="balance" value="<?php echo $balance;?>" size="9" style="text-align:right" onkeypress="return isNumberKey(event)"></td>
                </tr>
            </tbody>
          </table>
          <table class="list addproduct">
            <thead>
              <tr>
                <td colspan="2" class="left"><?php echo $text_product; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $entry_product; ?></td>
                <td class="left">
                  <input type="text" name="model" value="" size="5" />&nbsp;&nbsp;
                  <input type="text" name="product" value="" size="100"/>
                  <input type="hidden" name="product_id" value="" /></td>
              </tr>
              <tr id="option"></tr>
              <tr id="start_time_expend" style="display:none">
                <td class="left">Thời gian tập trung:</td>
                <td class="left"><input type="text" name="start_time_input" id="start_time_input" size="100"/></td>
              </tr>
              <tr id="meeting_expend" style="display:none">
                <td class="left">Điểm đón khách:</td>
                <td class="left"><input type="text" name="meeting_input" id="meeting_input" size="100"/></td>
              </tr>
              <tr id="included_expend" style="display:none">
                <td class="left">Included:</td>
                <td class="left"><textarea name="included_input" class="editor" id="included_input" style="width:700px"></textarea></td>
              </tr>
              <tr id="notincluded_expend" style="display:none">
                <td class="left">Not Included:</td>
                <td class="left"><textarea name="notincluded_input" class="editor" id="notincluded_input" style="width:700px"></textarea></td>
              </tr>
              <tr id="terms_expend" style="display:none">
                <td class="left">Terms:</td>
                <td class="left"><textarea name="terms_input" class="editor" id="terms_input" style="width:700px"></textarea></td>
              </tr>
              <tr style="display:none">
                <td class="left"><?php echo $entry_quantity; ?></td>
                <td class="left"><input type="text" name="quantity" value="1" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td class="left">&nbsp;</td>
                <td class="left"><a id="button-product" class="button"><?php echo $button_add_product; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-customer" class="vtabs-content">
          <table class="form">
            <tr style="display:none">
              <td class="left"><?php echo $entry_store; ?></td>
              <td class="left"><select name="store_id">
                  <option value="0"><?php echo $text_default; ?></option>
                  <?php foreach ($stores as $store) { ?>
                  <?php if ($store['store_id'] == $store_id) { ?>
                  <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer; ?></td>
              <td><input type="text" name="customer" value="<?php echo $customer; ?>" size="40"/>
                <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
                <input type="hidden" name="customer_group_id" value="<?php echo $customer_group_id; ?>" /></td>
            </tr>
            <tr>
              <td class="left"><?php echo $entry_customer_group; ?></td>
              <td class="left"><select id="customer_group_id" disabled="disabled">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
              <td><input type="text" name="lastname" value="<?php echo $lastname; ?>" size="40"/>
                <?php if ($error_lastname) { ?>
                <span class="error"><?php echo $error_lastname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
              <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" size="40"/>
                <?php if ($error_firstname) { ?>
                <span class="error"><?php echo $error_firstname; ?></span>
                <?php } ?></td>
            </tr>

            <tr>
              <td><span class="required">*</span> <?php echo $entry_email; ?></td>
              <td><input type="text" name="email" value="<?php echo $email; ?>" size="40"/>
                <?php if ($error_email) { ?>
                <span class="error"><?php echo $error_email; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
              <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
                <?php if ($error_telephone) { ?>
                <span class="error"><?php echo $error_telephone; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_fax; ?></td>
              <td><input type="text" name="fax" value="<?php echo $fax; ?>" /></td>
            </tr>
          </table>
          <table class="form">
            <tr>
              <td><?php echo $entry_address; ?></td>
              <td><select name="payment_address">
                  <option value="0" selected="selected"><?php echo $text_none; ?></option>
                  <?php foreach ($addresses as $address) { ?>
                  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['address_1'] . ', ' . $address['zone'] . ', ' . $address['country']; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
              <td><input type="text" name="payment_lastname" value="<?php echo $payment_lastname; ?>" size="40"/>
                <?php if ($error_payment_lastname) { ?>
                <span class="error"><?php echo $error_payment_lastname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
              <td><input type="text" name="payment_firstname" value="<?php echo $payment_firstname; ?>" size="40"/>
                <?php if ($error_payment_firstname) { ?>
                <span class="error"><?php echo $error_payment_firstname; ?></span>
                <?php } ?></td>
            </tr>

            <tr style="display:none">
              <td><?php echo $entry_company; ?></td>
              <td><input type="text" name="payment_company" value="<?php echo $payment_company; ?>" /></td>
            </tr>
            <tr id="company-id-display" style="display:none">
              <td><span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?></td>
              <td><input type="text" name="payment_company_id" value="<?php echo $payment_company_id; ?>" /></td>
            </tr>
            <tr id="tax-id-display" style="display:none">
              <td><span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?></td>
              <td><input type="text" name="payment_tax_id" value="<?php echo $payment_tax_id; ?>" />
                <?php if ($error_payment_tax_id) { ?>
                <span class="error"><?php echo $error_payment_tax_id; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
              <td><input type="text" name="payment_address_1" value="<?php echo $payment_address_1; ?>" size="40"/>
                <?php if ($error_payment_address_1) { ?>
                <span class="error"><?php echo $error_payment_address_1; ?></span>
                <?php } ?></td>
            </tr>
            <tr style="display:none">
              <td><?php echo $entry_address_2; ?></td>
              <td><input type="text" name="payment_address_2" value="<?php echo $payment_address_2; ?>" /></td>
            </tr>
            <tr style="display:none">
              <td><span class="required">*</span> <?php echo $entry_city; ?></td>
              <td><input type="text" name="payment_city" value="<?php echo $payment_city; ?>" />
                <?php if ($error_payment_city) { ?>
                <span class="error"><?php echo $error_payment_city; ?></span>
                <?php } ?></td>
            </tr>
            <tr style="display:none">
              <td><span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
              <td><input type="text" name="payment_postcode" value="<?php echo $payment_postcode; ?>" />
                <?php if ($error_payment_postcode) { ?>
                <span class="error"><?php echo $error_payment_postcode; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_country; ?></td>
              <td><select name="payment_country_id">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $payment_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <?php if ($error_payment_country) { ?>
                <span class="error"><?php echo $error_payment_country; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
              <td><select name="payment_zone_id">
                </select>
                <?php if ($error_payment_zone) { ?>
                <span class="error"><?php echo $error_payment_zone; ?></span>
                <?php } ?></td>
            </tr>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td class="left" colspan="2"><?php echo $text_order; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr style="display:none">
                <td class="left"><?php echo $entry_shipping; ?></td>
                <td class="left"><select name="shipping">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php if ($shipping_code) { ?>
                    <option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
                    <?php } ?>
                  </select>
                  <input type="hidden" name="shipping_method" value="<?php echo $shipping_method; ?>" />
                  <input type="hidden" name="shipping_code" value="<?php echo $shipping_code; ?>" />
                  <?php if ($error_shipping_method) { ?>
                  <span class="error"><?php echo $error_shipping_method; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_payment; ?></td>
                <td class="left"><select name="payment">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php if ($payment_code) { ?>
                    <option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
                    <?php } ?>
                  </select>
                  <input type="hidden" name="payment_method" value="<?php echo $payment_method; ?>" />
                  <input type="hidden" name="payment_code" value="<?php echo $payment_code; ?>" />
                  <?php if ($error_payment_method) { ?>
                  <span class="error"><?php echo $error_payment_method; ?></span>
                  <?php } ?>
                  &nbsp; <a id="button-update" class="button"><?php echo $button_update_total; ?></a>
                  </td>
              </tr>
              <tr style="display:none">
                <td class="left"><?php echo $entry_coupon; ?></td>
                <td class="left"><input type="text" name="coupon" value="" /></td>
              </tr>
              <tr style="display:none">
                <td class="left"><?php echo $entry_voucher; ?></td>
                <td class="left"><input type="text" name="voucher" value="" /></td>
              </tr>
              <tr style="display:none">
                <td class="left"><?php echo $entry_reward; ?></td>
                <td class="left"><input type="text" name="reward" value="" /></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_comment; ?></td>
                <td class="left"><textarea name="comment" cols="40" rows="5"><?php echo $comment; ?></textarea></td>
              </tr>
              <tr style="display:none">
                <td class="left"><?php echo $entry_affiliate; ?></td>
                <td class="left"><input type="text" name="affiliate" value="<?php echo $affiliate; ?>" />
                  <input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id; ?>" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td class="left">&nbsp;</td>
                <td class="left"></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-shipping" class="vtabs-content"  style="display:none">
          <table class="form">
            <tr>
              <td><?php echo $entry_address; ?></td>
              <td><select name="shipping_address">
                  <option value="0" selected="selected"><?php echo $text_none; ?></option>
                  <?php foreach ($addresses as $address) { ?>
                  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
              <td><input type="text" name="shipping_firstname" value="<?php echo $shipping_firstname; ?>" />
                <?php if ($error_shipping_firstname) { ?>
                <span class="error"><?php echo $error_shipping_firstname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
              <td><input type="text" name="shipping_lastname" value="<?php echo $shipping_lastname; ?>" />
                <?php if ($error_shipping_lastname) { ?>
                <span class="error"><?php echo $error_shipping_lastname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_company; ?></td>
              <td><input type="text" name="shipping_company" value="<?php echo $shipping_company; ?>" /></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
              <td><input type="text" name="shipping_address_1" value="<?php echo $shipping_address_1; ?>" />
                <?php if ($error_shipping_address_1) { ?>
                <span class="error"><?php echo $error_shipping_address_1; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_address_2; ?></td>
              <td><input type="text" name="shipping_address_2" value="<?php echo $shipping_address_2; ?>" /></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_city; ?></td>
              <td><input type="text" name="shipping_city" value="<?php echo $shipping_city; ?>" /></td>
            </tr>
            <tr>
              <td><span id="shipping-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
              <td><input type="text" name="shipping_postcode" value="<?php echo $shipping_postcode; ?>" />
                <?php if ($error_shipping_postcode) { ?>
                <span class="error"><?php echo $error_shipping_postcode; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_country; ?></td>
              <td><select name="shipping_country_id">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $shipping_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <?php if ($error_shipping_country) { ?>
                <span class="error"><?php echo $error_shipping_country; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
              <td><select name="shipping_zone_id">
                </select>
                <?php if ($error_shipping_zone) { ?>
                <span class="error"><?php echo $error_shipping_zone; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-voucher" class="vtabs-content"  style="display:none">
          <table class="list">
            <thead>
              <tr>
                <td></td>
                <td class="left"><?php echo $column_product; ?></td>
                <td class="left"><?php echo $column_model; ?></td>
                <td class="right"><?php echo $column_quantity; ?></td>
                <td class="right"><?php echo $column_price; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody id="voucher">
              <?php $voucher_row = 0; ?>
              <?php if ($order_vouchers) { ?>
              <?php foreach ($order_vouchers as $order_voucher) { ?>
              <tr id="voucher-row<?php echo $voucher_row; ?>">
                <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$('#voucher-row<?php echo $voucher_row; ?>').remove(); $('#button-update').trigger('click');" /></td>
                <td class="left"><?php echo $order_voucher['description']; ?>
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][order_voucher_id]" value="<?php echo $order_voucher['order_voucher_id']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][voucher_id]" value="<?php echo $order_voucher['voucher_id']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][description]" value="<?php echo $order_voucher['description']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][code]" value="<?php echo $order_voucher['code']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][from_name]" value="<?php echo $order_voucher['from_name']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][from_email]" value="<?php echo $order_voucher['from_email']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][to_name]" value="<?php echo $order_voucher['to_name']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][to_email]" value="<?php echo $order_voucher['to_email']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][voucher_theme_id]" value="<?php echo $order_voucher['voucher_theme_id']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][message]" value="<?php echo $order_voucher['message']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][amount]" value="<?php echo $order_voucher['amount']; ?>" /></td>
                <td class="left"></td>
                <td class="right">1</td>
                <td class="right"><?php echo $order_voucher['amount']; ?></td>
                <td class="right"><?php echo $order_voucher['amount']; ?></td>
              </tr>
              <?php $voucher_row++; ?>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td colspan="2" class="left"><?php echo $text_voucher; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_to_name; ?></td>
                <td class="left"><input type="text" name="to_name" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_to_email; ?></td>
                <td class="left"><input type="text" name="to_email" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_from_name; ?></td>
                <td class="left"><input type="text" name="from_name" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_from_email; ?></td>
                <td class="left"><input type="text" name="from_email" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_theme; ?></td>
                <td class="left"><select name="voucher_theme_id">
                    <?php foreach ($voucher_themes as $voucher_theme) { ?>
                    <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo addslashes($voucher_theme['name']); ?></option>
                    <?php } ?>
                  </select></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_message; ?></td>
                <td class="left"><textarea name="message" cols="40" rows="5"></textarea></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_amount; ?></td>
                <td class="left"><input type="text" name="amount" value="25.00" size="5" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td class="left">&nbsp;</td>
                <td class="left"><a id="button-voucher" class="button"><?php echo $button_add_voucher; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>

        <div id="tab-history" class="vtabs-content" <?php if(!$order_id){?> style="display:none"<?php }?>>
        <div id="history"></div>
        <table class="form">
          <tr>
            <td><?php echo $entry_order_status; ?></td>
            <td>
              <input type="hidden" name="old_order_status_id" value="<?php echo $order_status_id; ?>" id="old_order_status_id" />
              <select name="order_status_id">
                <?php foreach ($order_statuses as $order_statuses) { ?>
                <?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
                <option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_notify; ?></td>
            <td><input type="checkbox" name="notify" value="1" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_comment; ?></td>
            <td><textarea name="comment_history" id="comment_history" class="editor" cols="40" rows="8" style="width: 50%"></textarea>
              <div style="margin-top: 10px; text-align: right;"><a id="button-history" class="button"><?php echo $button_add_history; ?></a></div></td>
          </tr>
        </table>
      </div>
      	<?php if(in_array($this->user->getId(),$array_admin)){?>
      	<div id="tab-log" class="vtabs-content" >
        	<table class="list">
            	<thead>
                	<tr>
                    	<td class="left"><?php echo $column_id?></td>
                        <td class="left"><?php echo $column_user?></td>
                        <td class="left"><?php echo $column_date?></td>
                    </tr>
                </thead>
                <tbody>
                	<?php $count = 1;?>
                	<?php foreach($logs as $item){?>
                	<tr>
                    	<td class="left"><?php echo $count;?></td>
                        <td class="left"><?php echo $item['user'];?></td>
                        <td class="left"><?php echo $item['date'];?></td>
                    </tr>
                    <?php $count++;}?>
                </tbody>
            </table>
        </div>
        <?php }?>
      </form>
    </div>
  </div>
</div>
<script>

$('input[name="lastname"]').bind('keyup',function(){
	$('input[name="payment_lastname"]').val($(this).val());
});
$('input[name="firstname"]').bind('keyup',function(){
	$('input[name="payment_firstname"]').val($(this).val());
});
$('#reload-promotion').bind('click',function(){
	$('#button-update').trigger('click');
});
</script>
<?php if($status_deposit){?>
<script type="text/javascript">
$('.list_deposit').show();
$('.display_deposit').find('i').toggle();
</script>
<?php }?>
<script type="text/javascript">
$(".display_deposit").click(function() {
	$('.list_deposit').toggle();
	$(this).find('i').toggle();
	var s = $('.status_deposit');
	(s.val()==0)?s.val(1):s.val(null);
});

$(".deposit").bind('change keyup', function() {
	var v = $(this).val();

    if(v && parseInt(v) > 0){

      var t = $(this).prev();

      var total = $('.total').text();
      total = total.replace('₫','');
      var j = 1;
      for(j; j <= 4; j ++){
        total = total.replace('.','');
      }

      var sub_total = parseInt(total) - parseInt(v);

      if(parseInt(sub_total) >= 0){

        $(t).text(showNumber(v));
        $('.balance').val(sub_total.toFixed(0).replace(/./g, function(c, i, a) { return i && c !== "." && ((a.length - i) % 3 === 0) ? '.' + c : c; }) +'₫ ');

      }

    }else{
        $('.balance').val('');
        $(this).prev().text('');
    }

});
</script>
<script type="text/javascript"><!--

  function format_number(pnumber,decimals)
  {
    if (isNaN(pnumber)) { return 0};
    if (pnumber=='') { return 0};
    var snum = new String(pnumber);
    var sec = snum.split('.');
    var whole = parseFloat(sec[0]);
    var result = '';

    if(sec.length > 1){
      var dec = new String(sec[1]);
      dec = String(parseFloat(sec[1])/Math.pow(10,(dec.length - decimals)));
      dec = String(whole + Math.round(parseFloat(dec))/Math.pow(10,decimals));
      var dot = dec.indexOf('.');
      if(dot == -1){
        dec += '.';
        dot = dec.indexOf('.');
      }
      while(dec.length <= dot + decimals) { dec += '0'; }
      result = dec;
    } else{
      var dot;
      var dec = new String(whole);
      if(decimals){
        dec += '.';
        dot = dec.indexOf('.');
        while(dec.length <= dot + decimals) { dec += '0'; }
      }
      result = dec;
    }
    return result;
  }


$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';

		$.each(items, function(index, item) {
			if (item['category'] != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item['category'] + '</li>');

				currentCategory = item['category'];
			}

			self._renderItem(ul, item);
		});
	}
});

$('input[name=\'customer\']').catcomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item['customer_group'],
						label: item.name + ' -- ' +item.email,
						name: item.name,
						value: item['customer_id'],
						customer_group_id: item['customer_group_id'],
						firstname: item['firstname'],
						lastname: item['lastname'],
						email: item['email'],
						telephone: item['telephone'],
						fax: item['fax'],
						address: item['address']
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'customer\']').attr('value', ui.item['name']);
		$('input[name=\'customer_id\']').attr('value', ui.item['value']);
		$('input[name=\'firstname\']').attr('value', ui.item['firstname']);
		$('input[name=\'lastname\']').attr('value', ui.item['lastname']);
		$('input[name=\'email\']').attr('value', ui.item['email']);
		$('input[name=\'telephone\']').attr('value', ui.item['telephone']);
		$('input[name=\'fax\']').attr('value', ui.item['fax']);

		html = '<option value="0"><?php echo $text_none; ?></option>';

		for (i in  ui.item['address']) {
			html += '<option value="' + ui.item['address'][i]['address_id'] + '">' + ui.item['address'][i]['firstname'] + ' ' + ui.item['address'][i]['lastname'] + ', ' + ui.item['address'][i]['address_1'] + ', ' + ui.item['address'][i]['city'] + ', ' + ui.item['address'][i]['country'] + '</option>';
		}

		$('select[name=\'shipping_address\']').html(html);
		$('select[name=\'payment_address\']').html(html);

		$('select[name=\'payment_address\'] option:nth-child(2)').prop('selected',true);
		$('select[name=\'payment_address\']').trigger('change');

		$('select[id=\'customer_group_id\']').attr('disabled', false);
		$('select[id=\'customer_group_id\']').attr('value', ui.item['customer_group_id']);
		$('select[id=\'customer_group_id\']').trigger('change');
		$('select[id=\'customer_group_id\']').attr('disabled', true);

		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('select[id=\'customer_group_id\']').live('change', function() {
	$('input[name=\'customer_group_id\']').attr('value', this.value);

	var customer_group = [];

<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}

		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}

		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}

		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}
	}
});

$('select[id=\'customer_group_id\']').trigger('change');

$('input[name=\'affiliate\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['affiliate_id'],
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'affiliate\']').attr('value', ui.item['label']);
		$('input[name=\'affiliate_id\']').attr('value', ui.item['value']);

		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

var payment_zone_id = '<?php echo $payment_zone_id; ?>';

$('select[name=\'payment_country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=sale/order/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'payment_country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json != '' && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == payment_zone_id) {
	      				html += ' selected="selected"';
	    			}

	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'payment_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'payment_country_id\']').trigger('change');

$('select[name=\'payment_address\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=sale/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			if (json != '') {
				$('input[name=\'payment_firstname\']').attr('value', json['firstname']);
				$('input[name=\'payment_lastname\']').attr('value', json['lastname']);
				$('input[name=\'payment_company\']').attr('value', json['company']);
				$('input[name=\'payment_company_id\']').attr('value', json['company_id']);
				$('input[name=\'payment_tax_id\']').attr('value', json['tax_id']);
				$('input[name=\'payment_address_1\']').attr('value', json['address_1']);
				$('input[name=\'payment_address_2\']').attr('value', json['address_2']);
				$('input[name=\'payment_city\']').attr('value', json['city']);
				$('input[name=\'payment_postcode\']').attr('value', json['postcode']);
				$('select[name=\'payment_country_id\']').attr('value', json['country_id']);

				payment_zone_id = json['zone_id'];

				$('select[name=\'payment_country_id\']').trigger('change');
			}
		}
	});
});

var shipping_zone_id = '<?php echo $shipping_zone_id; ?>';

$('select[name=\'shipping_country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=sale/order/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'payment_country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json != '' && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == shipping_zone_id) {
	      				html += ' selected="selected"';
	    			}

	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'shipping_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'shipping_country_id\']').trigger('change');

$('select[name=\'shipping_address\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=sale/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			if (json != '') {
				$('input[name=\'shipping_firstname\']').attr('value', json['firstname']);
				$('input[name=\'shipping_lastname\']').attr('value', json['lastname']);
				$('input[name=\'shipping_company\']').attr('value', json['company']);
				$('input[name=\'shipping_address_1\']').attr('value', json['address_1']);
				$('input[name=\'shipping_address_2\']').attr('value', json['address_2']);
				$('input[name=\'shipping_city\']').attr('value', json['city']);
				$('input[name=\'shipping_postcode\']').attr('value', json['postcode']);
				$('select[name=\'shipping_country_id\']').attr('value', json['country_id']);

				shipping_zone_id = json['zone_id'];

				$('select[name=\'shipping_country_id\']').trigger('change');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'model\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.model + ' : ' + item.name,
						name: item.name,
						start_time: item.start_time,
						included: item.included,
						notincluded: item.notincluded,
						terms: item.terms,
						value: item.product_id,
						model: item.model,
						option: item.option,
						price: item.price
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'model\']').attr('value', ui.item['model']);
		$('input[name=\'product\']').attr('value', ui.item['name']);
		$('input[name=\'product_id\']').attr('value', ui.item['value']);
		$('#start_time_expend').show();
		$('#meeting_expend').show();
		$('#included_expend').show();
		$('#terms_expend').show();
		$('#notincluded_expend').show();
		$('input[name=\'start_time_input\']').attr('value', '');
		$('input[name=\'meeting_input\']').attr('value', '28/13 Bùi Viện, P.Phạm Ngũ Lão, Q.1, Tp.HCM');
		$('textarea[name=\'included_input\']').html(ui.item['included']);
		$('textarea[name=\'terms_input\']').html(ui.item['terms']);
		$('textarea[name=\'notincluded_input\']').html(ui.item['notincluded']);
		CKEDITOR.instances.included_input.setData(ui.item['included']);
		CKEDITOR.instances.terms_input.setData(ui.item['terms']);
		CKEDITOR.instances.notincluded_input.setData(ui.item['notincluded']);


		if (ui.item['option'] != '') {

			html = '';
			html +='<div id="tabsle" class="htabs">';
			html +='<a href="#tab-ngaythuong" style="text-decoration: none;">Giá ngày thường</a>';
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['class'] == 0 && option['category'] == 1 && option['type'] == 'checkbox'){
					html +='<a href="#tab-ngayle" style="text-decoration: none;">Giá tết dương lịch</a>';
					break;
				}
			}
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['class'] == 0 && option['category'] == 2 && option['type'] == 'checkbox'){
					html +='<a href="#tab-ngayle1" style="text-decoration: none;">Giá tết nguyên đán</a>';
					break;
				}
			}
			html +='</div>';

			html +='<div id="tab-ngayle">';
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['class'] == 0 && option['category'] == 1 && option['type'] == 'checkbox'){
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required'] != 0) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';

					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];

						html += '<input type="text" name="option[' + option['product_option_id'] + '][' + option_value['product_option_value_id'] + ']" value="0" id="option-value-' + option_value['product_option_value_id'] + '" size="2" />';
						html += '<label for="option-value-' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' ('+ option_value['price'] + ')';
						}

						html += '</label>';
						html += '<br />';
					}

					html += '</div>';
					html += '<br />';
				}
			}
			html +='</div>';

			html +='<div id="tab-ngayle1">';
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['class'] == 0 && option['category'] == 2 && option['type'] == 'checkbox'){
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required'] != 0) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';

					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];

						html += '<input type="text" name="option[' + option['product_option_id'] + '][' + option_value['product_option_value_id'] + ']" value="0" id="option-value-' + option_value['product_option_value_id'] + '" size="2" />';
						html += '<label for="option-value-' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' ('+ option_value['price'] + ')';
						}

						html += '</label>';
						html += '<br />';
					}

					html += '</div>';
					html += '<br />';
				}
			}
			html +='</div>';

			html +='<div id="tab-ngaythuong">';
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['category'] == 0){
					if (option['type'] == 'checkbox') {
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required'] != 0) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';

					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];

						html += '<input type="text" name="option[' + option['product_option_id'] + '][' + option_value['product_option_value_id'] + ']" value="0" id="option-value-' + option_value['product_option_value_id'] + '" size="2" />';
						html += '<label for="option-value-' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price'] + ')';
						}

						html += '</label>';
						html += '<br />';
					}

					html += '</div>';
					html += '<br />';
				}
				}
			}
			html +='</div>';

			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['type'] == 'date') {
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required']) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';
					html += '<div class="list-datepicker"></div><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" class="departure" />';
					html += '</div>';
					html += '<br />';
				}

			}

			$('#option').html('<td class="left"><?php echo $entry_option; ?></td><td class="left">' + html + '</td>');

			for (i = 0; i < ui.item.option.length; i++) {
				option = ui.item.option[i];

				if (option['type'] == 'file') {
					new AjaxUpload('#button-option-' + option['product_option_id'], {
						action: 'index.php?route=sale/order/upload&token=<?php echo $token; ?>',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						data: option,
						onSubmit: function(file, extension) {
							$('#button-option-' + (this._settings.data['product_option_id'] + '-' + this._settings.data['product_option_id'])).after('<img src="view/image/loading.gif" class="loading" />');
						},
						onComplete: function(file, json) {

							$('.error').remove();

							if (json['success']) {
								alert(json['success']);

								$('input[name=\'option[' + this._settings.data['product_option_id'] + ']\']').attr('value', json['file']);
							}

							if (json.error) {
								$('#option-' + this._settings.data['product_option_id']).after('<span class="error">' + json['error'] + '</span>');
							}

							$('.loading').remove();
						}
					});
				}
			}

			$('.date').datepicker({dateFormat: 'yy-mm-dd'});
			$('.datetime').datetimepicker({
				dateFormat: 'yy-mm-dd',
				timeFormat: 'h:m'
			});
			$('.time').timepicker({timeFormat: 'h:m'});
		} else {
			$('#option td').remove();
		}
		$('#tabsle a').tabs();
		var date_current = new Date;
		var current = new Date(date_current.getMonth()+1+"/"+(date_current.getDate())+"/"+date_current.getFullYear());
		var maxdate=new Date("12/01/"+(date_current.getFullYear()+3));
		$(".list-datepicker").datepicker({gotoCurrent:!0,changeMonth:!0,changeYear:!0,minDate:current,maxDate:maxdate,numberOfMonths:2,dateFormat: 'dd/mm/yy', altField: ".departure"})
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.model + ' : ' + item.name,
						name: item.name,
						start_time: item.start_time,
						included: item.included,
						notincluded: item.notincluded,
						terms: item.terms,
						value: item.product_id,
						model: item.model,
						option: item.option,
						price: item.price
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'model\']').attr('value', ui.item['model']);
		$('input[name=\'product\']').attr('value', ui.item['label']);
		$('input[name=\'product_id\']').attr('value', ui.item['value']);
		$('#start_time_expend').show();
		$('#meeting_expend').show();
		$('#included_expend').show();
		$('#terms_expend').show();
		$('#notincluded_expend').show();
		$('input[name=\'start_time_input\']').attr('value', ui.item['start_time']);
		$('input[name=\'meeting_input\']').attr('value', '28/13 Bùi Viện, P.Phạm Ngũ Lão, Q.1, Tp.HCM');
		$('textarea[name=\'included_input\']').html(ui.item['included']);
		$('textarea[name=\'terms_input\']').html(ui.item['terms']);
		$('textarea[name=\'notincluded_input\']').html(ui.item['notincluded']);
		CKEDITOR.instances.included_input.setData(ui.item['included']);
		CKEDITOR.instances.terms_input.setData(ui.item['terms']);
		CKEDITOR.instances.notincluded_input.setData(ui.item['notincluded']);

		if (ui.item['option'] != '') {
			html = '';
			html +='<div id="tabsle" class="htabs">';
			html +='<a href="#tab-ngaythuong" style="text-decoration: none;">Giá ngày thường</a>';
			if(ui.item['option'][0]['category'] == 1){
				html +='<a href="#tab-ngayle" style="text-decoration: none;">Giá ngày lễ</a>';
			}
			html +='</div>';

			html +='<div id="tab-ngayle">';
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['category'] == 1){
					if (option['type'] == 'checkbox') {
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required']) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';

					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];

						html += '<input type="text" name="option[' + option['product_option_id'] + '][' + option_value['product_option_value_id'] + ']" value="0" id="option-value-' + option_value['product_option_value_id'] + '" size="2" />';
						html += '<label for="option-value-' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price'] + ')';
						}

						html += '</label>';
						html += '<br />';
					}

					html += '</div>';
					html += '<br />';
				}
				}
			}
			html +='</div>';

			html +='<div id="tab-ngaythuong">';
			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['category'] == 0){
					if (option['type'] == 'checkbox') {
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required']) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';

					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];

						html += '<input type="text" name="option[' + option['product_option_id'] + '][' + option_value['product_option_value_id'] + ']" value="0" id="option-value-' + option_value['product_option_value_id'] + '" size="2" />';
						html += '<label for="option-value-' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price'] + ')';
						}

						html += '</label>';
						html += '<br />';
					}

					html += '</div>';
					html += '<br />';
				}
				}
			}
			html +='</div>';

			for (i = 0; i < ui.item['option'].length; i++) {
				option = ui.item['option'][i];
				if (option['type'] == 'date') {
					html += '<div id="option-' + option['product_option_id'] + '">';

					if (option['required']) {
						html += '<span class="required">*</span> ';
					}

					html += option['name'] + '<br />';
					html += '<div class="list-datepicker"></div><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['option_value'] + '" class="departure" />';
					html += '</div>';
					html += '<br />';
				}

			}
			$('#option').html('<td class="left"><?php echo $entry_option; ?></td><td class="left">' + html + '</td>');

			for (i = 0; i < ui.item.option.length; i++) {
				option = ui.item.option[i];

				if (option['type'] == 'file') {
					new AjaxUpload('#button-option-' + option['product_option_id'], {
						action: 'index.php?route=sale/order/upload&token=<?php echo $token; ?>',
						name: 'file',
						autoSubmit: true,
						responseType: 'json',
						data: option,
						onSubmit: function(file, extension) {
							$('#button-option-' + (this._settings.data['product_option_id'] + '-' + this._settings.data['product_option_id'])).after('<img src="view/image/loading.gif" class="loading" />');
						},
						onComplete: function(file, json) {

							$('.error').remove();

							if (json['success']) {
								alert(json['success']);

								$('input[name=\'option[' + this._settings.data['product_option_id'] + ']\']').attr('value', json['file']);
							}

							if (json.error) {
								$('#option-' + this._settings.data['product_option_id']).after('<span class="error">' + json['error'] + '</span>');
							}

							$('.loading').remove();
						}
					});
				}
			}

			$('.date').datepicker({dateFormat: 'yy-mm-dd'});
			$('.datetime').datetimepicker({
				dateFormat: 'yy-mm-dd',
				timeFormat: 'h:m'
			});
			$('.time').timepicker({timeFormat: 'h:m'});
		} else {
			$('#option td').remove();
		}
		$('#tabsle a').tabs();
		var date_current = new Date;
		var current = new Date(date_current.getMonth()+1+"-"+(date_current.getDate())+"-"+date_current.getFullYear());
		var maxdate=new Date("12/01/"+(date_current.getFullYear()+3));
		$(".list-datepicker").datepicker({gotoCurrent:!0,changeMonth:!0,changeYear:!0,minDate:current,maxDate:maxdate,numberOfMonths:2,dateFormat: 'dd/mm/yy', altField: ".departure"})
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'payment\']').bind('change', function() {
	if (this.value) {
		$('input[name=\'payment_method\']').attr('value', $('select[name=\'payment\'] option:selected').text());
	} else {
		$('input[name=\'payment_method\']').attr('value', '');
	}

	$('input[name=\'payment_code\']').attr('value', this.value);
});

$('select[name=\'shipping\']').bind('change', function() {
	if (this.value) {
		$('input[name=\'shipping_method\']').attr('value', $('select[name=\'shipping\'] option:selected').text());
	} else {
		$('input[name=\'shipping_method\']').attr('value', '');
	}

	$('input[name=\'shipping_code\']').attr('value', this.value);
});
//--></script>
<script type="text/javascript"><!--
$('#button-product, #button-voucher, #button-update').live('click', function() {
	data  = '#tab-customer input[type=\'text\'], #tab-customer input[type=\'hidden\'], #tab-customer input[type=\'radio\']:checked, #tab-customer input[type=\'checkbox\']:checked, #tab-customer select, #tab-customer textarea, ';
	data += '#tab-payment input[type=\'text\'], #tab-payment input[type=\'hidden\'], #tab-payment input[type=\'radio\']:checked, #tab-payment input[type=\'checkbox\']:checked, #tab-payment select, #tab-payment textarea, ';
	data += '#tab-shipping input[type=\'text\'], #tab-shipping input[type=\'hidden\'], #tab-shipping input[type=\'radio\']:checked, #tab-shipping input[type=\'checkbox\']:checked, #tab-shipping select, #tab-shipping textarea, ';

	if ($(this).attr('id') == 'button-product') {
		data += '#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea, ';
	} else {
		data += '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, ';
	}

	if ($(this).attr('id') == 'button-voucher') {
		data += '#tab-voucher input[type=\'text\'], #tab-voucher input[type=\'hidden\'], #tab-voucher input[type=\'radio\']:checked, #tab-voucher input[type=\'checkbox\']:checked, #tab-voucher select, #tab-voucher textarea, ';
	} else {
		data += '#voucher input[type=\'text\'], #voucher input[type=\'hidden\'], #voucher input[type=\'radio\']:checked, #voucher input[type=\'checkbox\']:checked, #voucher select, #voucher textarea, ';
	}

	data += '#tab-total input[type=\'text\'], #tab-total input[type=\'hidden\'], #tab-total input[type=\'radio\']:checked, #tab-total input[type=\'checkbox\']:checked, #tab-total select, #tab-total textarea';

	$.ajax({
		url: '<?php echo $store_url; ?>index.php?route=checkout/manual&token=<?php echo $token; ?>',
		type: 'post',
		data: $(data),
		dataType: 'json',
//		dataType: 'TEXT',
		beforeSend: function() {
			$('.success, .warning, .attention, .error').remove();

			$('.box').before('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();
			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('.box').before('<div class="warning">' + json['error']['warning'] + '</div>');
				}

				// Order Details
				if (json['error']['customer']) {
					$('.box').before('<span class="error">' + json['error']['customer'] + '</span>');
				}

				if (json['error']['firstname']) {
					$('input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
				}

				if (json['error']['lastname']) {
					$('input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
				}

				if (json['error']['email']) {
					$('input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
				}

				if (json['error']['telephone']) {
					$('input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
				}

				// Payment Address
				if (json['error']['payment']) {
					if (json['error']['payment']['firstname']) {
						$('input[name=\'payment_firstname\']').after('<span class="error">' + json['error']['payment']['firstname'] + '</span>');
					}

					if (json['error']['payment']['lastname']) {
						$('input[name=\'payment_lastname\']').after('<span class="error">' + json['error']['payment']['lastname'] + '</span>');
					}

					if (json['error']['payment']['address_1']) {
						$('input[name=\'payment_address_1\']').after('<span class="error">' + json['error']['payment']['address_1'] + '</span>');
					}

					if (json['error']['payment']['city']) {
						$('input[name=\'payment_city\']').after('<span class="error">' + json['error']['payment']['city'] + '</span>');
					}

					if (json['error']['payment']['country']) {
						$('select[name=\'payment_country_id\']').after('<span class="error">' + json['error']['payment']['country'] + '</span>');
					}

					if (json['error']['payment']['zone']) {
						$('select[name=\'payment_zone_id\']').after('<span class="error">' + json['error']['payment']['zone'] + '</span>');
					}

					if (json['error']['payment']['postcode']) {
						$('input[name=\'payment_postcode\']').after('<span class="error">' + json['error']['payment']['postcode'] + '</span>');
					}
				}

				// Shipping	Address
				if (json['error']['shipping']) {
					if (json['error']['shipping']['firstname']) {
						$('input[name=\'shipping_firstname\']').after('<span class="error">' + json['error']['shipping']['firstname'] + '</span>');
					}

					if (json['error']['shipping']['lastname']) {
						$('input[name=\'shipping_lastname\']').after('<span class="error">' + json['error']['shipping']['lastname'] + '</span>');
					}

					if (json['error']['shipping']['address_1']) {
						$('input[name=\'shipping_address_1\']').after('<span class="error">' + json['error']['shipping']['address_1'] + '</span>');
					}

					if (json['error']['shipping']['city']) {
						$('input[name=\'shipping_city\']').after('<span class="error">' + json['error']['shipping']['city'] + '</span>');
					}

					if (json['error']['shipping']['country']) {
						$('select[name=\'shipping_country_id\']').after('<span class="error">' + json['error']['shipping']['country'] + '</span>');
					}

					if (json['error']['shipping_zone']) {
						$('select[name=\'shipping_zone_id\']').after('<span class="error">' + json['error']['shipping']['zone'] + '</span>');
					}

					if (json['error']['shipping']['postcode']) {
						$('input[name=\'shipping_postcode\']').after('<span class="error">' + json['error']['shipping']['postcode'] + '</span>');
					}
				}

				// Products
				if (json['error']['product']) {
					if (json['error']['product']['option']) {
						for (i in json['error']['product']['option']) {
							$('#option-' + i).after('<span class="error">' + json['error']['product']['option'][i] + '</span>');
						}
					}

					if (json['error']['product']['stock']) {
						$('.box').before('<div class="warning">' + json['error']['product']['stock'] + '</div>');
					}

					if (json['error']['product']['minimum']) {
						for (i in json['error']['product']['minimum']) {
							$('.box').before('<div class="warning">' + json['error']['product']['minimum'][i] + '</div>');
						}
					}
				} else {
					$('input[name=\'model\']').attr('value', '');
					$('input[name=\'product\']').attr('value', '');
					$('input[name=\'product_id\']').attr('value', '');
					$('#option td').remove();
					$('input[name=\'quantity\']').attr('value', '1');
				}

				// Voucher
				if (json['error']['vouchers']) {
					if (json['error']['vouchers']['from_name']) {
						$('input[name=\'from_name\']').after('<span class="error">' + json['error']['vouchers']['from_name'] + '</span>');
					}

					if (json['error']['vouchers']['from_email']) {
						$('input[name=\'from_email\']').after('<span class="error">' + json['error']['vouchers']['from_email'] + '</span>');
					}

					if (json['error']['vouchers']['to_name']) {
						$('input[name=\'to_name\']').after('<span class="error">' + json['error']['vouchers']['to_name'] + '</span>');
					}

					if (json['error']['vouchers']['to_email']) {
						$('input[name=\'to_email\']').after('<span class="error">' + json['error']['vouchers']['to_email'] + '</span>');
					}

					if (json['error']['vouchers']['amount']) {
						$('input[name=\'amount\']').after('<span class="error">' + json['error']['vouchers']['amount'] + '</span>');
					}
				} else {
					$('input[name=\'from_name\']').attr('value', '');
					$('input[name=\'from_email\']').attr('value', '');
					$('input[name=\'to_name\']').attr('value', '');
					$('input[name=\'to_email\']').attr('value', '');
					$('textarea[name=\'message\']').attr('value', '');
					$('input[name=\'amount\']').attr('value', '25.00');
				}

				// Shipping Method
				if (json['error']['shipping_method']) {
					$('.box').before('<div class="warning">' + json['error']['shipping_method'] + '</div>');
				}

				// Payment Method
				if (json['error']['payment_method']) {
					$('.box').before('<div class="warning">' + json['error']['payment_method'] + '</div>');
				}

				// Coupon
				if (json['error']['coupon']) {
					$('.box').before('<div class="warning">' + json['error']['coupon'] + '</div>');
				}

				// Voucher
				if (json['error']['voucher']) {
					$('.box').before('<div class="warning">' + json['error']['voucher'] + '</div>');
				}

				// Reward Points
				if (json['error']['reward']) {
					$('.box').before('<div class="warning">' + json['error']['reward'] + '</div>');
				}
			} else {
				$('input[name=\'model\']').attr('value', '');
				$('input[name=\'product\']').attr('value', '');
				$('input[name=\'product_id\']').attr('value', '');
				$('#option td').remove();
				$('input[name=\'quantity\']').attr('value', '1');

				$('input[name=\'from_name\']').attr('value', '');
				$('input[name=\'from_email\']').attr('value', '');
				$('input[name=\'to_name\']').attr('value', '');
				$('input[name=\'to_email\']').attr('value', '');
				$('textarea[name=\'message\']').attr('value', '');
				$('input[name=\'amount\']').attr('value', '25.00');
			}

			if (json['success']) {
				$('.box').before('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');
			}

			if (json['order_product'] != '') {
				var product_row = 0;
				var option_row = 0;
				var download_row = 0;
				var total_row = 0;

				html = '';

				for (i = 0; i < json['order_product'].length; i++) {
					product = json['order_product'][i];

					html += '<tr id="product-row' + product_row + '" data-id="' + product_row + '">';
					html += '<td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$(\'#product-row' + product_row + '\').remove(); $(\'#button-update\').trigger(\'click\');" /><img src="view/image/product.png" onclick="update_order($(this))" class="pop" style="cursor: pointer;width: 17px;margin-top:10px"/></td>';
					html += '<td class="left">' + product['model'] + ' : ' + product['name'] + '<br />';
					html += '<input type="hidden" name="order_product[' + product_row + '][order_product_id]" value="" />';
					html += '<input type="hidden" name="order_product[' + product_row + '][product_id]" value="' + product['product_id'] + '" />';
					html += '<input type="hidden" name="order_product[' + product_row + '][name]" value="' + product['name'] + '" class="order_product_' + product_row + '_name"/>';
					html += '<input type="hidden" name="order_product[' + product_row + '][model]" value="' + product['model'] + '" class="order_product_' + product_row + '_model"/>';
					html += '<input type="hidden" name="order_product[' + product_row + '][duration]" value="' + product['duration'] + '" />';
					html += '<input type="hidden" name="order_product[' + product_row + '][start_time]" value="' + product['start_time'] + '" class="order_product_' + product_row + '_start_time" class="order_product_' + product_row + '_start_time"/>';
					html += '<input type="hidden" name="order_product[' + product_row + '][meeting]" value="' + product['meeting'] + '" class="order_product_' + product_row + '_meeting" class="order_product_' + product_row + '_meeting"/>';
					html += '<textarea name="order_product[' + product_row + '][included]" class="order_product_' + product_row + '_included" style="display:none;" class="order_product_' + product_row + '_included">' + product['included'] + '</textarea>';
					html += '<textarea name="order_product[' + product_row + '][notincluded]" class="order_product_' + product_row + '_notincluded" style="display:none;" class="order_product_' + product_row + '_notincluded">' + product['notincluded'] + '</textarea>';
					html += '<textarea name="order_product[' + product_row + '][terms]" class="order_product_' + product_row + '_terms" style="display:none;" class="order_product_' + product_row + '_terms">' + product['terms'] + '</textarea>';
					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];

							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][order_option_id]" value="' + option['order_option_id'] + '" class="order_product_' + product_row + '_order_option_' + option_row + '_order_option_id"/>';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][product_option_id]" value="' + option['product_option_id'] + '" class="order_product_' + product_row + '_order_option_' + option_row + '_product_option_id"/>';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][product_option_value_id]" value="' + option['product_option_value_id'] + '" class="order_product_' + product_row + '_order_option_' + option_row + '_product_option_value_id"/>';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][name]" value="' + option['name'] + '" class="order_product_' + product_row + '_order_option_' + option_row + '_name"/>';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][value]" value="' + option['value'] + '" class="order_product_' + product_row + '_order_option_' + option_row + '_value"/>';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_option][' + option_row + '][type]" value="' + option['type'] + '" class="order_product_' + product_row + '_order_option_' + option_row + '_type"/>';

							option_row++;
						}
					}

					if (product['download']) {
						for (j = 0; j < product['download'].length; j++) {
							download = product['download'][j];

							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][order_download_id]" value="' + download['order_download_id'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][name]" value="' + download['name'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][filename]" value="' + download['filename'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][mask]" value="' + download['mask'] + '" />';
							html += '  <input type="hidden" name="order_product[' + product_row + '][order_download][' + download_row + '][remaining]" value="' + download['remaining'] + '" />';

							download_row++;
						}
					}

					html += '  </td>';
					html += '  <td class="right"><label class="order_product_' + product_row + '_quantity_text">' + product['quantity'] + '</label><input type="hidden" name="order_product[' + product_row + '][quantity]" value="' + product['quantity'] + '" class="order_product_' + product_row + '_quantity"/></td>';
					html += '  <td class="right"><label class="order_product_' + product_row + '_price_text">' + product['price_text'] + '</label><input type="hidden" name="order_product[' + product_row + '][price]" value="' + product['price'] + '" class="order_product_' + product_row + '_price"/></td>';
					html += '  <td class="right"><label class="order_product_' + product_row + '_total_text">' + product['total_text'] + '</label><input type="hidden" name="order_product[' + product_row + '][total]" value="' + product['total'] + '" id="order_product_total_' + product_row + '" class="order_product_' + product_row + '_total"/><input type="hidden" name="order_product[' + product_row + '][tax]" value="' + product['tax'] + '" /><input type="hidden" name="order_product[' + product_row + '][reward]" value="' + product['reward'] + '" /></td>';
					html += '</tr>';

					product_row++;
				}

                <?php /* Kiem tra neu co saleoff thi cong saleoff */ ?>

                var saleoff = $('.cl_saleoff').find('td').last().text();

                if(saleoff){
                  var total_price = saleoff.replace('₫','');
                      total_price = total_price.replace('.','');
                  var row_total = parseInt(json['order_total'][0]['value']) - parseInt(total_price);

                  html += '<tr>';
                  html += '<td class="right" colspan="4">Thành tiền: </td>';
                  html += '<td class="right" >';
                  html += json['order_total'][0]['text']
                  html += '<input type="text" value="'+json['order_total'][0]['value']+'" class="order_total_1_text_input" size="10" style="display:none" onkeypress="return isNumberKey(event)">';
                  html += '</td>';
                  html += '</tr>';
                  html += '<tr>';
                  html += '<td class="right" colspan="4">Đã Giảm: </td>';
                  html += '<td class="right" >'+saleoff + '</td>';
                  html += '</tr>';
                  html += '<tr>';
                  html += '<td class="right " colspan="4">Tổng cộng</td>';
                  html += '<td class="right total" >'+row_total.toFixed(0).replace(/./g, function(c, i, a) { return i && c !== "." && ((a.length - i) % 3 === 0) ? '.' + c : c; }) +'₫ ';

                  for (i in json['order_total']) {
                    total = json['order_total'][i];
                    html += '     <input type="hidden" name="order_total[' + total_row + '][order_total_id]" value="" />';
                    html += '     <input type="hidden" name="order_total[' + total_row + '][code]" value="' + total['code'] + '" />';
                    html += '	  <input type="hidden" name="order_total[' + total_row + '][title]" value="' + total['title'] + '" />';
                    html += '     <input type="hidden" name="order_total[' + total_row + '][text]" value="' + total['text'] + '" class="order_total_' + total['sort_order'] + '_text"/>';
                    html += '     <input type="hidden" name="order_total[' + total_row + '][value]" value="' + total['value'] + '" class="order_total_' + total['sort_order'] + '"/>';
                    html += '     <input type="hidden" class="total" name="order_total[' + total_row + '][sort_order]" value="' + total['sort_order'] + '" />';
                    total_row++;
                  }

                  html += '</td>';
                  html += '</tr>';

                }else {

                    for (i in json['order_total']) {

                      total = json['order_total'][i];
                      html += '<tr id="total-row' + total_row + '" class="total-row" data-id="' + total['sort_order'] + '">';
                      html += '  <td class="right" colspan="4">';
                      if (total['sort_order'] == 7 || total['sort_order'] == 8) {
                        html += '  <span style="float:left">';
                        html += '  <img src="view/image/product.png" onclick="update_total_row($(this))" class="update_total_edit_btn" style="cursor: pointer;width: 17px;"/><img src="view/image/success.png" onclick="update_total_row_up($(this))" style="cursor: pointer;width: 17px;display:none;"/>';
                        html += '  </span>';
                      }
                      html += total['title'] + ':';
                      html += '     <input type="hidden" name="order_total[' + total_row + '][order_total_id]" value="" />';
                      html += '     <input type="hidden" name="order_total[' + total_row + '][code]" value="' + total['code'] + '" />';
                      html += '	  <input type="hidden" name="order_total[' + total_row + '][title]" value="' + total['title'] + '" />';
                      html += '     <input type="hidden" name="order_total[' + total_row + '][text]" value="' + total['text'] + '" class="order_total_' + total['sort_order'] + '_text"/>';
                      html += '     <input type="hidden" name="order_total[' + total_row + '][value]" value="' + total['value'] + '" class="order_total_' + total['sort_order'] + '"/>';
                      html += '     <input type="hidden" name="order_total[' + total_row + '][sort_order]" value="' + total['sort_order'] + '" />';
                      html += '  </td>';
                      html += '  <td class="right total">';
                      html += '  <label class="order_total_' + total['sort_order'] + '_text_text">' + total['text'] + '</label>';
                      html += '  <input type="text" value="' + total['value'] + '" class="order_total_' + total['sort_order'] + '_text_input" size="10" style="display:none" onkeypress="return isNumberKey(event)"/>';

                      html += '  </td>';
                      html += '</tr>';
                      total_row++;
                    }

                }




				$('#product').html(html);

				if (json['product_id']) {
					$('.order_product_' + (product_row - 1) + '_included').html(CKEDITOR.instances.included_input.getData());
					$('.order_product_' + (product_row - 1) + '_terms').html(CKEDITOR.instances.terms_input.getData());
					$('.order_product_' + (product_row - 1) + '_notincluded').html(CKEDITOR.instances.notincluded_input.getData());
					$('#start_time_expend').hide();
					$('#meeting_expend').hide();
					$('#included_expend').hide();
					$('#notincluded_expend').hide();
					$('#terms_expend').hide();
					$('input[name=\'start_time_input\']').val('')
					$('input[name=\'meeting_input\']').val('')
					$('textarea[name=\'included_input\']').html('');
					$('textarea[name=\'terms_input\']').html('');
					$('textarea[name=\'notincluded_input\']').html('');
					CKEDITOR.instances.included_input.setData('');
					CKEDITOR.instances.notincluded_input.setData('');
					CKEDITOR.instances.terms_input.setData('');

				}

			} else {
				html  = '</tr>';
				html += '  <td colspan="5" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';

				$('#product').html(html);
			}

			// Vouchers
			if (json['order_voucher'] != '') {
				var voucher_row = 0;

				 html = '';

				 for (i in json['order_voucher']) {
					voucher = json['order_voucher'][i];

					html += '<tr id="voucher-row' + voucher_row + '">';
					html += '  <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$(\'#voucher-row' + voucher_row + '\').remove(); $(\'#button-update\').trigger(\'click\');" /></td>';
					html += '  <td class="left">' + voucher['description'];
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][order_voucher_id]" value="" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][voucher_id]" value="' + voucher['voucher_id'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][description]" value="' + voucher['description'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][code]" value="' + voucher['code'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][from_name]" value="' + voucher['from_name'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][from_email]" value="' + voucher['from_email'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][to_name]" value="' + voucher['to_name'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][to_email]" value="' + voucher['to_email'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][voucher_theme_id]" value="' + voucher['voucher_theme_id'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][message]" value="' + voucher['message'] + '" />';
					html += '  <input type="hidden" name="order_voucher[' + voucher_row + '][amount]" value="' + voucher['amount'] + '" />';
					html += '  </td>';
					html += '  <td class="left"></td>';
					html += '  <td class="right">1</td>';
					html += '  <td class="right">' + voucher['amount'] + '</td>';
					html += '  <td class="right">' + voucher['amount'] + '</td>';
					html += '</tr>';

					voucher_row++;
				}

				$('#voucher').html(html);
			} else {
				html  = '</tr>';
				html += '  <td colspan="6" class="center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';

				$('#voucher').html(html);
			}

			// Shipping Methods
			if (json['shipping_method']) {
				html = '<option value=""><?php echo $text_select; ?></option>';

				for (i in json['shipping_method']) {
					html += '<optgroup label="' + json['shipping_method'][i]['title'] + '">';

					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							if (json['shipping_method'][i]['quote'][j]['code'] == $('input[name=\'shipping_code\']').attr('value')) {
								html += '<option value="' + json['shipping_method'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_method'][i]['quote'][j]['title'] + '</option>';
							} else {
								html += '<option value="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</option>';
							}
						}
					} else {
						html += '<option value="" style="color: #F00;" disabled="disabled">' + json['shipping_method'][i]['error'] + '</option>';
					}

					html += '</optgroup>';
				}

				$('select[name=\'shipping\']').html(html);

				if ($('select[name=\'shipping\'] option:selected').attr('value')) {
					$('input[name=\'shipping_method\']').attr('value', $('select[name=\'shipping\'] option:selected').text());
				} else {
					$('input[name=\'shipping_method\']').attr('value', '');
				}

				$('input[name=\'shipping_code\']').attr('value', $('select[name=\'shipping\'] option:selected').attr('value'));
			}

			// Payment Methods
			if (json['payment_method']) {
				html = '<option value=""><?php echo $text_select; ?></option>';

				for (i in json['payment_method']) {
					if (json['payment_method'][i]['code'] == $('input[name=\'payment_code\']').attr('value')) {
						html += '<option value="' + json['payment_method'][i]['code'] + '" selected="selected">' + json['payment_method'][i]['title'] + '</option>';
					} else {
						html += '<option value="' + json['payment_method'][i]['code'] + '">' + json['payment_method'][i]['title'] + '</option>';
					}
				}

				$('select[name=\'payment\']').html(html);

				if ($('select[name=\'payment\'] option:selected').attr('value')) {
					$('input[name=\'payment_method\']').attr('value', $('select[name=\'payment\'] option:selected').text());
				} else {
					$('input[name=\'payment_method\']').attr('value', '');
				}

				$('input[name=\'payment_code\']').attr('value', $('select[name=\'payment\'] option:selected').attr('value'));
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

//--></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'dd/mm/yy'});
$('.datetime').datetimepicker({
	dateFormat: 'dd/mm/yy',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
$('#tabs a').tabs();
//--></script>
<script>
$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);

	return false;
});
$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

$('#button-history').live('click', function() {
	CKupdate();
    if(typeof verifyStatusChange == 'function'){
        if(verifyStatusChange() == false){
            return false;
        }else{
            addOrderInfo();
        }
    }else{
        addOrderInfo();
    }
	$('#messagebox').show();

	$.ajax({
		url: 'index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + encodeURIComponent($('input[name=\'notify\']').attr('checked') ? 1 : 0) + '&append=' + encodeURIComponent($('input[name=\'append\']').attr('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment_history\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-history').attr('disabled', true);
			$('#history').prepend('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-history').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#history').html(html);
			$('textarea[name=\'comment_history\']').val('');
			CKEDITOR.instances.comment_history.setData();
			$('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
			$('html, body').animate({ scrollTop: 0 }, 'slow');
			$('#messagebox').hide();
			setTimeout(
			function(){
				location.reload();
			}
			,1000)

		}
	});
});
</script>
<script type="text/javascript"><!--
    function orderStatusChange(){
        var status_id = $('select[name="order_status_id"]').val();

        $('#openbayInfo').remove();

        $.ajax({
            url: 'index.php?route=extension/openbay/ajaxOrderInfo&token=<?php echo $this->request->get['token']; ?>&order_id=<?php echo $this->request->get['order_id']; ?>&status_id='+status_id,
            type: 'post',
            dataType: 'html',
            beforeSend: function(){},
            success: function(html) {
                $('#history').after(html);
            },
            failure: function(){},
            error: function(){}
        });
    }

    function addOrderInfo(){
        var status_id = $('select[name="order_status_id"]').val();
        var old_status_id = $('#old_order_status_id').val();

        $('#old_order_status_id').val(status_id);

        $.ajax({
            url: 'index.php?route=extension/openbay/ajaxAddOrderInfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id='+status_id+'&old_status_id='+old_status_id,
            type: 'post',
            dataType: 'html',
            data: $(".openbayData").serialize(),
            beforeSend: function(){},
            success: function() {},
            failure: function(){},
            error: function(){}
        });
    }

    $(document).ready(function() {
        orderStatusChange();
    });



    $('select[name="order_status_id"]').change(function(){orderStatusChange();});
//--></script>
<script type="text/javascript" src="view/javascript/orderedit.js"></script>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="view/javascript/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript"><!--
$( 'textarea.editor').each( function() {
 CKEDITOR.replace( $(this).attr('id'),{
	 filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
 });
});
function CKupdate(){
    for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();
}
//--></script>
<?php echo $footer; ?>