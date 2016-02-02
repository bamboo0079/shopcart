<?php 
class ModelCatalogAttributeType extends Model {
	public function addAttributeType($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_type SET sort_order = '" . (int)$data['sort_order'] . "'");

		$attribute_type_id = $this->db->getLastId();

		foreach ($data['attribute_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_type_description SET attribute_type_id = '" . (int)$attribute_type_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function editAttributeType($attribute_type_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "attribute_type SET sort_order = '" . (int)$data['sort_order'] . "' WHERE attribute_type_id = '" . (int)$attribute_type_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "attribute_type_description WHERE attribute_type_id = '" . (int)$attribute_type_id . "'");

		foreach ($data['attribute_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_type_description SET attribute_type_id = '" . (int)$attribute_type_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function deleteAttributeType($attribute_type_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "attribute_type WHERE attribute_type_id = '" . (int)$attribute_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "attribute_type_description WHERE attribute_type_id = '" . (int)$attribute_type_id . "'");
	}

	public function getAttributeType($attribute_type_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_type WHERE attribute_type_id = '" . (int)$attribute_type_id . "'");

		return $query->row;
	}

	public function getAttributeTypes($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "attribute_type ag LEFT JOIN " . DB_PREFIX . "attribute_type_description agd ON (ag.attribute_type_id = agd.attribute_type_id) WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'agd.name',
			'ag.sort_order'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY ag.sort_order,agd.name";	
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

	public function getAttributeTypeDescriptions($attribute_type_id) {
		$attribute_type_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_type_description WHERE attribute_type_id = '" . (int)$attribute_type_id . "'");

		foreach ($query->rows as $result) {
			$attribute_type_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $attribute_type_data;
	}

	public function getTotalAttributeTypes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "attribute_type");

		return $query->row['total'];
	}	
}
?>