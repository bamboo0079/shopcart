<?php echo $header;?>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home;?>"><?php echo $text_home; ?></a>
        :: <a href="<?php echo $category_href; ?>"><?php echo $text_category;?></a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/category.png" alt=""> <?php echo $text_category;?></h1>
            <div class="buttons"><a class="button add-new">Thêm</a><a class="button delete-news">Xóa</a></div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs"><a href="#tab-general" class="cat-menu selected" style="display: inline;"><?php echo $text_category_name; ?></a><a class="tag-menu" href="#tab-data" style="display: inline;"><?php echo $text_category_tag; ?></a></div>
            <form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form">
                <input type="hidden" name="type-add" value="1">
                <input class="buttom-cat" type="hidden" name="buttom-cat" value="1">
                <div id="tab-general" style="display: block;">
                    <div id="language2" style="display: block;">
                        <table class="list">
                            <thead>
                            <tr>
                                <td width="1" style="text-align: center;"><input type="checkbox" name="check-all-cat" class="check-all-cat" ></td>
                                <td class="left"><?php echo $text_all; ?></td>
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
                            <td width="1" style="text-align: center;"><input type="checkbox" name="check-all-tag" class="check-all-cat"></td>
                            <td class="left"><?php echo $text_all; ?></td>
                        </tr>
                        </thead>
                        <tbody class="tag">

                        <?php if(!empty($tags)){
                            foreach ($tags as $tag) {
                        ?>
                        <tr>
                            <td style="text-align: center;">
                                <input type="checkbox" name="tag_menu[]" value="<?php echo $tag['tag_id'];?>">
                            </td>
                            <td class="left"><?php echo $tag['name']; ?></td>

                        </tr>
                        <?php  } }else{ ?>
                        <tr>
                            <td class="center" colspan="4"><?php echo $text_category_none; ?></td>
                        </tr>
                        <?php } ?>
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
    $('.cat-menu').on('click',function(){
        $('input[name=type-add]').val(1);
    });
    $('.tag-menu').on('click',function(){
        $('input[name=type-add]').val(2);
    });
    $(function(){
        $('.check-all-cat').on('click',function(){
            var parent = $(this).parent().parent().parent().parent().find('tbody').find('tr').find('td').find('input');
            if($(this).is(':checked')){
                parent.attr('checked','checked');
            }else{
                parent.removeAttr('checked');
            }
        });
        $('.add-new').on('click',function(){
             $('.buttom-cat').val('1');
             $('#form').submit();
        });
        $('.delete-news').on('click',function(){
            $('.buttom-cat').val('2');
            $('#form').submit();
        });
    })
</script>
<?php echo $footer;?>