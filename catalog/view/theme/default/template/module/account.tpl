<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category box-news-category">
      <?php if (!$logged) { ?>
      <li><a href="<?php echo $login; ?>"><i class="fa fa-external-link-square"></i> <?php echo $text_login; ?></a></li>
      <li><a href="<?php echo $register; ?>"><i class="fa fa-pencil-square-o"></i> <?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>"><i class="fa fa-eye-slash"></i> <?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $account; ?>"><i class="fa fa-user"></i> <?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $edit; ?>"><i class="fa fa-info-circle"></i> <?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><i class="fa fa-eye-slash"></i> <?php echo $text_password; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $address; ?>"><i class="fa fa-book"></i> <?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $order; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o"></i> <?php echo $text_newsletter; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i> <?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
