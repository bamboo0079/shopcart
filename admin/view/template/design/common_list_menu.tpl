<?php echo $header;  ?>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home_link;?>"><?php echo $text_home;?></a>
        :: <a href="<?php echo $cat_link;?>"><?php echo $text_category;?></a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img alt="" src="view/image/banner.png"> <?php echo $cat_detail;?></h1>
            <div class="buttons"><a class="button" href="<?php echo (isset($ad_new) && !empty($ad_new) ? $ad_new : ''); ?>">Thêm</a><a class="button" onclick="$('form').submit();">Xóa</a></div>
        </div>
        <div class="content">
            <form id="form" enctype="multipart/form-data" method="post" action="<?php echo $action;?>">
                <table class="list">
                    <thead>
                    <tr>
                        <td width="1" style="text-align: center;"><input type="checkbox" class="check_all"></td>
                        <td class="left"><?php echo $entry_name_menu; ?></td>
                        <td class="left"><?php echo $text_category_menu; ?></td>
                        <td class="left"><?php echo $text_category_scroll; ?></td>
                        <td class="left"><?php echo $entry_status; ?></td>
                        <td class="right"><?php echo $text_action;?></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        if(isset($list_menu) && !empty($list_menu)){
                        foreach($list_menu as $_items){
                    ?>
                    <tr>
                        <td style="text-align: center;"> <input type="checkbox" value="<?php echo $_items['menu_id'];?>" name="menu_item[]">
                        </td>
                        <td class="left"><?php echo $_items['name'];?></td>
                        <td class="left"><?php echo( $_items['status'] == 1 ? 'bật' : 'tắt');?></td>
                        <td class="left">
                            <?php
                                if($_items['display'] == 1){
                                    echo "menu tĩnh";
                                }elseif($_items['display'] == 2){
                                    echo "dropdown menu";
                                }elseif($_items['display'] == 3){
                                    echo "megamenu";
                                }elseif($_items['display'] == 4){
                                    echo "menu hình";
                                }
                            ?>
                        </td>
                        <td class="left">
                            <?php echo($_items['scroll'] == 1 ? 'bật' : 'tắt' );?>
                        </td>
                        <td class="right">
                            [ <a href="<?php echo $this->url->link('design/menu/update_menu','category_id='.$this->request->get['id'].'&id='.$_items['menu_id'].'&type='.$type.'&type_menu='.$type_menu.'&token='.$this->session->data['token']);?>">Sửa</a> ]
                        </td>
                    </tr>
                    <?php } } else{ ?>
                    <tr >
                        <td colspan="6"><p style="line-height: 50px; text-align: center"><?php echo " Chưa có danh sách menu"; ?></p></td>
                    </tr>
                    <?php }?>
                    </tbody>
                </table>
            </form>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $('.check_all').on('click',function(){
            if($(this).is(':checked')){
                var table = $(this).parent().parent().parent().parent().find('tr').find('td').find('input').attr('checked','checked');
            }else{
                var table = $(this).parent().parent().parent().parent().find('tr').find('td').find('input').removeAttr('checked');
            }
        })
    })
</script>
<?php echo $footer;?>