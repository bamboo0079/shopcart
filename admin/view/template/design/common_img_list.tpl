<?php echo $header;   ?>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home_link;?>"><?php echo $entry_home;?></a>
        :: <a href="<?php echo $category_link;?>"><?php echo $entry_image_list;?></a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/banner.png" alt=""> <?php echo $entry_image_list;?></h1>
            <div class="buttons"><a href="<?php echo $add_new; ?>" class="button"><?php echo $entry_bottom_add;?></a><a onclick="$('form').submit();" class="button"><?php echo $entry_bottom_delete;?></a></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                    <tr>
                        <td width="1" style="text-align: center;"><input type="checkbox" class="check_all"></td>
                        <td class="left"><?php echo $entry_image_name;?></td>
                        <td class="left"><?php echo $entry_add_position;?></td>
                        <td class="left"><?php echo $entry_status;?></td>
                        <td class="right"><?php echo $entry_image_action;?></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        if(isset($list_img) && !empty($list_img)){
                        foreach($list_img as $_items){
                    ?>
                    <tr>
                        <td style="text-align: center;"> <input type="checkbox" name="id[]" value="<?php echo $_items['id'];?>">
                        </td>
                        <td class="left"><?php echo $_items['name'];?></td>
                        <td class="left"><?php echo ($_items['position'] = 'content_top' ? $entry_content_top : $_items['position'] = 'content_bottom' ? $entry_content_bottom : $_items['position'] == 'column_left' ? $entry_content_left : $entry_content_right);?></td>
                        <td class="left"><?php echo($_items['status'] == 1 ? 'Bật' : 'Tắt');?></td>
                        <td class="right">
                            [ <a href="<?php echo $this->url->link('design/common_img/edit','&id='.$_items['id'].'&token='.$this->session->data['token']);?>">Sửa</a> ] [ <a href="<?php echo $this->url->link('design/common_img/delete','id='.$_items['id'].'&token='.$this->session->data['token']);?>">Xóa</a> ]
                        </td>
                    </tr>
                    <?php } }?>
                    </tbody>
                </table>
            </form>

        </div>
    </div>
</div>
<?php echo $footer;?>