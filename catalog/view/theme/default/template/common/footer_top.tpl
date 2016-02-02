<?php if ($modules) { ?>
<div id="footer-top">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?>
<script type="text/javascript">
    $(function(){
        var arr = [];
        var div = $('.scroll');
        var i = -1;
        div.each(function(){
            i++;
            var scroll_height = $(this).offset().top;
            arr[i] = scroll_height;
        });
        var footer_top = $('.footer_top').offset().top;
        $(window).scroll(function(){
            var height_top = $(this).scrollTop();
            var j = -1;
            var e = 0;
            div.each(function(){
                j++;
                var div_height = $(this).offset().top;
                var height_one = $(this).height();
                if(j == 0){
                    e = 0;
                }else{
                    e = e + $(this).prev().height();
                }
                if(height_top >= (arr[j] - e - height_one)){
                    $(this).css('position','fixed');
                    $(this).css('top', e);
                    $(this).css('width','15.3%');
                    $(this).css('z-index','10');
                    $(this).css('background','#fff');
                }else{
                    if(parseInt(height_top) <= div_height ){
                        $(this).removeAttr('style');
                    }
                }
            });
            var footer = $('.footer_top').offset().top;
            /*console.log(footer );
            console.log(height_top );*/
            if(height_top >= footer - 550){
                $('.scroll').css('z-index','0');
            }

        });
    });
</script>
