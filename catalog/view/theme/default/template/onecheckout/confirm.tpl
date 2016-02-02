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
            <td class="total" style="width:100px !important;"><?php echo $column_total; ?></td>
        </tr>
        </thead>
        <tbody>
        <?php $total = 0;$total2=0;$sale2=0; foreach ($products as $product) { ;?>
        <tr>
            <td class="name"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?>

            </td>
            <td class="quantity">
                <select name="quantity[<?php echo $product['key']; ?>]" size="0">
                    <?php for($i = 0; $i <= 30; $i++){ ?>
                    <?php if($i == $product['quantity']){ ?>
                    <option value="<?php echo $i?>" selected="selected"><?php echo $i?></option>
                    <?php }else{ ?>
                    <option value="<?php echo $i?>"><?php echo $i?></option>
                    <?php }?>
                    <?php }?>
                </select><span><?php echo $product['quantity'];?></span></td>
            <td class="price"><?php echo $product['price'];?><br>                
            </td>
            <td class="total">
            <?php echo $this->currency->format($product['total'])."<br>";?>
                <?php
            $exp = explode(' ',$product['option'][0]['name']);
              if($exp[0] == 'Giá' && in_array(99,$exp)){
                $sale = 0;
                $date = explode('/', $product['option'][1]['value']);
                $date_ch = strtotime($date[1].'/'.$date[0].'/'.$date[2]);
                if($date_ch <= strtotime('01/03/2016') && $date_ch >= strtotime('12/23/2015')){
                    if($this->cart->filtertour($product['product_id']) == 0){
                        if($product['quantity'] < 5){
                            $sale = 99000;
                        }elseif($product['quantity'] >= 5){
                            $sale = 119000;
                        }
                    }elseif($this->cart->filtertour($product['product_id']) == 1){
                        if($product['quantity'] < 5){
                            $sale = 129000;
                        }elseif($product['quantity'] >= 5){
                            $sale = 219000;
                        }
                    }
                }
                $sale2 = $sale2 + ($sale*$product['quantity']);
                $returns = true;
                $total = $total + $product['total']-($sale*$product['quantity']);
                }else{
                $total = $total + $product['total'];
                

                }
                $total2 = $total2 + $product['total'];
                
                ?>
                <span class="remove"><a href="javascript:void(0)" title="<?php echo $button_remove; ?>" data-id="<?php echo $product['key']; ?>" /></a></span>

                </td>

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

        <tr>
            <td colspan="2" class="price">Thành tiền:</td>
            <td colspan="2" class="total"><b> <?php echo $this->currency->format($total2);?></b></td>
        </tr>
        <?php if(isset($sale2) && $sale2 != 0){ ?>
         <tr>
            <td colspan="2" class="price">Giảm:</td>
            <td colspan="2" class="total"><b> <?php echo $this->currency->format($sale2);?></b></td>
        </tr>
        <?php } ?>
        <tr>
            <td colspan="2" class="price">Tổng tiền thanh toán:</td>
            <td colspan="2" class="total"> <?php echo $this->currency->format($total);?></td>
        </tr>
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