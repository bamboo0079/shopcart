<?php echo $header;   ?>
<style type="text/css">
    .right{ width: 200px; }
</style>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home; ?>"><?php echo $text_home;?></a>
        :: <a href="<?php echo $category_href;?>"><?php echo $text_category;?></a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/category.png" alt=""> <?php echo $text_category;?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $text_add; ?></a><a href="javascript:void(0)" class="button delete-menu"><?php echo $text_delete; ?></a></div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs"><a href="#tab-general" class="selected cat-menu" style="display: inline;"><?php echo $text_category_menu;?></a><a class="tag-menu" href="#tab-data" style="display: inline;"><?php echo $text_category_tag;?></a></div>
            <form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form">
                <input type="hidden" name="type-add" value="1">
                <div id="tab-general" style="display: block;">
                    <div id="language2" style="display: block;">
                        <table class="list">
                            <thead>
                            <tr>
                                <td width="1" style="text-align: center;"><input type="checkbox" name="check-all-cat" ></td>
                                <td class="left"><?php echo $text_category_name; ?></td>
                                <td class="right"><?php echo $text_action;?></td>
                            </tr>
                            </thead>
                            <tbody class="cat">
                            <?php if (isset($categories) && !empty($categories)) { ?>
                            <?php foreach ($categories as $category) { ?>
                            <tr>
                                <td style="text-align: center;">
                                    <input type="checkbox" name="cat_menu[]" value="<?php echo $category['category_id']; ?>" />
                                </td>
                                <td class="left"><?php echo $category['name']; ?></td>
                                <td class="right"><a href="<?php echo $category['href'];?>">[<?php echo $text_edit;?>]</a>
                                </td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="center" colspan="4"><?php echo $text_category_none; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-data" style="display: none;">
                    <table class="list">
                        <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" name="check-all-tag"></td>
                            <td class="left"><?php echo $text_category_name;?></td>
                            <td class="right"><?php echo $text_action;?></td>
                        </tr>
                        </thead>
                        <tbody class="tag">

                        <?php if(!empty($tags)){
                            foreach ($tags as $tag) {
                            if(isset($tag_choose[$tag['tag_id']]) && $tag_choose[$tag['tag_id']] == $tag['tag_id']){
                        ?>
                        <tr>
                            <td style="text-align: center;">
                                <input type="checkbox" name="tag_menu[]" value="<?php echo $tag['tag_id'];?>">
                            </td>
                            <td class="left"><?php echo $tag['name']; ?></td>
                            <td class="right">
                                [ <a href="<?php echo $tag['href'];?>"><?php echo $text_edit;?></a> ]
                            </td>
                        </tr>
                        <?php } } } ?>
                        </tbody>
                    </table>
                </div>

            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#tabs a').tabs();
    $('#languages a').tabs();
    $(function(){
        $('.cat-menu').on('click',function(){
            $('input[name=type-add]').val(1);
        });
        $('.tag-menu').on('click',function(){
            $('input[name=type-add]').val(2);
        });
        $('.delete-menu').on('click',function() {
            var x = confirm("Dữ liệu sau khi Xóa / Gỡ bỏ không thể phục hồi! Bạn có chắc chắn muốn làm điều này?");
            if (x) {
                var input = $('tbody.cat').find('tr').find('input');
                input.each(function(){
                    if($(this).is(':checked')) {
                        var id = $(this).val();
                        var tr = $(this).parent().parent();
                        $.ajax({
                            url: 'index.php?route=design/menu/delete&id='+id+'&cat=1&token=<?php echo $this->session->data["token"]; ?>',
                            type: 'post',
                            success: function(data) {
                                tr.remove();
                            }
                        });
                    }

                });
                var input = $('tbody.tag').find('tr').find('input');
                input.each(function(){
                    if($(this).is(':checked')) {
                        var id = $(this).val();
                        var tr = $(this).parent().parent();
                        $.ajax({
                            url: 'index.php?route=design/menu/delete&id='+id+'&cat=2&token=<?php echo $this->session->data["token"]; ?>',
                            type: 'post',
                            success: function(data) {
                                tr.remove();
                            }
                        });
                    }

                });
            } else{
                return false;
            }
        });
        $('input[name=check-all-cat]').on('click',function(){
            if($(this).is(':checked')){
                $('tbody.cat').find('input').attr('checked','checked');
            }else{
                $('tbody.cat').find('input').removeAttr('checked');
            }
        });
        $('input[name=check-all-tag]').on('click',function(){
            if($(this).is(':checked')){
                $('tbody.tag').find('input').attr('checked','checked');
            }else{
                $('tbody.tag').find('input').removeAttr('checked');
            }
        });
    });
</script>

<?php echo $footer; ?>