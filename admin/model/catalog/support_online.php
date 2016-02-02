<?php
class ModelCatalogSupportOnline extends Model {
	public function addSupportOnline($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "support_online SET yahoo = '" . $this->db->escape($data['yahoo']) . "', skype = '" . $this->db->escape($data['skype']) . "', email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
		
		$id = $this->db->getLastId();
		
		foreach ($data['support_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "support_online_description SET id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		
		$this->cache->delete('support_online');
		
	}
	
	public function editSupportOnline($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "support_online SET yahoo = '" . $this->db->escape($data['yahoo']) . "', skype = '" . $this->db->escape($data['skype']) . "', email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "support_online_description WHERE id = '" . (int)$id . "'");
		foreach ($data['support_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "support_online_description SET id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		
		$this->cache->delete('support_online');
		
	}
	
	public function deleteSupportOnline($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "support_online WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "support_online_description WHERE id = '" . (int)$id . "'");
	}
	
	public function getSupportOnline($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "support_online c LEFT JOIN " . DB_PREFIX . "support_online_description nd ON (c.id = nd.id) WHERE c.id = '" . (int)$id . "'");
		
		return $query->row;
	}

	public function getSupportOnlines($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "support_online c LEFT JOIN " . DB_PREFIX . "support_online_description nd ON (c.id = nd.id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  
		
		$sort_data = array(
			'c.id',
			'nd.name',
			'c.status',
			'c.sort_order'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.id";	
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
	
	public function getTotalSupportOnlines() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "support_online");
		
		return $query->row['total'];
	}
	
	public function getSupportOnlineDescriptions($id) {
		$support_online_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "support_online_description WHERE id = '" . (int)$id . "'");
		
		foreach ($query->rows as $result) {
			$support_online_description_data[$result['language_id']] = array(
				'name'             				=> $result['name']
			);
		}
		
		return $support_online_description_data;
	}	
}
?>