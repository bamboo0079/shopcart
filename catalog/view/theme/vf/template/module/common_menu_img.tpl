<?php
$croll =  $result['scroll'];
$query = $this->db->query("SELECT * FROM img_menu WHERE menu_id = '".$id."' ");
$items = $query->rows;
if(!empty($items)){
?>
<div class="wr-img <?php echo($result['scroll'] == 1 ? 'scroll' : '')?>">
    <?php
    foreach($items as $_items){
    ?>
    <a href="<?php echo $_items['link'];?>" alt="<?php echo $_items['title'];?>" title="<?php echo $_items['title'];?>"><img alt="<?php echo $_items['img']; ?>" src="<?php echo( $this->model_tool_image->onesize($_items['img'],100,100))?>"></a>
    <?php }?>
</div>
<?php }?>


