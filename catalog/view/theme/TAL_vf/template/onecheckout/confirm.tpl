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
        <?php $total = 0;$total2=0;$sale2=0; foreach ($products as $product) { ?>
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
              if(preg_match('/người lớn/',$product['option'][0]['name'])){
                $sale = 0;
                $date = explode('/', end($product['option'])['value']);
                $date_ch = strtotime($date[1].'/'.$date[0].'/'.$date[2]);
                if(isJSON($this->event->check((int)$product['product_id']))){
                    $EVENT_START = EVENT_START;  
                    $EVENT_START2 = EVENT_START;     
                    $EVENT_END = EVENT_END;
                } else{
                    $EVENT_START = '0000-00-00';         
                    $EVENT_START2 = '0000-00-00';            
                    $EVENT_END = '0000-00-00';
                }

                if($date_ch >= strtotime($EVENT_START2) && $date_ch <= strtotime($EVENT_END)) {
                    /*---- code by minh event am lich -----*/
                    $json = json_decode($this->event->check((int)$product['product_id']));
                    if(isset($json)){
                        preg_match('/[0-9]/',$json->name,$match);
                        if($product['day_pay'] == 1){
                            if($match[0] == 1 || $match[0] == 2 || $match[0] == 3) {
                                $sale = 70000;
                            }elseif($match[0] == 4 || $match[0] == 5 || $match[0] == 6) {
                                $sale = 106000;
                            }else{
                                $sale = 279000;
                            }
                        }
                        if($product['day_pay'] == 2){
                            if($match[0] == 1 || $match[0] == 2 || $match[0] == 3) {
                                $sale = 86000;                       
                            }elseif($match[0] == 4 || $match[0] == 5 || $match[0] == 6) {
                                $sale = 126000;
                            }else{
                                $sale = 329000;
                            }
                        }
                        if($product['day_pay'] == 3){
                            if($match[0] == 1 || $match[0] == 2 || $match[0] == 3) {
                                $sale = 117000;
                            }elseif($match[0] == 4 || $match[0] == 5 || $match[0] == 6) {
                                $sale = 158000;
                            }else{
                                $sale = 379000;
                            }
                        }
                    }
                    /*---- code by minh  event am lich -----*/
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