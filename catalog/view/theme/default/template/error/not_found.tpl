<?php echo $header; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
    <?php if (empty($error_tmp)) {?>
          <h1 class="heading_title_error"><?php echo $heading_title; ?></h1>
            <div class="content"><?php echo $text_error; ?></div>
            <div class="buttons">
                <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
            </div>
          <?php }else{ ?>
            <h1 class="heading_title_error"><?php echo $heading_title_page; ?></h1>
    <?php }?>
  
  <?php if (isset($error_tmp)) {
          if ($error_tmp==1) {?>
          <h2 class="olds_heading_title"><?php echo $heading_title_error; ?></h1>
  <div class="sitemap-info">
    <ul>
        <?php foreach ($categories as $category_1) { ?>
        <li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
          <?php if ($category_1['children']) { ?>
          <ul>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <li><a href="<?php echo $category_2['href']; ?>"><i class="fa fa-caret-right"></i> <?php echo $category_2['name']; ?></a>
              <?php if ($category_2['children']) { ?>
              <ul>
                <?php foreach ($category_2['children'] as $category_3) { ?>
                <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
        <li>
          <ul>
                <li><a href="<?php echo $account; ?>"><i class="fa fa-caret-right"></i> <?php echo $text_account_error; ?></a>
                  <ul>
                    <li><a href="<?php echo $edit; ?>"><?php echo $text_edit_error; ?></a></li>
                    <li><a href="<?php echo $password; ?>"><?php echo $text_password_error; ?></a></li>
                    <li><a href="<?php echo $address; ?>"><?php echo $text_address_error; ?></a></li>
                    <li><a href="<?php echo $history; ?>"><?php echo $text_history_error; ?></a></li>
                  </ul>
                </li>
                <li><a href="javascript:void(0)"><i class="fa fa-caret-right"></i> <?php echo $text_information_error; ?></a>
                  <ul>
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact_error; ?></a></li>
                  </ul>
                </li>
                <li><a href="<?php echo $cart; ?>"><i class="fa fa-caret-right"></i> <?php echo $text_cart_error; ?></a></li>
                <li><a href="<?php echo $search; ?>"><i class="fa fa-caret-right"></i> <?php echo $text_search_error; ?></a></li>
              </ul>
        </li>
      </ul>
    
  </div>  
  <?php }}?>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>