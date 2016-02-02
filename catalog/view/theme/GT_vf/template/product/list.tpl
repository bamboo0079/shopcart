<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="category"><?php echo $content_top; ?>
  <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><span typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a></span>
    <?php } ?>
  </div>
  <h1 itemprop="name" class="promotion_title"><a href="<?php echo $url?>" title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></a></h1>
  <div id="list_content_desc" class="promotion_content_desc expand">
        <?php echo $desc;?>
        <div class="quote-expand">--- Xem thêm ---</div>
    </div>
  <div class="list_content">
  	<table class="table_style table_list">
    	<thead>
        	<tr>
            	<th>STT</th>
                <th class="left" width="30%">Lịch Trình Tour</th>
                <th>Thời Gian</th>
                <th>Lịch Khởi Hành</th>
                <th>Phương Tiện</th>
                <th>Giá Tour(VNĐ)</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        	<?php foreach ($lists as $t=>$item) { ?>
            <tr>
            	<td class="title" colspan="7"><?php echo $item['title']; ?></td>
            </tr>
            <?php foreach ($list_product_box[$t] as $k=>$product) { ?>
            <tr <?php if($k % 2 == 1){ echo 'class="r"';}?>>
            	<td class="center"><?php echo $k+1; ?></td>
                <td class="left tit"><a href="<?php echo $product['href']; ?>"><?php echo $product['model']; ?> : <?php echo $product['name']; ?></a></td>
                <td class="center"><?php echo $product['duration']; ?></td>
                <td class="center"><?php echo $product['start_time']; ?></td>
                <td class="center"><?php echo $product['transport']; ?></td>
                <td class="center pri"><?php echo $product['price']; ?></td>
                <td><a href="<?php echo $product['href']; ?>" class="button" target="_blank"/><?php echo $button_view_more?></a></td>
            </tr>
            <?php }?>
            <?php }?>
        </tbody>
    </table>
  </div>
  
  <?php echo $content_bottom; ?></div> 
  
<?php echo $footer; ?>