<?php 
class ModelCatalogAttributeMeal extends Model {
	public function addAttributeMeal($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_meal SET image = '" . $this->db->escape($data['image']) . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$attribute_meal_id = $this->db->getLastId();

		foreach ($data['attribute_meal_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_meal_description SET attribute_meal_id = '" . (int)$attribute_meal_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function editAttributeMeal($attribute_meal_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "attribute_meal SET image = '" . $this->db->escape($data['image']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE attribute_meal_id = '" . (int)$attribute_meal_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "attribute_meal_description WHERE attribute_meal_id = '" . (int)$attribute_meal_id . "'");

		foreach ($data['attribute_meal_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_meal_description SET attribute_meal_id = '" . (int)$attribute_meal_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function deleteAttributeMeal($attribute_meal_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "attribute_meal WHERE attribute_meal_id = '" . (int)$attribute_meal_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "attribute_meal_description WHERE attribute_meal_id = '" . (int)$attribute_meal_id . "'");
	}

	public function getAttributeMeal($attribute_meal_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_meal WHERE attribute_meal_id = '" . (int)$attribute_meal_id . "'");

		return $query->row;
	}

	public function getAttributeMeals($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "attribute_meal ag LEFT JOIN " . DB_PREFIX . "attribute_meal_description agd ON (ag.attribute_meal_id = agd.attribute_meal_id) WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'agd.name',
			'ag.sort_order'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY ag.sort_order";	
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

	public function getAttributeMealDescriptions($attribute_meal_id) {
		$attribute_meal_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_meal_description WHERE attribute_meal_id = '" . (int)$attribute_meal_id . "'");

		foreach ($query->rows as $result) {
			$attribute_meal_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $attribute_meal_data;
	}

	public function getTotalAttributeMeals() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "attribute_meal");

		return $query->row['total'];
	}	
}
?>