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
            <td><input type="text" name="mngt_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmngt-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cn = 1;?>
                <?php foreach ($khmngt_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmngt-product<?php echo $product['product_id']; ?>" class="khmn <?php echo $class; ?>">
                  <label><b><?php echo $cn;?>.</b></label>
                  <input type="text" name="numn" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cn++;} ?>
              </div>
              <input type="hidden" name="khmngt_product" value="<?php echo $khmngt_product; ?>" /></td>
          </tr>
          <tr>
            <td>Trung:</td>
            <td><input type="text" name="mtgt_product" value=""size="100" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmtgt-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $ct = 1;?>
                <?php foreach ($khmtgt_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmtgt-product<?php echo $product['product_id']; ?>" class="khmt <?php echo $class; ?>">
                  <label><b><?php echo $ct;?>.</b></label>
                  <input type="text" name="numt" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $ct++;} ?>
              </div>
              <input type="hidden" name="khmtgt_product" value="<?php echo $khmtgt_product; ?>" /></td>
          </tr>
          <tr>
            <td>Bắc:</td>
            <td><input type="text" name="mbgt_product" value="" size="100"/></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="khmbgt-product" class="scrollbox" style="width:80%">
                <?php $class = 'odd'; ?>
                <?php $cb = 1;?>
                <?php foreach ($khmbgt_product_box as $product) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div id="khmbgt-product<?php echo $product['product_id']; ?>" class="khmb <?php echo $class; ?>">
                  <label><b><?php echo $cb;?>.</b></label>
                  <input type="text" name="numb" size="1" />
                  <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php $cb++;} ?>
              </div>
              <input type="hidden" name="khmbgt_product" value="<?php echo $khmbgt_product; ?>" /></td>
          </tr>
          <tr>
            <td>Title:</td>
            <td><input type="text" name="gioto_customtitle" value="<?php echo $gioto_customtitle; ?>" size="100" /></td>
          </tr>
          <tr>
            <td>Name:</td>
            <td><input type="text" name="gioto_title" value="<?php echo $gioto_title; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Keyword:</td>
            <td><input type="text" name="gioto_metakey" value="<?php echo $gioto_metakey; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Meta Description:</td>
            <td><input type="text" name="gioto_metadesc" value="<?php echo $gioto_metadesc; ?>" size="100"/></td>
          </tr>
          <tr>
            <td>Description:</td>
            <td><textarea name="gioto_desc" id="gioto_desc"><?php echo $gioto_desc; ?></textarea></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
<!--
CKEDITOR.replace('gioto_desc', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
$('input[name=\'mngt_product\']')
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
			
            $('#khmngt-product' + ui.item.value).remove();
            var rown = $('.khmn').length + 1;
            $('#khmngt-product').append('<div id="khmngt-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="numn" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmngt-product div:odd')
                .attr('class', 'odd');
            $('#khmngt-product div:even')
                .attr('class', 'even');
            $('#khmngt-product div')
                .addClass("khmn");
            data = $.map($('#khmngt-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
			console.log(data);
            $('input[name=\'khmngt_product\']')
                .attr('value', data.join());
            nummn();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mtgt_product\']')
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
            $('#khmtgt-product' + ui.item.value)
                .remove();
            var rowt = $('.khmt')
                .length + 1;
            $('#khmtgt-product')
                .append('<div id="khmtgt-product' + ui.item.value + '"><label><b>' + rowt + '.</b></label> <input type="text" name="numt" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmtgt-product div:odd')
                .attr('class', 'odd');
            $('#khmtgt-product div:even')
                .attr('class', 'even');
            $('#khmtgt-product div')
                .addClass("khmt");
            data = $.map($('#khmtgt-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmtgt_product\']')
                .attr('value', data.join());
            nummt();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('input[name=\'mbgt_product\']')
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
            $('#khmbgt-product' + ui.item.value)
                .remove();
            var rowb = $('.khmb')
                .length + 1;
            $('#khmbgt-product')
                .append('<div id="khmbgt-product' + ui.item.value + '"><label><b>' + rowb + '.</b></label> <input type="text" name="numb" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
            $('#khmbgt-product div:odd')
                .attr('class', 'odd');
            $('#khmbgt-product div:even')
                .attr('class', 'even');
            $('#khmbgt-product div')
                .addClass("khmb");
            data = $.map($('#khmbgt-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmbgt_product\']')
                .attr('value', data.join());
            nummb();
            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });
$('#khmngt-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmngt-product div:odd')
            .attr('class', 'odd');
        $('#khmngt-product div:even')
            .attr('class', 'even');
        $('#khmbgt-product div')
            .addClass("khmn");
        data = $.map($('#khmngt-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmngt_product\']')
            .attr('value', data.join());
    });
$('#khmtgt-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmtgt-product div:odd')
            .attr('class', 'odd');
        $('#khmtgt-product div:even')
            .attr('class', 'even');
        $('#khmbgt-product div')
            .addClass("khmt");
        data = $.map($('#khmtgt-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmtgt_product\']')
            .attr('value', data.join());
    });
$('#khmbgt-product div img')
    .live('click', function() {
        $(this)
            .parent()
            .remove();
        $('#khmbgt-product div:odd')
            .attr('class', 'odd');
        $('#khmbgt-product div:even')
            .attr('class', 'even');
        $('#khmbgt-product div')
            .addClass("khmb");
        data = $.map($('#khmbgt-product input:hidden'), function(element) {
            return $(element)
                .attr('value');
        });
        $('input[name=\'khmbgt_product\']')
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
                        .insertBefore($("#khmngt-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmn')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmn')
                        .insertAfter($("#khmngt-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numn]")
                .val('');
            data = $.map($('#khmngt-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmngt_product\']')
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
                        .insertBefore($("#khmtgt-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmt')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmt')
                        .insertAfter($("#khmtgt-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numt]")
                .val('');
            //var r = $(this).length;
            //$(this).prev().html('<b>'+r+'.</b>');
            data = $.map($('#khmtgt-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmtgt_product\']')
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
                        .insertBefore($("#khmbgt-product div:eq(" + pos + ")"));
                }
                if ($(this)
                    .parents('.khmb')
                    .index() < pos) {
                    //move down
                    $(this)
                        .parents('.khmb')
                        .insertAfter($("#khmbgt-product div:eq(" + pos + ")"));
                }
            }
            $("input[name=numb]")
                .val('');
            data = $.map($('#khmbgt-product input:hidden'), function(element) {
                return $(element)
                    .attr('value');
            });
            $('input[name=\'khmbgt_product\']')
                .attr('value', data.join());
        })
}
nummb();
//-->
</script> 
<?php echo $footer; ?>