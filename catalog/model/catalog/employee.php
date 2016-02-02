<?php
class ModelCatalogEmployee extends Model {
	public function getEmployee($employee_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "employee e LEFT JOIN " . DB_PREFIX . "employee_description ed ON (e.employee_id = ed.employee_id) LEFT JOIN " . DB_PREFIX . "employee_to_store e2s ON (e.employee_id = e2s.employee_id) WHERE e.employee_id = '" . (int)$employee_id . "' AND ed.language_id = '" . (int)$this->config->get('config_language_id') . "' AND e2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND e.status = '1'");
	
		return $query->row;
	}
	
	public function getEmployees() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employee e LEFT JOIN " . DB_PREFIX . "employee_description ed ON (e.employee_id = ed.employee_id) LEFT JOIN " . DB_PREFIX . "employee_to_store e2s ON (e.employee_id = e2s.employee_id) WHERE ed.language_id = '" . (int)$this->config->get('config_language_id') . "' AND e2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND e.status = '1' ORDER BY e.sort_order, LCASE(ed.name) ASC");
		
		return $query->rows;
	}
	
	public function getEmployeeLayoutId($employee_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employee_to_layout WHERE employee_id = '" . (int)$employee_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return false;
		}
	}	
}
?>