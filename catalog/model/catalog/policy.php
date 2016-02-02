<?php
class ModelCatalogPolicy extends Model {
	public function getPolicy($policy_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "policy i LEFT JOIN " . DB_PREFIX . "policy_description id ON (i.policy_id = id.policy_id) LEFT JOIN " . DB_PREFIX . "policy_to_store i2s ON (i.policy_id = i2s.policy_id) WHERE i.policy_id = '" . (int)$policy_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'");
	
		return $query->row;
	}
	
	public function getPolicys() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "policy i LEFT JOIN " . DB_PREFIX . "policy_description id ON (i.policy_id = id.policy_id) LEFT JOIN " . DB_PREFIX . "policy_to_store i2s ON (i.policy_id = i2s.policy_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' ORDER BY i.sort_order, LCASE(id.title) ASC");
		
		return $query->rows;
	}
	
	public function getpolicyLayoutId($policy_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "policy_to_layout WHERE policy_id = '" . (int)$policy_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");
		 
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_policy');
		}
	}	
}
?>