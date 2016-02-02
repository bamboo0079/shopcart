<?php
class ModelCatalogSupportOnline extends Model {
	
	public function getSupportOnlines() {
		$sql = "SELECT * FROM " . DB_PREFIX . "support_online n LEFT JOIN " . DB_PREFIX . "support_online_description nd ON (n.id = nd.id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' ORDER BY n.sort_order";
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function countSupportOnlines() {
		$sql = "SELECT  COUNT(*) AS total FROM " . DB_PREFIX . "support_online n LEFT JOIN " . DB_PREFIX . "support_online_description nd ON (n.id = nd.id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' ORDER BY n.sort_order";
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
}
?>