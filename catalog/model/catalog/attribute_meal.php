<?php
class ModelCatalogAttributeMeal extends Model {
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