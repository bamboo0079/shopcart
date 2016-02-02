<?php
class ModelEventEvent extends Model {
	public function getEventIDByAlias($link){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."event WHERE event_seo='".$link."'");
		return $query->row;
	}
	public function getEventGroup($event_id){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."event_group WHERE event_id = '".(int)$event_id."' ORDER BY vf_event_group.order");
		return $query->rows;
	}
	public function getEventAds($event_id,$date){
		if($event_id == 0){
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ads WHERE start_date <= '".$date."' AND end_date >= '".$date."'");
		}else{
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ads WHERE event_id='".(int)$event_id."' AND start_date <= '0000-00-00' AND end_date >= '0000-00-00'");
			if(!$query->num_rows){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ads WHERE event_id='".(int)$event_id."' AND start_date <= '".$date."' AND end_date >= '".$date."'");				
			}	
		}
		return $query->row;
	}
	/*Minh - get order saleoff voi account list*/
	public function getEventSaleOff($order_id){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."event_order_saleoff WHERE order_id='".(int)$order_id."'");
		return $query->row;
	}
}
?>