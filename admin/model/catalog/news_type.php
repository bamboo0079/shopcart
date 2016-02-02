<?php
class ModelCatalogNewsType extends Model {
	public function addNewsType($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news_type SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
		
		$id = $this->db->getLastId();
		
		foreach ($data['type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_description SET news_type_id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_type_id=" . (int)$id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		$this->cache->delete('news_type');
	}
	
	public function editNewsType($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news_type SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE news_type_id = '" . (int)$id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_description WHERE news_type_id = '" . (int)$id . "'");
		
		foreach ($data['type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_description SET news_type_id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_type_id=" . (int)$id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_type_id=" . (int)$id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('news_type');
		
	}
	
	public function deleteNewsType($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type WHERE news_type_id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_description WHERE news_type_id = '" . (int)$id . "'");
	}
	
	public function getNewsType($id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_type_id=" . (int)$id . "') AS keyword FROM " . DB_PREFIX . "news_type o LEFT JOIN " . DB_PREFIX . "news_type_description nd ON (o.news_type_id = nd.news_type_id) WHERE o.news_type_id = '" . (int)$id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}

	public function getNewsTypes($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news_type c LEFT JOIN " . DB_PREFIX . "news_type_description nd ON (c.news_type_id = nd.news_type_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  
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
	
	public function getTotalNewsType() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_type");
		
		return $query->row['total'];
	}
	public function getNewsTypeDescriptions($id) {
		$type_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_type_description WHERE news_type_id = '" . (int)$id . "'");
		
		foreach ($query->rows as $result) {
			
			$type_description_data[$result['language_id']] = array(
				'name'             				=> $result['name']
			);
			
		}
		return $type_description_data;
		
	}
}
?>