<?php echo $header;  ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/menu_style.css" />
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $link_home;?>"><?php echo $text_home;?></a>::
        <a href="<?php echo $category_link;?>"><?php echo $text_category;?></a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img alt="" src="view/image/user-group.png"> <?php echo $text_add_category;?></h1>
            <div class="buttons"><a class="button" onclick="$('#form').submit();"><?php echo $button_save;?></a><a class="button" href="<?php echo $destroy;?>"><?php echo $text_destroy;?></a></div>
        </div>

        <div class="content">
            <form id="form" method="POST" action="<?php echo $action; ?>">
                <input type="hidden" name="type" value="<?php echo $type;?>">
                <table class="form">
                    <tbody>
                    <tr>
                        <td>
                            <div class="tl-top"><?php echo $text_menu_category;?></div>
                            <div class="scrollbox st-none">
                                <?php
                                    $i = 1;
                                    if(isset($categories) && !empty($categories)){
                                    foreach ($categories as $category) {
                                    if(!isset($cat_choose[$category['category_id']]) || $cat_choose[$category['category_id']] != $category['category_id']){
                                ?>
                                <?php
                                    if(isset($category_arr) && isset($category_arr[$category['category_id']]) &&  $category_arr[$category['category_id']] == $category['category_id']){
                                ?>
                                <div class="st-ct" >
                                    <input type="checkbox" value="<?php echo $category['category_id']; ?>" name="cat_menu[]">
                                    <?php echo $category['name']; ?>
                                </div>
                                <?php }?>
                                <?php } } } ?>

                            </div>
                            <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all;?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_destroy_all;?></a>
                        </td>
                        <td><a id="sl-prev" class="cls"><< </a> <a id="sl-next" class="cls"> >></a></td>
                        <td>
                            <div class="tl-top"><?php echo $text_category_choose;?></div>
                            <div class="scrollbox st-choose">

                            </div>
                            <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all;?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_destroy_all;?></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>

    </div>
</div>
<script type="application/javascript">
    $(function(){
        $('body').delegate('#sl-next','click',function(){
            var  input = $('.st-none').find('div').find('input');
            input.each(function(){
                if($(this).is(':checked')){
                    var text = $(this).parent().text();
                    var id = $(this).val();
                    var html = '<div class="st-ct">';
                    html += '<input type="checkbox" value="'+id+'" name="cat_menu_choose[]">';
                    html += '<input type="hidden" value="'+id+'" name="cat_menu_choose[]">'+text+'';
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
                    html += '<input type="checkbox" value="'+id+'" name="cat_menu[id][]">'+text+'';
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
<?php echo $footer;?>