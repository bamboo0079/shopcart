<?php
class ModelSaleCustomerType extends Model {
	public function addCustomerType($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_type SET sort_order = '" . (int)$data['sort_order'] . "'");
	
		$customer_type_id = $this->db->getLastId();
		
		foreach ($data['customer_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_type_description SET customer_type_id = '" . (int)$customer_type_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}	
	}
	
	public function editCustomerType($customer_type_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer_type SET sort_order = '" . (int)$data['sort_order'] . "' WHERE customer_type_id = '" . (int)$customer_type_id . "'");
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_type_description WHERE customer_type_id = '" . (int)$customer_type_id . "'");

		foreach ($data['customer_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_type_description SET customer_type_id = '" . (int)$customer_type_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
	}
	
	public function deleteCustomerType($customer_type_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_type WHERE customer_type_id = '" . (int)$customer_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_type_description WHERE customer_type_id = '" . (int)$customer_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE customer_type_id = '" . (int)$customer_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE customer_type_id = '" . (int)$customer_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE customer_type_id = '" . (int)$customer_type_id . "'");
	}
	
	public function getCustomerType($customer_type_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer_type cg LEFT JOIN " . DB_PREFIX . "customer_type_description cgd ON (cg.customer_type_id = cgd.customer_type_id) WHERE cg.customer_type_id = '" . (int)$customer_type_id . "' AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}
	
	public function getCustomerTypes($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "customer_type cg LEFT JOIN " . DB_PREFIX . "customer_type_description cgd ON (cg.customer_type_id = cgd.customer_type_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		$sort_data = array(
			'cgd.name',
			'cg.sort_order'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY cg.sort_order";	
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
	
	public function getCustomerTypeDescriptions($customer_type_id) {
		$customer_type_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_type_description WHERE customer_type_id = '" . (int)$customer_type_id . "'");
				
		foreach ($query->rows as $result) {
			$customer_type_data[$result['language_id']] = array(
				'name'        => $result['name'],
				'description' => $result['description']
			);
		}
		
		return $customer_type_data;
	}
		
	public function getTotalCustomerTypes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_type");
		
		return $query->row['total'];
	}
}
?>