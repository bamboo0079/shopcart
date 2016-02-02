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
            <td>SÀI GÒN TOUR 3 NGÀY TRỞ LÊN:</td>
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
            <td>PHAN THIẾT 3 TRỞ LÊN:</td>
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
            <td>ĐÀ NẴNG 3 NGÀY TRỞ LÊN:</td>
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
            <td>HÀ NỘI 3 NGÀY TRỞ LÊN:</td>
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
            <td>PHÚ QUỐC 3 NGÀY TRỞ LÊN:</td>
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
numpt3n();

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

//-->
</script> 
<?php echo $footer; ?>