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
            <td>Nam:</td>
            <td><input type="text" name="mntdl_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmntdl-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cn = 1;?>
                <?php foreach ($khmntdl_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmntdl-product<?php echo $product['product_id']; ?>" class="khmn <?php echo $class; ?>">
                  <label><b><?php echo $cn;?>.</b></label>
                  <input type="text" name="numn" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cn++;} ?>
              </div>
              <input type="hidden" name="khmntdl_product" value="<?php echo $khmntdl_product; ?>" /></td>
          </tr>
          <tr>
            <td>Trung:</td>
            <td><input type="text" name="mttdl_product" value=""size="100" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmttdl-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $ct = 1;?>
                <?php foreach ($khmttdl_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmttdl-product<?php echo $product['product_id']; ?>" class="khmt <?php echo $class; ?>">
                  <label><b><?php echo $ct;?>.</b></label>
                  <input type="text" name="numt" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $ct++;} ?>
              </div>
              <input type="hidden" name="khmttdl_product" value="<?php echo $khmttdl_product; ?>" /></td>
          </tr>
          <tr>
            <td>Bắc:</td>
            <td><input type="text" name="mbtdl_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmbtdl-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmbtdl_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmbtdl-product<?php echo $product['product_id']; ?>" class="khmb <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numb" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmbtdl_product" value="<?php echo $khmbtdl_product; ?>" /></td>
          </tr>
          <tr>
            <td>Title:</td>
            <td><input type="text" name="khtetduonglich_customtitle" value="<?php echo $khtetduonglich_customtitle; ?>" size="100" /></td>
          </tr>
          <tr>
            <td>Name:</td>
            <td><input type="text" name="khtetduonglich_title" value="<?php echo $khtetduonglich_title; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Keyword:</td>
            <td><input type="text" name="khtetduonglich_metakey" value="<?php echo $khtetduonglich_metakey; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Description:</td>
            <td><input type="text" name="khtetduonglich_metadesc" value="<?php echo $khtetduonglich_metadesc; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Description:</td>
            <td><textarea name="khtetduonglich_desc" id="khtetduonglich_desc"><?php echo $khtetduonglich_desc; ?></textarea></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
<!--
CKEDITOR.replace('khtetduonglich_desc', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
$('input[name=\'mntdl_product\']')
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
            $('#khmntdl-product' + ui.item.value)
                .remove();
            var rown = $('.khmn')
                .length + 1;
            $('#khmntdl-product')
                .append('<div id="khmntdl-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="numn" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmntdl-product div:odd')
                .attr('class', 'odd');
            $('#khmntdl-product div:even')
                .attr('class', 'even');
            $('#khmntdl-product div')
                .addClass("khmn");
            data = $.map($('#khmntdl-product input'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmntdl_product\']')
                .attr('value', data.join());
            nummn();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mttdl_product\']')
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
            $('#khmttdl-product' + ui.item.value)
                .remove();
            var rowt = $('.khmt')
                .length + 1;
            $('#khmttdl-product')
                .append('<div id="khmttdl-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numt" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmttdl-product div:odd')
                .attr('class', 'odd');
            $('#khmttdl-product div:even')
                .attr('class', 'even');
            $('#khmttdl-product div')
                .addClass("khmt");
            data = $.map($('#khmttdl-product input'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmttdl_product\']')
                .attr('value', data.join());
            nummt();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mbtdl_product\']')
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
            $('#khmbtdl-product' + ui.item.value)
                .remove();
            var rowb = $('.khmb')
                .length + 1;
            $('#khmbtdl-product')
                .append('<div id="khmbtdl-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numb" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmbtdl-product div:odd')
                .attr('class', 'odd');
            $('#khmbtdl-product div:even')
                .attr('class', 'even');
            $('#khmbtdl-product div')
                .addClass("khmb");
            data = $.map($('#khmbtdl-product input'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmbtdl_product\']')
                .attr('value', data.join());
            nummb();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('#khmntdl-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmntdl-product div:odd')
            .attr('class', 'odd');
        $('#khmntdl-product div:even')
            .attr('class', 'even');
        $('#khmbtdl-product div')
            .addClass("khmn");
        data = $.map($('#khmntdl-product input[type=hidden]'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmntdl_product\']')
            .attr('value', data.join());
    });
$('#khmttdl-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmttdl-product div:odd')
            .attr('class', 'odd');
        $('#khmttdl-product div:even')
            .attr('class', 'even');
        $('#khmbtdl-product div')
            .addClass("khmt");
        data = $.map($('#khmttdl-product input[type=hidden]'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmttdl_product\']')
            .attr('value', data.join());
    });
$('#khmbtdl-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmbtdl-product div:odd')
            .attr('class', 'odd');
        $('#khmbtdl-product div:even')
            .attr('class', 'even');
        $('#khmbtdl-product div')
            .addClass("khmb");
        data = $.map($('#khmbtdl-product input[type=hidden]'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmbtdl_product\']')
            .attr('value', data.join());
    });

function nummn() {
    $('input[name=numn]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numn]")
                .length - 1) {
                if ($(this)
                    .parents('.khmn')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmn')
                        .insertBefore($("#khmntdl-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmn')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmn')
                        .insertAfter($("#khmntdl-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numn]")
                .val('');
            data = $.map($('#khmntdl-product input[type=hidden]'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmntdl_product\']')
                .attr('value', data.join());
        })
}
nummn();

function nummt() {
    $('input[name=numt]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numt]")
                .length - 1) {
                if ($(this)
                    .parents('.khmt')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmt')
                        .insertBefore($("#khmttdl-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmt')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmt')
                        .insertAfter($("#khmttdl-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numt]")
                .val('');
            //var r = $(this).length;
            //$(this).prev().html('<b>'+r+'.</b>');
            data = $.map($('#khmttdl-product input[type=hidden]'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmttdl_product\']')
                .attr('value', data.join());
        })
}
nummt();

function nummb() {
    $('input[name=numb]')
        .on('blur', function() {
            var pos = $(this)
                .val() - 1;
            if (pos >= 0 && pos <= $("input[name=numb]")
                .length - 1) {
                if ($(this)
                    .parents('.khmb')
                    .index() > pos) {
                    //move up
                    $(this)
                        .parents('.khmb')
                        .insertBefore($("#khmbtdl-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmb')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmb')
                        .insertAfter($("#khmbtdl-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numb]")
                .val('');
            data = $.map($('#khmbtdl-product input[type=hidden]'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmbtdl_product\']')
                .attr('value', data.join());
        })
}
nummb();
//-->
</script> 
<?php echo $footer; ?>