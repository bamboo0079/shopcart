<?php
class ModelCatalogPolicy extends Model {
	public function addPolicy($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "policy SET sort_order = '" . (int)$this->request->post['sort_order'] . "', status = '" . (int)$data['status'] . "', category = '" . (int)$data['category'] . "'");

		$policy_id = $this->db->getLastId(); 
			
		foreach ($data['policy_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "policy_description SET policy_id = '" . (int)$policy_id . "', language_id = '" . (int)$language_id . "',name = '" . $this->db->escape($value['name']) . "',  description = '" . $this->db->escape($value['description']) . "'");
		}
		
		if (isset($data['policy_store'])) {
			foreach ($data['policy_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "policy_to_store SET policy_id = '" . (int)$policy_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['policy_layout'])) {
			foreach ($data['policy_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "policy_to_layout SET policy_id = '" . (int)$policy_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
		
		$this->cache->delete('policy');
	}
	
	public function editPolicy($policy_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "policy SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', category = '" . (int)$data['category'] . "' WHERE policy_id = '" . (int)$policy_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "policy_description WHERE policy_id = '" . (int)$policy_id . "'");
					
		foreach ($data['policy_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "policy_description SET policy_id = '" . (int)$policy_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "policy_to_store WHERE policy_id = '" . (int)$policy_id . "'");
		
		if (isset($data['policy_store'])) {
			foreach ($data['policy_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "policy_to_store SET policy_id = '" . (int)$policy_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "policy_to_layout WHERE policy_id = '" . (int)$policy_id . "'");

		if (isset($data['policy_layout'])) {
			foreach ($data['policy_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "policy_to_layout SET policy_id = '" . (int)$policy_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
		
		$this->cache->delete('policy');
	}
	
	public function deletePolicy($policy_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "policy WHERE policy_id = '" . (int)$policy_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "policy_description WHERE policy_id = '" . (int)$policy_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "policy_to_store WHERE policy_id = '" . (int)$policy_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "policy_to_layout WHERE policy_id = '" . (int)$policy_id . "'");

		$this->cache->delete('policy');
	}	

	public function getPolicy($policy_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "policy WHERE policy_id = '" . (int)$policy_id . "'");
		
		return $query->row;
	}
		
	public function getPolicys($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "policy i LEFT JOIN " . DB_PREFIX . "policy_description id ON (i.policy_id = id.policy_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
			$sort_data = array(
				'i.sort_order'
			);		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY i.sort_order";	
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
		} else {
			$policy_data = $this->cache->get('policy.' . $this->config->get('config_language_id'));
		
			if (!$policy_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "policy i LEFT JOIN " . DB_PREFIX . "policy_description id ON (i.policy_id = id.policy_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY i.sort_order");
	
				$policy_data = $query->rows;
			
				$this->cache->set('policy.' . $this->config->get('config_language_id'), $policy_data);
			}	
	
			return $policy_data;			
		}
	}
	
	public function getPolicyDescriptions($policy_id) {
		$policy_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "policy_description WHERE policy_id = '" . (int)$policy_id . "'");

		foreach ($query->rows as $result) {
			$policy_description_data[$result['language_id']] = array(
				'description' => $result['description'],
				'name'         =>$result['name']
			);
		}
		
		return $policy_description_data;
	}
	
	public function getPolicyStores($policy_id) {
		$policy_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "policy_to_store WHERE policy_id = '" . (int)$policy_id . "'");

		foreach ($query->rows as $result) {
			$policy_store_data[] = $result['store_id'];
		}
		
		return $policy_store_data;
	}

	public function getPolicyLayouts($policy_id) {
		$policy_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "policy_to_layout WHERE policy_id = '" . (int)$policy_id . "'");
		
		foreach ($query->rows as $result) {
			$policy_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $policy_layout_data;
	}
		
	public function getTotalPolicys() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "policy");
		
		return $query->row['total'];
	}	
	
	public function getTotalPolicysByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "policy_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
?>