<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title><?php echo $heading_title?></title>

<base href="<?php echo $base; ?>" />

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/print.css" />

<link href="<?php echo $link?>" rel="canonical">

</head>

<body>

<div class="body">

  <div class="wrapper">

  <?php echo $header?>

   <div class="content">

    <h1 class="content_title"><?php echo $model; ?>: <?php echo $name ;?></h1>

    <?php if($shortdescription){?><div class="content_desc"><?php echo $shortdescription; ?></div><?php }?>

    

    <?php if($highlights){?>

    <ul class="content_note">

        <div><?php echo $text_highlights ;?></div> 

        <?php echo $highlights?>

    </ul>

    <?php } ?>

    

    <?php if($product_details){?>

    <?php foreach($product_details as $item){?>

    <div class="schedule">

        <div class="schedule_title">

            <label><?php echo $item['label']?></label><span><?php echo $item['title']?></span>

        </div>

        <div class="schedule_text">

            <?php echo $item['text']?>

            <?php if($item['meals']){?>

            <div class="meal">

                <?php foreach($item['meals'] as $m){?>

                <p><img src="<?php echo $m['image']?>" /><span><?php echo $m['name']?></span></p>

                <?php }?>

            </div>

            <?php }?>

        </div>

    </div>

    <?php } ?>

    <?php }else{?>

    <?php if($description){ ?>

    <?php echo $description; ?>

    <?php } ?>

    <?php } ?>

    

    <?php if($included){?>

    <ul class="content_note">

        <div><?php echo $text_included; ?></div> 

        <?php echo $included; ?>

    </ul>

    <?php } ?>

    

    <?php if($notincluded){?>

    <ul class="content_note">

        <div><?php echo $text_notincluded; ?></div> 

        <?php echo $notincluded; ?>

    </ul>

    <?php } ?>

    

    <?php if($info){?>

    <ul class="content_note">

        <div><?php echo $text_info; ?></div> 

        <?php echo $info; ?>

        <ul>

         <li>Mọi thắc mắc xin vui lòng liên hệ với chúng tôi qua số điện thoại:

         <ul>

          <li><span style="font-weight:bold;color:red;"><label style="color:#333">TƯ VẤN:</label> +84 (0) 903 779 759 - (0) 903 550 236 </span></li>

          <li><span style="font-weight:bold;color:red;"><label style="color:#333">ĐẶT TOUR:</label> +84 (08) 360 226 49 - 2210 2465 - 2240 6474 - 6651 81 67</span></li>

          <li>Hoặc<span style="font-weight:bold"> </span>qua địa chỉ email: <span style="font-weight:bold"><a href="mailto:sales@vietfuntravel.com.vn">sales@vietfuntravel.com.vn</a></span> Chúng tôi sẽ hỗ trợ quý khách 24/7.</li>

         </ul>

         </li>

        </ul>

    </ul>

    <?php } ?>

    

    <?php if($meeting){?>

    <ul class="content_note">

        <div><?php echo $text_meeting; ?></div> 

        <?php echo $meeting; ?>

    </ul>

    <?php } ?>

    

    <?php if($options){?>

    <div id="tab-price" class="tab-content">

      <div class="price_details content_introduction">

        <div class="detail_tour_price_detail_wrap" id="togglerone">          

          <div class="price-detail-item">

            <div class="title_table_price"><span>Bảng giá ngày thường</span></div>

            <table class="table_style table_price">

                <thead>

                    <th class="line">



                        <table>

                            <tr>

                                <td>&nbsp;</td>

                                <td>Giá</td>

                            </tr>

                            <tr>

                                <td>Loại</td>

                                <td>&nbsp;</td>

                            </tr>

                        </table>

                    </th>

                    

                    <?php foreach ($options as $option)  {?>

                    <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

                    <th><?php echo $option['name']; ?></th>

                    <?php } ?>

                    <?php } ?>

                </thead>

                <tbody>

                    <tr>

                        <td class="in">

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td><?php echo $option_value['name']; ?><label>&nbsp;</label></td></tr></table>

                        <?php }?>

                        <?php break;}?>

                        <?php }?>

                         </td>

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '0') { ?>

                        <td class="in">

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td class="pri"><?php echo $option_value['price']; ?><label><?php if(in_array($option['option_id'],$phuthu)){?><?php echo $option_value['name']; ?><?php }else{?>&nbsp;<?php }?></label></td></tr></table>

                        <?php } ?>

                        </td>

                        <?php }?>

                        <?php } ?>

                    </tr>

                </tbody>

            </table>

          </div>

         <!--Ve may bay--> 

          <?php if($check_maybay){?>

          <div class="price-detail-item">

            <div class="title_table_price"><span>Vé Máy Bay</span></div>

            <table class="table_style table_price">

                <thead>

                    <th class="line">

                        <table>

                            <tr>

                                <td>&nbsp;</td>

                                <td>Giá</td>

                            </tr>

                            <tr>

                                <td>Loại</td>

                                <td>&nbsp;</td>

                            </tr>

                        </table>

                    </th>

                    

                    <?php foreach ($options as $option)  {?>

                    <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

                    <th><?php echo $option['name']; ?></th>

                    <?php } ?>

                    <?php } ?>

                </thead>

                <tbody>

                    <tr>

                        <td class="in">

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td><?php echo $option_value['name']; ?><label>&nbsp;</label></td></tr></table>

                        <?php }?>

                        <?php break;}?>

                        <?php }?>

                         </td>

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '1') { ?>

                        <td class="in">

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td class="pri"><?php echo $option_value['price']; ?><label><?php if(in_array($option['option_id'],$phuthu)){?><?php echo $option_value['name']; ?><?php }else{?>&nbsp;<?php }?></label></td></tr></table>

                        <?php } ?>

                        </td>

                        <?php }?>

                        <?php } ?>

                    </tr>

                </tbody>

            </table>

          </div>

          <?php }?>

          

        <!--Ve Tau-->

          <?php if($check_vetau){?>

          <div class="price-detail-item">

            <div class="title_table_price"><span>Vé Tàu</span></div>

            <table class="table_style table_price">

                <thead>

                    <th class="line">

                        <table>

                            <tr>

                                <td>&nbsp;</td>

                                <td>Giá</td>

                            </tr>

                            <tr>

                                <td>Loại</td>

                                <td>&nbsp;</td>

                            </tr>

                        </table>

                    </th>

                    <?php foreach ($options as $option)  {?>

                    <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '3') { ?>

                    <th><?php echo $option['name']; ?></th>

                    <?php } ?>

                    <?php } ?>

                </thead>

                <tbody>

                    <tr>

                        <td class="in">

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '3') { ?>

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td><?php echo $option_value['name']; ?><label>&nbsp;</label></td></tr></table>

                        <?php }?>

                        <?php break;}?>

                        <?php }?>

                         </td>

                        <?php foreach ($options as $option)  {?>

                        <?php if ($option['type'] == 'checkbox' && $option['category'] == '0' && $option['class'] == '3') { ?>

                        <td class="in">

                        <?php foreach ($option['option_value'] as $option_value) { ?>

                        <table><tr><td class="pri"><?php echo $option_value['price']; ?><label><?php if(in_array($option['option_id'],$phuthu)){?><?php echo $option_value['name']; ?><?php }else{?>&nbsp;<?php }?></label></td></tr></table>

                        <?php } ?>

                        </td>

                        <?php }?>

                        <?php } ?>

                    </tr>

                </tbody>

            </table>

          </div>

          <?php }?>

          

        </div>

      </div>

    </div>  

    <?php }?>

      

    <?php if($attribute_groups){?>

    <div class="title_table_price title_table_hotel"><span>Khách sạn</span></div> 

    <table class="table_style table_payment">

          <thead>

            <tr>

              <th scope="col">Vùng</th>

              <th scope="col">Loại tour</th>

              <th scope="col">Khách sạn</th>

            </tr>

          </thead>

          <tbody>

            <?php foreach ($attribute_groups as $attribute_group) { ?>

            <tr>

              <td rowspan="<?php echo $attribute_group['total']; ?>" class="pri"><?php echo $attribute_group['name']; ?></td>

              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>

              <td align="center"><?php echo $attribute['name_type']; ?></td>

              <td align="center"><?php echo $attribute['name']; ?></td>

            </tr>

            <?php } ?>

            <?php } ?>

          </tbody>

        </table>

    <?php }?>

    

    <?php if($policy){?>

    <?php echo $policy['description'];?>

    <?php } ?>

   </div>

  <?php echo $footer?>

  </div>

