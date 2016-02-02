<?php echo $header; ?>
<?php 
if (isset($column_left)) {
  echo $column_left; 
}
if(isset($column_right)){
  echo $column_right; 
}
?>
<div id="content"  class="content-block"><?php echo $content_top; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <h2 class="h2-line"><?php echo $heading_title; ?></h2>
    <div class="content-left">
        <ul class="account_list">
            <li <?php echo (isset($active) && $active == 'account' ? 'id="active"' : '');?> ><a href="<?php echo $edit; ?>"><i class="fa fa-info-circle"></i> <?php echo $text_edit; ?></a></li>
            <li <?php echo (isset($active) && $active == 'password' ? 'id="active"' : '');?> ><a href="<?php echo $password; ?>"><i class="fa fa-eye-slash"></i> <?php echo $text_password; ?></a></li>
            <li <?php echo (isset($active) && $active == 'order' ? 'id="active"' : '');?> ><a href="<?php echo $order; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $text_order; ?></a></li>
            <li <?php echo (isset($active) && $active == 'newsletter' ? 'id="active"' : '');?>><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o"></i> <?php echo $text_newsletter; ?></a></li>
        </ul>
    </div>
    <div class="content-right content-order-list">
        <?php if ($orders) { ?>
        <?php foreach ($orders as $order) { ?>
        <div class="order-list">
            <div class="order-id"><b><?php echo $text_order_id; ?></b> <?php echo $order['order_id']; ?></div>
            <div class="order-status"><img src="/image/order-status/order-status-<?php echo $order['status_id']?>.png" /></div>
            <div class="order-content">
                <div><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
                    <b><?php echo $text_quantity; ?></b> <?php echo $order['products']; ?></div>
                <div><b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?><br />
                    <b><?php echo $text_total; ?></b> <span style="color:#b00;font-weight:bold"><?php /* show gia da giam coder by tranminh*/ echo $order['total']; ?></span></div>
                <div class="order-info"><a href="<?php echo $order['href']; ?>" class="button" title="<?php echo $button_view; ?>"><?php echo $button_view?></a></div>
            </div>
        </div>
        <?php } ?>
        <div class="pagination"><?php echo $pagination; ?></div>
        <?php } else { ?>
        <div class="content"><?php echo $text_empty; ?></div>
        <?php } ?>

    </div>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>