<?php echo $header;?><?php echo $column_left; ?><?php echo $column_right; ?>
<style type="text/css">
    .htabs a,.htabs1 a,.htabs_1 a{
        font-size: 13px !important;
            color: #FFF;
    }
    .product-promotion-col li p.price{
        color: #960707;
    }
    .title_tour{
        text-align:center;font-size: 13px;
        background-color:#FFF !important;
        font-weight: bold;color:red;box-shadow: 1px 2px 7px 0 #B2B2B2;
        text-transform: uppercase;
    }
    .product-promotion-col li p.title{width: 28%;}
    .product-promotion-col li.r{
        background: #FFF;
    }
    .product-promotion-col li:hover{
        background: #9CDAC3;
    }
    .product-promotion-col li.bar_title_duonglich{
        background: #ECF4FF !important;
    }
    .product-promotion-col li{padding:1px 0 1px 5px;}
    .product-promotion-col li p.type{margin-right:0;}
    .product-promotion-col li.bar_title{padding:1px 5px;}
    .product-promotion-col li p.start_time{width:269.000đ;}
    .product-promotion-col li p.price{width:12%;}
    tr.r.bar_title.bar_title_duonglich{
        border-top: 5px solid #fff !important;
        border-bottom: 1px solid #fff !important;
        margin-right: -10px!important;
        background: #008D54!important;
        width: 98.3%;
        padding: 10px 5px;
        font-weight: bold;
        font-size: 13px !important;
        color: #FFF !important;
        text-transform: uppercase;
        line-height: 1.9em;
    }
    .product-promotion-col tr{
        background: #fff;
        padding: 11px 0 6px 10px;
        overflow: auto;
        border-top: 1px solid #aaa;
        width: 98.3%;
    }
    .product-promotion-col th.type,.product-promotion-col td.type, .product-promotion-col td.model{
        line-height: 1.4;
        width: 8%;
        text-align: left;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
        text-align: center;
    }
    .product-promotion-col td.info{
        line-height: 1.4;
        width: 8%;padding-left: 5px;
        text-align: left;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
    }
    .product-promotion-col td.info a{
        background-color:#22A7EE;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
        border-radius:5px;
        display:inline-block;
        cursor:pointer;
        color:#ffffff;
        font-family:Arial;
        font-size:14px;
        padding:4px 25px;
        text-decoration:none;
    }
    .product-promotion-col td.info a:hover{
        background-color:#0B86DE;
    }
    .product-promotion-col th.model{
        line-height: 1.4;
        width: 7%;padding-left: 5px;
        text-align: left;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
    }
    .product-promotion-col th.type_tour{
        line-height: 1.4;
        width: 9%;
        padding-left: 5px;
        text-align: left;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
    }
    .product-promotion-col td.title {
        width: 36%;
        margin-right: 2%;
        text-align: left;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
    }
    .product-promotion-col th.title{
        width: 36%;
        margin-right: 2%;
        text-align: center;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
    }
    .product-promotion-col th.start_time,.product-promotion-col td.start_time {
        width: 19%;
        border-right: 1px solid #aaa;
        border-right-style: dashed;
        text-align: center;
    }
    .product-promotion-col td.start_time{
        line-height: 1.8em;font-size: 14px;
    }
     .product-promotion-col th.price,.product-promotion-col td.price {
        width: 13%;    border-right: 1px solid #aaa;
        border-right-style: dashed;
        text-align: center;
    }
    .product-promotion-col td.price{
        font-size: 14px;
        line-height: 1.8em;
        color: #FF0000;
        font-weight: bold;
    }
    .product-promotion-col td{
        text-align: center;
        padding-left: 5px;
        padding-right: 5px;
    }
    .product-promotion-col tr td.type a{
        margin-right: 2%;
        text-align: left;
        color: #0B86DE;
        line-height: 1.8em;
        font-size: 14px;
    }
    .product-promotion-col tr td.title a{
        margin-right: 2%;
        text-align: left;
        color: #0B86DE;
        line-height: 1.8em;
        font-size: 14px;
        font-weight: bold;
    }
    .product-promotion-col tr:hover{
        background: #EAEAEA;
    }
    td.type_tour{
        background:#E2F6F7;
        color: #FF0000;
        font-weight: bold;
        border-right: 1px solid #D4D4D4;
    } 
    .htabs1 a{
    white-space: nowrap;
    padding: 8px 0.8px 8px 8px;
    float: left;
    font-family: Tahoma,Geneva,sans-serif;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    color: #FFF;
    display: none;
    width: 24%;} 
    table.product-promotion-col{
            width: 99.3%;clear: both;
    }
    .tour-two a{
        padding: 8px 8.4px 8px 8px !important;
        width: 14.7% !important;
    }
    .tour-three a{
        padding: 8px 11.5px 8px 8px !important;
        width: 31% !important;
    }
    td div {
    border-bottom: 1px dashed #aaa;
    }
    .htabs1 a{
        width: 23%;
        border: 1px solid #6CB58B;
        padding: 8px 8.3px 8px 8px;
    }
    .htabs1 a.selected{
        border: 1px solid #6CB58B;
        color: #008D54;
    }
    div.non-border{
        border: none;
    }
    .archor {
        margin-left: 28%;
    }
    .htabs_1 a,.htabs a.selected{
        background: #00913E;
    }
    .htabs1 a{
        background: #FFF;
        color: red;
    }
    .htabs a{
        background: #56B845;
    }
    .htabs1 a:hover{
        color: #008D54;
    }
    ul.note {
    line-height: 1.6;
    padding-left: 29px;
    list-style-type: square;
    border-left: 3px solid #E67E22;
    margin: 10px 0;
}
</style>
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
                <li><div class="sg ico tooltips"><i class="char"><?php echo $text_sg; ?></i><span><?php echo $text_saigon;?></span></div></li>
                <li><div class="pt ico tooltips"><i class="char"><?php echo $text_pt; ?></i><span><?php echo $text_phanthiet;?></span></div></li>
                <li><div class="dn ico tooltips"><i class="char"><?php echo $text_dn;?></i><span><?php echo $text_danang;?></span></div></li>
            </ul>
        </div>
        
        <div id="tabs" class="htabs">
            <a href="#tab-product3" class="product3"><span class="headtitle">điểm đến:</span>  <?php echo $text_local_start_3;?></a>
            <a href="#tab-product2" class="product2"><span class="headtitle">điểm đến:</span>  <?php echo $text_local_start_2;?></a>
            <a href="#tab-product1" class="product1"><span class="headtitle">điểm đến:</span>  <?php echo $text_local_start_1;?></a>
        </div>
        <?php if(isset($products)){ ?>
        <div id="tab-product3">
            <div id="tabs3" class="htabs1">
                <a href="#tab-productsg" class="productsg"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  sài gòn</span></a>
                <a href="#tab-productmt" class="productmt"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  miền tây</span></a>
                <a href="#tab-productvt" class="productvt"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  vũng tàu</span></a>
                <a href="#tab-productpq" class="productpq"><i class="fa fa-star fa-lg animated infinite slideOutLeft"></i><span class="atitle">  phú quốc</span></a>
            </div>
            <div id="tab-productsg">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Sài Gòn') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productmt">
                   <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                    <th class="type_tour">Loại Tour</th>
                    <th class="model">Mã Tour</th>
                    <th class="title"><?php echo $text_name?></th>
                    <th class="price">Giá Đã Giảm</th>
                    <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Miền Tây') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productvt">
                   <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                    <th class="type_tour">Loại Tour</th>
                    <th class="model">Mã Tour</th>
                    <th class="title"><?php echo $text_name?></th>
                    <th class="price">Giá Đã Giảm</th>
                    <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Vũng Tàu') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productpq">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Phú Quốc') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
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
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Phan Thiết') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productdl">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Đà Lạt') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>    
            </div>
            <div id="tab-productnt">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Nha Trang') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productdn">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Đà Nẵng') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productha">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Hội An') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-producth">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Huế') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
        </div>

        <div id="tab-product1">
            <div id="tabs1" class="htabs1 tour-three">
                <a href="#tab-producthn" class="producthn"><i class="fa fa-star fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> hà nội</span></a>
                <a href="#tab-producthl" class="producthl"><i class="fa fa-star fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> hạ long</span></a>
                <a href="#tab-productsp" class="productsp"><i class="fa fa-star fa-lg animated infinite slideOutLeft fa-lg"></i><span class="atitle"> sapa</span></a>
            </div>
            <div id="tab-producthn">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Hà Nội') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-producthl">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Hạ Long') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
            <div id="tab-productsp">
                <table class="product-promotion-col">
                    <tr class="r bar_title bar_title_duonglich" style="margin-right: 10px!important;clear: both;">
                        <th class="type_tour">Loại Tour</th>
                        <th class="model">Mã Tour</th>
                        <th class="title"><?php echo $text_name?></th>
                        <th class="price">Giá Đã Giảm</th>
                        <th class="type"></th>
                    </tr>
                    <?php foreach ($products as $value) {
                        if($value['location'] == 'Sapa') { ?>
                            <tr>
                                <td class="type">
                                    <?php echo $value['duration']?>
                                </td>
                                <td class="model">
                                    <?php echo $value['model']?>
                                </td>
                                <td class="title">
                                    <a href="<?php echo $value['href']?>" target="_blank" rel="nofollow" title="<?php echo $value['name']?>">
                                        <?php echo $value['name']?>
                                    </a>
                                </td>
                                <td class="price">
                                    <div class = "non-border"><?php echo $value['special']; ?></div>
                                </td>
                                <td class="info">
                                    <a href="<?php echo $value['href']?>" target="_blank"  rel="nofollow" title="<?php echo $value['name']?>">Xem
                                    </a>
                                </td>
                            </tr>
                    <?php }} ?>
                </table>
            </div>
        </div>
        <?php } ?>
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
    <div id="cas"></div>
    <!--Comment-->
    <div class="promotion_carousel">
        <div class="content_box jcarousel" id="carousel_promotion">
            <ul class="values">
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
    goToByScroll('.sg','#tabs','.product1');
    goToByScroll('.pt','#tabs','.product2');
    goToByScroll('.dn','#tabs','.product3');
    $(".list_map").colorbox({inline:true, width:"80%",height:"35%", href:"#list_map"});
    
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