</div>



<div class="print" title="In trang"><i class="icon_print"></i></div>

<div class="pdf" title="Xuất file pdf"><a href="//pdfcrowd.com/url_to_pdf/?height=-1&amp;pdf_name=<?php echo $heading_title?>.pdf&use_print_media=1" class="icon_pdf"></a></div>

<div class="back" title="<?php echo $heading_title?>"><a href="<?php echo $link?>"><i class="icon_back"></i></a></div>

<?php if ($copy_active) {?>

    <script>

    function printPage(){

        window.print();

    };

    $('.print').bind('click',function(){

        printPage();

    })

    $(document).ready(function() {

    $('.wrapper').bind('hover',function(){

        ondisfun(this);

    })

    $('.wrapper').bind('mouseleave', function() {

        offdisfun(this);

    });

        

    });

    function ondisfun(e){

        $(e).css({'-webkit-user-select':'none','-moz-user-select':'none'});

        $(e).attr({'copy':'return false','onselectstart':'return false','oncut':'return false','onpaste':'return false'});

    }

    function offdisfun(e){

        $(e).css({'-webkit-user-select':'','-moz-user-select':''});

        $(e).removeAttr('copy').removeAttr('onselectstart').removeAttr('oncut').removeAttr('onpaste');

    }

  </script> 

<?php }?>



   

</body>

</html>