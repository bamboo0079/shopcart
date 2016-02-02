<?php
class ModelCatalogComment extends Model {
	public function addComment($url,$data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "comment SET name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', date = '" . date_to_time_data($this->db->escape($data['date'])) . "', url = '" . $this->db->escape($url) . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
	
	}
	
	public function addCommentChild($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "comment SET name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', url = '" . $this->db->escape($data['url']) . "', parent_id = '" . (int)$data['parent_id'] . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
	
	}

	public function getCommentsByUrlParent($url, $start = 0, $limit = 20) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE url = '" . $this->db->escape($url) . "' AND parent_id = 0 AND status = '1' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
		
		return $query->rows;
	}
	public function getCommentsByUrlByParent($parent_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE parent_id = ". (int)$parent_id ." AND status = '1' ORDER BY date_added");
		return $query->rows;
	}
	
	public function getTotalComments() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment");
		
		return $query->row['total'];
	}
	public function getTotalCommentsByUrlParent($url) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment WHERE url = '" . $this->db->escape($url) . "' AND parent_id = 0 AND status = '1'");
		
		return $query->row['total'];
	}
}
?>