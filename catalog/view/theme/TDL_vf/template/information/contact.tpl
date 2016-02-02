<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content">
          <h3><?php echo $store; ?></h3>
          <div class="left" style="width:65%"> <b class="bluebold"><?php echo $text_address; ?></b> <?php echo $address; ?><br />
            <?php if ($telephone) { ?>
            <b class="bluebold"><?php echo $text_telephone; ?></b> <?php echo $telephone; ?><br />
            <?php } ?>
          </div>
          <div class="right" style="width:30%">
            
            <b class="bluebold">Email:</b> <a href="mailto:<?php echo $config_email?>"><?php echo $config_email?></a><br />
            <?php if ($fax) { ?>
            <b class="bluebold"><?php echo $text_fax; ?></b> <?php echo $fax; ?><br />
            <?php } ?>
          </div>
        </div>
        <div class="content">
              		<iframe width="100%" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Viet+Fun+Travel,+ph%C6%B0%E1%BB%9Dng+Ph%E1%BA%A1m+Ng%C5%A9+L%C3%A3o,+Ho+Chi+Minh+City,+Vietnam&amp;aq=0&amp;oq=vietfuntravel&amp;sll=37.0625,-95.677068&amp;sspn=38.963048,86.572266&amp;ie=UTF8&amp;hq=Viet+Fun+Travel,&amp;hnear=ph%C6%B0%E1%BB%9Dng+Ph%E1%BA%A1m+Ng%C5%A9+L%C3%A3o,+Qu%E1%BA%ADn+1,+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam&amp;ll=10.768229,106.694361&amp;spn=0.011826,0.021136&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=1028095815559464759&amp;output=embed"></iframe>
            </div>
    </div>
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
            <div class="left"> <b><?php echo $entry_name; ?></b><br />
              <input type="text" name="name" value="<?php echo $name; ?>" style="width: 97%;" />
              <br />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?>
              <br />
              <b><?php echo $entry_email; ?></b><br />
              <input type="text" name="email" value="<?php echo $email; ?>" style="width: 97%;" />
              <br />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?>
              
              <br />
              <b><?php echo $entry_captcha; ?></b><br />
              <input type="text" name="captcha" value="<?php echo $captcha; ?>" style="width: 97%;" />
              <br />
              <img src="index.php?route=information/contact/captcha" alt="" />
              <?php if ($error_captcha) { ?>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
            </div>
            <div class="right"> <b><?php echo $entry_enquiry; ?></b><br />
              <textarea name="enquiry" cols="40" rows="10" style="width: 97%;"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?>
            </div>
          </div>
    <div class="buttons">
      <div class="left"><input type="submit" value="<?php echo $button_send; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>