<?php echo $header;   ?>
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
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/banner.png" alt="" /> <?php echo $cat_detail; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button save"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td width="100px"><span class="required">*</span> <?php echo $entry_name_menu; ?></td>
                        <td>
                            <input data-rule-required="true" data-msg-required="<?php echo $text_error_menu_name; ?>" style="width: 50%" type="text" name="menu_name" value="<?php echo(isset($menu_info) && !empty($menu_info['name']) ? $menu_info['name'] : ''); ?>" size="100" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_header_title; ?></td>
                        <td>
                            <input data-rule-required="true" data-msg-required="<?php echo $text_error_menu_main_title; ?>" style="width: 50%" type="text" name="title_menu" value="<?php echo(isset($menu_info) && !empty($menu_info['title']) ? $menu_info['title'] : ''); ?>" size="100" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_status; ?></td>
                        <td>
                            <select name="status" data-rule-required="true" data-msg-required="<?php echo $text_error_menu_status; ?>" >
                                <option value="1"<?php echo(isset($menu_info) && ($menu_info['status'] == 1) ? 'selected="selected"' : ''); ?>><?php echo $text_enabled; ?></option>
                                <option value="0"<?php echo(isset($menu_info) && ($menu_info['status'] == 0) ? 'selected="selected"' : ''); ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $text_category_menu; ?></td>
                        <td><select class="cat_menu" name="cat_menu" data-rule-required="true" data-msg-required="<?php echo $text_error_menu_cat; ?>">
                                <?php
                                if(isset($menu_info['type']) && $menu_info['type'] == 5){ ?>
                                <option value="1"<?php echo(isset($menu_info) && ($menu_info['type'] == 1) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_one; ?></option>
                                <option value="2"<?php echo(isset($menu_info) && ($menu_info['type'] == 2) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_two; ?></option>
                                <option value="3"<?php echo(isset($menu_info) && ($menu_info['type'] == 3) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_three; ?></option>
                                <option value="4"<?php echo(isset($menu_info) && ($menu_info['type'] == 4) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_img; ?></option>
                                <option value="5"<?php echo(isset($menu_info) && ($menu_info['type'] == 5) ? 'selected="selected"' : ''); ?>><?php echo 'Tin tức'; ?></option>
                                <?php }else{
                                    if(isset($menu_info['type']) && $menu_info['type']==4){
                                        ?>
                                <option value="4"<?php echo(isset($menu_info) && ($menu_info['type'] == 4) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_img; ?></option>
                                <?php }elseif(isset($menu_info['type']) && $menu_info['type']!=4){ ?>
                                <option value="1"<?php echo(isset($menu_info) && ($menu_info['type'] == 1) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_one; ?></option>
                                <option value="2"<?php echo(isset($menu_info) && ($menu_info['type'] == 2) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_two; ?></option>
                                <option value="3"<?php echo(isset($menu_info) && ($menu_info['type'] == 3) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_three; ?></option>
                                <?php }else{ ?>
                                <option value="1"<?php echo(isset($menu_info) && ($menu_info['type'] == 1) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_one; ?></option>
                                <option value="2"<?php echo(isset($menu_info) && ($menu_info['type'] == 2) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_two; ?></option>
                                <option value="3"<?php echo(isset($menu_info) && ($menu_info['type'] == 3) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_three; ?></option>
                                <option value="4"<?php echo(isset($menu_info) && ($menu_info['type'] == 4) ? 'selected="selected"' : ''); ?>><?php echo $text_category_menu_img; ?></option>
                                <?php }?>
                                <?php }?>
                            </select>
                        </td>
                    </tr>
                    <?php if(isset($menu_info['type']) && $menu_info['type'] != 5){ ?>
                    <?php if( isset($menu_info['type']) && $menu_info['type'] != 4 && $menu_info['type'] != 1){ ?>
                    <tr class="display-menu">
                        <td><span class="required">*</span> <?php echo $text_category_display; ?></td>
                        <td><select class="cat_menu" name="display_menu" data-rule-required="true" data-msg-required="<?php echo $text_error_menu_cat; ?>">
                                <option value="1"<?php echo(isset($menu_info) && ($menu_info['display'] == 1) ? 'selected="selected"' : ''); ?>><?php echo $static_menu; ?></option>
                                <option value="2"<?php echo(isset($menu_info) && ($menu_info['display'] == 2) ? 'selected="selected"' : ''); ?>><?php echo $dropdown_menu; ?></option>
                                <option value="3"<?php echo(isset($menu_info) && ($menu_info['display'] == 3) ? 'selected="selected"' : ''); ?>><?php echo $mega_menu; ?></option>
                            </select>
                        </td>
                    </tr>
                    <?php } ?>
                    <?php if( isset($menu_info['type']) && $menu_info['type'] != 4 && $menu_info['type'] == 1){ ?>
                    <tr class="display-menu">
                        <td><span class="required">*</span> <?php echo $text_category_display; ?></td>
                        <td><select class="cat_menu" name="display_menu" data-rule-required="true" data-msg-required="<?php echo $text_error_menu_cat; ?>">
                                <option value="1"<?php echo(isset($menu_info) && ($menu_info['display'] == 1) ? 'selected="selected"' : ''); ?>><?php echo $static_menu; ?></option>
                            </select>
                        </td>
                    </tr>
                    <?php } ?>
                    <?php }?>

                    <?php if( !isset($menu_info)){ ?>
                    <tr class="display-menu">
                        <td><span class="required">*</span> <?php echo $text_category_display; ?></td>
                        <td><select class="cat_menu" name="display_menu" data-rule-required="true" data-msg-required="<?php echo $text_error_menu_cat; ?>">
                                <option value="1"><?php echo $static_menu; ?></option>
                                <option value="2"><?php echo $static_menu; ?></option>
                                <option value="3"><?php echo $static_menu; ?></option>
                                <option value="4"><?php echo $static_menu; ?></option>
                            </select>
                        </td>
                    </tr>
                    <?php } ?>
                    <tr>
                        <td><span class="required">*</span> <?php echo $text_category_order; ?></td>
                        <td>
                            <input data-rule-required="true" data-msg-required="<?php echo $text_error_menu_oder; ?>" style="width: 50px" type="text" name="oder" value="<?php echo(isset($menu_info) && !empty($menu_info['oder']) ? $menu_info['oder'] : ''); ?>">
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $text_category_scroll; ?></td>
                        <td>
                            <input style="width: 2%; padding: 0px; margin: 0px;" type="radio" name="scroll" value="0"<?php echo(isset($menu_info['scroll']) && $menu_info['scroll'] == 0 ? 'checked="checked"' : (!isset($menu_info['scroll'])) ? 'checked="checked"' : ''); ?>><label>Disable</label><input style="width: 2%" type="radio" name="scroll" value="1" <?php echo(isset($menu_info) && $menu_info['scroll'] == 1 ? 'checked="checked"' : ''); ?>><label>Enable</label>
                        </td>
                    </tr>
                    <tr class="mn-form">
                        <td></td>
                        <td>
                            <?php
                                if(isset($menu_info) && $menu_info['type'] == 5){ ?>
                            <?php
                                    $query = $this->db->query("SELECT * FROM menu_news WHERE menu_id = '".$menu_info['id']."'");
                            $result = $query->rows;
                            if(!empty($result)){
                            $i = 0;
                            foreach($result as $_items){
                            ?>

                            <div class="mn-wr-parent class-boder sl-width">
                                <div class="mn-cl-left">
                                    <div class="image">
                                        <img id="thumb<?php echo $i;?>" alt="" src="<?php echo(isset($_items['img']) && !empty($_items['img']) ? $this->model_tool_image->onesize($_items['img'],100,100) : $this->model_tool_image->onesize('cache/no_image-100x100.jpg',100,100))?>"><input type="hidden" name="image[img<?php echo $i;?>]" value="<?php echo $_items['img']; ?>" id="image<?php echo $i;?>" /><br /><a onclick="image_upload(\'image' + <?php echo $i;?> + '\', \'thumb' + <?php echo $i;?> + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + <?php echo $i;?> + '\').attr(\'src\', \'../image/cache/no_image-100x100.jpg\'); $(\'#image' + <?php echo $i;?> + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a>
                                    </div>
                                    <div class="img-link">
                                        <input type="text" name="link[]" value="<?php echo $_items['link'];?>" placeholder="Link hình ảnh">
                                    </div>
                                </div>
                                <div class="mn-cl-right">
                                    <textarea style="width: 100%; height: 148px" name="content[]" class="editor<?php echo $i;?>"  id="editor<?php echo $i;?>"><?php echo $_items['content'];?></textarea>
                                </div>
                            </div>

                            <?php $i++;  } } ?>
                            <div class="mn-wr-parent sl-width">
                                <div class="mn-bottom">
                                    <a class="button add-news">Thêm Tin Tức</a>
                                </div>
                            </div>
        </div>
        <?php }else{ ?>
        <?php
                            if(isset($menu_info) && $menu_info['type'] != 4){ ?>
        <div class="mn-body">
            <?php
                                    if(isset($menu_info)){
                                        $query = $this->db->query("SELECT * FROM menu_level_1 WHERE menu_id = '".$menu_info['id']."' ORDER BY oder");
            $level_1 = $query->rows;
            if(!empty($level_1)){
            $i = 1;
            foreach($level_1 as $_items_lv_1){ ?>
            <div class="mn-row">
                <div class="mn-wr-parent">
                    <div class="mn-wr-tile"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_parent_<?php echo $i;?>"  value="<?php echo(!empty($_items_lv_1['title']) ? $_items_lv_1['title']: '');?>"></div>
                    <div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="parent_order_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_1['oder']) ? $_items_lv_1['oder']  : '');?>"></div>
                    <div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="parent_icon_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_1['icon']) ? $_items_lv_1['icon']  : '');?>"></div>
                    <div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="parent_link_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_1['link']) ? $_items_lv_1['link']  : '');?>"></div>
                    <div class="mn-view"> <span class="pr-add">[Thêm]</span> <span class="pr-delete">[Xóa]</span>
                        <?php if($menu_info['type'] != 1){ ?>
                        <span key-parent="<?php echo $i;?>" class="add-child-pr">[Thêm Mục Con]</span>
                        <?php }?>
                    </div>
                </div>
                <?php
                                                    $sql = $this->db->query("SELECT * FROM menu_level_2 WHERE id_level_1 = '".$_items_lv_1['id']."' ORDER BY oder");
                $level_2 = $sql->rows;
                if(!empty($level_2)){
                $j = 1;
                foreach($level_2 as $_items_lv_2){ ?>
                <div class="mn-wr-child">
                    <div class="mn-wr-cl-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_lv_<?php echo $j;?>_parent_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_2['title']) ? $_items_lv_2['title']: '');?>"></div>
                    <div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="oder_child_lv_<?php echo $j;?>_parent_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_2['oder']) ? $_items_lv_2['oder']: '');?>"></div>
                    <div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_lv_<?php echo $j;?>_parent_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_2['icon']) ? $_items_lv_2['icon']: '');?>"></div>
                    <div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_lv_<?php echo $j;?>_parent_<?php echo $i;?>" value="<?php echo(!empty($_items_lv_2['link']) ? $_items_lv_2['link']: '');?>"></div>
                    <div class="mn-view"> <span key-parent="<?php echo $i;?>" cat = "<?php echo $j;?>" class="pr-add-child">[Thêm]</span> <span class="pr-remove-child">[Xóa]</span>
                        <?php
                                                                    if( $menu_info['type'] != 1 &&  $menu_info['type'] != 2){
                                                                        ?>
                        <span key-parent="<?php echo $i;?>" cat = "<?php echo $j;?>" class="add-child-cli">[Thêm Mục Con]</span>
                        <?php } ?>
                    </div>
                </div>
                <div>
                    <?php
                                                            if(!empty($_items_lv_2['id'])){
                                                                $sql_3 = $this->db->query("SELECT * FROM menu_level_3 WHERE id_level_2 = '".$_items_lv_2['id']."' ORDER BY oder ");
                    $level_3 = $sql_3->rows;
                    if(!empty($level_3)){
                    $v = 1;
                    foreach($level_3 as $_items_level_3){ ?>
                    <div class="mn-wr-gr">
                        <div class="mn-wr-gr-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_root_lv_<?php echo $j;?>_parent_<?php echo $i;?>_row_<?php echo $v;?>" value="<?php echo(!empty($_items_level_3['title']) ? $_items_level_3['title']: '');?>"></div>
                        <div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="oder_child_root_lv_<?php echo $j;?>_parent_<?php echo $i;?>_row_<?php echo $v;?>" value="<?php echo(!empty($_items_level_3['oder']) ? $_items_level_3['oder']: '');?>"></div>
                        <div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_root_lv_<?php echo $j;?>_parent_<?php echo $i;?>_row_<?php echo $v;?>" value="<?php echo(!empty($_items_level_3['icon']) ? $_items_level_3['icon']: '');?>"></div>
                        <div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_root_lv_<?php echo $j;?>_parent_<?php echo $i;?>_row_<?php echo $v;?>" value="<?php echo(!empty($_items_level_3['link']) ? $_items_level_3['link']: '');?>"></div>
                        <div class="mn-view"> <span key-parent = "<?php echo $i;?>" cat = "<?php echo $j;?>" class="pr-add-sl">[Thêm]</span> <span class="pr-delete">[Xóa]</div>
                    </div>
                    <?php $v++; } } ?>
                </div>
                <?php $j++; } } } ?>
            </div>
            <?php $i ++; } } } ?>
        </div>
        <?php } elseif(isset($menu_info) && $menu_info['type'] == 4){ ?>
        <div class="mn-body">
            <table style="width: 98.5%" class="list" id="images">
                <thead>
                <tr>
                    <td class="left">Tiêu đề:</td>
                    <td class="left">Link</td>
                    <td width="150px" class="left">Hình ảnh:</td>
                    <td width="100px" class="left">Thứ tự</td>
                    <td></td>
                </tr>
                </thead>
                <?php
                                    $query = $this->db->query("SELECT * FROM img_menu WHERE  menu_id = '".$menu_info['id']."'");
                $menu = $query->rows;
                if(!empty($menu)){
                $i = 1;
                foreach($menu as $img_menu){
                ?>
                <tbody id="image-row<?php echo $i ?>">
                <tr>
                    <td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" style="width: 220px" type="text" name="menu_image[<?php echo $i;?>][img]" value="<?php echo(isset($img_menu) && !empty($img_menu['title']) ? $img_menu['title'] : '')?>"></td>
                    <td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" style="width: 220px" type="text" name="menu_image[<?php echo $i;?>][link]" value="<?php echo(isset($img_menu) && !empty($img_menu['link']) ? $img_menu['link'] : '')?>"></td>
                    <td class="left">
                        <div class="image">
                            <img id="thumb<?php echo $i;?>" alt="" src="<?php echo(isset($img_menu) && !empty($img_menu['img']) ? $this->model_tool_image->onesize($img_menu['img'],100,100) : $this->model_tool_image->onesize('cache/no_image-100x100.jpg',100,100))?>">
                            <input type="hidden" name="menu_image[<?php echo $i;?>][image]" value="<?php echo(isset($img_menu) && !empty($img_menu['img']) ? $img_menu['img'] : '') ?>" id="image<?php echo $i;?>" /><br />
                            <a onclick="image_upload('image<?php echo $i;?>', 'thumb<?php echo $i;?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb<?php echo $i;?>').attr('src', '<?php echo $i;?>'); $('#image<?php echo $i;?>').attr('value', '')"><?php echo $text_clear; ?></a></div></td>
                    <td class="left"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" style="width: 70px" type="text" name="menu_image[<?php echo $i;?>][oder]" value="<?php echo(isset($img_menu) && !empty($img_menu['oder']) ? $img_menu['oder'] : '')?>"></td>
                    <td><a onclick="$('#image-row<?php echo $i;?>').remove();" class="button">Xóa</a></td>
                </tr>
                </tbody>
                <?php $i++; } }?>
            </table>
            <?php }elseif(!isset($menu_info) || empty($menu_info['type'])){ ?>
            <div class="mn-body">
                <div class="mn-wr-parent">
                    <div class="mn-wr-parent">
                        <div class="mn-wr-tile"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_parent_1" ></div>
                        <div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="parent_order_1"></div>
                        <div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="parent_icon_1"></div>
                        <div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="parent_link_1"></div>
                        <div class="mn-view"> <span class="pr-add">[Thêm]</span> <span class="pr-delete">[Xóa]</span>
                            <span key-parent="1" class="add-child-pr">[Thêm Mục Con]</span>
                        </div>
                    </div>
                </div>
            </div>
            <?php  }?>

            <?php }?>
            </td>
            </tr>
            <tr>
                <style type="text/css">
                    .scrollbox div input{ margin: 1%; width: 2%;}
                    .tour-child{ margin-left: 44px; width: 93%; font-weight: normal;}
                </style>
            </tr>
            </table>
            </form>
        </div>
    </div>
</div>
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

</style>
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
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-view"> <span key-parent = "'+ key +'" class="pr-add-child">[Thêm]</span> <span class="pr-delete">[Xóa]</span><span style="display: none" key-parent = "'+ key +'" cat = "'+i+'" class="add-child-cli">[Thêm Mục Con]</span> </div>';
                html += '</div>';
                html += '<div></div>';
            }else{
                var html =  '<div class="mn-wr-child">';
                html += '<div class="mn-wr-cl-title"><input data-rule-required="true" data-msg-required="<?php echo $text_error_title; ?>" type="text" placeholder="Nhập tiêu đề " name="title_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input data-rule-required="true" data-msg-required="<?php echo $text_error_oder; ?>" type="text" placeholder="Nhập thứ tự " name="oder_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-oder"><input type="text" placeholder="Nhập icon " name="icon_child_lv_' + i + '_parent_'+ key +'"></div>';
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_lv_' + i + '_parent_'+ key +'"></div>';
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
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_lv_'+ i +'_parent_'+ key +'"></div>';
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
                html += '<div class="mn-wr-link"><input data-rule-required="true" data-msg-required="<?php echo $text_error_link; ?>" type="text" placeholder="Nhập link " name="link_child_lv_'+ i +'_parent_'+ key +'"></div>';
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
        html += '<td class="left"><div class="image"><img id="thumb'+i+'" alt="" src="/image/cache/no_image-100x100.jpg"><img src="<?php echo (isset($no_image) ? $no_image : '') ?>" alt="" id="thumb' + i + '" /><input type="hidden" name="menu_image[' + i + '][image]" value="" id="image' + i + '" /><br /><a onclick="image_upload(\'image' + i + '\', \'thumb' + i + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + i + '\').attr(\'src\', \'<?php echo (isset($no_image) ? $no_image : ''); ?>\'); $(\'#image' + i + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a></div></td>';
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
        html += '<td class="left"><div class="image"><img id="thumb'+i+'" alt="" src="/image/cache/no_image-100x100.jpg"><input type="hidden" name="menu_image[' + i + '][image]" value="" id="image' + i + '" /><br /><a onclick="image_upload(\'image' + i + '\', \'thumb' + i + '\');"><?php echo (isset($text_browse) ? $text_browse : ''); ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + i + '\').attr(\'src\', \'<?php echo (isset($no_image) ? $no_image : ''); ?>\'); $(\'#image' + i + '\').attr(\'value\', \'\');"><?php echo (isset($text_clear) ? $text_clear : ''); ?></a></div></td>';
        html += '<td class="left"><input type="text" name="menu_image[' + i + '][oder]" value="0" /></td>';
        html += '<td><a onclick="$(\'#image-row' + i  + '\').remove();" class="button">Xóa</a></td>';
        html += '</tr>';
        html += '</tbody>';

        add.before(html);
    }
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
            var get_class = $('.mn-wr-parent');
            var count = get_class.length - 1;
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
            html += '<textarea style="width: 100%; height: 174px" name="content[]" class="editor"  id="editor'+count+'"></textarea>';
            html += '</div>';
            html += '</div>';

            $('.class-boder').last().after(html);

        });
    });
</script>

