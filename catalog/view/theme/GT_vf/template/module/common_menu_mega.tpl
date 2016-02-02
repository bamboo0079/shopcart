<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/css_menu.css">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/vf/stylesheet/style_menu.css">
<div style="margin-bottom: 10px;" class="wpb_wrapper <?php echo($result['scroll'] == 1 ? 'scroll' : ''); ?>">
    <div class="vc_wp_custommenu wpb_content_element">
        <div class="widget widget_nav_menu">
            <h2 class="widgettitle"><?php echo $result['title'];?> </h2>
            <div class="menu-product-categories-container">
                <ul id="menu-product-categories" class="menu">
                    <?php
                    $query = $this->db->query("SELECT * FROM menu_level_1 WHERE menu_id = '".$id."' ORDER BY oder ");
                    $result = $query->rows;
                    if(!empty($result)){
                    foreach($result as $_items){
                    ?>
                    <?php if($result){ ?>
                    <li id="menu-item-2026" class="sep menu-item menu-item-type-taxonomy menu-item-object-product_cat current-menu-ancestor current-menu-parent menu-item-has-children menu-item-2026 menu-item-has-icon menu-item-mega">
                        <a href="javascript:void(0)"><i class="fa <?php echo (!empty($_items['icon']) ? $_items['icon'] : 'fa-caret-right')?>"></i> <?php echo $_items['title']; ?></a>

                        <div class="mega-menu-container container" style="width:500px">
                            <?php
                        $sql = $this->db->query("SELECT * FROM menu_level_2 WHERE id_level_1 = '".$_items['id']."' ORDER BY oder");
                            $results = $sql->rows;
                            if(!empty($results)){
                            ?>
                            <?php foreach($results as $lv_2){ ?>
                            <div class="mega-menu-columns">
                                <div id="menu-item-2491" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-2491 mega-sub-menu col-md-4">
                                    <a href="<?php echo $lv_2['link']; ?>" rel="<?php echo $lv_2['link']; ?>"><?php echo $lv_2['title']; ?></a>
                                    <?php
                                    $sql_lv3 = $this->db->query("SELECT * FROM menu_level_3 WHERE id_level_2 = '".$lv_2['id']."' ORDER BY oder");
                                    $resuls_lv3 = $sql_lv3->rows;
                                    if(!empty($resuls_lv3)){
                                    ?>
                                    <ul class="sub-menu">
                                        <?php
                                            foreach($resuls_lv3 as $_lv3){
                                        ?>
                                        <li id="menu-item-2492" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-2492">
                                            <a class="" href="<?php echo $_lv3['link']; ?>"> <?php echo $_lv3['title']; ?></a>
                                        </li>
                                        <?php }?>
                                    </ul>
                                    <?php } ?>
                                </div>
                            </div>
                            <?php }?>
                            <?php }?>
                        </div>
                        <?php } ?>
                    </li>
                    <?php }  } ?>
                </ul>

            </div>
        </div>
    </div>
</div>




