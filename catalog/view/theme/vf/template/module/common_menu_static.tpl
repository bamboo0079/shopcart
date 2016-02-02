<?php
    $this->load->model('catalog/common_menu');
if(isset($id) && !empty($result)){
$scroll = $result['scroll'];
?>
<div class="box" <?php echo($result['scroll'] == 1 ? 'scroll' : ''); ?>">
<h4 class="box-heading"><?php echo $result['title'];?></h4>
<div class="box-content">
    <ul class="box-category ">
        <?php
                    $query = $this->db->query("SELECT * FROM menu_level_1 WHERE menu_id = '".$id."'");
        $result = $query->rows;
        if(!empty($result)){
        foreach($result as $_items){
        ?>
        <li>
            <a rel="" href="<?php echo $_items['link']?>"><i class="fa <?php echo($_items['icon'] ? $_items['icon'] : 'fa-caret-right');?> "></i> <?php echo $_items['title']; ?></a>
            <?php
                        $sql = $this->db->query("SELECT * FROM menu_level_2 WHERE id_level_1 = '".$_items['id']."' ORDER BY oder");
            $results = $sql->rows;
            if(!empty($results)){
            foreach($results as $_level_2){
            ?>
            <ul>
                <li><?php if(!empty($_level_2['icon'])){ ?><i class="fa <?php echo( ($_level_2['icon']) ? $_level_2['icon'] : '' )?>"></i><?php }?><a class="active" rel="" href="<?php echo $_level_2['link'];?>"><?php echo $_level_2['title']?></a> </li>
                <?php
                            $sql_lv3 = $this->db->query("SELECT * FROM menu_level_3 WHERE id_level_2 = '".$_level_2['id']."' ORDER BY oder");
                $resuls_lv3 = $sql_lv3->rows;
                if(!empty($resuls_lv3)){
                foreach($resuls_lv3 as $_lv3){
                ?>
                <li><?php if(!empty($_lv3['icon'])){ ?><i class="fa <?php echo( ($_lv3['icon']) ? $_lv3['icon'] : 'fa-caret-right' ); ?>"></i><?php }?><a href="<?php echo $_lv3['link'];?>"><?php echo $_lv3['title'];?></a> </li>
                <?php }}?>
            </ul>
            <?php } } }?>
        </li>
        <?php }?>

    </ul>
</div>
</div>

<?php }?>