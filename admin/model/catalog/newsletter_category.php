<?php
class ModelCatalogNewsLetterCategory extends Model {
	public function addCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_category SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
		
		$id = $this->db->getLastId();
		
		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_category_description SET id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		$this->cache->delete('newsletter_category');
	}
	
	public function editCategory($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "newsletter_category SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE id = '" . (int)$id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_category_description WHERE id = '" . (int)$id . "'");
		
		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_category_description SET id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		$this->cache->delete('newsletter_category');
		
	}
	
	public function deleteCategory($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_category WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_category_description WHERE id = '" . (int)$id . "'");
	}
	
	public function getCategory($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter_category soc LEFT JOIN " . DB_PREFIX . "newsletter_category_description socd ON (soc.id = socd.id) WHERE soc.id = '" . (int)$id . "' AND socd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}

	public function getCategories($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "newsletter_category c LEFT JOIN " . DB_PREFIX . "newsletter_category_description nd ON (c.id = nd.id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  
		
		$sort_data = array(
			'c.id',
			'nd.name',
			'c.status',
			'c.sort_order'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.sort_order";	
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
	
	public function getTotalCategory() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "newsletter_category");
		
		return $query->row['total'];
	}
	public function getCategoryDescriptions($id) {
		$category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter_category_description WHERE id = '" . (int)$id . "'");
		
		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             				=> $result['name']
			);
		}
		
		return $category_description_data;
	}
}
?>