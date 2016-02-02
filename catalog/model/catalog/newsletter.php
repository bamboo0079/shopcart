<?php
class ModelCatalogNewsLetter extends Model {
	
	
	
	public function addNewsLetter($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter SET email = '" . $this->db->escape($data['email']) . "'");
		
		$id = $this->db->getLastId();
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_description SET id = '" . (int)$id . "', language_id = '" . (int)$this->config->get('config_language_id') . "', name = '" . $this->db->escape($data['name']) . "'");
		
		$this->cache->delete('newsletter');
		
	}
	
	public function getNewsLetterStatusbyEmail($email) {
		$query = $this->db->query("SELECT status FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($email) . "'");
		
		return $query->row;
	}
	public function getNewsLetterbyEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter c LEFT JOIN " . DB_PREFIX . "newsletter_description nd ON (c.id = nd.id) LEFT JOIN " . DB_PREFIX . "newsletter_to_category sc ON (c.id = sc.id) WHERE c.email = '" . $this->db->escape($email) . "'");
		
		return $query->row;
	}
	
	
	public function getNewsLetter($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter c LEFT JOIN " . DB_PREFIX . "newsletter_description nd ON (c.id = nd.id) LEFT JOIN " . DB_PREFIX . "newsletter_to_category sc ON (c.id = sc.id) WHERE c.id = '" . (int)$id . "'");
		
		return $query->row;
	}
	
	
	public function getNewsLetterVerifyEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "verify_newsletter WHERE email = '" . $this->db->escape($email) . "'");
		return $query->row;
	}
	
	public function deleteNewsLetterVerifyEmail($email) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "verify_newsletter WHERE email = '" . $this->db->escape($email) . "'");
	}
	
	public function addNewsLetterVerifyEmail($email,$code) {
		$this->db->query("INSERT " . DB_PREFIX . "verify_newsletter SET code = '" . $this->db->escape($code) . "', email = '" . $this->db->escape($email) . "', date = NOW()");
	}
	
	public function updateNewsLetterStatusEmail($email) {
		 $this->db->query("UPDATE " . DB_PREFIX . "newsletter SET status = 1 WHERE email = '" . $this->db->escape($email) . "'");
	}
	
	public function getNewsLetterVerifyCode($code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "verify_newsletter WHERE code = '" . $this->db->escape($code) . "'");
		return $query->row;
	}
	
	public function deleteNewsLetterVerifyCode($code) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "verify_newsletter WHERE code = '" . $this->db->escape($code) . "'");
	}
	
}
?>