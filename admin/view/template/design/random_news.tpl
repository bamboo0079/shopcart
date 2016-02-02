<?php echo $header; ?>
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
            <h1><img alt="" src="view/image/category.png"> Form random</h1>
            <div class="buttons"><a class="button" onclick="$('#form').submit(); "><span>Random</span></a><?php if(isset($older_link) && !empty($older_link)){ ?><a class="button" href="<?php echo $older_link;?>"><span>Tin cũ</span></a><?php } ?></div>
        </div>
        <div class="content">
            <form id="form" enctype="multipart/form-data" method="post" action="<?php echo $action?>">
                <div id="tab-general" style="display: block;">
                    <div id="language2" style="display: block;">
                        <table class="form">
                            <tbody>
                            <tr class="session">
                                <td><span class="required">*</span> Số đoạn lớn:</td>
                                <td>
                                    <select name="large_session" class="large_session">
                                        <?php for($i = 0;$i <= 10;$i ++){ ?>
                                        <option value="<?php echo $i;?>">  <?php echo $i;?>  </option>
                                        <?php }?>
                                    </select>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
       $('.large_session').on('change',function(){
           var val = $(this).val();
           for(var i = 1; i <= parseInt(val); i++){
               var html =  '<tr>';
               html += '<td>Đoạn '+i+'</td>';
               html += '<td><textarea class="editor'+i+' huge-lass" id="editor'+i+'" name="huge[session]['+i+']"></textarea></td>';
               html += '</tr>';
               html += '<tr class="mr">';
               html += '<td>Đoạn nhỏ</td>';
               html += '<td><select key = '+i+' class = "small"> ';
               for(var j = 0; j <= 15; j++) {
                   html += '<option value="'+j+'"> '+ j +' </option>';
               }
               html += '</select></td>';
               html += '</tr>';
               $('table.form').append(html);
               $( 'textarea.editor'+i+'').each( function() {
                   CKEDITOR.replace( $(this).attr('id'),{
                       filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                       filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                       filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                       filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                       filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                       filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
                   });
               });


           }
           var ls_count = $('textarea.huge-lass');
           var  huge_add = '<tr>';
                huge_add += '<td></td>';
                huge_add += '<td><div><a class="button add-huge-session"><span>Thêm đoạn lớn</span></a></div></td>';
                huge_add += '</tr>';
           var last_row = ls_count.parent().parent().last().next().after(huge_add);

           $('tr.session').remove();

       });

          $('body').delegate('.small','change',function(){
              var value = $(this).val();
                var key = $(this).attr('key');
              for(var v = 1; v <= parseInt(value); v++) {
                  var html = '<tr class="child">';
                  html += '<td></td>';
                  html += '<td><div class="small-row"><textarea class="editor'+key+v+' key'+key+'" id="editor'+key+v+'" name="huge['+key+']['+v+']" value=""></textarea></div></td>';
                  html += '</tr>';
                  $(this).parent().parent().after(html);
                  $( 'textarea.editor'+key+v+'').each( function() {
                      CKEDITOR.replace( $(this).attr('id'),{
                          filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                          filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                          filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                          filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                          filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                          filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
                      });
                  });
              }
              var   dhtml = '<tr class="mr">';
                    dhtml += '<td></td>';
                    dhtml += '<td><div class="small-add"><a key = '+key+' class="button remove-smal-row"><span>Xóa đoạn nhỏ</span></a><a key = '+key+' class="button add-smal-row"><span>Thêm đoạn nhỏ</span></a></div></td>';
                    dhtml += '</tr>';
              var row = $('.small-row').last().parent().parent();
             row.after(dhtml);
            $(this).parent().parent().hide();
          });
        $('body').delegate('.add-smal-row','click',function(){
            var key = $(this).attr('key');
            var textarea = $('textarea.key'+key+'');
            var count = parseInt(textarea.length) + 1;
            var html = '<tr class="mr">';
                html += '<td></td>';
                html += '<td><div class="small-row"><textarea class="editor'+key+count+' key'+key+'" id="editor'+key+count+'" name="huge['+key+']['+count+']" value=""></textarea></div></td>';
                html += '</tr>';
            textarea.parent().parent().parent().last().after(html);
            $( 'textarea.editor'+key+count+'').each( function() {
                CKEDITOR.replace($(this).attr('id'),{
                    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
                });
            });
        });

        $('body').delegate('.add-huge-session','click',function(){
            var ls_count = $('textarea.huge-lass');
            var key = parseInt(ls_count.length)+1;
            var html =  '<tr>';
            html += '<td>Đoạn '+key+'</td>';
            html += '<td><textarea class="editor'+key+' huge-lass" id="editor'+key+'" name="huge[session]['+key+']"></textarea></td>';
            html += '</tr>';
            html += '<tr>';
            html += '<td>Đoạn nhỏ</td>';
            html += '<td><select key = '+key+' class = "small"> ';
            for(var j = 0; j <= 15; j++) {
                html += '<option value="'+j+'"> '+ j +' </option>';
            }
            html += '</select></td>';
            html += '</tr>';
            var child = $('table.form').find('tr').last().before(html);

            $( 'textarea.editor'+key+'').each( function() {
                CKEDITOR.replace( $(this).attr('id'),{
                    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
                    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
                });
            });
        });
        $('body').delegate('.remove-smal-row','click',function(){
            var find = $(this).parent().parent().parent().prev('tr.child');
            if(parseInt(find.prev('tr.child').live().length) > 0){
                find.remove();
            }else{
                find.remove();
                $(this).parent().parent().parent().remove();
                $('.small').parent().parent().show();
            }
        })

    });
</script>
<?php echo $footer;?>