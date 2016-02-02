<?php echo $header;?><?php echo $column_left; ?><?php echo $column_right; ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/even29.css">
<div id="content" class="category home"><?php echo $content_top; ?>
    <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
    <h1 itemprop="name" class="promotion_title"><a href="<?php echo $url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>
    <div id="promotion_content_desc" class="promotion_content_desc">
        <?php echo $desc;?>
    </div>
    <div class="promotion_content">
        <div class="tool">
            <ul>
                <li><div class="top ico tooltips"><i class="fa fa-arrow-up"></i><span><?php echo $text_top;?></span></div></li>
                <li><div class="km ico tooltips"><i class="fa fa-newspaper-o"></i><span><?php echo $text_promotion;?></span></div></li>
                <li><div class="list_map ico tooltips"><i class="fa fa-map-marker"></i><span><?php echo $text_location;?></span></div></li>
                <li><div class="sg ico tooltips"><i class="char"><?php echo $text_sg;?></i><span><?php echo $text_saigon;?></span></div></li>
                <li><div class="pt ico tooltips"><i class="char"><?php echo $text_pt;?></i><span><?php echo $text_phanthiet;?></span></div></li>
                <li><div class="dn ico tooltips"><i class="char"><?php echo $text_dn;?></i><span><?php echo $text_danang;?></span></div></li>
            </ul>
        </div>
        <div id="tabs" class="htabs">
            <a href="#tab-product3" class="product3"><span class="headtitle">điểm đến:</span>  <?php echo $text_local_start_3;?></a>
            <a href="#tab-product2" class="product2"><span class="headtitle">điểm đến:</span>  <?php echo $text_local_start_2;?></a>
            <a href="#tab-product_mt" class="product_mt"><span class="headtitle">điểm đến:</span>  <?php echo $text_local_start_1;?></a>
        </div>

        <div id="tab-product3">
            <div id="tabs3" class="htabs1">
                <a href="#tab-productmt" class="productmt"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  miền tây</span></a>
                <a href="#tab-productsg" class="productsg"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  sài gòn</span></a>
                <a href="#tab-productvt" class="productvt"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  vũng tàu</span></a>
                <a href="#tab-productpq" class="productpq"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  phú quốc</span></a>
            </div>

            <div id="tab-productmt">
                   <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                    <th class="type">Giảm</th>
                    <th class="type_tour">Loại Tour</th>
                    <th class="model">Mã Tour</th>
                    <th class="title"><?php echo $text_name?></th>
                    <th class="start_time">Loại</th>
                    <th class="price">Giá Đã Giảm</th>
                    <th class="type"></th>
                    </tr>
                    <?php $count = count($products4);?>
                    <?php foreach($products4 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline first">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                       <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>

                    <?php $count = count($products5);?>
                    <?php foreach($products5 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_sescon">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline sescon">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                       <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>

                    <?php $count = count($products6);?>
                    <?php foreach($products6 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_three">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline three">
                                <span>559.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productsg">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products1);?>
                    <?php foreach($products1 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline first_mt">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                        if ($key1 == 0) {
                                        ?>
                                        <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                       <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products2);?>
                    <?php foreach($products2 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_sescon_mt">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline sescon_mt">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products3);?>
                    <?php foreach($products3 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_three_mt">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline three_mt">
                                <span>559.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                       <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productvt">
                   <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                    <th class="type">Giảm</th>
                    <th class="type_tour">Loại Tour</th>
                    <th class="model">Mã Tour</th>
                    <th class="title"><?php echo $text_name?></th>
                    <th class="start_time">Loại</th>
                    <th class="price">Giá Đã Giảm</th>
                    <th class="type"></th>
                    </tr>
                    <?php $count = count($products7);?>
                    <?php foreach($products7 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline first_vt">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productpq">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products10);?>
                    <?php foreach($products10 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline first_pq">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products11);?>
                    <?php foreach($products11 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_sescon_pq">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline sescon_pq">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
        </div>
        <div id="tab-product2">
            <div id="tabs2" class="htabs1 tour-two">
                <a href="#tab-productpt" class="productpt"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  phan thiết</span></a>
                <a href="#tab-productdl" class="productdl"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  đà lạt</span></a>
                <a href="#tab-productnt" class="productnt"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  nha trang</span></a>
                <a href="#tab-productdn" class="productdn"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  đà nẵng</span></a>
                <a href="#tab-productha" class="productha"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  hội an</span></a>
                <a href="#tab-producth" class="producth"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  huế</span></a>
            </div>

            <div id="tab-productpt">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products13);?>
                    <?php foreach($products13 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products14);?>
                    <?php foreach($products14 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productdl">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products16);?>
                    <?php foreach($products16 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products17);?>
                    <?php foreach($products17 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>    
            </div>
            <div id="tab-productnt">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products19);?>
                    <?php foreach($products19 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products20);?>
                    <?php foreach($products20 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productdn">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products22);?>
                    <?php foreach($products22 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline first_dn">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products23);?>
                    <?php foreach($products23 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_sescon_dn">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline sescon_dn">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products24);?>
                    <?php foreach($products24 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_three_dn">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline three_dn">
                                <span>559.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productha">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products25);?>
                    <?php foreach($products25 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-producth">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products28);?>
                    <?php foreach($products28 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
        </div>

        <div id="tab-product_mt">
            <div id="tabs1" class="htabs1 tour-three">
                <a href="#tab-producthn" class="producthn"><i class="fa fa-star fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> hà nội</span></a>
                <a href="#tab-producthl" class="producthl"><i class="fa fa-star fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> hạ long</span></a>
                <a href="#tab-productsp" class="productsp"><i class="fa fa-star fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> sapa</span></a>
            </div>
            <div id="tab-producthn">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products31);?>
                    <?php foreach($products31 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline first_hn">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $total_option = count($option['option_value']);?>
                                    <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products32);?>
                    <?php foreach($products32 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_sescon_hn">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline sescon_hn">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products33);?>
                    <?php foreach($products33 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr class="r_three_hn">
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline three_hn">
                                <span>559.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-producthl">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products34);?>
                    <?php foreach($products34 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products35);?>
                    <?php foreach($products35 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
            <div id="tab-productsp">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type">Giảm</th>
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="start_time">Loại</th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php $count = count($products37);?>
                    <?php foreach($products37 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>139.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                    <?php $count = count($products38);?>
                    <?php foreach($products38 as $key =>$item){?>
                    <?php if ($key == 0) { ?>
                    <tr>
                        <td class="type_tour" rowspan="<?php echo $count;?>">
                            <div class="price_hotline">
                                <span>269.000đ</span>
                                <span class="arrow_price"></span>
                            </div>
                        </td>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }else{?>
                        <tr>
                        <td class="type">
                            <?php echo $item['duration']?>
                        </td>
                        <td class="model">
                            <?php echo $item['model']?>
                        </td>
                        <td class="title">
                            <a href="<?php echo $item['href']?>" target="_blank" rel="nofollow" title="<?php echo $item['name']?>">
                                <?php echo $item['name']?>
                            </a>
                        </td>
                        <td class="start_time" >
                            <?php foreach ($item['product_option_id'] as $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { ?>
                                <?php $count_option = count($option['option_value']);
                                    foreach ($option['option_value'] as $key => $option_value) { 
                                                if ($count_option == $key+1) {
                                                    echo '<div class = "non-border">'.$option_value["name"].'</div>';
                                                }else{
                                                    echo '<div>'.$option_value["name"].'</div>'; 
                                                }}?>
                                <?php break;}?>
                            <?php }?>
                        </td>
                        <td class="price">
                            <?php foreach ($item['product_option_id'] as $key1 => $option)  {?>
                                <?php if ($option['type'] == 'checkbox' && $option['category'] == $even_date && $option['class'] == '0') { 
                                     if ($key1 == 0) {
                                    ?>
                                    <?php $count_option = count($option['option_value']);
                                        foreach ($option['option_value'] as $key => $option_value) { 
                                            if ($count_option == $key+1) {
                                                echo '<div class = "non-border">'.$option_value["price"].'</div>';
                                            }else{
                                                echo '<div>'.$option_value["price"].'</div>'; 
                                            }
                                        }
                                    }
                                }
                            } ?>
                        </td>
                        <td class="info">
                            <a href="<?php echo $item['href']?>" target="_blank"  rel="nofollow" title="<?php echo $item['name']?>">Xem
                            </a>
                        </td>
                    </tr>
                    <?php }}?>
                </table>
            </div>
        </div>
    </div>    
    <div style="display:none">
        <div id="list_map">
            <p class="title"><?php echo $text_list_location;?></p>
            <?php for ($i = 0; $i < count($cats);) { ?>
            <ul class="list_map_promotion">
                <?php $j = $i + ceil(count($cats) / 4); ?>
                <?php for (; $i < $j; $i++) { ?>
                <?php if (isset($cats[$i])) { ?>
                <li><a href="<?php echo $cats[$i]['href']; ?>" rel="nofollow"><i class="fa fa-map-marker"></i> <?php echo $cats[$i]['name']; ?></a></li>
                <?php }?>
                <?php }?>
            </ul>
            <?php } ?>
        </div>
    </div>
    <!--Comment-->
    <div class="promotion_carousel">
        <div class="content_box jcarousel" id="carousel_promotion">
            <ul class="items">
            <?php foreach($cats as $item){?>
            <li>
            <a href="<?php echo $item['href']; ?>" rel="nofollow"><img src="<?php echo $item['thumb']; ?>" alt="<?php echo $item['name']; ?>"></a>
            <span><?php echo $item['name']; ?></span>
            </li>
            <?php }?>
            </ul>
            <a class="control-prev" id="last-prev"></a> 
            <a class="control-next" id="last-next"></a>
        </div>
    </div>
    <div id="promotion_content_news"></div>
      <?php echo $comment?>
      <!--Comment-->
<?php echo $content_bottom; ?></div>
<script>
$(document).ready(function() {
    var e = $(".tool"),
    t = $(window),
    n = e.offset(),
    r = 0;
    t.scroll(function () {
        if (t.scrollTop() > n.top) {
            e.addClass("fixed-scroll")
        } else {
            e.removeClass("fixed-scroll")
        }
    })
    function goToByScroll(e,s,t){
        $(e).click(function(e) { 
            $(t).trigger('click');
            $('html,body').animate({scrollTop: $(s).offset().top},100);           
        });
    }
    goToByScroll('.top','.promotion_content_desc');
    goToByScroll('.sg','#tabs','.product_mt');
    goToByScroll('.pt','#tabs','.product2');
    goToByScroll('.dn','#tabs','.product3');
    $(".list_map").colorbox({inline:true, width:"50%",height:"35%", href:"#list_map"});
    
    var e_mt = $(".first");
    var e2_mt = $(".sescon");
    var e3_mt = $(".three");
     t_mt = $(window);
     n_mt = e.offset();
     r_mt = 0;
     l_mt = $(".r_sescon");
     l2_mt = $(".r_three");
     l3_mt = $(".promotion_carousel");
     t_mt.scroll(function() {
      if (t_mt.scrollTop() > n_mt.top && t_mt.scrollTop() < (l_mt.offset().top - 120)) {
           e_mt.addClass("fixed-scroll");
           e2_mt.removeClass("fixed-scroll");

                e3_mt.removeClass("fixed-scroll");
      }else{
            e_mt.removeClass("fixed-scroll");
            e3_mt.removeClass("fixed-scroll");
            if (t_mt.scrollTop() > (l_mt.offset().top - 120) && t_mt.scrollTop() < (l2_mt.offset().top - 120)) {
                e2_mt.addClass("fixed-scroll");
                e3_mt.removeClass("fixed-scroll");
            }else{
                e2_mt.removeClass("fixed-scroll");
                if (t_mt.scrollTop() > (l2_mt.offset().top - 120) && t_mt.scrollTop() < (l3_mt.offset().top - 130) && t_mt.scrollTop() >  n_mt.top) {
                    e3_mt.addClass("fixed-scroll");
                }else{
                    e3_mt.removeClass("fixed-scroll");
                };
            };
        }
    })
     // SG
    var e_sg = $(".first_mt");
    var e2_sg = $(".sescon_mt");
    var e3_sg = $(".three_mt");
     t_sg = $(window);
     n_sg = e.offset();
     r_sg = 0;
     l_sg = $(".r_sescon_mt");
     l2_sg = $(".r_three_mt");
     l3_sg = $(".promotion_carousel");
     t_sg.scroll(function() {
      if (t_sg.scrollTop() > n_sg.top && t_sg.scrollTop() < (l_sg.offset().top - 120)) {
           e_sg.addClass("fixed-scroll");
           e2_sg.removeClass("fixed-scroll");
            e3_sg.removeClass("fixed-scroll");
      }else{
            e_sg.removeClass("fixed-scroll");
            e3_sg.removeClass("fixed-scroll");
            if (t_sg.scrollTop() > (l_sg.offset().top - 120) && t_sg.scrollTop() < (l2_sg.offset().top - 120)) {
                e2_sg.addClass("fixed-scroll");
                e3_sg.removeClass("fixed-scroll");
            }else{
                e2_sg.removeClass("fixed-scroll");
                if (t_sg.scrollTop() > (l2_sg.offset().top - 120) && t_sg.scrollTop() < (l3_sg.offset().top - 130) && t_sg.scrollTop() >  n_sg.top) {
                    e3_sg.addClass("fixed-scroll");
                }else{
                    e3_sg.removeClass("fixed-scroll");
                };
            };
        }
    })

      // DN
    var e_dn = $(".first_dn");
    var e2_dn = $(".sescon_dn");
    var e3_dn = $(".three_dn");
     t_dn = $(window);
     n_dn = e.offset();
     r_dn = 0;
     l_dn = $(".r_sescon_dn");
     l2_dn = $(".r_three_dn");
     l3_dn = $(".promotion_carousel");
     t_dn.scroll(function() {
      if (t_dn.scrollTop() > n_dn.top && t_dn.scrollTop() < (l_dn.offset().top - 120)) {
           e_dn.addClass("fixed-scroll");
           e2_dn.removeClass("fixed-scroll");
            e3_dn.removeClass("fixed-scroll");
      }else{
            e_dn.removeClass("fixed-scroll");
            e3_dn.removeClass("fixed-scroll");
            if (t_dn.scrollTop() > (l_dn.offset().top - 120) && t_dn.scrollTop() < (l2_dn.offset().top - 120)) {
                e2_dn.addClass("fixed-scroll");
                e3_dn.removeClass("fixed-scroll");
            }else{
                e2_dn.removeClass("fixed-scroll");
                if (t_dn.scrollTop() > (l2_dn.offset().top - 120) && t_dn.scrollTop() < (l3_dn.offset().top - 130) && t_dn.scrollTop() >  n_dn.top) {
                    e3_dn.addClass("fixed-scroll");
                }else{
                    e3_dn.removeClass("fixed-scroll");
                };
            };
        }
    })

      // DN
    var e_hn = $(".first_hn");
    var e2_hn = $(".sescon_hn");
    var e3_hn = $(".three_hn");
     t_hn = $(window);
     n_hn = e.offset();
     r_hn = 0;
     l_hn = $(".r_sescon_hn");
     l2_hn = $(".r_three_hn");
     l3_hn = $(".promotion_carousel");
     t_hn.scroll(function() {
      if (t_hn.scrollTop() > n_hn.top && t_hn.scrollTop() < (l_hn.offset().top - 120)) {
           e_hn.addClass("fixed-scroll");
           e2_hn.removeClass("fixed-scroll");
            e3_hn.removeClass("fixed-scroll");
      }else{
            e_hn.removeClass("fixed-scroll");
            e3_hn.removeClass("fixed-scroll");
            if (t_hn.scrollTop() > (l_hn.offset().top - 120) && t_hn.scrollTop() < (l2_hn.offset().top - 120)) {
                e2_hn.addClass("fixed-scroll");
                e3_hn.removeClass("fixed-scroll");
            }else{
                e2_hn.removeClass("fixed-scroll");
                if (t_hn.scrollTop() > (l2_hn.offset().top - 120) && t_hn.scrollTop() < (l3_hn.offset().top - 130) && t_hn.scrollTop() >  n_hn.top) {
                    e3_hn.addClass("fixed-scroll");
                }else{
                    e3_hn.removeClass("fixed-scroll");
                };
            };
        }
    })
});
</script>
<script>
$(function() {
//Header li
$('.product-promotion-col li').click(function(){
    window.open($(this).find('a').attr('href'));
    return false;
}) ;
//Fix title bar
var e = $(".bar_title"),
    t = $(window),
    n = e.offset(),
    r = 0,
    l = $(".promotion_content_desc");
    
    t.scroll(function() {
    if (t.scrollTop() > n.top && t.scrollTop() < l.offset().top) {
        e.stop().animate({top:t.scrollTop() - n.top},400);
        e.addClass("bar_title_fix");
        //
    }else{
        e.removeClass("bar_title_fix");
    }
})
//box content
$(".promotion_content_label,.km").colorbox({inline:true, width:"70%",height:"90%", href:"#promotion_content_desc"});

//tab
$('#tabs a').tabs(); $('#tabs1 a').tabs(); $('#tabs2 a').tabs(); $('#tabs3 a').tabs();

//click tab
if(document.location.hash == '#product_mt'){
    $('.product_mt').trigger('click');
    $('html,body').animate({scrollTop: $('.promotion_content').offset().top},100);     
}
if(document.location.hash == '#product2'){
    $('.product2').trigger('click');
    $('html,body').animate({scrollTop: $('.promotion_content').offset().top},100);     
}
if(document.location.hash == '#product3'){
    $('.product3').trigger('click');
    $('html,body').animate({scrollTop: $('.promotion_content').offset().top},100);     
}
});
</script>
<script type="text/javascript"><!--
$('.vtabs1 a').tabs();$('.vtabs2 a').tabs();$('.vtabs3 a').tabs();$('.vtabs4 a').tabs();$('.vtabs5 a').tabs()
//--></script> 
<script type="text/javascript">$(function() { $('#carousel_promotion').jcarousel({ wrap: 'circular'}).jcarouselAutoscroll({interval: 8000,target: '+=4',autostart: true}); $('#last-prev').jcarouselControl({ target: '-=4' }); $('#last-next').jcarouselControl({ target: '+=4' });});</script>
<?php echo $footer; ?>
