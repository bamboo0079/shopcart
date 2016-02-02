<?php
class ModelCatalogOption extends Model {
	public function getOption($option_id){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."option_value ov LEFT JOIN ".DB_PREFIX."option_value_description ovd ON (ov.option_value_id=ovd.option_value_id) where ov.option_id='".(int)$option_id."' ORDER BY ov.option_value_id");
		foreach ($query->rows as $key => $value) {
			$option_value[]  = array(
					"option_value_id"	=> $value['option_value_id'],
					"image"				=> $value['image'],
					"sort_order"		=> $value['sort_order'],
					"language_id"		=> $value['language_id'],
					"name"				=> $value['name']
				);
		}
		if($query->num_rows){
			return $option_value;
		}else{
			return false;
		}
	}
	public function getOptions(){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."option o LEFT JOIN ".DB_PREFIX."option_description od ON (o.option_id=od.option_id) ORDER BY o.option_id");
		$option_data = array();
		foreach ($query->rows as $key => $value) {
			$option_data[]  =  array(
						"option_id"	  	=>   $value['option_id'],
						"type"			=>	 $value['type'],
						"sort_order"	=> 	 $value['sort_order'],
						"category"		=>	 $value['category'],
						"class"			=>   $value['class'],
						"language_id"	=> 	 $value['language_id'],
						"name"			=>	 $value['name'],
						"option_value"	=> 	 $this->getOption($value['option_id'])
			);
		}
		return $option_data;
	}
}
?>