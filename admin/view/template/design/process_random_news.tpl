<?php echo $header;?>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<style type="text/css">
    .small-row{ margin-left: 35px;}
    .small-add{ text-align: right;}
    .remove-smal-row{ margin-right: 10px }
</style>
<div id="content">
    <div class="breadcrumb">
        <a href="<?php echo $home_link;?>">Trang chủ</a>
        :: <a href="<?php echo $category_link;?>">Random tin</a>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img alt="" src="view/image/information.png"> Random tin</h1>
            <div class="buttons"><a class="button" href="<?php echo $category_delete;?>"><span>Xóa</span></a></div>
        </div>
        <div class="content">
            <div class="htabs" id="tabs">
                <?php
                    if(!empty($huge)){
                    for($i = 0;$i < count($huge); $i++){
                ?>
                <a href="#tab-<?php echo $i;?>" style="display: inline;" <?php if($i==0){ echo 'class="selected"'; }?>>Aticle <?php echo $i+1;?></a>
                <?php }} ?>
            </div>

            <form id="form" enctype="multipart/form-data" method="post" action="http://vietfuntravel_svn.vf/admin/index.php?route=catalog/news/update&amp;token=9fbaf6e10d3b67df9624fe05a06e50c9&amp;news_id=155">
                <?php
                    if(!empty($huge)){
                    for($v = 0; $v < count($huge);$v++){
                ?>
                    <div id="tab-<?php echo $v;?>" <?php if($v==0){ echo 'style="display: block"'; }else{ echo 'style="display: none"'; } ?>>
                        <table class="form">
                            <tbody><tr>
                                <td>
                                    <textarea class="editor<?php echo $v;?> huge-lass" id="editor<?php echo $v;?>" name="huge[session][<?php echo $v;?>]">
                                    <?php
                                        for($i=0; $i < count($huge);$i++){
                                            if(isset($huge[$v][$i])){
                                               echo $huge[$v][$i].'<br>';
                                               if(isset($child[$v])){
                                                    $t = $i + 1;
                                                    if(isset($child[$v][$t])){
                                                        foreach($child[$v][$t] as $_items){
                                                            print_r($_items);echo "<br>";
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    ?>
                                    </textarea>
                                    <script type="text/javascript">
                                        $(function(){
                                            $( 'textarea.editor<?php echo $v;?>').each( function() {
                                                CKEDITOR.replace( $(this).attr('id'),{
                                                    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                                                    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                                                    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                                                    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                                                    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                                                    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
                                                });
                                            });
                                        })
                                    </script>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                <?php }}?>


            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#tabs a').tabs();
    $('#languages a').tabs();
</script>

<?php echo $footer;?>