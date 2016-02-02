<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>

<?php 
if (isset($column_left)) {
  echo $column_left; 
}
if(isset($column_right)){
  echo $column_right; 
}
?>
<div id="content" class="content-block"><?php echo $content_top; ?>
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
    <div class="content-right">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="content">
                <table class="form">
                    <tr>
                        <td class="td-left"><?php echo $entry_newsletter;?></td>
                        <td class="td-right">
                            <input type="radio" name="newsletter" value="1"<?php echo( $radio == 1 ? 'checked="checked"' : '')?> />
                            <?php echo $text_yes; ?>&nbsp;
                            <input type="radio" name="newsletter" value="0"<?php echo( $radio == 0 ? 'checked="checked"' : '')?> />
                            <?php echo $text_no; ?>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="<?php echo $entry_update; ?>" class="button" /></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>