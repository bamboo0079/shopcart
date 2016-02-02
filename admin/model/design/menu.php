<?php
class ModelDesignMenu extends Model{
    public function addMenu($menu, $lv_1,$cat_id,$type){
        $this->db->query("INSERT INTO menu SET name = '".$menu['name']."', title = '".$menu['title']."', type = '".$menu['type']."', scroll = '".$menu['scroll']."', display = '".$menu['display']."', status = '".$menu['status']."', oder = '".$menu['oder']."'");
        $_id = $this->db->getLastId();
        if(!empty($lv_1)){
            foreach($lv_1 as $_items){
                $this->db->query("INSERT INTO menu_level_1 SET menu_id = '".$_id."', title = '".$_items['title']."', link = '".$_items['link']."', icon = '".$_items['icon']."', oder = '".$_items['oder']."'");
                $menu_id = $this->db->getLastId();
                if(!empty($_items['level_2'])){
                    foreach($_items['level_2'] as $key => $_lv_2){
                        $this->db->query("INSERT INTO menu_level_2 SET menu_id = '".$_id."', id_level_1 = '".$menu_id."', title = '".$_lv_2['title']."', link = '".$_lv_2['link']."', icon = '".$_lv_2['icon']."', oder = '".$_lv_2['oder']."'");
                        $_lv_2_id = $this->db->getLastId();
                        if(!empty($_lv_2['level_3'])){
                            foreach($_lv_2['level_3'] as $key => $_lv_3){
                                $this->db->query("INSERT INTO menu_level_3 SET menu_id = '".$_id."', id_level_2 = '".$_lv_2_id."', title = '".$_lv_3['title']."', link = '".$_lv_3['link']."', icon = '".$_lv_3['icon']."', oder = '".$_lv_3['oder']."'");
                            }
                        }
                    }
                }
            }
        }
        $this->db->query("INSERT INTO menu_display SET menu_id = '".$_id."', cat_menu = '".$cat_id."', type = '".$type."'");
        return $_id;
    }

