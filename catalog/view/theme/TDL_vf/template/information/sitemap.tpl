<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="home"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
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
                <li><a href="<?php echo $account; ?>"><i class="fa fa-caret-right"></i> <?php echo $text_account; ?></a>
                  <ul>
                    <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                    <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                    <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                    <li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
                  </ul>
                </li>
                <li><a href="javascript:void(0)"><i class="fa fa-caret-right"></i> <?php echo $text_information; ?></a>
                  <ul>
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                  </ul>
                </li>
                <li><a href="<?php echo $cart; ?>"><i class="fa fa-caret-right"></i> <?php echo $text_cart; ?></a></li>
                <li><a href="<?php echo $search; ?>"><i class="fa fa-caret-right"></i> <?php echo $text_search; ?></a></li>
              </ul>
        </li>
      </ul>
    
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>