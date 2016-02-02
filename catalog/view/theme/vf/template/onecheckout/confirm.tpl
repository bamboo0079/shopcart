<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="onecheckout-product">
  <table>
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="price"><?php echo $column_price; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <td class="quantity">
        <select name="quantity[<?php echo $product['key']; ?>]" size="0">
        <?php for($i = 0; $i <= 30; $i++){?>
        <?php if($i == $product['quantity']){?>
        <option value="<?php echo $i?>" selected="selected"><?php echo $i?></option>
        <?php }else{?>
        <option value="<?php echo $i?>"><?php echo $i?></option>
        <?php }?>
        <?php }?>
        </select><span><?php echo $product['quantity'];?></span></td>
        <td class="price"><?php echo $product['price']; ?></td>
        <td class="total"><?php echo $product['total']; ?><span class="remove"><a href="javascript:void(0)" title="<?php echo $button_remove; ?>" data-id="<?php echo $product['key']; ?>" /></a></span></td>
        
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="quantity">1</td>
        <td class="price"><?php echo $voucher['amount']; ?></td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <?php if($total['value'] != 0){?>
      <tr>
        <td colspan="2" class="price"><b><?php echo $total['title']; ?>:</b></td>
        <td colspan="2" class="total"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
      <?php } ?>
    </tfoot>
  </table>
</div>
<?php echo $cartmodule; ?>
<?php if ($text_agree) { ?>
<div class="buttons"> 
    <label> 
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?><?php echo $text_agree; ?><label><br /><br />
  <div class="right divclear">
    <a id="button-confirmorder" class="button"><span><?php echo $button_confirm; ?></span></a>
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="right">
    <a id="button-confirmorder" class="button"><span><?php echo $button_confirm; ?></span></a>
  </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
    width: '100%',
    height: '70%'
});
//--></script>