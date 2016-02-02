<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /><?php echo $heading_title?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td>SÀI GÒN TOUR 1 -2 NGÀY:</td>
            <td><input type="text" name="msg1neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmsg1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cn = 1;?>
                <?php foreach ($khmsg1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmsg1nhe-product<?php echo $product['product_id']; ?>" class="khmsg1n <?php echo $class; ?>">
                  <label><b><?php echo $cn;?>.</b></label>
                  <input type="text" name="numsg1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cn++;} ?>
              </div>
              <input type="hidden" name="khmsg1neven29_product" value="<?php echo $khmsg1neven29_product; ?>" /></td>
          </tr>
        <tr>
            <td>SÀI GÒN TOUR 3 - 4 - 5 NGÀY:</td>
            <td><input type="text" name="msg3neven29_product" value=""size="100" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmsg3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $ct = 1;?>
                <?php foreach ($khmsg3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmsg3nhe-product<?php echo $product['product_id']; ?>" class="khmsg3n <?php echo $class; ?>">
                  <label><b><?php echo $ct;?>.</b></label>
                  <input type="text" name="numsg3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $ct++;} ?>
              </div>
              <input type="hidden" name="khmsg3neven29_product" value="<?php echo $khmsg3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>SÀI GÒN TOUR 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="msg6neven29_product" value=""size="100" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmsg6nhe-product" class="scrollbox" style="width:80%">
                    <?php $class = 'odd'; ?>
                    <?php $ct = 1;?>
                    <?php foreach ($khmsg6neven29_product_box as $product) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div id="khmsg6nhe-product<?php echo $product['product_id']; ?>" class="khmsg6n <?php echo $class; ?>">
                        <label><b><?php echo $ct;?>.</b></label>
                        <input type="text" name="numsg6n" size="1" />
                        <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                        <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php $ct++;} ?>
                </div>
                <input type="hidden" name="khmsg6neven29_product" value="<?php echo $khmsg6neven29_product; ?>" />
            </td>
        </tr>
<!-- MT -->
        <tr>
            <td>MIEN TAY TOUR 1 -2 NGÀY:</td>
            <td><input type="text" name="mmt1neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmmt1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cn = 1;?>
                <?php foreach ($khmmt1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmmt1nhe-product<?php echo $product['product_id']; ?>" class="khmmt1n <?php echo $class; ?>">
                  <label><b><?php echo $cn;?>.</b></label>
                  <input type="text" name="nummt1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cn++;} ?>
              </div>
              <input type="hidden" name="khmmt1neven29_product" value="<?php echo $khmmt1neven29_product; ?>" /></td>
          </tr>
        <tr>
            <td>MIEN TAY TOUR 3 - 4 - 5 NGÀY:</td>
            <td><input type="text" name="mmt3neven29_product" value=""size="100" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmmt3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $ct = 1;?>
                <?php foreach ($khmmt3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmmt3nhe-product<?php echo $product['product_id']; ?>" class="khmmt3n <?php echo $class; ?>">
                  <label><b><?php echo $ct;?>.</b></label>
                  <input type="text" name="nummt3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $ct++;} ?>
              </div>
              <input type="hidden" name="khmmt3neven29_product" value="<?php echo $khmmt3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>MIEN TAY TOUR 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mmt6neven29_product" value=""size="100" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmmt6nhe-product" class="scrollbox" style="width:80%">
                    <?php $class = 'odd'; ?>
                    <?php $ct = 1;?>
                    <?php foreach ($khmmt6neven29_product_box as $product) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div id="khmmt6nhe-product<?php echo $product['product_id']; ?>" class="khmmt6n <?php echo $class; ?>">
                        <label><b><?php echo $ct;?>.</b></label>
                        <input type="text" name="nummt6n" size="1" />
                        <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                        <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php $ct++;} ?>
                </div>
                <input type="hidden" name="khmmt6neven29_product" value="<?php echo $khmmt6neven29_product; ?>" />
            </td>
        </tr>
<!-- VT start -->
        <tr>
            <td>VŨNG TÀU TOUR 1 -2 NGÀY:</td>
            <td><input type="text" name="mvt1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmvt1nhe-product" class="scrollbox" style="width:80%">
                    <?php $class = 'odd'; ?>
                    <?php $cn = 1;?>
                    <?php foreach ($khmvt1neven29_product_box as $product) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div id="khmvt1nhe-product<?php echo $product['product_id']; ?>" class="khmvt1n <?php echo $class; ?>">
                      <label><b><?php echo $cn;?>.</b></label>
                      <input type="text" name="numvt1n" size="1" />
                      <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                      <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php $cn++;} ?>
                </div>
                <input type="hidden" name="khmvt1neven29_product" value="<?php echo $khmvt1neven29_product; ?>" />
            </td>
        </tr>
        <tr>
            <td>VŨNG TÀU TOUR 3 - 4 - 5 NGÀY:</td>
            <td><input type="text" name="mvt3neven29_product" value=""size="100" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmvt3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $ct = 1;?>
                <?php foreach ($khmvt3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmvt3nhe-product<?php echo $product['product_id']; ?>" class="khmvt3n <?php echo $class; ?>">
                  <label><b><?php echo $ct;?>.</b></label>
                  <input type="text" name="numvt3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $ct++;} ?>
              </div>
              <input type="hidden" name="khmvt3neven29_product" value="<?php echo $khmvt3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>VŨNG TÀU TOUR 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mvt6neven29_product" value=""size="100" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmvt6nhe-product" class="scrollbox" style="width:80%">
                    <?php $class = 'odd'; ?>
                    <?php $ct = 1;?>
                    <?php foreach ($khmvt6neven29_product_box as $product) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div id="khmvt6nhe-product<?php echo $product['product_id']; ?>" class="khmvt6n <?php echo $class; ?>">
                        <label><b><?php echo $ct;?>.</b></label>
                        <input type="text" name="numvt6n" size="1" />
                        <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                        <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php $ct++;} ?>
                </div>
                <input type="hidden" name="khmvt6neven29_product" value="<?php echo $khmvt6neven29_product; ?>" />
            </td>
        </tr>
        <tr>
            <td>PHÚ QUỐC 1 - 2 NGÀY:</td>
            <td><input type="text" name="mpq1neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmpq1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmpq1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmpq1nhe-product<?php echo $product['product_id']; ?>" class="khmpq1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numpq1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmpq1neven29_product" value="<?php echo $khmpq1neven29_product; ?>" /></td>
          </tr>
          <tr>
            <td>PHÚ QUỐC 3-4-5 NGÀY:</td>
            <td><input type="text" name="mpq3neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmpq3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmpq3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmpq3nhe-product<?php echo $product['product_id']; ?>" class="khmpq3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numpq3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmpq3neven29_product" value="<?php echo $khmpq3neven29_product; ?>" /></td>
          </tr>
          <tr>
            <td>PHÚ QUỐC 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mpq6neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmpq6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmpq6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmpq6nhe-product<?php echo $product['product_id']; ?>" class="khmpq6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numpq6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmpq6neven29_product" value="<?php echo $khmpq6neven29_product; ?>" /></td>
          </tr>
<!-- PT start -->
        <tr>
            <td>PHAN THIẾT 1 - 2 NGÀY:</td>
            <td><input type="text" name="mpt1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmpt1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmpt1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmpt1nhe-product<?php echo $product['product_id']; ?>" class="khmpt1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numpt1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmpt1neven29_product" value="<?php echo $khmpt1neven29_product; ?>" /></td>
          </tr>
          <tr>
            <td>PHAN THIẾT 3 - 4 - 5 NGÀY:</td>
            <td><input type="text" name="mpt3neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmpt3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmpt3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmpt3nhe-product<?php echo $product['product_id']; ?>" class="khmpt3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numpt3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmpt3neven29_product" value="<?php echo $khmpt3neven29_product; ?>" /></td>
          </tr>
        <tr>
            <td>PHAN THIẾT 6 TRỞ LÊN:</td>
            <td><input type="text" name="mpt6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmpt6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmpt6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmpt6nhe-product<?php echo $product['product_id']; ?>" class="khmpt3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numpt6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmpt6neven29_product" value="<?php echo $khmpt6neven29_product; ?>" /></td>
        </tr>

        <tr>
            <td>DÀ LẠT 1 - 2 NGÀY:</td>
            <td><input type="text" name="mdl1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmdl1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmdl1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmdl1nhe-product<?php echo $product['product_id']; ?>" class="khmdl1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numdl1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmdl1neven29_product" value="<?php echo $khmdl1neven29_product; ?>" /></td>
          </tr>
          <tr>
            <td>ĐÀ LẠT 3 - 4 - 5 NGÀY:</td>
            <td><input type="text" name="mdl3neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmdl3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmdl3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmdl3nhe-product<?php echo $product['product_id']; ?>" class="khmdl3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numdl3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmdl3neven29_product" value="<?php echo $khmdl3neven29_product; ?>" /></td>
          </tr>
        <tr>
            <td>ĐÀ LẠT 6 TRỞ LÊN:</td>
            <td><input type="text" name="mdl6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmdl6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmdl6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmdl6nhe-product<?php echo $product['product_id']; ?>" class="khmdl3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numdl6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmdl6neven29_product" value="<?php echo $khmdl6neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>NHA TRANG 1 - 2 NGÀY:</td>
            <td><input type="text" name="mnt1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmnt1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmnt1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmnt1nhe-product<?php echo $product['product_id']; ?>" class="khmnt1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numnt1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmnt1neven29_product" value="<?php echo $khmnt1neven29_product; ?>" /></td>
          </tr>
          <tr>
            <td>NHA TRANG 3 - 4 - 5 NGÀY:</td>
            <td><input type="text" name="mnt3neven29_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmnt3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmnt3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmnt3nhe-product<?php echo $product['product_id']; ?>" class="khmnt3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numnt3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmnt3neven29_product" value="<?php echo $khmnt3neven29_product; ?>" /></td>
          </tr>
        <tr>
            <td>NHA TRANG 6 TRỞ LÊN:</td>
            <td><input type="text" name="mnt6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div id="khmnt6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmnt6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmnt6nhe-product<?php echo $product['product_id']; ?>" class="khmnt3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numnt6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmnt6neven29_product" value="<?php echo $khmnt6neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>ĐÀ NẴNG 1 -2 NGÀY:</td>
            <td><input type="text" name="mdn1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmdn1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmdn1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmdn1nhe-product<?php echo $product['product_id']; ?>" class="khmdn1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numdn1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmdn1neven29_product" value="<?php echo $khmdn1neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>ĐÀ NẴNG 3-4-5 NGÀY:</td>
            <td><input type="text" name="mdn3neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmdn3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmdn3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmdn3nhe-product<?php echo $product['product_id']; ?>" class="khmdn3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numdn3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmdn3neven29_product" value="<?php echo $khmdn3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>ĐÀ NẴNG 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mdn6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmdn6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmdn6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmdn6nhe-product<?php echo $product['product_id']; ?>" class="khmdn6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numdn6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmdn6neven29_product" value="<?php echo $khmdn6neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HỘI AN 1 -2 NGÀY:</td>
            <td><input type="text" name="mha1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmha1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmha1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmha1nhe-product<?php echo $product['product_id']; ?>" class="khmha1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numha1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmha1neven29_product" value="<?php echo $khmha1neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HỘI AN 3-4-5 NGÀY:</td>
            <td><input type="text" name="mha3neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmha3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmha3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmha3nhe-product<?php echo $product['product_id']; ?>" class="khmha3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numha3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmha3neven29_product" value="<?php echo $khmha3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HỘI AN 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mha6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmha6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmha6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmha6nhe-product<?php echo $product['product_id']; ?>" class="khmha6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numha6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmha6neven29_product" value="<?php echo $khmha6neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HUẾ 1 -2 NGÀY:</td>
            <td><input type="text" name="mhue1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhue1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhue1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhue1nhe-product<?php echo $product['product_id']; ?>" class="khmhue1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhue1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhue1neven29_product" value="<?php echo $khmhue1neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HUẾ 3-4-5 NGÀY:</td>
            <td><input type="text" name="mhue3neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhue3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhue3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhue3nhe-product<?php echo $product['product_id']; ?>" class="khmhue3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhue3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhue3neven29_product" value="<?php echo $khmhue3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HUẾ 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mhue6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhue6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhue6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhue6nhe-product<?php echo $product['product_id']; ?>" class="khmhue6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhue6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhue6neven29_product" value="<?php echo $khmhue6neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HÀ NỘI 1 -2 NGÀY:</td>
            <td><input type="text" name="mhn1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhn1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhn1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhn1nhe-product<?php echo $product['product_id']; ?>" class="khmhn1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhn1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhn1neven29_product" value="<?php echo $khmhn1neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HÀ NỘI 3-4-5 NGÀY:</td>
            <td><input type="text" name="mhn3neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhn3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhn3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhn3nhe-product<?php echo $product['product_id']; ?>" class="khmhn3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhn3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhn3neven29_product" value="<?php echo $khmhn3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HÀ NỘI 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mhn6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhn6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhn6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhn6nhe-product<?php echo $product['product_id']; ?>" class="khmhn6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhn6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhn6neven29_product" value="<?php echo $khmhn6neven29_product; ?>" /></td>
       </tr>
       <tr>
            <td>HẠ LONG 1 -2 NGÀY:</td>
            <td><input type="text" name="mhl1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhl1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhl1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhl1nhe-product<?php echo $product['product_id']; ?>" class="khmhl1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhl1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhl1neven29_product" value="<?php echo $khmhl1neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HẠ LONG 3-4-5 NGÀY:</td>
            <td><input type="text" name="mhl3neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhl3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhl3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhl3nhe-product<?php echo $product['product_id']; ?>" class="khmhl3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhl3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhl3neven29_product" value="<?php echo $khmhl3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>HẠ LONG 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="mhl6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmhl6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmhl6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmhl6nhe-product<?php echo $product['product_id']; ?>" class="khmhl6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numhl6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmhl6neven29_product" value="<?php echo $khmhl6neven29_product; ?>" /></td>
       </tr>
        <tr>
            <td>SA PA 1 -2 NGÀY:</td>
            <td><input type="text" name="msp1neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmsp1nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmsp1neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmsp1nhe-product<?php echo $product['product_id']; ?>" class="khmsp1n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numsp1n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmsp1neven29_product" value="<?php echo $khmsp1neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>SA PA 3-4-5 NGÀY:</td>
            <td><input type="text" name="msp3neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmsp3nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmsp3neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmsp3nhe-product<?php echo $product['product_id']; ?>" class="khmsp3n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numsp3n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmsp3neven29_product" value="<?php echo $khmsp3neven29_product; ?>" /></td>
        </tr>
        <tr>
            <td>SA PA 6 NGÀY TRỞ LÊN:</td>
            <td><input type="text" name="msp6neven29_product" value="" size="100"/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div id="khmsp6nhe-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmsp6neven29_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmsp6nhe-product<?php echo $product['product_id']; ?>" class="khmsp6n <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numsp6n" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmsp6neven29_product" value="<?php echo $khmsp6neven29_product; ?>" /></td>
       </tr>
          <tr>
            <td>Title:</td>
            <td><input type="text" name="even29_customtitle" value="<?php echo $even29_customtitle; ?>" size="100" /></td>
          </tr>
          <tr>
            <td>Name:</td>
            <td><input type="text" name="even29_title" value="<?php echo $even29_title; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Keyword:</td>
            <td><input type="text" name="even29_metakey" value="<?php echo $even29_metakey; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Description:</td>
            <td><input type="text" name="even29_metadesc" value="<?php echo $even29_metadesc; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Description:</td>
            <td><textarea name="even29_desc" id="even29_desc"><?php echo $even29_desc; ?></textarea></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
<!--
CKEDITOR.replace('even29_desc', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
$('input[name=\'msg1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
      
            $('#khmsg1nhe-product' + ui.item.value).remove();
            var rown = $('.khmsg1n').length + 1;
            $('#khmsg1nhe-product').append('<div id="khmsg1nhe-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="numsg1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmsg1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmsg1nhe-product div:even')
                .attr('class', 'even');
            $('#khmsg1nhe-product div')
                .addClass("khmsg1n");
            data = $.map($('#khmsg1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
      console.log(data);
            $('input[name=\'khmsg1neven29_product\']')
                .attr('value', data.join());
            numsg1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'msg3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmsg3nhe-product' + ui.item.value)
                .remove();
            var rowt = $('.khmsg3n').length + 1;
            $('#khmsg3nhe-product')
                .append('<div id="khmsg3nhe-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numsg3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmsg3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmsg3nhe-product div:even')
                .attr('class', 'even');
            $('#khmsg3nhe-product div')
                .addClass("khmsg3n");
            data = $.map($('#khmsg3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsg3neven29_product\']')
                .attr('value', data.join());
            numsg3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'msg6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmsg6nhe-product' + ui.item.value)
                .remove();
            var rowt = $('.khmsg6n').length + 1;
            $('#khmsg6nhe-product')
                .append('<div id="khmsg6nhe-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numsg6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmsg6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmsg6nhe-product div:even')
                .attr('class', 'even');
            $('#khmsg6nhe-product div')
                .addClass("khmsg6n");
            data = $.map($('#khmsg6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsg6neven29_product\']')
                .attr('value', data.join());
            numsg6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// 
$('input[name=\'mmt1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            
            $('#khmmt1nhe-product' + ui.item.value).remove();
            var rown = $('.khmmt1n').length + 1;
            $('#khmmt1nhe-product').append('<div id="khmmt1nhe-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="nummt1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmmt1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmmt1nhe-product div:even')
                .attr('class', 'even');
            $('#khmmt1nhe-product div')
                .addClass("khmmt1n");
            data = $.map($('#khmmt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            console.log(data);
            $('input[name=\'khmmt1neven29_product\']')
                .attr('value', data.join());
            nummt1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mmt3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmmt3nhe-product' + ui.item.value)
                .remove();
            var rowt = $('.khmmt3n').length + 1;
            $('#khmmt3nhe-product')
                .append('<div id="khmmt3nhe-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="nummt3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmmt3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmmt3nhe-product div:even')
                .attr('class', 'even');
            $('#khmmt3nhe-product div')
                .addClass("khmmt3n");
            data = $.map($('#khmmt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmmt3neven29_product\']')
                .attr('value', data.join());
            nummt3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mmt6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmmt6nhe-product' + ui.item.value)
                .remove();
            var rowt = $('.khmmt6n').length + 1;
            $('#khmmt6nhe-product')
                .append('<div id="khmmt6nhe-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="nummt6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmmt6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmmt6nhe-product div:even')
                .attr('class', 'even');
            $('#khmmt6nhe-product div')
                .addClass("khmmt6n");
            data = $.map($('#khmmt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmmt6neven29_product\']')
                .attr('value', data.join());
            nummt6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
//  mien tay


$('input[name=\'mvt1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            
            $('#khmvt1nhe-product' + ui.item.value).remove();
            var rown = $('.khmvt1n').length + 1;
            $('#khmvt1nhe-product').append('<div id="khmvt1nhe-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="numvt1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmvt1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmvt1nhe-product div:even')
                .attr('class', 'even');
            $('#khmvt1nhe-product div')
                .addClass("khmvt1n");
            data = $.map($('#khmvt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            console.log(data);
            $('input[name=\'khmvt1neven29_product\']')
                .attr('value', data.join());
            numsg1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mvt3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmvt3nhe-product' + ui.item.value)
                .remove();
            var rowt = $('.khmvt3n').length + 1;
            $('#khmvt3nhe-product')
                .append('<div id="khmvt3nhe-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numvt3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmvt3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmvt3nhe-product div:even')
                .attr('class', 'even');
            $('#khmvt3nhe-product div')
                .addClass("khmvt3n");
            data = $.map($('#khmvt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmvt3neven29_product\']')
                .attr('value', data.join());
            numvt3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mvt6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmvt6nhe-product' + ui.item.value)
                .remove();
            var rowt = $('.khmvt6n').length + 1;
            $('#khmvt6nhe-product')
                .append('<div id="khmvt6nhe-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numvt6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmvt6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmvt6nhe-product div:even')
                .attr('class', 'even');
            $('#khmvt6nhe-product div')
                .addClass("khmvt6n");
            data = $.map($('#khmvt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmvt6neven29_product\']')
                .attr('value', data.join());
            numvt3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mpq1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmpq1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmpq1n').length + 1;
            $('#khmpq1nhe-product')
                .append('<div id="khmpq1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numpq1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmpq1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmpq1nhe-product div:even')
                .attr('class', 'even');
            $('#khmpq1nhe-product div')
                .addClass("khmpq1n");
            data = $.map($('#khmpq1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpq1neven29_product\']')
                .attr('value', data.join());
            numpq1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mpq3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmpq3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmpq3n').length + 1;
            $('#khmpq3nhe-product')
                .append('<div id="khmpq3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numpq3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmpq3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmpq3nhe-product div:even')
                .attr('class', 'even');
            $('#khmpq3nhe-product div')
                .addClass("khmpq3n");
            data = $.map($('#khmpq3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpq3neven29_product\']')
                .attr('value', data.join());
            numpq3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mpq6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmpq6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmpq6n').length + 1;
            $('#khmpq6nhe-product')
                .append('<div id="khmpq6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numpq6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmpq6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmpq6nhe-product div:even')
                .attr('class', 'even');
            $('#khmpq6nhe-product div')
                .addClass("khmpq6n");
            data = $.map($('#khmpq6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpq6neven29_product\']')
                .attr('value', data.join());
            numpq6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// phan thiet
$('input[name=\'mpt1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmpt1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmpt1n')
                .length + 1;
            $('#khmpt1nhe-product')
                .append('<div id="khmpt1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numpt1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmpt1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmpt1nhe-product div:even')
                .attr('class', 'even');
            $('#khmpt1nhe-product div')
                .addClass("khmpt1n");
            data = $.map($('#khmpt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpt1neven29_product\']')
                .attr('value', data.join());
            numpt1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mpt3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmpt3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmpt3n')
                .length + 1;
            $('#khmpt3nhe-product')
                .append('<div id="khmpt3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numpt3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmpt3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmpt3nhe-product div:even')
                .attr('class', 'even');
            $('#khmpt3nhe-product div')
                .addClass("khmpt3n");
            data = $.map($('#khmpt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpt3neven29_product\']')
                .attr('value', data.join());
            numpt3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mpt6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmpt6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmpt6n')
                .length + 1;
            $('#khmpt6nhe-product')
                .append('<div id="khmpt6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numpt6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmpt6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmpt6nhe-product div:even')
                .attr('class', 'even');
            $('#khmpt6nhe-product div')
                .addClass("khmpt6n");
            data = $.map($('#khmpt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpt6neven29_product\']')
                .attr('value', data.join());
            numpt6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// Đà lạt
$('input[name=\'mdl1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmdl1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmdl1n')
                .length + 1;
            $('#khmdl1nhe-product')
                .append('<div id="khmdl1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numdl1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmdl1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmdl1nhe-product div:even')
                .attr('class', 'even');
            $('#khmdl1nhe-product div')
                .addClass("khmdl1n");
            data = $.map($('#khmdl1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdl1neven29_product\']')
                .attr('value', data.join());
            numdl1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mdl3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmdl3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmdl3n')
                .length + 1;
            $('#khmdl3nhe-product')
                .append('<div id="khmdl3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numdl3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmdl3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmdl3nhe-product div:even')
                .attr('class', 'even');
            $('#khmdl3nhe-product div')
                .addClass("khmdl3n");
            data = $.map($('#khmdl3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdl3neven29_product\']')
                .attr('value', data.join());
            numdl3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mdl6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmdl6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmdl6n')
                .length + 1;
            $('#khmdl6nhe-product')
                .append('<div id="khmdl6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numdl6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmdl6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmdl6nhe-product div:even')
                .attr('class', 'even');
            $('#khmdl6nhe-product div')
                .addClass("khmdl6n");
            data = $.map($('#khmdl6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdl6neven29_product\']')
                .attr('value', data.join());
            numdl6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// Nha Trang
// Đà lạt
$('input[name=\'mnt1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmnt1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmnt1n')
                .length + 1;
            $('#khmnt1nhe-product')
                .append('<div id="khmnt1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numnt1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmnt1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmnt1nhe-product div:even')
                .attr('class', 'even');
            $('#khmnt1nhe-product div')
                .addClass("khmnt1n");
            data = $.map($('#khmnt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmnt1neven29_product\']')
                .attr('value', data.join());
            numnt1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mnt3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmnt3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmnt3n')
                .length + 1;
            $('#khmnt3nhe-product')
                .append('<div id="khmnt3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numnt3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmnt3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmnt3nhe-product div:even')
                .attr('class', 'even');
            $('#khmnt3nhe-product div')
                .addClass("khmnt3n");
            data = $.map($('#khmnt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmnt3neven29_product\']')
                .attr('value', data.join());
            numnt3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mnt6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmnt6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmnt6n')
                .length + 1;
            $('#khmnt6nhe-product')
                .append('<div id="khmnt6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numnt6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmnt6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmnt6nhe-product div:even')
                .attr('class', 'even');
            $('#khmnt6nhe-product div')
                .addClass("khmnt6n");
            data = $.map($('#khmnt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmnt6neven29_product\']')
                .attr('value', data.join());
            numnt6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
    // đà nẵng
$('input[name=\'mdn1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmdn1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmdn1n')
                .length + 1;
            $('#khmdn1nhe-product')
                .append('<div id="khmdn1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numdn1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmdn1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmdn1nhe-product div:even')
                .attr('class', 'even');
            $('#khmdn1nhe-product div')
                .addClass("khmdn1n");
            data = $.map($('#khmdn1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdn1neven29_product\']')
                .attr('value', data.join());
            numdn1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mdn3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmdn3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmdn3n')
                .length + 1;
            $('#khmdn3nhe-product')
                .append('<div id="khmdn3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numdn3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmdn3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmdn3nhe-product div:even')
                .attr('class', 'even');
            $('#khmdn3nhe-product div')
                .addClass("khmdn3n");
            data = $.map($('#khmdn3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdn3neven29_product\']')
                .attr('value', data.join());
            numdn3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mdn6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmdn6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmdn6n')
                .length + 1;
            $('#khmdn6nhe-product')
                .append('<div id="khmdn6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numdn6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmdn6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmdn6nhe-product div:even')
                .attr('class', 'even');
            $('#khmdn6nhe-product div')
                .addClass("khmdn6n");
            data = $.map($('#khmdn6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdn6neven29_product\']')
                .attr('value', data.join());
            numdn6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// Hôi an
$('input[name=\'mha1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmha1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmha1n')
                .length + 1;
            $('#khmha1nhe-product')
                .append('<div id="khmha1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numha1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmha1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmha1nhe-product div:even')
                .attr('class', 'even');
            $('#khmha1nhe-product div')
                .addClass("khmha1n");
            data = $.map($('#khmha1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmha1neven29_product\']')
                .attr('value', data.join());
            numha1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mha3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmha3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmha3n')
                .length + 1;
            $('#khmha3nhe-product')
                .append('<div id="khmha3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numha3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmha3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmha3nhe-product div:even')
                .attr('class', 'even');
            $('#khmha3nhe-product div')
                .addClass("khmha3n");
            data = $.map($('#khmha3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmha3neven29_product\']')
                .attr('value', data.join());
            numha3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mha6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmha6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmha6n')
                .length + 1;
            $('#khmha6nhe-product')
                .append('<div id="khmha6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numha6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmha6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmha6nhe-product div:even')
                .attr('class', 'even');
            $('#khmha6nhe-product div')
                .addClass("khmha6n");
            data = $.map($('#khmha6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmha6neven29_product\']')
                .attr('value', data.join());
            numha6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
    // Huế
    $('input[name=\'mhue1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhue1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhue1n')
                .length + 1;
            $('#khmhue1nhe-product')
                .append('<div id="khmhue1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhue1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhue1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhue1nhe-product div:even')
                .attr('class', 'even');
            $('#khmhue1nhe-product div')
                .addClass("khmhue1n");
            data = $.map($('#khmhue1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhue1neven29_product\']')
                .attr('value', data.join());
            numhue1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mhue3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhue3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhue3n')
                .length + 1;
            $('#khmhue3nhe-product')
                .append('<div id="khmhue3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhue3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhue3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhue3nhe-product div:even')
                .attr('class', 'even');
            $('#khmhue3nhe-product div')
                .addClass("khmhue3n");
            data = $.map($('#khmhue3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhue3neven29_product\']')
                .attr('value', data.join());
            numhue3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mhue6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhue6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhue6n')
                .length + 1;
            $('#khmhue6nhe-product')
                .append('<div id="khmhue6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhue6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhue6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhue6nhe-product div:even')
                .attr('class', 'even');
            $('#khmhue6nhe-product div')
                .addClass("khmhue6n");
            data = $.map($('#khmhue6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhue6neven29_product\']')
                .attr('value', data.join());
            numhue6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// Hà nội
$('input[name=\'mhn1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhn1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhn1n').length + 1;
            $('#khmhn1nhe-product')
                .append('<div id="khmhn1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhn1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhn1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhn1nhe-product div:even')
                .attr('class', 'even');
            $('#khmhn1nhe-product div')
                .addClass("khmhn1n");
            data = $.map($('#khmhn1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhn1neven29_product\']')
                .attr('value', data.join());
            numhn1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mhn3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhn3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhn3n').length + 1;
            $('#khmhn3nhe-product')
                .append('<div id="khmhn3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhn3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhn3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhn3nhe-product div:even')
                .attr('class', 'even');
            $('#khmhn3nhe-product div')
                .addClass("khmhn3n");
            data = $.map($('#khmhn3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhn3neven29_product\']')
                .attr('value', data.join());
            numhn3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mhn6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhn6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhn6n').length + 1;
            $('#khmhn6nhe-product')
                .append('<div id="khmhn6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhn6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhn6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhn6nhe-product div:even')
                .attr('class', 'even');
            $('#khmhn6nhe-product div')
                .addClass("khmhn6n");
            data = $.map($('#khmhn6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhn6neven29_product\']')
                .attr('value', data.join());
            numhn6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
// Hạ long
$('input[name=\'mhl1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhl1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhl1n').length + 1;
            $('#khmhl1nhe-product')
                .append('<div id="khmhl1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhl1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhl1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhl1nhe-product div:even')
                .attr('class', 'even');
            $('#khmhl1nhe-product div')
                .addClass("khmhl1n");
            data = $.map($('#khmhl1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhl1neven29_product\']')
                .attr('value', data.join());
            numhl1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'mhl3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhl3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhl3n').length + 1;
            $('#khmhl3nhe-product')
                .append('<div id="khmhl3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhl3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhl3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhl3nhe-product div:even')
                .attr('class', 'even');
            $('#khmhl3nhe-product div')
                .addClass("khmhl3n");
            data = $.map($('#khmhl3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhl3neven29_product\']')
                .attr('value', data.join());
            numhl3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mhl6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmhl6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmhl6n').length + 1;
            $('#khmhl6nhe-product')
                .append('<div id="khmhl6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numhl6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmhl6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmhl6nhe-product div:even')
                .attr('class', 'even');
            $('#khmhl6nhe-product div')
                .addClass("khmhl6n");
            data = $.map($('#khmhl6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhl6neven29_product\']')
                .attr('value', data.join());
            numhl6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'msp1neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmsp1nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmsp1n').length + 1;
            $('#khmsp1nhe-product')
                .append('<div id="khmsp1nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numsp1n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmsp1nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmsp1nhe-product div:even')
                .attr('class', 'even');
            $('#khmsp1nhe-product div')
                .addClass("khmsp1n");
            data = $.map($('#khmsp1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsp1neven29_product\']')
                .attr('value', data.join());
            numsp1n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('input[name=\'msp3neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmsp3nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmsp3n').length + 1;
            $('#khmsp3nhe-product')
                .append('<div id="khmsp3nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numsp3n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmsp3nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmsp3nhe-product div:even')
                .attr('class', 'even');
            $('#khmsp3nhe-product div')
                .addClass("khmsp3n");
            data = $.map($('#khmsp3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsp3neven29_product\']')
                .attr('value', data.join());
            numsp3n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'msp6neven29_product\']')
    .autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            model: item.model,
                            name: item.name,
                            label: item.model + ' - ' + item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#khmsp6nhe-product' + ui.item.value)
                .remove();
            var rowb = $('.khmsp6n').length + 1;
            $('#khmsp6nhe-product')
                .append('<div id="khmsp6nhe-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numsp6n" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmsp6nhe-product div:odd')
                .attr('class', 'odd');
            $('#khmsp6nhe-product div:even')
                .attr('class', 'even');
            $('#khmsp6nhe-product div')
                .addClass("khmsp6n");
            data = $.map($('#khmsp6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsp6neven29_product\']')
                .attr('value', data.join());
            numsp6n();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

$('#khmsg1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmsg1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmsg1nhe-product div:even')
            .attr('class', 'even');
        $('#khmsg1nhe-product div')
            .addClass("khmsg1n");
        data = $.map($('#khmsg1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmsg1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmsg3nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmsg3nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmsg3nhe-product div:even')
            .attr('class', 'even');
        $('#khmsg3nhe-product div')
            .addClass("khmsg3n");
        data = $.map($('#khmsg3nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmsg3neven29_product\']')
            .attr('value', data.join());
    });
$('#khmsg6nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmsg6nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmsg6nhe-product div:even')
            .attr('class', 'even');
        $('#khmsg6nhe-product div')
            .addClass("khmsg6n");
        data = $.map($('#khmsg6nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmsg6neven29_product\']')
            .attr('value', data.join());
    });
//  mien tay
$('#khmmt1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmmt1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmmt1nhe-product div:even')
            .attr('class', 'even');
        $('#khmmt1nhe-product div')
            .addClass("khmmt1n");
        data = $.map($('#khmmt1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmmt1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmmt3nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmmt3nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmmt3nhe-product div:even')
            .attr('class', 'even');
        $('#khmmt3nhe-product div')
            .addClass("khmmt3n");
        data = $.map($('#khmmt3nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmmt3neven29_product\']')
            .attr('value', data.join());
    });
$('#khmmt6nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmmt6nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmmt6nhe-product div:even')
            .attr('class', 'even');
        $('#khmmt6nhe-product div')
            .addClass("khmmt6n");
        data = $.map($('#khmmt6nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmmt6neven29_product\']')
            .attr('value', data.join());
    });

$('#khmvt1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmvt1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmvt1nhe-product div:even')
            .attr('class', 'even');
        $('#khmvt1nhe-product div')
            .addClass("khmvt1n");
        data = $.map($('#khmvt1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmvt1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmvt3nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmvt3nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmvt3nhe-product div:even')
            .attr('class', 'even');
        $('#khmvt3nhe-product div')
            .addClass("khmvt3n");
        data = $.map($('#khmvt3nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmvt3neven29_product\']')
            .attr('value', data.join());
    });
$('#khmvt6nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmvt6nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmvt6nhe-product div:even')
            .attr('class', 'even');
        $('#khmvt6nhe-product div')
            .addClass("khmvt6n");
        data = $.map($('#khmvt6nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmvt6neven29_product\']')
            .attr('value', data.join());
    });
$('#khmpq1nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmpq1nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmpq1nhe-product div:even')
        .attr('class', 'even');
    $('#khmpq1nhe-product div')
        .addClass("khmpq1n");
    data = $.map($('#khmpq1nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmpq1neven29_product\']')
        .attr('value', data.join());
});
 $('#khmpq3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmpq3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmpq3nhe-product div:even')
        .attr('class', 'even');
    $('#khmpq3nhe-product div')
        .addClass("khmpq3n");
    data = $.map($('#khmpq3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmpq3neven29_product\']')
        .attr('value', data.join());
});
 $('#khmpq6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmpq6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmpq6nhe-product div:even')
        .attr('class', 'even');
    $('#khmpq6nhe-product div')
        .addClass("khmpq6n");
    data = $.map($('#khmpq6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmpq6neven29_product\']')
        .attr('value', data.join());
});
$('#khmpt1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmpt1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmpt1nhe-product div:even')
            .attr('class', 'even');
        $('#khmpt1nhe-product div')
            .addClass("khmpt1n");
        data = $.map($('#khmpt1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmpt1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmpt3nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmpt3nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmpt3nhe-product div:even')
            .attr('class', 'even');
        $('#khmpt3nhe-product div')
            .addClass("khmpt3n");
        data = $.map($('#khmpt3nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmpt3neven29_product\']')
            .attr('value', data.join());
    });
$('#khmpt6nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmpt6nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmpt6nhe-product div:even')
            .attr('class', 'even');
        $('#khmpt6nhe-product div')
            .addClass("khmpt6n");
        data = $.map($('#khmpt6nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmpt6neven29_product\']')
            .attr('value', data.join());
    });
    // 
  $('#khmdl1nhe-product div img')
  .live('click', function() {
      $(this)
          .parent()
          .remove();
      $('#khmdl1nhe-product div:odd')
          .attr('class', 'odd');
      $('#khmdl1nhe-product div:even')
          .attr('class', 'even');
      $('#khmdl1nhe-product div')
          .addClass("khmdl1n");
      data = $.map($('#khmdl1nhe-product input:hidden'), function(element) {
          return $(element)
              .attr('value');
      });
      $('input[name=\'khmdl1neven29_product\']')
          .attr('value', data.join());
  });
$('#khmdl3nhe-product div img')
  .live('click', function() {
      $(this)
          .parent()
          .remove();
      $('#khmdl3nhe-product div:odd')
          .attr('class', 'odd');
      $('#khmdl3nhe-product div:even')
          .attr('class', 'even');
      $('#khmdl3nhe-product div')
          .addClass("khmdl3n");
      data = $.map($('#khmdl3nhe-product input:hidden'), function(element) {
          return $(element)
              .attr('value');
      });
      $('input[name=\'khmdl3neven29_product\']')
          .attr('value', data.join());
  });
$('#khmdl6nhe-product div img')
  .live('click', function() {
      $(this)
          .parent()
          .remove();
      $('#khmdl6nhe-product div:odd')
          .attr('class', 'odd');
      $('#khmdl6nhe-product div:even')
          .attr('class', 'even');
      $('#khmdl6nhe-product div')
          .addClass("khmdl6n");
      data = $.map($('#khmdl6nhe-product input:hidden'), function(element) {
          return $(element)
              .attr('value');
      });
      $('input[name=\'khmdl6neven29_product\']')
          .attr('value', data.join());
  });
// 
$('#khmnt1nhe-product div img')
  .live('click', function() {
      $(this)
          .parent()
          .remove();
      $('#khmnt1nhe-product div:odd')
          .attr('class', 'odd');
      $('#khmnt1nhe-product div:even')
          .attr('class', 'even');
      $('#khmnt1nhe-product div')
          .addClass("khmnt1n");
      data = $.map($('#khmnt1nhe-product input:hidden'), function(element) {
          return $(element)
              .attr('value');
      });
      $('input[name=\'khmnt1neven29_product\']')
          .attr('value', data.join());
  });
$('#khmnt3nhe-product div img')
  .live('click', function() {
      $(this)
          .parent()
          .remove();
      $('#khmnt3nhe-product div:odd')
          .attr('class', 'odd');
      $('#khmnt3nhe-product div:even')
          .attr('class', 'even');
      $('#khmnt3nhe-product div')
          .addClass("khmnt3n");
      data = $.map($('#khmnt3nhe-product input:hidden'), function(element) {
          return $(element)
              .attr('value');
      });
      $('input[name=\'khmnt3neven29_product\']')
          .attr('value', data.join());
  });
$('#khmnt6nhe-product div img')
  .live('click', function() {
      $(this)
          .parent()
          .remove();
      $('#khmnt6nhe-product div:odd')
          .attr('class', 'odd');
      $('#khmnt6nhe-product div:even')
          .attr('class', 'even');
      $('#khmnt6nhe-product div')
          .addClass("khmnt6n");
      data = $.map($('#khmnt6nhe-product input:hidden'), function(element) {
          return $(element)
              .attr('value');
      });
      $('input[name=\'khmnt6neven29_product\']')
          .attr('value', data.join());
  });
$('#khmdn1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmdn1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmdn1nhe-product div:even')
            .attr('class', 'even');
        $('#khmdn1nhe-product div')
            .addClass("khmdn1n");
        data = $.map($('#khmdn1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmdn1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmdn3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmdn3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmdn3nhe-product div:even')
        .attr('class', 'even');
    $('#khmdn3nhe-product div')
        .addClass("khmdn3n");
    data = $.map($('#khmdn3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmdn3neven29_product\']')
        .attr('value', data.join());
});
$('#khmdn6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmdn6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmdn6nhe-product div:even')
        .attr('class', 'even');
    $('#khmdn6nhe-product div')
        .addClass("khmdn6n");
    data = $.map($('#khmdn6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmdn6neven29_product\']')
        .attr('value', data.join());
});
// 
$('#khmha1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmha1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmha1nhe-product div:even')
            .attr('class', 'even');
        $('#khmha1nhe-product div')
            .addClass("khmha1n");
        data = $.map($('#khmha1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmha1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmha3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmha3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmha3nhe-product div:even')
        .attr('class', 'even');
    $('#khmha3nhe-product div')
        .addClass("khmha3n");
    data = $.map($('#khmha3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmha3neven29_product\']')
        .attr('value', data.join());
});
$('#khmha6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmha6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmha6nhe-product div:even')
        .attr('class', 'even');
    $('#khmha6nhe-product div')
        .addClass("khmha6n");
    data = $.map($('#khmha6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmha6neven29_product\']')
        .attr('value', data.join());
});
// 
$('#khmhue1nhe-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmhue1nhe-product div:odd')
            .attr('class', 'odd');
        $('#khmhue1nhe-product div:even')
            .attr('class', 'even');
        $('#khmhue1nhe-product div')
            .addClass("khmhue1n");
        data = $.map($('#khmhue1nhe-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmhue1neven29_product\']')
            .attr('value', data.join());
    });
$('#khmhue3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhue3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhue3nhe-product div:even')
        .attr('class', 'even');
    $('#khmhue3nhe-product div')
        .addClass("khmhue3n");
    data = $.map($('#khmhue3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhue3neven29_product\']')
        .attr('value', data.join());
});
$('#khmhue6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhue6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhue6nhe-product div:even')
        .attr('class', 'even');
    $('#khmhue6nhe-product div')
        .addClass("khmhue6n");
    data = $.map($('#khmhue6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhue6neven29_product\']')
        .attr('value', data.join());
});
$('#khmhn1nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhn1nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhn1nhe-product div:even')
        .attr('class', 'even');
    $('#khmhn1nhe-product div')
        .addClass("khmhn1n");
    data = $.map($('#khmhn1nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhn1neven29_product\']')
        .attr('value', data.join());
});
$('#khmhn3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhn3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhn3nhe-product div:even')
        .attr('class', 'even');
    $('#khmhn3nhe-product div')
        .addClass("khmhn3n");
    data = $.map($('#khmhn3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhn3neven29_product\']')
        .attr('value', data.join());
});
$('#khmhn6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhn6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhn6nhe-product div:even')
        .attr('class', 'even');
    $('#khmhn6nhe-product div')
        .addClass("khmhn6n");
    data = $.map($('#khmhn6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhn6neven29_product\']')
        .attr('value', data.join());
});
// 
$('#khmhl1nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhl1nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhl1nhe-product div:even')
        .attr('class', 'even');
    $('#khmhl1nhe-product div')
        .addClass("khmhl1n");
    data = $.map($('#khmhl1nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhl1neven29_product\']')
        .attr('value', data.join());
});
$('#khmhl3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhl3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhl3nhe-product div:even')
        .attr('class', 'even');
    $('#khmhl3nhe-product div')
        .addClass("khmhl3n");
    data = $.map($('#khmhl3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhl3neven29_product\']')
        .attr('value', data.join());
});
$('#khmhl6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmhl6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmhl6nhe-product div:even')
        .attr('class', 'even');
    $('#khmhl6nhe-product div')
        .addClass("khmhl6n");
    data = $.map($('#khmhl6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmhl6neven29_product\']')
        .attr('value', data.join());
});
// 
$('#khmsp1nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmsp1nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmsp1nhe-product div:even')
        .attr('class', 'even');
    $('#khmsp1nhe-product div')
        .addClass("khmsp1n");
    data = $.map($('#khmsp1nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmsp1neven29_product\']')
        .attr('value', data.join());
});
$('#khmsp3nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmsp3nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmsp3nhe-product div:even')
        .attr('class', 'even');
    $('#khmsp3nhe-product div')
        .addClass("khmsp3n");
    data = $.map($('#khmsp3nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmsp3neven29_product\']')
        .attr('value', data.join());
});
$('#khmsp6nhe-product div img')
.live('click', function() {
    $(this)
        .parent()
        .remove();
    $('#khmsp6nhe-product div:odd')
        .attr('class', 'odd');
    $('#khmsp6nhe-product div:even')
        .attr('class', 'even');
    $('#khmsp6nhe-product div')
        .addClass("khmsp6n");
    data = $.map($('#khmsp6nhe-product input:hidden'), function(element) {
        return $(element)
            .attr('value');
    });
    $('input[name=\'khmsp6neven29_product\']')
        .attr('value', data.join());
});
function numsg1n() {
    $('input[name=numsg1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numsg1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmsg1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmsg1n')
                        .insertBefore($("#khmsg1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmsg1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmsg1n')
                        .insertAfter($("#khmsg1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numsg1n]")
                .val('');
            data = $.map($('#khmsg1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsg1neven29_product\']')
                .attr('value', data.join());
        })
}
numsg1n();

function numsg3n() {
    $('input[name=numsg3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numsg3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmsg3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmsg3n')
                        .insertBefore($("#khmsg3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmsg3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmsg3n')
                        .insertAfter($("#khmsg3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numsg3n]")
                .val('');
            //var r = $(this).length;
            //$(this).prev().html('<b>'+r+'.</b>');
            data = $.map($('#khmsg3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsg3neven29_product\']')
                .attr('value', data.join());
        })
}
numsg3n();

function numsg6n() {
    $('input[name=numsg6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numsg6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmsg6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmsg6n')
                        .insertBefore($("#khmsg6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmsg6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmsg6n')
                        .insertAfter($("#khmsg6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numsg6n]")
                .val('');
            data = $.map($('#khmsg6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsg6neven29_product\']')
                .attr('value', data.join());
        })
}
numsg6n();
// 
function nummt1n() {
    $('input[name=nummt1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=nummt1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmmt1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmmt1n')
                        .insertBefore($("#khmmt1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmmt1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmmt1n')
                        .insertAfter($("#khmmt1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=nummt1n]")
                .val('');
            data = $.map($('#khmmt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmmt1neven29_product\']')
                .attr('value', data.join());
        })
}
nummt1n();

function nummt3n() {
    $('input[name=nummt3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=nummt3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmmt3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmmt3n')
                        .insertBefore($("#khmmt3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmmt3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmmt3n')
                        .insertAfter($("#khmmt3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=nummt3n]")
                .val('');
            //var r = $(this).length;
            //$(this).prev().html('<b>'+r+'.</b>');
            data = $.map($('#khmmt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmmt3neven29_product\']')
                .attr('value', data.join());
        })
}
nummt3n();

function nummt6n() {
    $('input[name=nummt6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=nummt6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmmt6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmmt6n')
                        .insertBefore($("#khmmt6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmmt6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmmt6n')
                        .insertAfter($("#khmmt6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=nummt6n]")
                .val('');
            data = $.map($('#khmmt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmmt6neven29_product\']')
                .attr('value', data.join());
        })
}
nummt6n();
// 

function numvt1n() {
    $('input[name=numvt1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numvt1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmvt1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmvt1n')
                        .insertBefore($("#khmvt1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmvt1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmvt1n')
                        .insertAfter($("#khmvt1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numvt1n]")
                .val('');
            data = $.map($('#khmvt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmvt1neven29_product\']')
                .attr('value', data.join());
        })
}
numvt1n();

function numvt3n() {
    $('input[name=numvt3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numvt3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmvt3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmvt3n')
                        .insertBefore($("#khmvt3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmvt3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmvt3n')
                        .insertAfter($("#khmvt3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numvt3n]")
                .val('');
            //var r = $(this).length;
            //$(this).prev().html('<b>'+r+'.</b>');
            data = $.map($('#khmvt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmvt3neven29_product\']')
                .attr('value', data.join());
        })
}
numvt3n();

function numvt6n() {
    $('input[name=numvt6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numvt6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmvt6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmvt6n')
                        .insertBefore($("#khmvt6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmvt6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmvt6n')
                        .insertAfter($("#khmvt6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numvt6n]")
                .val('');
            data = $.map($('#khmvt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmvt6neven29_product\']')
                .attr('value', data.join());
        })
}
numvt6n();

function numpq1n() {
    $('input[name=numpq1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numpq1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmpq1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmpq1n')
                        .insertBefore($("#khmpq1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmpq1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmpq1n')
                        .insertAfter($("#khmpq1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numpq1n]")
                .val('');
            data = $.map($('#khmpq1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpq1neven29_product\']')
                .attr('value', data.join());
        })
}
numpq1n();

function numpq3n() {
    $('input[name=numpq3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numpq3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmpq3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmpq3n')
                        .insertBefore($("#khmpq3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmpq3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmpq3n')
                        .insertAfter($("#khmpq3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numpq3n]")
                .val('');
            data = $.map($('#khmpq3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpq3neven29_product\']')
                .attr('value', data.join());
        })
}
numpq3n();
function numpq6n() {
    $('input[name=numpq6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numpq6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmpq6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmpq6n')
                        .insertBefore($("#khmpq6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmpq6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmpq6n')
                        .insertAfter($("#khmpq6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numpq6n]")
                .val('');
            data = $.map($('#khmpq6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpq6neven29_product\']')
                .attr('value', data.join());
        })
}
numpq6n();

function numpt1n() {
    $('input[name=numpt1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numpt1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmpt1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmpt1n')
                        .insertBefore($("#khmpt1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmpt1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmpt1n')
                        .insertAfter($("#khmpt1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numpt1n]")
                .val('');
            data = $.map($('#khmpt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpt1neven29_product\']')
                .attr('value', data.join());
        })
}
numpt1n();

function numpt3n() {
    $('input[name=numpt3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numpt3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmpt3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmpt3n')
                        .insertBefore($("#khmpt3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmpt3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmpt3n')
                        .insertAfter($("#khmpt3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numpt3n]")
                .val('');
            data = $.map($('#khmpt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpt3neven29_product\']')
                .attr('value', data.join());
        })
}
numpt6n();
function numpt6n() {
    $('input[name=numpt6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numpt6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmpt6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmpt6n')
                        .insertBefore($("#khmpt6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmpt6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmpt6n')
                        .insertAfter($("#khmpt6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numpt6n]")
                .val('');
            data = $.map($('#khmpt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmpt6neven29_product\']')
                .attr('value', data.join());
        })
}
numpt6n();
// 
function numdl1n() {
    $('input[name=numdl1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numdl1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmdl1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmdl1n')
                        .insertBefore($("#khmdl1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmdl1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmdl1n')
                        .insertAfter($("#khmdl1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numdl1n]")
                .val('');
            data = $.map($('#khmdl1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdl1neven29_product\']')
                .attr('value', data.join());
        })
}
numdl1n();

function numdl3n() {
    $('input[name=numdl3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numdl3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmdl3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmdl3n')
                        .insertBefore($("#khmdl3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmdl3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmdl3n')
                        .insertAfter($("#khmdl3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numdl3n]")
                .val('');
            data = $.map($('#khmdl3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdl3neven29_product\']')
                .attr('value', data.join());
        })
}
numdl6n();
function numdl6n() {
    $('input[name=numdl6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numdl6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmdl6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmdl6n')
                        .insertBefore($("#khmdl6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmdl6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmdl6n')
                        .insertAfter($("#khmdl6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numdl6n]")
                .val('');
            data = $.map($('#khmdl6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdl6neven29_product\']')
                .attr('value', data.join());
        })
}
numdl6n();
function numnt1n() {
    $('input[name=numnt1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numnt1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmnt1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmnt1n')
                        .insertBefore($("#khmnt1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmnt1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmnt1n')
                        .insertAfter($("#khmnt1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numnt1n]")
                .val('');
            data = $.map($('#khmnt1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmnt1neven29_product\']')
                .attr('value', data.join());
        })
}
numnt1n();

function numnt3n() {
    $('input[name=numnt3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numnt3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmnt3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmnt3n')
                        .insertBefore($("#khmnt3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmnt3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmnt3n')
                        .insertAfter($("#khmnt3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numnt3n]")
                .val('');
            data = $.map($('#khmnt3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmnt3neven29_product\']')
                .attr('value', data.join());
        })
}
numnt6n();
function numnt6n() {
    $('input[name=numnt6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numnt6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmnt6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmnt6n')
                        .insertBefore($("#khmnt6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmnt6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmnt6n')
                        .insertAfter($("#khmnt6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numnt6n]")
                .val('');
            data = $.map($('#khmnt6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmnt6neven29_product\']')
                .attr('value', data.join());
        })
}
numnt6n();
function numdn1n() {
    $('input[name=numdn1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numdn1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmdn1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmdn1n')
                        .insertBefore($("#khmdn1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmdn1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmdn1n')
                        .insertAfter($("#khmdn1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numdn1n]")
                .val('');
            data = $.map($('#khmdn1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdn1neven29_product\']')
                .attr('value', data.join());
        })
}
numdn1n();

function numdn3n() {
    $('input[name=numdn3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numdn3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmdn3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmdn3n')
                        .insertBefore($("#khmdn3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmdn3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmdn3n')
                        .insertAfter($("#khmdn3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numdn3n]")
                .val('');
            data = $.map($('#khmdn3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdn3neven29_product\']')
                .attr('value', data.join());
        })
}
numdn3n();


function numdn6n() {
    $('input[name=numdn6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numdn6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmdn6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmdn6n')
                        .insertBefore($("#khmdn6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmdn6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmdn6n')
                        .insertAfter($("#khmdn6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numdn6n]")
                .val('');
            data = $.map($('#khmdn6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmdn6neven29_product\']')
                .attr('value', data.join());
        })
}
numdn6n();
// 
function numha1n() {
    $('input[name=numha1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numha1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmha1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmha1n')
                        .insertBefore($("#khmha1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmha1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmha1n')
                        .insertAfter($("#khmha1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numha1n]")
                .val('');
            data = $.map($('#khmha1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmha1neven29_product\']')
                .attr('value', data.join());
        })
}
numha1n();

function numha3n() {
    $('input[name=numha3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numha3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmha3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmha3n')
                        .insertBefore($("#khmha3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmha3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmha3n')
                        .insertAfter($("#khmha3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numha3n]")
                .val('');
            data = $.map($('#khmha3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmha3neven29_product\']')
                .attr('value', data.join());
        })
}
numha3n();


function numha6n() {
    $('input[name=numha6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numha6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmha6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmha6n')
                        .insertBefore($("#khmha6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmha6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmha6n')
                        .insertAfter($("#khmha6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numha6n]")
                .val('');
            data = $.map($('#khmha6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmha6neven29_product\']')
                .attr('value', data.join());
        })
}
numha6n();
// 
function numhue1n() {
    $('input[name=numhue1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhue1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhue1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhue1n')
                        .insertBefore($("#khmhue1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhue1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhue1n')
                        .insertAfter($("#khmhue1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhue1n]")
                .val('');
            data = $.map($('#khmhue1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhue1neven29_product\']')
                .attr('value', data.join());
        })
}
numhue1n();

function numhue3n() {
    $('input[name=numhue3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhue3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhue3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhue3n')
                        .insertBefore($("#khmhue3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhue3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhue3n')
                        .insertAfter($("#khmhue3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhue3n]")
                .val('');
            data = $.map($('#khmhue3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhue3neven29_product\']')
                .attr('value', data.join());
        })
}
numhue3n();


function numhue6n() {
    $('input[name=numhue6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhue6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhue6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhue6n')
                        .insertBefore($("#khmhue6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhue6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhue6n')
                        .insertAfter($("#khmhue6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhue6n]")
                .val('');
            data = $.map($('#khmhue6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhue6neven29_product\']')
                .attr('value', data.join());
        })
}
numhue6n();

function numhn1n() {
    $('input[name=numhn1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhn1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhn1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhn1n')
                        .insertBefore($("#khmhn1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhn1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhn1n')
                        .insertAfter($("#khmhn1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhn1n]")
                .val('');
            data = $.map($('#khmhn1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhn1neven29_product\']')
                .attr('value', data.join());
        })
}
numhn1n();

function numhn3n() {
    $('input[name=numhn3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhn3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhn3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhn3n')
                        .insertBefore($("#khmhn3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhn3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhn3n')
                        .insertAfter($("#khmhn3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhn3n]")
                .val('');
            data = $.map($('#khmhn3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhn3neven29_product\']')
                .attr('value', data.join());
        })
}
numhn3n();


function numhn6n() {
    $('input[name=numhn6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhn6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhn6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhn6n')
                        .insertBefore($("#khmhn6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhn6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhn6n')
                        .insertAfter($("#khmhn6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhn6n]")
                .val('');
            data = $.map($('#khmhn6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhn6neven29_product\']')
                .attr('value', data.join());
        })
}
numhn6n();
function numhl1n() {
    $('input[name=numhl1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhl1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhl1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhl1n')
                        .insertBefore($("#khmhl1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhl1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhl1n')
                        .insertAfter($("#khmhl1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhl1n]")
                .val('');
            data = $.map($('#khmhl1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhl1neven29_product\']')
                .attr('value', data.join());
        })
}
numhl1n();

function numhl3n() {
    $('input[name=numhl3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhl3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhl3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhl3n')
                        .insertBefore($("#khmhl3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhl3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhl3n')
                        .insertAfter($("#khmhl3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhl3n]")
                .val('');
            data = $.map($('#khmhl3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhl3neven29_product\']')
                .attr('value', data.join());
        })
}
numhl3n();


function numhl6n() {
    $('input[name=numhl6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numhl6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmhl6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmhl6n')
                        .insertBefore($("#khmhl6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmhl6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmhl6n')
                        .insertAfter($("#khmhl6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numhl6n]")
                .val('');
            data = $.map($('#khmhl6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmhl6neven29_product\']')
                .attr('value', data.join());
        })
}
numhl6n();
function numsp1n() {
    $('input[name=numsp1n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numsp1n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmsp1n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmsp1n')
                        .insertBefore($("#khmsp1nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmsp1n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmsp1n')
                        .insertAfter($("#khmsp1nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numsp1n]")
                .val('');
            data = $.map($('#khmsp1nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsp1neven29_product\']')
                .attr('value', data.join());
        })
}
numsp1n();

function numsp3n() {
    $('input[name=numsp3n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numsp3n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmsp3n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmsp3n')
                        .insertBefore($("#khmsp3nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmsp3n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmsp3n')
                        .insertAfter($("#khmsp3nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numsp3n]")
                .val('');
            data = $.map($('#khmsp3nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsp3neven29_product\']')
                .attr('value', data.join());
        })
}
numsp3n();


function numsp6n() {
    $('input[name=numsp6n]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numsp6n]")
                .length - 1) {
                if ($(this)
                    .parents('.khmsp6n')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmsp6n')
                        .insertBefore($("#khmsp6nhe-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmsp6n')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmsp6n')
                        .insertAfter($("#khmsp6nhe-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numsp6n]")
                .val('');
            data = $.map($('#khmsp6nhe-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmsp6neven29_product\']')
                .attr('value', data.join());
        })
}
numsp6n();
//-->
</script> 
<?php echo $footer; ?>