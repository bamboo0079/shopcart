<?php echo $header;   ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/menu_style.css" />
<script type="text/javascript" src="view/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<style type="text/css">
    input{ width:100% }
    .mn-body{ width: 99%;  float: left; display: block; overflow: hidden; border: 1px #cccccc solid;padding-left: 20px; padding-top: 10px; padding-bottom: 20px;}
    .mn-row{ width: 100%; float: left; margin-top: 10px}
    .mn-wr-parent, .mn-wr-child, .mn-wr-gr{ width: 100%; float: left;  }
    .mn-wr-tile, .mn-wr-cl-title{ width: 300px; float: left;}
    .mn-wr-oder{ width: 70px; float: left; margin-left: 15px;}
    .mn-wr-link{ width: 70px; float: left; margin-left: 15px;}
    .mn-view{ width: 200px; float: left; height: 20px; margin-left: 15px;}
    .mn-view span{ line-height: 20px; color: #002D57; cursor: pointer; margin-left: 5px;}
    .mn-wr-link{ width: 270px; float: left; margin-left: 15px;}
    .mn-wr-cl-title{ padding-left: 20px; width: 281px;}
    .mn-wr-child, .mn-wr-gr{ margin-top: 10px;}
    .mn-wr-gr-title{ width: 261px; float:left; padding-left: 40px;}
    .mn-cl-right textarea{ width: 100%; height: 175px }
</style>
<script type="text/javascript">
    $(document).ready(function(){
        $('#form').validate();
    });
</script>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home;?>">Trang chủ</a>
        :: <a href="<?php echo $category_link;?>">Danh mục</a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img alt="" src="view/image/category.png"> <?php echo $cat_detail;?></h1>
            <div class="buttons"><a class="button" onclick="$('#form').submit();"><?php echo $text_add;?></a><a class="button delete-menu" href="<?php echo $link;?>"><?php echo $text_delete;?></a></div>
        </div>
        <div class="content">
            <div class="htabs" id="tabs"><a style="display: inline;" class="cat-menu selected" href="#tab-general"><?php echo $text_menu_avail;?></a><a style="display: inline;" href="#tab-data" class="tag-menu"><?php echo $text_menu_new;?></a></div>
            <form id="form" enctype="multipart/form-data" method="post" action="<?php echo $action; ?>">
                <div style="display: block;" id="tab-general">
                    <div style="display: block;" id="language2">
                        <table  style="border: 0px">
                            <?php if(isset($all_menu) && !empty($all_menu)){ ?>
                            <tr style="border: 0px">
                                <td style="border: 0px">
                                    <div class="tl-top"><?php echo $text_menu_category;?></div>
                                    <div class="scrollbox st-none">
                                        <?php
                                            if(!empty($all_menu)){
                                            foreach($all_menu as $_items){
                                        ?>
                                        <div class="st-ct">
                                            <input type="checkbox" name="menu_id[]" value="<?php echo $_items['id'];?>">
                                            <?php echo $_items['name'];?>
                                        </div>
                                        <?php } } ?>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all;?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_destroy_all;?></a>
                                </td>
                                <td style="border: 0px"><a class="cls" id="sl-prev">&lt;&lt; </a> <a class="cls" id="sl-next"> &gt;&gt;</a></td>
                                <td style="border: 0px">
                                    <div class="tl-top"><?php echo $text_category_choose;?></div>
                                    <div class="scrollbox st-choose">

                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_destroy_all;?></a>
                                </td>
                            </tr>
                            <?php }else{ echo $text_category_none; }?>
                        </table>
                    </div>
                </div>
                <div style="display: none;" id="tab-data">
                    <table class="list">
                        <tbody class="tag">

                        <table class="form">
                            <tbody><tr>
                                <td width="100px"><span class="required" aria-required="true">*</span> <?php echo $entry_name_menu;?></td>
                                <td>
                                    <input data-rule-required="true" data-msg-required="Vui lòng nhập tên menu" style="width: 50%" type="text" name="menu_name" value="" size="100" aria-required="true">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="required" aria-required="true">*</span> <?php echo $entry_header_title;?></td>
                                <td>
                                    <input data-rule-required="true" data-msg-required="Vui lòng nhập tiêu đề chính" style="width: 50%" type="text" name="title_menu" value="" size="100" aria-required="true">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="required" aria-required="true">*</span> <?php echo $entry_status;?></td>
                                <td>
                                    <select name="status" data-rule-required="true" data-msg-required="Vui lòng chọn trạng thái" aria-required="true">
                                        <option value="1"><?php echo $text_enabled;?></option>
                                        <option value="0"><?php echo $text_disabled;?></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="required" aria-required="true">*</span> <?php echo 'Loại menu';?></td>
                                <td><select class="cat_menu" name="cat_menu" data-rule-required="true" data-msg-required="Chọn loại menu" aria-required="true">
                                        <option value="1"><?php echo $text_category_menu_one;?></option>
                                        <option value="2"><?php echo $text_category_menu_two;?></option>
                                        <option value="3"><?php echo $text_category_menu_three;?></option>
                                        <option value="4"><?php echo $text_category_menu_img;?></option>
                                        <option value="5"><?php echo 'Tin tức';?></option>
                                    </select>
                                </td>
                            </tr>

                            <tr class="display-menu">
                                <td><span class="required" aria-required="true">*</span> <?php echo $text_category_display;?></td>
                                <td><select class="cat_menu" name="display_menu" data-rule-required="true" data-msg-required="Chọn loại menu" aria-required="true"><option value="1"><?php echo $static_menu;?></option></select>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="required" aria-required="true">*</span> <?php echo $entry_sort_order;?></td>
                                <td>
                                    <input data-rule-required="true" data-msg-required="Vui lòng nhập thử tự" style="width: 50px" type="text" name="oder" value="" aria-required="true">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="required" aria-required="true">*</span> <?php echo $text_category_scroll;?></td>
                                <td>
                                    <input style="width: 2%; padding: 0px; margin: 0px;" type="radio" name="scroll" value="0" checked="checked"><label><?php echo $text_disabled;?></label><input style="width: 2%" type="radio" name="scroll" value="1"><label><?php echo $text_enabled;?></label>
                                </td>
                            </tr>
                            <tr class="mn-form">
                                <td></td>
                                <td>
                                    <div class="mn-body">
                                        <div class="mn-wr-parent">
                                            <div class="mn-wr-parent">
                                                <div class="mn-wr-tile">
                                                    <input type="text" name="title_parent_1" placeholder="<?php echo $text_error_title;?> " data-msg-required="<?php echo $text_error_title;?>" data-rule-required="true" aria-required="true">
                                                </div>
                                                <div class="mn-wr-oder">
                                                    <input type="text" name="parent_order_1" placeholder="<?php echo 'Nhập thứ tự';?> " data-msg-required="<?php echo $text_error_oder;?>" data-rule-required="true" aria-required="true">
                                                </div>
                                                <div class="mn-wr-oder">
                                                    <input type="text" name="parent_icon_1" placeholder="Nhập icon " aria-required="true">
                                                </div>
                                                <div class="mn-wr-link">
                                                    <input type="text" name="parent_link_1" placeholder="Nhập link " data-msg-required="Vui lòng nhập link" data-rule-required="true" aria-required="true">
                                                </div>
                                                <div class="mn-view">
                                                    <span class="pr-add">[Thêm]</span>
                                                    <span class="pr-delete">[Xóa]</span>
                                                    <span class="add-child-pr" key-parent="1" style="display: none;">[Thêm Mục Con]</span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <style type="text/css">
                                    .scrollbox div input{ margin: 1%; width: 2%;}
                                    .tour-child{ margin-left: 44px; width: 93%; font-weight: normal;}
                                </style>

                            </tr></tbody></table>

                        </tbody>
                    </table>
                </div>
                <div style="display:none" id="tab-design">
                    test<table class="list">
                        <tbody><tr>
                            <td>test</td>
                        </tr>
                        </tbody></table>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#tabs a').tabs();
    $('#languages a').tabs();
    $(function(){
        $('body').delegate('#sl-next','click',function(){
            var  input = $('.st-none').find('div').find('input');
            input.each(function(){
                if($(this).is(':checked')){
                    var text = $(this).parent().text();
                    var id = $(this).val();
                    var html = '<div class="st-ct">';
                    html += '<input type="checkbox" value="'+id+'" name="menu_id_choose[]">';
                    html += '<input type="hidden" value="'+id+'" name="menu_id_choose[]">'+text+'';
                    html += '</div>';

                    var div_af = $('.st-choose').find('div.st-ct').last();
                    if(div_af.length > 0){
                        div_af.after(html);
                    }else{
                        $('.st-choose').html(html);
                    }
                    $(this).parent().first().remove();
                    var div = $('.st-choose').find('div');
                }

            })
        });
        $('body').delegate('#sl-prev','click',function(){
            var  input = $('.st-choose').find('div').find('input');
            input.each(function(){
                if($(this).is(':checked')){
                    var text = $(this).parent().text();
                    var id = $(this).val();
                    var html = '<div class="st-ct">';
                    html += '<input type="checkbox" value="'+id+'" name="menu_id[]">'+text+'';
                    html += '</div>';
                    var div_af = $('.st-none').find('div.st-ct').last();
                    if(div_af.length > 0){
                        div_af.after(html);
                    }else{
                        $('.st-none').html(html);
                    }
                    $(this).parent().first().remove();
                }

            })
        })
    })
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('select[name=cat_menu]').on('change',function(){
            var id = $(this).val();
            if(parseInt(id) == 1){
                $('.mn-body').find('div:not([class])').remove();
                $('.add-child-pr').hide();
                $('tr.display-menu').show();
                getMenu(id);
            }else{
                if(parseInt(id) == 2){
                    $('.add-child-pr').show();
                    $('.add-child-cli').hide();
                    $('.mn-wr-child').next().remove();
                    $('tr.display-menu').show();
                    getMenu(id);
                }else{
                    if(parseInt(id)==3){
                        $('.add-child-cli').show();
                        $('tr.display-menu').show();
                        getMenu(id);
                    }else{
                        if(parseInt(id)==4){
                            $('tr.display-menu').hide();
                            getImageMenu();
                        }else{
                            if(parseInt(id)==5){
                                getNewsMenu();
                            }
                        }
                    }
                }
            }
        });
        <?php if(!isset($menu_info) || empty($menu_info)){ ?>
            $('select[name=cat_menu]').trigger('change');
        <?php } ?>
        $('body').delegate('.pr-add','click',function(){
            var title = $(".mn-wr-parent");
            var i = 1;
            title.each(function(){
                i++;
            });
            var cat_menu = $('select[name=cat_menu]').val();
            if(parseInt(cat_menu) == 1){
                var html = '<div class="mn-row">';
                html +=  '<div class="mn-wr-parent">';
                html +=  '<div class="mn-wr-tile"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_parent_'+ i +'"></div>';
                html +=  '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="parent_order_'+ i +'"></div>';
                html +=  '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="parent_icon_'+ i + '"></div>';
                html +=  '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="parent_link_'+ i +'"></div>';
                html +=  '<div class="mn-view"> <span key-parent = "'+ i +'" class="pr-add">[Thêm]</span> <span class="pr-delete">[Xóa]</span> <span style="display: none" key-parent="'+ i +'" class="add-child-pr">[Thêm Mục Con]</span></div>';
                html +=  '</div>';
                html += '</div>';
            }else{
                var html = '<div class="mn-row">';
                html +=  '<div class="mn-wr-parent">';
                html +=  '<div class="mn-wr-tile"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_parent_'+ i +'"></div>';
                html +=  '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="parent_order_'+ i +'"></div>';
                html +=  '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="parent_icon_'+ i + '"></div>';
                html +=  '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="parent_link_'+ i +'"></div>';
                html +=  '<div class="mn-view"> <span key-parent = "'+ i +'" class="pr-add">[Thêm]</span> <span class="pr-delete">[Xóa]</span> <span key-parent="'+ i +'" class="add-child-pr">[Thêm Mục Con]</span> </div>';
                html +=  '</div>';
                html += '</div>';
            }
            var parent = $(this).parent().parent().parent();

            parent.after(html);

        });
        $('body').delegate('.pr-delete','click',function(){
            var parent = $(this).parent().parent().parent();
            parent.remove();
            parent.next().remove();
        });
        $('body').delegate('.pr-add-child','click',function(){
            var key =  $(this).attr('key-parent');
            var parent = $(this).parent().parent();
            var div = parent.next();

            var wr = parent.parent().find('div.mn-wr-child');
            console.log(wr);
            var i = 1;
            wr.each(function(){
                i++;
            });
            var cat_menu = $('select[name=cat_menu]').val();
            if(parseInt(cat_menu) == 2){
                $('.add-child-cli').hide();
                var html =  '<div class="mn-wr-child">';
                html += '<div class="mn-wr-cl-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="oder_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input placeholder="Nhập icon " name="icon_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-view"> <span key-parent = "'+ key +'" class="pr-add-child">[Thêm]</span> <span class="pr-delete">[Xóa]</span><span style="display: none" key-parent = "'+ key +'" cat = "'+i+'" class="add-child-cli">[Thêm Mục Con]</span> </div>';
                html += '</div>';
                html += '<div></div>';
            }else{
                var html =  '<div class="mn-wr-child">';
                html += '<div class="mn-wr-cl-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="oder_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-view"> <span key-parent = "'+ key +'" class="pr-add-child">[Thêm]</span> <span class="pr-delete">[Xóa]</span> <span key-parent = "'+ key +'" cat = "'+i+'" class="add-child-cli">[Thêm Mục Con]</span></div>';
                html += '</div>';
                html += '<div></div>';
            }

            div.after(html);
        });
        $('body').delegate('.add-child-pr','click',function(){
            var key = $(this).attr('key-parent');
            var parent = $(this).parent().parent();
            var div = parent.next();
            var row_content = $(this).parent().parent().nextAll();
            var i = 1;
            row_content.each(function(){
                i++;
            });
            var cat_menu = $('select[name=cat_menu]').val();
            if(parseInt(cat_menu)==2){
                var html = '<div>';
                html +=  '<div class="mn-wr-child">';
                html += '<div class="mn-wr-cl-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_lv_'+ i +'_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>"  type="text" placeholder="Nhập thứ tự " name="oder_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_lv_' +i+ '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_lv_'+ i +'_parent_'+ key +'"></div>';
                html += '<div class="mn-view"> <span key-parent = "'+ key +'" class="pr-add-child">[Thêm]</span> <span class="pr-remove-child">[Xóa]</span><span style="display: none" key-parent = "' + key + '" cat = "'+ i +'" class="add-child-cli">[Thêm Mục Con]</span></div>';
                html += '</div>';
                html += '<div></div>';
                html += '</div>';
            }else{
                $('.add-child-cli').show();
                var html = '<div>';
                html +=  '<div class="mn-wr-child">';
                html += '<div class="mn-wr-cl-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_lv_'+ i +'_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>"  type="text" placeholder="Nhập thứ tự " name="oder_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_lv_' +i+ '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_lv_'+ i +'_parent_'+ key +'"></div>';
                html += '<div class="mn-view"> <span key-parent = "'+ key +'" class="pr-add-child">[Thêm]</span> <span class="pr-remove-child">[Xóa]</span> <span key-parent = "' + key + '" cat = "'+ i +'" class="add-child-cli">[Thêm Mục Con]</span></div>';
                html += '</div>';
                html += '<div></div>';
                html += '</div>';
            }

            parent.after(html);
        });
        $('body').delegate('.add-child-cli','click',function(){
            var key = $(this).attr('key-parent');
            var cat = $(this).attr('cat');
            var parent = $(this).parent().parent();
            var div = parent.next();
            var value = div.find('div.mn-wr-gr');
            var i = 1;
            value.each(function(){
                i++;
            });
            var html =  '<div class="mn-wr-gr">';
            html += '<div class="mn-wr-gr-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề "  name="title_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự "  name="oder_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon "  name="icon_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link "  name="link_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-view"> <span key-parent = "'+key+'" cat = "'+cat+'" class="pr-add-sl">[Thêm]</span> <span class="pr-delete-slt">[Xóa]</div>';
            div.append(html);
        });
        $('body').delegate('.pr-add-sl','click',function(){
            var key = $(this).attr('key-parent');
            var cat = $(this).attr('cat');
            var parent = $(this).parent().parent();
            var div = parent.parent().find('div.mn-wr-gr');
            var i = 1;
            div.each(function(){
                i++;
            });

            var html = '<div class="mn-wr-gr">';
            html += '<div class="mn-wr-gr-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="oder_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_root_lv_'+cat+'_parent_'+key+'_row_'+i+'"></div>';
            html += '<div class="mn-view"> <span key-parent = "'+ key +'" cat = "'+ cat +'" class="pr-add-sl">[Thêm]</span> <span class="pr-delete">[Xóa]</div>';
            html += '</div>';
            parent.after(html);
        });
        $('body').delegate('.pr-delete-slt','click',function(){
            var parent =  $(this).parent().parent().first();
            parent.remove();
        });
        $('body').delegate('.pr-remove-child','click',function(){
            var parent = $(this).parent().parent().next().remove();
            $(this).parent().parent().remove();
        })
        $('body').delegate('.choose_file','click',function(){
            var img = $(this).attr('image');
            var thub = $(this).attr('thumb');
            image_upload(img,thub);
        });
        $('body').delegate('.delete_file','click',function(){
            var img = $(this).attr('image');
            var thub = $(this).attr('thumb');
        });
    });
    function getImageMenu(){
        var tbody = $('table#images').find('tbody');
        var i = 0;
        tbody.each(function(){
            i++;
        });
        var html = '<table style="width: 98.5%" class="list" id="images">';
        html += '<thead>';
        html += '<tr>';
        html += '<td class="left">Tiêu đề:</td>';
        html += '<td class="left">Link</td>';
        html += '<td width="150px" class="left">Hình ảnh:</td>';
        html += '<td width="100px" class="left">Thứ tự</td>';
        html += '<td></td>';
        html += '</tr>';
        html += '</thead>';
        html += '<tbody id="image-row0">'
        html += '<tr>';
        html += '<td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" style="width: 220px" type="text" name="menu_image['+i+'][img]"></td>';
        html += '<td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" style="width: 220px" type="text" name="menu_image[' + i + '][link]"></td>';
        html += '<td class="left"><div class="image"><img id="thumb'+i+'" alt="" src="../image/cache/no_image-100x100.jpg"><img src="<?php echo (isset($no_image) ? $no_image : '') ?>" alt="" id="thumb' + i + '" /><input type="hidden" name="menu_image[' + i + '][image]" value="" id="image' + i + '" /><br /><a onclick="image_upload(\'image' + i + '\', \'thumb' + i + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + i + '\').attr(\'src\', \'<?php echo (isset($no_image) ? $no_image : ''); ?>\'); $(\'#image' + i + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a></div></td>';
        html += '<td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" style="width: 70px" type="text" name="menu_image[' + i + '][oder]" value="0"></td>';
        html += '<td><a onclick="$(\'#image-row' + i  + '\').remove();" class="button">Xóa</a></td>';
        html += '</tr>';
        html += '</tbody>';
        html += '<tfoot>';
        html += '</tfoot>';
        html += '</table>';
        $('.mn-body').html(html);
    }
    function getMenu(id){
        if(parseInt(id)==1){
            var html = '<div class="mn-wr-parent">';
            html += '<div class="mn-wr-parent">';
            html += '<div class="mn-wr-tile"><input type="text" name="title_parent_1" placeholder="Nhập tiêu đề " data-msg-required="Vui lòng nhập tiêu đề" data-rule-required="true" aria-required="true"></div>';
            html += '<div class="mn-wr-oder"><input type="text" name="parent_order_1" placeholder="Nhập thứ tự " data-msg-required="Vui lòng nhập thứ tự" data-rule-required="true" aria-required="true"></div>';
            html += '<div class="mn-wr-oder"><input type="text" name="parent_icon_1" placeholder="Nhập icon " aria-required="true"></div>';
            html += '<div class="mn-wr-link"><input type="text" name="parent_link_1" placeholder="Nhập link " data-msg-required="Vui lòng nhập link" data-rule-required="true" aria-required="true"></div>';
            html += '<div class="mn-view"> <span class="pr-add">[Thêm]</span> <span class="pr-delete">[Xóa]</span> <span class="add-child-pr" key-parent="1" style="display: none;">[Thêm Mục Con]</span></div>';
            html += '</div>';
            html += '</div>';
            $('.mn-body').html(html);
            $('select[name=display_menu]').html('<option value="1"><?php echo $static_menu; ?></option>');
        }else{
            if(parseInt(id)==2 || parseInt(id)==3){
                var html = '<div class="mn-wr-parent">';
                html += '<div class="mn-wr-parent">';
                html += '<div class="mn-wr-tile"><input type="text" name="title_parent_1" placeholder="Nhập tiêu đề " data-msg-required="Vui lòng nhập tiêu đề" data-rule-required="true" aria-required="true"></div>';
                html += '<div class="mn-wr-oder"><input type="text" name="parent_order_1" placeholder="Nhập thứ tự " data-msg-required="Vui lòng nhập thứ tự" data-rule-required="true" aria-required="true"></div>';
                html += '<div class="mn-wr-oder"><input type="text" name="parent_icon_1" placeholder="Nhập icon " aria-required="true"></div>';
                html += '<div class="mn-wr-link"><input type="text" name="parent_link_1" placeholder="Nhập link " data-msg-required="Vui lòng nhập link" data-rule-required="true" aria-required="true"></div>';
                html += '<div class="mn-view"> <span class="pr-add">[Thêm]</span> <span class="pr-delete">[Xóa]</span> <span class="add-child-pr" key-parent="1">[Thêm Mục Con]</span></div>';
                html += '</div>';
                html += '</div>';
                $('.mn-body').html(html);
            }
            if(parseInt(id)==2){
                $('select[name=display_menu]').html('<option value="1"><?php echo $static_menu; ?></option><option value="2"><?php echo $dropdown_menu; ?></option>');
            }else{
                if(parseInt(id)==3){
                    $('select[name=display_menu]').html('<option value="1"><?php echo $static_menu; ?></option><option value="2"><?php echo $dropdown_menu; ?></option><option value="3"><?php echo $mega_menu; ?></option>');
                }
            }
        }
    }
    function addImage(){
        var add =  $('.add_menu').parent().parent().parent();
        var tbody = $('table#images').find('tbody');
        var i = 0;
        tbody.each(function(){
            i++;
        });
        var html = '<tbody id="image-row'+i+'">';
        html += '<tr>';
        html += '<td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" style="width: 220px" type="text" name="menu_image[' + i + '][img]"></td>';
        html += '<td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" style="width: 220px" type="text" name="menu_image[' + i + '][link]"></td>';
        html += '<td class="left"><div class="image"><img id="thumb'+i+'" alt="" src="../image/cache/no_image-100x100.jpg"><input type="hidden" name="menu_image[' + i + '][image]" value="" id="image' + i + '" /><br /><a onclick="image_upload(\'image' + i + '\', \'thumb' + i + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + i + '\').attr(\'src\', \'<?php echo (isset($no_image) ? $no_image : ''); ?>\'); $(\'#image' + i + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a></div></td>';
        html += '<td class="left"><input type="text" name="menu_image[' + i + '][oder]" value="0" /></td>';
        html += '<td><a onclick="$(\'#image-row' + i  + '\').remove();" class="button">Xóa</a></td>';
        html += '</tr>';
        html += '</tbody>';

        add.before(html);
    }
    function image_upload(field, thumb) {

        $('#dialog').remove();

        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $this->session->data['token']; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

        $('#dialog').dialog({
            title: '<?php echo (isset($text_image_manager) ? $text_image_manager : ""); ?>',
            close: function (event, ui) {
                if ($('#' + field).attr('value')) {
                    $.ajax({
                        url: 'index.php?route=common/filemanager/image&token=<?php echo $this->session->data['token']; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
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
        $('.get-all').on('click',function(){
            if($(this).prop('checked')) {
                $(this).parent().parent().first().children().find('input').attr('checked','checked');
            }else{
                $(this).parent().parent().first().children().find('input').removeAttr('checked');
            }
        });
    });
    function getNewsMenu(){
    <?php $token = $this->session->data['token'];?>
        $('.display-menu').hide();
        var html = '<div class="mn-wr-parent class-boder sl-width">';
        html += '<div class="mn-cl-left">';
        html += '<div class="image">';
        html += '<img id="thumb0" alt="" src="../image/cache/no_image-100x100.jpg"><input type="hidden" name="image[img0]" value="" id="image0" /><br /><a onclick="image_upload(\'image' + 0 + '\', \'thumb' + 0 + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + 0 + '\').attr(\'src\', \'../image/cache/no_image-100x100.jpg\'); $(\'#image' + 0 + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a>';
        html += '</div>';
        html += '<div class="img-link">';
        html += '<input type="text" name="link[]" placeholder="Link hình ảnh">';
        html += '</div>';
        html += '</div>';
        html += '<div class="mn-cl-right">';
        html += '<textarea name="content[]" class="editor"  id="editor"></textarea>';
        html += '</div>';
        html += '</div>';
        html += '<div class="mn-wr-parent sl-width">';
        html += '<div class="mn-bottom">';
        html += '<a class="button add-news">Thêm Tin Tức</a>';
        html += '</div>';
        html += '</div>';

        $('.mn-body').html(html);


    }
    $(function(){
        $('body').delegate('.add-news','click',function(){
            <?php $token = $this->session->data['token'];?>
            var get_class = $('.mn-body').find('.class-boder');
            var count = get_class.length;
            $('.display-menu').hide();
            var html = '<div class="mn-wr-parent class-boder sl-width">';
            html += '<div class="mn-cl-left">';
            html += '<div class="image">';
            html += '<img id="thumb'+count+'" alt="" src="../image/cache/no_image-100x100.jpg"><input type="hidden" name="image[img'+count+']" value="" id="image' + count + '" /><br /><a onclick="image_upload(\'image' + count + '\', \'thumb' + count + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + count + '\').attr(\'src\', \'../image/cache/no_image-100x100.jpg\'); $(\'#image' + count + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a>';
            html += '</div>';
            html += '<div class="img-link">';
            html += '<input type="text" name="link[]" placeholder="Link hình ảnh">';
            html += '</div>';
            html += '</div>';
            html += '<div class="mn-cl-right">';
            html += '<textarea name="content[]" class="editor"  id="editor'+count+'"></textarea>';
            html += '</div>';
            html += '</div>';

            $('.class-boder').last().after(html);
            $('textarea.editor'+count+'').attr('value','');

        });
    });
</script>
<?php echo $footer;?>