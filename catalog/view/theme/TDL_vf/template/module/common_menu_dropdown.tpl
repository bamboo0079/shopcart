<?php
$this->load->model('catalog/common_menu');
if(isset($id) && !empty($result)){
?>
<div class="box <?php echo($result['scroll'] == 1 ? 'scroll' : '')?>">
    <h4 class="box-heading"><?php echo $result['title'];?></h4>
    <ul id="accordion" class="accordion get-one">
        <?php
            $query = $this->db->query("SELECT * FROM menu_level_1 WHERE menu_id = '".$id."' ORDER BY oder ");
        $result = $query->rows;
        if(!empty($result)){
        foreach($result as $_items){
        ?>
        <li >
            <div class="link" key="1">
                <i class="fa <?php echo (!empty($_items['icon']) ? $_items['icon'] : 'fa-caret-right')?>"></i>
                <?php echo $_items['title'];?><i class="fa fa-plus"></i>
            </div>
            <?php
            $sql = $this->db->query("SELECT * FROM menu_level_2 WHERE id_level_1 = '".$_items['id']."' ORDER BY oder");
            $results = $sql->rows;
            if(!empty($results)){
            ?>
            <ul class="submenu">
                <?php
					$ct = 1;
                    foreach($results as $lv_2){
                ?>
                <li <?php echo ($ct == count($results) ? 'class="not-border"' : '');?> >
                <?php $sql_lv3 = $this->db->query("SELECT * FROM menu_level_3 WHERE id_level_2 = '".$lv_2['id']."' ORDER BY oder");
                $resuls_lv3 = $sql_lv3->rows;
                ?>
                <div class="link-child" key="1"><i class="fa <?php echo (!empty($lv_2['icon']) ? $lv_2['icon'] : 'fa-caret-right');?>"></i><a href="<?php echo $lv_2['link'];?>"><?php echo $lv_2['title'];?></a><?php if(!empty($resuls_lv3)){ ?><i class="fa fa-plus"></i><?php } ?></div>
                <?php

                    if(!empty($resuls_lv3)){
                    ?>
                <ul class="submenu-child">
                    <?php
                                foreach($resuls_lv3 as $_lv3){
                            ?>
                    <li>
                        <div class="link-child wr-child">
                            <i class="fa <?php echo (!empty($_lv3['icon']) ? $lv_2['icon'] : 'fa-caret-right');?>"></i><a href="<?php echo $_lv3['link'];?>"><?php echo $_lv3['title'];?></a>
                        </div>
                    </li>
                    <?php }?>
                </ul>
                <?php }?>
        </li>
        <?php $ct++; }?>
    </ul>
    <?php }?>
    </li>
    <?php } } }?>
    </ul>
</div>
<script>
    $(function(){
        $('.link, .link-child').on('click',function(){
            var div = $(this).parent().first();
            var toge = div.find('ul').first().toggle();
            var key = $(this).attr('key');
            if(parseInt(key) == 1){
                $(this).find('i').last().removeClass('fa-plus');
                $(this).find('i').last().addClass('fa-minus');
                $(this).attr("key",500);
            }else{
                $(this).find('i').last().removeClass('fa-minus');
                $(this).find('i').last().addClass('fa-plus');
                $(this).attr("key",1);
            }
        });
    })
</script>