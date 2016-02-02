<?php
class ModelDesignCommonImg extends Model{
    public function InsertImg($img_name,$link, $image,$position,$width,$height,$status){
        $this->db->query("INSERT INTO common_img SET name = '".$img_name."',link = '".$link."', img = '".$image."', position = '".$position."', width = '".$width."', height = '".$height."', status = '".$status."'");
        return $this->db->getLastId();
    }
    public function getList(){
        $query = $this->db->query("SELECT * FROM common_img ORDER BY name");
        return $query->rows;
    }
    public function getDescription($id){
        $query = $this->db->query("SELECT * FROM common_img WHERE id = '".$id."'");
        return $query->row;
    }
    public function UpdateImg($id, $data){
        $this->db->query("UPDATE common_img SET name = '".$data['img_name'][0]."', link = '".$data['link'][0]."', img = '".$data['image']['img0']."', position = '".$data['position'][0]."', width = '".$data['width'][0]."',height = '".$data['height'][0]."', status = '".$data['status']['atc0']."' WHERE id = '". $id."'");
    }
    public function deleteImg($id){
        $this->db->query("DELETE  FROM common_img WHERE id = '".$id."'");
    }
    public function getSetting($setting){
        $query = $this->db->query("SELECT * FROM ".DB_PREFIX."setting WHERE `group` LIKE '".$setting."'");
        return $query->rows;
    }

}
?>