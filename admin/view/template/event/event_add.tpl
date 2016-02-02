<?php echo $header; ?>
<style>
    .add_group{ cursor: pointer; }
</style>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if (isset($error) && !empty($error)) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <?php if (isset($success) && !empty($success)) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>

    <div class="box">
           
    </div>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /><?php echo $text_event_text;?></h1>
            <div class="buttons">
             <!-- <a class="button" href="">Group Event</a> -->
             <a class="button show_all_panel">Show All List</a>
             <a class="button close_all_panel">Close All List</a>
            <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel;?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <input type="hidden" name="event_id" value="<?php echo(isset($event_description[0]['id']) ? $event_description[0]['id'] : '');?>">
                <table class="form">
                    <tr>
                        <td style="width:25%"><?php echo $event_name_title;?>:</td>
                        <td>
                            <table>
                                <tr>
                                    <td ><input data-rule-required="true" data-msg-required="* Vui lòng nhập tên sự kiện" style="width: 300px" type="text" name="event_name" value="<?php echo (isset($event_description[0]['event_name']) ? $event_description[0]['event_name'] : '');?>"></td>
                                    <td>Event code</td>
                                    <td><input value="<?php echo (isset($event_description[0]['event_code']) ? $event_description[0]['event_code'] : '');?>" type="text" name="event_code" data-rule-required="true" data-msg-required="* Vui lòng nhập mã sự kiện"></td>
                                    <td> <input type="radio" name="status" value="1" <?php echo (isset($event_description[0]['status']) && $event_description[0]['status']== 1 ? 'checked="checked"' : '');?>> Enable <input type="radio" name="status" value="0" <?php echo (isset($event_description[0]['status']) && $event_description[0]['status']== 0 ? 'checked="checked"' : '');?> <?php echo (!isset($event_description[0]['status']) ? 'checked="checked"' : '');?>> Disable</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo 'Location';?>:</td>
                        <td>
                            <select class="location" name="location" data-rule-required="true" data-msg-required="* Vui lòng chọn location"  >
                                <option value="0">--Chọn location--</option>
                                <?php
                                    if(!empty($location)){
                                    foreach($location as $_location){
                                ?>
                                <option value="<?php echo $_location['id'] ?>" <?php echo (isset($event_description[0]['location'][0]['location']) && $event_description[0]['location'][0]['location']== $_location['id'] ? 'selected="selected"' : '');?> ><?php echo $_location['name'] ?></option>
                                <?php } } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $event_url_text;?>:</td>
                        <td>
                            <input data-rule-required="true" data-msg-required="* Vui lòng nhập link" type="text" name="seo_url" value="<?php echo (isset($event_description[0]['event_seo']) ? $event_description[0]['event_seo'] : '');?>" size="100">
                        </td>
                    </tr>

                    <tr>
                        <td><?php echo $event_time;?>:</td>
                        <td>
                            <table>
                                <tr>
                                    <td> <input data-rule-required="true" data-msg-required="* Vui lòng nhập ngày hiển thị" type="text" name="date_show" value="<?php echo (isset($event_description[0]['event_show']) ? $event_description[0]['event_show'] : '');?>" id="date-show" size="12" /></td>
                                    <td><?php echo $event_start;?></td>
                                    <td><input type="text" name="start_date" data-rule-required="true" data-msg-required="* Vui lòng nhập ngày bắt đầu sự kiện" value="<?php echo (isset($event_description[0]['event_start']) ? $event_description[0]['event_start'] : '');?>" id="date-start" size="12" /></td>
                                    <td><?php echo $event_end;?></td>
                                    <td><input type="text" name="end_date" data-rule-required="true" data-msg-required="* Vui lòng nhập ngày kết thúc sự kiện" value="<?php echo (isset($event_description[0]['event_end']) ? $event_description[0]['event_end'] : '');?>" id="date-end" size="12" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <strong>
                            Nguyên tắc tạo nhóm: #ten_vung #ten_nhom #so_ngay mỗi loại cách nhau dấu # (Thăng)<br>
                            Ví dụ: #mien_bac #tour 1 den 3 ngay #1<br>
                            Mảng lấy ra tương ứng: <br> 
                            mang[0] => ten_vung <br>
                            mang[1] => ten_nhom <br>
                            mang[2] => so_ngay
                            </strong>
                        </td>
                    </tr>
                    <?php
                        if(isset($event_description[0]['location']) && !empty($event_description[0]['location'])){
                        foreach($event_description[0]['location'] as $product){
                    ?>
                    
                    <tr>
                        <td><input style="width:90%;font-weight:bolder;color:#003A88" type="text" data-rule-required="true" data-msg-required="* Vui lòng nhập tên nhóm" name="group_name[]" placeholder="Loại tour" class="group_name" value="<?php echo $product['name']?>"><input type="hidden" name="event_attr[]" value="<?php echo $product['name'];?>">:</td>
                        <td><input class="mntal_product" type="text" name="mntal_product" value="" size="100"/>   <img class="add_group" src="view/image/add.png"> <img class="delete_group" style="cursor: pointer" src="view/image/delete.png"/>&nbsp;&nbsp;&nbsp;&nbsp;<a class="button show_panel">Show List</a></td>
                    </tr>

                    <tr class="show_input" style="display:none">
                        <td>&nbsp;</td>
                        <td>
                            <div id="khmntal-product" class="scrollbox khmntal-product" style="width:80%">
                                <?php $class = 'odd'; ?>
                                <?php $cn = 1;?>
                                <?php
                                if(isset($product['product']) && !empty($product['product'])){
                                foreach ($product['product'] as $_product) { ?>
                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                <div id="khmntal-product<?php echo $_product['id']; ?>" class=" khmntal-product<?php echo $_product['id']; ?> khmn <?php echo $class; ?>">
                                    <label><b><?php echo $cn;?>.</b></label>
                                    <input type="text" name="numn" size="1" />
                                    <strong style="text-decoration:underline"><?php echo $_product['model']; ?></strong> - <?php echo $_product['name']; ?> <img src="view/image/delete.png" />
                                    <input type="hidden" value="<?php echo $_product['id']; ?>" />
                                </div>
                                <?php $cn++;} } ?>
                            </div>
                            <?php
                                $value = str_replace(',',',,',$product['value']);
                                $value = str_replace(' ','',$value);
                            ?>
                            <input type="hidden" name="khmntal_product[]" value="<?php echo (isset($product['value']) ? $value : ''); ?>" />
                        </td>
                    </tr>
                    <?php }?>
                    <?php }else{ ?>
                    <tr>
                        <td><input type="text" data-rule-required="true" data-msg-required="* Vui lòng nhập tên nhóm" name="group_name[]" placeholder="Loại tour" class="group_name">:</td>
                        <td><input class="mntal_product" type="text" name="mntal_product" value="" size="100"/>   <img class="add_group" src="view/image/add.png"> <img class="delete_group" style="cursor: pointer" src="view/image/delete.png"/></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <div id="khmntal-product" class="scrollbox khmntal-product" style="width:80%">
                                <?php $class = 'odd'; ?>
                                <?php $cn = 1;?>
                                <?php
                                if(isset($event_description[0]['location']) && !empty($event_description[0]['location'])){
                                foreach ($event_description[0]['location'] as $product) { ?>
                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                <div id="khmntal-product<?php echo $product['product_id']; ?>" class=" khmntal-product<?php echo $product['product_id']; ?> khmn <?php echo $class; ?>">
                                    <label><b><?php echo $cn;?>.</b></label>
                                    <input type="text" name="numn" size="1" />
                                    <strong style="text-decoration:underline"><?php echo $product['model']; ?></strong> - <?php echo $product['name']; ?> <img src="view/image/delete.png" />
                                    <input type="hidden" value="<?php echo $product['product_id']; ?>" />
                                </div>
                                <?php $cn++;} } ?>
                            </div>
                            <input type="hidden" name="khmntal_product[]" value="<?php echo (isset($khmntal_product) ? $khmntal_product : ''); ?>" />
                        </td>
                    </tr>
                    <?php } ?>

                    <tr>
                        <td>Title:</td>
                        <td><input type="text" data-rule-required="true" data-msg-required="* Vui lòng nhập tiêu đề" name="khtetamlich_customtitle" value="<?php echo (isset($event_description[0]['event_title']) ? $event_description[0]['event_title'] : '');?>" size="100" /></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="khtetamlich_title" data-rule-required="true" data-msg-required="* Vui lòng nhập tên" value="<?php echo (isset($event_description[0]['customtitle']) ? $event_description[0]['customtitle'] : '');?>" size="100"/></td>
                    </tr>
                    <tr>
                        <td>Meta Keyword:</td>
                        <td><input type="text" name="khtetamlich_metakey" data-rule-required="true" data-msg-required="* Vui lòng nhập meta keyword" value="<?php echo (isset($event_description[0]['event_keywords']) ? $event_description[0]['event_keywords'] : '');?>" size="100"/></td>
                    </tr>
                    <tr>
                        <td>Meta Description:</td>
                        <td><input type="text" data-rule-required="true" data-msg-required="* Vui lòng nhập tên meta description" name="khtetamlich_metadesc" value="<?php echo (isset($event_description[0]['event_description']) ? $event_description[0]['event_description'] : '');?>" size="100"/></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><textarea data-rule-required="true" data-msg-required="* Vui lòng nhập mô tả sự kiện" name="khtetamlich_desc" id="khtetamlich_desc"><?php echo (isset($event_description[0]['event_contents']) ? $event_description[0]['event_contents'] : '');?></textarea></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript">
    $(function(){
        $('#form').validate();
    });
