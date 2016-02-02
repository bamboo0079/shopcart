<?php
class ModelCatalogEmployee extends Model {
	public function addEmployee($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "employee SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");

		$employee_id = $this->db->getLastId(); 
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "employee SET image = '" . $this->db->escape($data['image']) . "' WHERE employee_id = '" . (int)$employee_id . "'");
		}
		
		if (isset($data['image_view'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "employee SET image_view = '" . $this->db->escape($data['image_view']) . "' WHERE employee_id = '" . (int)$employee_id . "'");
		}

		foreach ($data['employee_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "employee_description SET employee_id = '" . (int)$employee_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', name_mask = '" . $this->db->escape($value['name_mask']) . "', custom_title = '" . $this->db->escape($value['custom_title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "', description = '" . $value['description'] . "', rank = '" . $this->db->escape($value['rank']) . "', intro = '" . $this->db->escape($value['intro']) . "'");
		}

		if (isset($data['employee_store'])) {
			foreach ($data['employee_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "employee_to_store SET employee_id = '" . (int)$employee_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['employee_layout'])) {
			foreach ($data['employee_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "employee_to_layout SET employee_id = '" . (int)$employee_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'employee_id=" . (int)$employee_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('employee');
	}

	public function editEmployee($employee_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "employee SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE employee_id = '" . (int)$employee_id . "'");
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "employee SET image = '" . $this->db->escape($data['image']) . "' WHERE employee_id = '" . (int)$employee_id . "'");
		}
		
		if (isset($data['image_view'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "employee SET image_view = '" . $this->db->escape($data['image_view']) . "' WHERE employee_id = '" . (int)$employee_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "employee_description WHERE employee_id = '" . (int)$employee_id . "'");

		foreach ($data['employee_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "employee_description SET employee_id = '" . (int)$employee_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', name_mask = '" . $this->db->escape($value['name_mask']) . "', custom_title = '" . $this->db->escape($value['custom_title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "', description = '" . $value['description'] . "', rank = '" . $this->db->escape($value['rank']) . "', intro = '" . $this->db->escape($value['intro']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "employee_to_store WHERE employee_id = '" . (int)$employee_id . "'");

		if (isset($data['employee_store'])) {
			foreach ($data['employee_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "employee_to_store SET employee_id = '" . (int)$employee_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "employee_to_layout WHERE employee_id = '" . (int)$employee_id . "'");

		if (isset($data['employee_layout'])) {
			foreach ($data['employee_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "employee_to_layout SET employee_id = '" . (int)$employee_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'employee_id=" . (int)$employee_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'employee_id=" . (int)$employee_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('employee');
	}

	public function deleteEmployee($employee_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "employee WHERE employee_id = '" . (int)$employee_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "employee_description WHERE employee_id = '" . (int)$employee_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "employee_to_store WHERE employee_id = '" . (int)$employee_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "employee_to_layout WHERE employee_id = '" . (int)$employee_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'employee_id=" . (int)$employee_id . "'");

		$this->cache->delete('employee');
	}	

	public function getEmployee($employee_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'employee_id=" . (int)$employee_id . "') AS keyword FROM " . DB_PREFIX . "employee WHERE employee_id = '" . (int)$employee_id . "'");

		return $query->row;
	}

	public function getEmployees($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "employee i LEFT JOIN " . DB_PREFIX . "employee_description id ON (i.employee_id = id.employee_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.name',
				'i.sort_order'
			);		

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY id.name";	
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
			$employee_data = $this->cache->get('employee.' . (int)$this->config->get('config_language_id'));

			if (!$employee_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employee i LEFT JOIN " . DB_PREFIX . "employee_description id ON (i.employee_id = id.employee_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.name");

				$employee_data = $query->rows;

				$this->cache->set('employee.' . (int)$this->config->get('config_language_id'), $employee_data);
			}	

			return $employee_data;			
		}
	}

	public function getEmployeeDescriptions($employee_id) {
		$employee_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employee_description WHERE employee_id = '" . (int)$employee_id . "'");

		foreach ($query->rows as $result) {
			$employee_description_data[$result['language_id']] = array(
				'name'       		=> $result['name'],
				'name_mask'       	=> $result['name_mask'],
				'custom_title'		=> $result['custom_title'],
				'meta_keyword'		=> $result['meta_keyword'],
				'meta_description'	=> $result['meta_description'],
				'short_description' => $result['short_description'],
				'description' 		=> $result['description'],
				'rank' 				=> $result['rank'],
				'intro' 			=> $result['intro']
			);
		}

		return $employee_description_data;
	}

	public function getEmployeeStores($employee_id) {
		$employee_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employee_to_store WHERE employee_id = '" . (int)$employee_id . "'");

		foreach ($query->rows as $result) {
			$employee_store_data[] = $result['store_id'];
		}

		return $employee_store_data;
	}

	public function getEmployeeLayouts($employee_id) {
		$employee_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employee_to_layout WHERE employee_id = '" . (int)$employee_id . "'");

		foreach ($query->rows as $result) {
			$employee_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $employee_layout_data;
	}

	public function getTotalEmployees() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "employee");

		return $query->row['total'];
	}	

	public function getTotalEmployeesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "employee_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
?>