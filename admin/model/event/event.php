<?php 
class ModelEventEvent extends Model {
	public function getEvent(){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."event");
		return $query->rows;
	}
	public function addAds($data){
		$this->db->query("DELETE FROM ".DB_PREFIX."ads");
		foreach ($data as $value) {
			$this->db->query("INSERT INTO ".DB_PREFIX."ads SET image_left='".$this->db->escape($value['image_left'])."', image_right='".$this->db->escape($value['image_right'])."', start_date='".$this->db->escape($value['start_date'])."', end_date='".$this->db->escape($value['end_date'])."', event_id='".(int)$value['event']."'");
		}
	}
	public function getAds(){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ads");
		return $query->rows;
	}
}
?>