    public function getTotalMenus(){
        $query = $this->db->query("SELECT COUNT(*) AS total FROM menu");
        return $query->row['total'];
    }
    public function getMenus($data = array()) {
        $sql = "SELECT * FROM menu";
        $sort_data = array(
            'oder',
            'status'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY name";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }
    public function getMenu($menu_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM menu WHERE id = '" . (int)$menu_id . "'");
        return $query->row;
    }
    public function UpdateChildMenu($lv_1,$menu_id){

        if(!empty($lv_1)){

            foreach($lv_1 as $_items){
                $this->db->query("INSERT INTO menu_level_1 SET menu_id = '".$menu_id."', title = '".$_items['title']."', link = '".$_items['link']."', icon = '".$_items['icon']."', oder = '".$_items['oder']."'");
                $level_1_id = $this->db->getLastId();
                if(!empty($_items['level_2'])){
                    foreach($_items['level_2'] as $_lv_2){

                        $this->db->query("INSERT INTO menu_level_2 SET menu_id = '".$menu_id."', id_level_1 = '".$level_1_id."', title = '".$_lv_2['title']."', link = '".$_lv_2['link']."', icon = '".$_lv_2['icon']."', oder = '".$_lv_2['oder']."'");
                        $_lv_2_id = $this->db->getLastId();
                        if(!empty($_lv_2['level_3'])){

                            foreach($_lv_2['level_3'] as $_lv_3){
                                $this->db->query("INSERT INTO menu_level_3 SET menu_id = '".$menu_id."', id_level_2 = '".$_lv_2_id."', title = '".$_lv_3['title']."', link = '".$_lv_3['link']."', icon = '".$_lv_3['icon']."', oder = '".$_lv_3['oder']."'");
                            }

                        }

                    }

                }
            }

        }

    }
    public function deleteAllMenu($menu_id){
        $this->db->query("DELETE FROM menu_level_1 WHERE menu_id = '".$menu_id."'");
        $this->db->query("DELETE FROM menu_level_2 WHERE menu_id = '".$menu_id."'");
        $this->db->query("DELETE FROM menu_level_3 WHERE menu_id = '".$menu_id."'");
    }
    public function AddMenuImage($menu,$arr,$cat_id,$type){
        $this->db->query("INSERT INTO menu SET name = '".$menu['name']."', title = '".$menu['title']."', type = '".$menu['type']."', display = '".$menu['display']."', status = '".$menu['status']."', oder = '".$menu['oder']."'");
        $_id = $this->db->getLastId();
        foreach($arr as $_attr){
            $this->db->query("INSERT INTO img_menu SET menu_id = '".$_id."', title = '".$_attr['title']."', link = '".$_attr['link']."', img = '".$_attr['img']."', oder = '".$_attr['oder']."'");
        }
        $this->db->query("INSERT INTO menu_display SET menu_id = '".$_id."', cat_menu = '".$cat_id."', type = '".$type."'");
        return $_id;
    }
    public function UpdateMenuImage($menu_id,$arr){
        foreach($arr as $_attr){
            $this->db->query("INSERT INTO img_menu SET menu_id = '".$menu_id."', title = '".$_attr['title']."', link = '".$_attr['link']."', img = '".$_attr['img']."', oder = '".$_attr['oder']."'");
        }
    }
    public function deleteMenuImage($menu_id){
        $this->db->query("DELETE FROM img_menu WHERE menu_id = '".$menu_id."'");
    }
    public function GetMenuDes($id){
        $query = $this->db->query("SELECT * FROM menu WHERE id = '".$id."'");
        return $query->row;
    }
    public function DeleteMenu($id,$type){
        $this->db->query("DELETE FROM menu WHERE id = '".$id."'");
        $this->db->query("DELETE FROM menu_display WHERE menu_id = '".$id."' AND type = '".$type."'");
        if($type == 1){
            $this->db->query("DELETE FROM menu_cat_id WHERE id = '".$id."'");
        }else{
            $this->db->query("DELETE FROM menu_tag_id WHERE id = '".$id."'");
        }
    }
    public function deleteChildMenuImage($id){
        $this->db->query("DELETE FROM img_menu WHERE menu_id = '".$id."'");
        $this->db->query("DELETE FROM menu_display WHERE menu_id = '".$id."'");
    }
    public function getMenuList(){
        $query = $this->db->query("SELECT * FROM menu");
        return $query->rows;
    }
    public function getDisplayMenu($id){
        $query = $this->db->query("SELECT * FROM menu_display WHERE menu_id = '".$id."'");
        return $query->row;
    }
    public function getCategoriesMenu(){
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ')
                AS name, c.parent_id, c.sort_order, c.status FROM " . DB_PREFIX . "category_path cp
                LEFT JOIN " . DB_PREFIX . "category c ON (cp.category_id = c.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id)
                JOIN menu_cat_id cid
                WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'
                AND cp.category_id = cid.cat_id
                AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sql .= " GROUP BY cp.category_id ORDER BY name";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        $query = $this->db->query($sql);

        return $query->rows;
    }
    public function getCategoryMenuDescription($id){
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ')
                AS name, c.parent_id, c.sort_order, c.status FROM " . DB_PREFIX . "category_path cp
                LEFT JOIN " . DB_PREFIX . "category c ON (cp.category_id = c.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id)
                JOIN menu_cat_id cid
                WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'
                AND cp.category_id = cid.cat_id
                AND cp.category_id = '".$id."'
                AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sql .= " GROUP BY cp.category_id ORDER BY name";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        $query = $this->db->query($sql);

        return $query->row;
    }
    public function getCategoriesMenuNone(){
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ')
                AS name, c.parent_id, c.sort_order, c.status FROM " . DB_PREFIX . "category_path cp
                LEFT JOIN " . DB_PREFIX . "category c ON (cp.category_id = c.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id)
                WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'
                AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        $sql .= " GROUP BY cp.category_id ORDER BY name";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        $query = $this->db->query($sql);

        return $query->rows;
    }
    public function getCatMenuChoose(){
        $query = $this->db->query("SELECT * FROM menu_cat_id");
        return $query->rows;
    }
    public function getTags($parent_id) {
        $tag_data = $this->cache->get('tag.' . $this->config->get('config_language_id') . '.' . $parent_id);
        if (!$tag_data) {
            $tag_data = array();
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
            foreach ($query->rows as $result) {
                $tag_data[] = array(
                    'tag_id' => $result['tag_id'],
                    'name'        => $this->getPath($result['tag_id'], $this->config->get('config_language_id')),
                    'status'  	  => $result['status'],
                    'sort_order'  => $result['sort_order']
                );

                $tag_data = array_merge($tag_data, $this->getTags($result['tag_id']));
            }
            $this->cache->set('tag.' . $this->config->get('config_language_id') . '.' . $parent_id, $tag_data);
        }
        return $tag_data;
    }
    public function getPath($tag_id) {
        $query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) WHERE c.tag_id = '" . (int)$tag_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");

        $tag_info = $query->row;

        if ($tag_info['parent_id']) {
            return $this->getPath($tag_info['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $tag_info['name'];
        } else {
            return $tag_info['name'];
        }
    }
    public function getTag($tag_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int)$tag_id . "') AS keyword FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int)$tag_id . "'");

        return $query->row;
    }
    public function TagGet(){
        $query = $this->db->query("SELECT tag_id FROM menu_tag_id");
        return $query->rows;
    }
    public function InsertCatMenu($id){
        $this->db->query("INSERT INTO menu_cat_id SET cat_id = '".$id."'");
    }
    public function InsertTagMenu($id){
        $this->db->query("INSERT INTO menu_tag_id SET tag_id = '".$id."'");
    }
    public function deleteCatMenu($id){
        $this->db->query("DELETE FROM menu_cat_id WHERE cat_id = '".$id."'");
    }
    public function deleteTagMenu($id){
        $this->db->query("DELETE FROM menu_tag_id WHERE tag_id = '".$id."'");
    }
    public function GetMenuDisplay($id,$type){
        $query = $this->db->query("SELECT * FROM menu_display ds
                                    LEFT JOIN menu mn ON (mn.id = ds.menu_id)
                                    WHERE ds.cat_menu = '".$id."'
                                    AND ds.type = '".$type."'
                                    ORDER BY mn.name
                                  ");
        return $query->rows;
    }
    public function getItemsMenu($id){
        $query = $this->db->query("SELECT * FROM menu
                                    WHERE menu.id NOT IN (
                                              SELECT menu_id FROM menu_display WHERE cat_menu = '".$id."'
                                          )
                                  ");
        return $query->rows;
    }
    public function InsertIdChoose($id,$cat_id,$type){
        $this->db->query("INSERT INTO menu_display SET menu_id = '".$id."', cat_menu = '".$cat_id."', type = '".$type."'");
    }
    public function AddMenuNews($menu,$items,$cat_id,$type){
        $this->db->query("INSERT INTO menu SET name = '".$menu['name']."', title = '".$menu['title']."', type = '".$menu['type']."', scroll = '".$menu['scroll']."', display = '".$menu['display']."', status = '".$menu['status']."', oder = '".$menu['oder']."'");
        $menu_id = $this->db->getLastId();
        for($i=0; $i < count($items); $i++){
            if(isset($items[$i]['img']) && !empty($items[$i]['img'])){
                $this->db->query("INSERT INTO menu_news SET menu_id = '".$menu_id."', img = '".$items[$i]['img']."', link = '".$items[$i]['link']."', content = '".$items[$i]['content']."'");
            }
        }
        $this->db->query("INSERT INTO menu_display SET menu_id = '".$menu_id."', cat_menu = '".$cat_id."', type = '".$type."'");
        return $menu_id;
    }
    public function deleteMenuNews($menu_id){
        $this->db->query("DELETE FROM menu_news WHERE menu_id = '".$menu_id."'");
    }
    public function EditMenuNews($menu_id,$items){
        for($i=0; $i <= count($items);$i++){
            if(isset($items[$i]['img']) && !empty($items[$i]['img'])){
                $this->db->query("INSERT INTO menu_news SET menu_id = '".$menu_id."', img = '".$items[$i]['img']."',link = '".$items[$i]['link']."', content = '".$items[$i]['content']."'");
            }
        }
    }
    public function UpdateMenu($menu_id,$menu){
        $this->db->query("UPDATE menu
                                SET name = '".$menu['name']."',
                                title = '".$menu['title']."',
                                scroll = '".$menu['scroll']."',
                                type = '".$menu['type']."',
                                display = '".$menu['display']."',
                                status = '".$menu['status']."',
                                oder = '".$menu['oder']."'
                                 WHERE id = '" . $menu_id . "'
                            ");

    }
    public function deleteDisplayMenu($cat_menu,$type){
        $this->db->query("DELETE FROM menu_display WHERE menu_id='".$cat_menu."' AND type='".$type."'");
    }
    public function GetTagDescription($id){
        $tag_data = array();
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag c
                                   LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id)
                                   WHERE c.tag_id = '" . (int)$id. "'
                                   AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
                                   ORDER BY c.sort_order, cd.name ASC");
        foreach ($query->rows as $result) {
            $tag_data[] = array(
                'tag_id' => $result['tag_id'],
                'name'        => $this->getPath($result['tag_id'], $this->config->get('config_language_id')),
                'status'  	  => $result['status'],
                'sort_order'  => $result['sort_order']
            );

            $tag_data = array_merge($tag_data, $this->getTags($result['tag_id']));
        }
        return $tag_data;
    }
    public function getModuleCommomonMenu(){
        $query = $this->db->query("SELECT * FROM `".DB_PREFIX."setting` WHERE `group` LIKE 'common_menu' ORDER BY `setting_id` ASC");
        return $query->row;
    }
    public function getSetting($setting){
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."setting WHERE `group` LIKE '".$setting."'");
        return $query->rows;
    }
}
?>