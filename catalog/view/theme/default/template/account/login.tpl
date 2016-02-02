<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="login-content">
    <div class="left">
      <h2 class="h2-line"><?php echo $text_new_customer; ?></h2>
      <div class="content">
        <p><b><?php echo $text_register; ?></b></p>
        <p><?php echo $text_register_account; ?></p>
        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
      <h2 class="h2-line"><?php echo $text_returning_customer; ?></h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><b><?php echo $text_i_am_returning_customer; ?></b></p>
          <label><?php echo $entry_email; ?></label><br />
          <input type="text" name="email" value="<?php echo $email; ?>" size="30" />
          <br />
            <label><?php echo $entry_password; ?></label><br />
          <input type="password" name="password" value="<?php echo $password; ?>" size="30"/>
          <br />
            <label><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></label>
          <br />
          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
          <?php if ($this->config->get('hybrid_auth_status')) { ?>
          <br /><br />
          <?php foreach ($this->config->get('hybrid_auth') as $config) { ?>
              <a onclick="window.open('<?php echo HTTPS_SERVER . 'index.php?route=hybrid/auth&source=product-review&provider=' . $config['provider']; ?>&redirect=<?php echo base64_encode($this->url->link('hybrid/auth/success')); ?>', 'newwindow', 'width=700, height=450,top=200, left=600'); return false;" href="<?php echo HTTPS_SERVER . 'index.php?route=hybrid/auth&provider=' . $config['provider']; ?>&redirect=<?php echo base64_encode($this->url->link('hybrid/auth/success')); ?>"><img src="<?php echo HTTP_SERVER . 'image/themezee_social_icons/' . strtolower($config['provider']); ?>.png" alt="<?php echo $config['provider']; ?>" title="<?php echo $config['provider']; ?>"/></a>
          <?php } ?>
        <?php } ?>
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '530644067038399',
      xfbml      : true,
      version    : 'v2.2'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<?php echo $footer; ?>