<?php
class ModelCatalogCommonMenu extends Model {

    public function GetDescription($id) {
        $query = $this->db->query("SELECT * FROM menu WHERE id = '".$id."' AND status = 1");
        return $query->row;
    }
    public function GetDisplayMenu($id,$category_id){
        $query = $this->db->query("SELECT * FROM menu_display WHERE menu_id = '".$id."' AND cat_menu='".$category_id."'");
        return $query->row;

    }
    public function checkAliasCat($keyword){
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."url_alias WHERE keyword='".$keyword."'");
        return $query->row;
    }
    public function GetMenuNewsDescription($id){
        $query = $this->db->query("SELECT * FROM menu_news WHERE menu_id='".$id."'");
        return $query->rows;
    }
}
?>