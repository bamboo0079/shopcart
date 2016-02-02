<?php echo $header; ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/menu_style.css" />
<script type="text/javascript" src="view/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#form').validate();
    });
</script>
<?php
$this->load->model('design/menu');
?>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home_link;?>"> <?php echo $entry_home;?></a> ::
        <a href="<?php echo $category_link;?>"> <?php echo 'Danh mục ảnh';?></a>
    </div>
    <?php if (isset($error_warning) && !empty($error_warning)) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/banner.png" alt="" /><?php echo $entry_img_add_list; ?> </h1>
            <div class="buttons"><a onclick="submit()" class="button save"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td width="100px"><span class="required">*</span> <?php echo $entry_img_name; ?></td>
                        <td>
                            <input data-rule-required="true" data-msg-required="<?php echo $text_error_img_name; ?>" style="width: 50%" type="text" name="img_name[]" value="<?php echo( isset($description['name']) && !empty($description['name']) ? $description['name'] : '');?>" size="100" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="required">*</span> <?php echo $entry_img_link; ?></td>
                        <td>
                            <input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" style="width: 50%" type="text" name="link[]" value="<?php echo( isset($description['link']) && !empty($description['link']) ? $description['link'] : '');?>" size="100" />
                        </td>
                    </tr>
                    <tr class="mn-form">
                        <td></td>
                        <td>
                            <div class="image">
                                <img id="thumb0" alt="" src=" <?php echo(isset($description['img']) && !empty($description['img']) ? $this->model_tool_image->onesize($description['img'],100,100) : '../image/cache/no_image-100x100.jpg')?>"><input  type="hidden" name="image[img0]" value="<?php echo( isset($description['img']) && !empty($description['img']) ? $description['img'] : '');?>" id="image0" /><br /><a onclick="image_upload('image0', 'thumb0')"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb0').attr('src', '../image/cache/no_image-100x100.jpg'); $('#image0').attr('value', '');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a>
                            </div>
                        </td>
                    </tr>
                    <tr >
                        <td><?php echo $entry_img_status; ?></td>
                        <td><input type="radio" name="status[atc0]" value="1"<?php echo (isset($description['status']) && $description['status'] == 1 ? 'checked="checked"' : '');?> <?php echo (!isset($description['status']) ? 'checked="checked"' : '');?> ><?php echo $entry_img_enable;?> <input type="radio" name="status[atc0]" value="0" <?php echo (isset($description['status']) && $description['status'] == 0 ? 'checked="checked"' : '');?>> <?php echo $entry_img_disable;?></td>
                    </tr>
                    <tr class="last-row">
                        <td><?php echo $entry_add_position;?></td>
                        <td>
                            <select name="position[]">
                                <option value="content_top"<?php echo (isset($description['position']) && $description['position'] == 'content_top' ? 'selected="selected"' : '');?>><?php echo $entry_content_top;?></option>
                                <option value="content_bottom"<?php echo (isset($description['position']) && $description['position'] == 'content_bottom' ? 'selected="selected"' : '');?>><?php echo $entry_content_bottom;?></option>
                                <option value="column_left"<?php echo (isset($description['position']) && $description['position'] == 'column_left' ? 'selected="selected"' : '');?>><?php echo $entry_content_left;?></option>
                                <option value="column_right"<?php echo (isset($description['position']) && $description['position'] == 'column_right' ? 'selected="selected"' : '');?>><?php echo $entry_content_right;?></option>
                            </select>
                        </td>
                    </tr>
                    <tr class="last-row">
                        <td><?php echo $entry_add_size;?></td>
                        <td>
                            <?php echo $entry_add_width;?>: <input data-rule-required="true" data-msg-required="<?php echo $text_error_width; ?>" type="text" name="width[]" value="<?php echo( isset($description['width']) && !empty($description['width']) ? $description['width'] : '');?>" style="width: 50px;"> px - <?php echo $entry_add_height;?>: <input data-rule-required="true" data-msg-required="<?php echo $text_error_height; ?>" style="width: 50px" type="text" name="height[]" value="<?php echo( isset($description['height']) && !empty($description['height']) ? $description['height'] : '');?>"> px
                        </td>
                    </tr>
                    <?php
                        if(!isset($description)){
                    ?>

                    <?php }?>
                </table>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    function image_upload(field, thumb) {
        $('#dialog').remove();
        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
        $('#dialog').dialog({
            title: '<?php echo (isset($text_image_manager) ? $text_image_manager : ""); ?>',
            close: function (event, ui) {
                if ($('#' + field).attr('value')) {
                    $.ajax({
                        url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
                        dataType: 'text',
                        success: function(data) {
//                            alert('<img src="' + data + '" alt="" id="' + thumb + '" />');return false;
                            $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');

                        }
                    });
                }
            },
            bgiframe: false,
            width: 960,
            height: 550,
            resizable: false,
            modal: false
        });
    };
    $(function(){
        $('.add-img').on('click',function(){
            var last = $('tr.last-row');
            var i = 0;
            last.each(function(){
                i++;
            });
            var html =  '<tr>';
            html += '<td width="100px"><span class="required">*</span> <?php echo $entry_img_name; ?></td>';
            html += '<td>';
            html += '<input data-rule-required="true" data-msg-required="<?php echo $text_error_img_name; ?>"  style="width: 50%" type="text" name="img_name[]" value="" size="100" />';
            html += '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td width="100px"><span class="required">*</span> <?php echo $entry_img_link; ?></td>';
            html += '<td>';
            html += '<input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" style="width: 50%" type="text" name="link[]" value="" size="100" />';
            html += '</td>';
            html += '</tr>';
            html += '<tr class="mn-form">';
            html += '<td></td>';
            html += '<td>';
            html += '<div class="image">';
            html += '<img id="thumb'+i+'" alt="" src="../image/cache/no_image-100x100.jpg"><img src="<?php echo (isset($no_image) ? $no_image : '') ?>" alt="" id="thumb' + i + '" /><input type="hidden" name="image[img' + i + ']" value="" id="image' + i + '" /><br /><a onclick="image_upload(\'image' + i + '\', \'thumb' + i + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + i + '\').attr(\'src\', \'<?php echo (isset($no_image) ? $no_image : ''); ?>\'); $(\'#image' + i + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a>';
            html += '</div>';
            html += '</td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td><?php echo $entry_img_status; ?>:</td>';
            html += '<td><input type="radio" checked="checked" name="status[atc'+i+']" value="1">Enable <input type="radio" name="status[atc'+i+']" value="0"> Disable</td>';
            html += '</tr>';
            html += '<tr class="last-row">';
            html += '<td><?php echo $entry_add_position;?>:</td>';
            html += '<td>';
            html += '<select name="position[]">';
            html += '<option value="content_top"><?php echo $entry_content_top;?></option>';
            html += '<option value="content_bottom"><?php echo $entry_content_bottom;?></option>';
            html += '<option value="column_left"><?php echo $entry_content_left;?></option>';
            html += '<option value="column_right"><?php echo $entry_content_right;?></option>';
            html += '</select>';
            html += '</td>';
            html += '</tr>';
            html += '<tr class="last-row">';
            html += '<td><?php echo $entry_add_size;?></td>';
            html += '<td>';
            html += '<?php echo $entry_add_width;?>: <input data-rule-required="true" data-msg-required="<?php echo $text_error_width; ?>" type="text" name="width[]" style="width: 50px;"> px - <?php echo $entry_add_height;?>: <input data-rule-required="true" data-msg-required="<?php echo $text_error_height; ?>" style="width: 50px" type="text" name="height[]"> px';
            html += '</td>';
            html += '</tr>';
            last.last().after(html);
        })
    });
    function submit(){
        var class_img = $('.image');
        var i = 0;
        class_img.each(function(){
            i++;
            if($(this).find('input').val() == ''){
                alert('Vui lòng chọn ảnh số '+i); return false;
            }else{
                $('#form').submit();
            }
        });

    }
</script>

