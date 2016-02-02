<?php /**
* Created by Khoa Nguyen / Email: codek365@gmail.com
*/
class Event
{
	
	private $config;
	private $db;
	private $data = array();
	private $data_recurring = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');

		if (!isset($this->session->data['event']) || !is_array($this->session->data['event'])) {
			$this->session->data['event'] = array();
		}
	}


	public function check($product_id)
	{
		$events = $this->db->query("SELECT * FROM ".DB_PREFIX."event_group WHERE event_id=".(int)EVENT_ID)->rows;
		foreach ($events as $key => $event) {
			$product_ids = explode(',', $event['value']);
			foreach ($product_ids as $key => $id) {
				if ($id == $product_id) {
					$json['group_id'] = $event['id'];
					$json['name'] = $event['name'];
					$json['location_id'] = $event['location'];
					return json_encode($json);
				}
			}			
		}
		return 0;
	}
	
} 
?>