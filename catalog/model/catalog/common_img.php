<?php
class ModelCatalogCommonImg extends Model {
    public function getDescription($id){
        $query = $this->db->query("SELECT * FROM common_img WHERE id = '".$id."' AND status = 1");
        return $query->row; //
    }
}
?>