</script>
<script type="text/javascript"><!--
    $(document).ready(function() {
        $('#date-show').datepicker({dateFormat: 'yy-mm-dd'});
        $('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
        $('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
    });
//--></script>
<script type="text/javascript">
    $(function(){

        $('input[name=event_name]').on('keyup',function() {
            var value = $(this).val();
            $.ajax({
                type:'POST',
                url: 'index.php?route=module/event/getlinkseo&token=<?php echo $token; ?>',
                dataType: 'text',
                data:{ value:value },
                success: function(data) {
                    $('input[name=seo_url]').val(data);
                }
            });
        });

        $('body').delegate('.group_name','focusout',function(){
            var value = $(this).val();
            if(value.length > 0) {
                $(this).after(value);
                if($(this).append().find('input').length == 0){
                    $(this).next().remove();
                    $(this).after('<input type="hidden" name="event_attr[]" value="' + value + '">');

                }else{
                    $(this).parent().find('input').val(value);
                }

                $(this).remove();
            }
        });
         $('body').delegate('.delete_group','click',function(){
            var result = confirm("Bạn thực sự muốn xóa, dữ liệu sẽ không được khôi phục");
            if (result) {
                var parent = $(this).parent().parent();
                parent.next().remove();
                parent.remove();
            }else{
                return false;
            }
        });
        $('body').delegate('.add_group','click',function(){
            var html = '<tr>';
            html +='<td><input type="text" name="group_name[]" placeholder="Loại tour" class="group_name">:</td>';
            html += '<td><input type="text" name="mntal_product[]" value="" size="100" class="ui-autocomplete-input mntal_product" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true">   <img class="add_group" src="view/image/add.png"><img class="delete_group" src="view/image/delete.png"></td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td>&nbsp;</td>';
            html += '<td>';
            html += '<div id="khmntal-product" class="scrollbox khmntal-product" style="width:80%">';
            html += '</div>';
            html += '<input type="hidden" name="khmntal_product[]" value="">';
            html += '</td>';
            html += '</tr>';
            $(this).parent().parent().next().after(html);
        });
    })
</script>
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

    $('body').delegate('.mntal_product','keyup',function(){
        var pdrow = $(this).parent().parent().next().find('div.scrollbox');

        $(this).autocomplete({
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
                $('.khmntal-product' + ui.item.value).remove();
                var rown = pdrow.find('div.khmn').length + 1;

                var html = '<div class="khmntal-product' + ui.item.value + '"><label><b>' + rown + '.</b></label> <input type="text" name="numn" size="1" /> <strong style="text-decoration:underline">' + ui.item.model + '</strong> ' + ' - ' + ui.item.name + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>';
                pdrow.append(html);
//              $('#khmntal-product').append(html);
                $('.khmntal-product div:odd').attr('class', 'odd');
                $('.khmntal-product div:even').attr('class', 'even');
                $('.khmntal-product div').addClass("khmn");
                pdrow.parent().find('input[name=\'khmntal_product[]\']').val(' ');
                data = $.map(pdrow.parent().find('input'), function(element) {
                    return $(element).attr('value');
                });
                pdrow.parent().find('input[name=\'khmntal_product[]\']').attr('value', data.join());
//                $('input[name=\'khmntal_product\']').attr('value', data.join());
                nummn();
                return false;
            },
            focus: function(event, ui) {
                return false;
            }
        });
    });

    $('.khmntal-product div img')
            .live('click', function() {

                var parent = $(this).parents('.khmntal-product').first();

//                $(this)
                    $(this)    .parent()
                        .remove();
                $('.khmntal-product div:odd')
                        .attr('class', 'odd');
                $('.khmntal-product div:even')
                        .attr('class', 'even');
                $('#khmbtal-product div')
                        .addClass("khmn");
                data = $.map(parent.find('input[type=hidden]'), function(element) {
                    return $(element)
                            .attr('value');
                });

                var i = '';
                var arr = '';
                for(i = 0; i < data.length; i++){
                    if(i == 0){
                        arr = arr + data[i];
                    }else{
                        arr = arr + ',,'+ data[i];
                    }

                }
//                console.log(arr); return false;

               parent.next().first().attr('value', arr);
//                parent.find('input[name=\'khmntal_product[]\']').attr('value', data.join());




//                $('input[name=\'khmntal_product[]\']')
//                        .attr('value', data.join());
            });
    $('.khmttal-product div img')
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
    $('.khmbtal-product div img')
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
        $('input[name=numn]').on('blur', function() {
                    var parent = $(this).parents('div.khmntal-product');
                    var div = $(this).parents('.khmn');
                    var pos = $(this).val();
                    if (pos >= 0 && pos <= parent.find("input[name=numn]").length ) {
                            var divkm = parent.find('div.khmn');
                            if ($(this).parents('.khmn') > pos) {
                                var i = 1
                                divkm.each(function () {
                                    if (pos == i) {
                                        if(div.find('strong').text() != $(this).find('strong').text()){
                                            $(this).before(div);
                                        }

                                    }
                                    i++;
                                });
                            }else{
                                var i = 1
                                divkm.each(function () {
                                    if (pos == i) {
                                        $(this).after(div);
                                    }
                                    i++;
                                })
                            }
                            $('input[name=numn]').val('');


                    }
                })
    }
    nummn();

    //-->

    $('.show_panel').on('click', function() {      
         $(this).parent().parent().next().toggle();
    });
    $('.show_all_panel').on('click', function() {    
        $('.show_input').show();
    });
    $('.close_all_panel').on('click', function() {    
        $('.show_input').hide();
    });

</script>
<?php echo $footer; ?>