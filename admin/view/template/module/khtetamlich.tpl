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
            <td><input type="text" name="mntal_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmntal-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cn = 1;?>
                <?php foreach ($khmntal_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmntal-product<?php echo $product['product_id']; ?>" class="khmn <?php echo $class; ?>">
                  <label><b><?php echo $cn;?>.</b></label>
                  <input type="text" name="numn" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cn++;} ?>
              </div>
              <input type="hidden" name="khmntal_product" value="<?php echo $khmntal_product; ?>" /></td>
          </tr>
          <tr>
            <td>Trung:</td>
            <td><input type="text" name="mttal_product" value=""size="100" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmttal-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $ct = 1;?>
                <?php foreach ($khmttal_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmttal-product<?php echo $product['product_id']; ?>" class="khmt <?php echo $class; ?>">
                  <label><b><?php echo $ct;?>.</b></label>
                  <input type="text" name="numt" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $ct++;} ?>
              </div>
              <input type="hidden" name="khmttal_product" value="<?php echo $khmttal_product; ?>" /></td>
          </tr>
          <tr>
            <td>Bắc:</td>
            <td><input type="text" name="mbtal_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmbtal-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmbtal_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmbtal-product<?php echo $product['product_id']; ?>" class="khmb <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numb" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmbtal_product" value="<?php echo $khmbtal_product; ?>" /></td>
          </tr>
          <tr>
            <td>Title:</td>
            <td><input type="text" name="khtetamlich_customtitle" value="<?php echo $khtetamlich_customtitle; ?>" size="100" /></td>
          </tr>
          <tr>
            <td>Name:</td>
            <td><input type="text" name="khtetamlich_title" value="<?php echo $khtetamlich_title; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Keyword:</td>
            <td><input type="text" name="khtetamlich_metakey" value="<?php echo $khtetamlich_metakey; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Description:</td>
            <td><input type="text" name="khtetamlich_metadesc" value="<?php echo $khtetamlich_metadesc; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Description:</td>
            <td><textarea name="khtetamlich_desc" id="khtetamlich_desc"><?php echo $khtetamlich_desc; ?></textarea></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
<!--
CKEDITOR.replace('khtetamlich_desc', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
$('input[name=\'mntal_product\']')
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
            $('#khmntal-product' + ui.item.value)
                .remove();
            var rown = $('.khmn')
                .length + 1;
            $('#khmntal-product')
                .append('<div id="khmntal-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="numn" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmntal-product div:odd')
                .attr('class', 'odd');
            $('#khmntal-product div:even')
                .attr('class', 'even');
            $('#khmntal-product div')
                .addClass("khmn");
            data = $.map($('#khmntal-product input'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmntal_product\']')
                .attr('value', data.join());
            nummn();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mttal_product\']')
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
            $('#khmttal-product' + ui.item.value)
                .remove();
            var rowt = $('.khmt')
                .length + 1;
            $('#khmttal-product')
                .append('<div id="khmttal-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numt" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmttal-product div:odd')
                .attr('class', 'odd');
            $('#khmttal-product div:even')
                .attr('class', 'even');
            $('#khmttal-product div')
                .addClass("khmt");
            data = $.map($('#khmttal-product input'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmttal_product\']')
                .attr('value', data.join());
            nummt();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mbtal_product\']')
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
            $('#khmbtal-product' + ui.item.value)
                .remove();
            var rowb = $('.khmb')
                .length + 1;
            $('#khmbtal-product')
                .append('<div id="khmbtal-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numb" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmbtal-product div:odd')
                .attr('class', 'odd');
            $('#khmbtal-product div:even')
                .attr('class', 'even');
            $('#khmbtal-product div')
                .addClass("khmb");
            data = $.map($('#khmbtal-product input'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmbtal_product\']')
                .attr('value', data.join());
            nummb();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('#khmntal-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmntal-product div:odd')
            .attr('class', 'odd');
        $('#khmntal-product div:even')
            .attr('class', 'even');
        $('#khmbtal-product div')
            .addClass("khmn");
        data = $.map($('#khmntal-product input[type=hidden]'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmntal_product\']')
            .attr('value', data.join());
    });
$('#khmttal-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmttal-product div:odd')
            .attr('class', 'odd');
        $('#khmttal-product div:even')
            .attr('class', 'even');
        $('#khmbtal-product div')
            .addClass("khmt");
        data = $.map($('#khmttal-product input[type=hidden]'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmttal_product\']')
            .attr('value', data.join());
    });
$('#khmbtal-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmbtal-product div:odd')
            .attr('class', 'odd');
        $('#khmbtal-product div:even')
            .attr('class', 'even');
        $('#khmbtal-product div')
            .addClass("khmb");
        data = $.map($('#khmbtal-product input[type=hidden]'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmbtal_product\']')
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
                        .insertBefore($("#khmntal-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmn')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmn')
                        .insertAfter($("#khmntal-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numn]")
                .val('');
            data = $.map($('#khmntal-product input[type=hidden]'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmntal_product\']')
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
                        .insertBefore($("#khmttal-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmt')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmt')
                        .insertAfter($("#khmttal-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numt]")
                .val('');
            //var r = $(this).length;
            //$(this).prev().html('<b>'+r+'.</b>');
            data = $.map($('#khmttal-product input[type=hidden]'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmttal_product\']')
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
                        .insertBefore($("#khmbtal-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmb')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmb')
                        .insertAfter($("#khmbtal-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numb]")
                .val('');
            data = $.map($('#khmbtal-product input[type=hidden]'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmbtal_product\']')
                .attr('value', data.join());
        })
}
nummb();
//-->
</script> 
<?php echo $footer; ?>