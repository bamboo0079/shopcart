<?php
class ModelCatalogComment extends Model {
	/*public function addcomment($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "comment SET name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', url = '" . $this->db->escape($data['url']) . "', parent_id = '" . (int)$data['parent_id'] . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
	
		$this->cache->delete('product');
	}
	*/
	public function editComment($comment_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "comment SET name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', date = '" . $this->db->escape($data['date']) . "', url = '" . $data['url'] . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = '" . $data['date_added'] . "', date_modified = '" . $data['date_modified'] . "' WHERE comment_id = '" . (int)$comment_id . "'");
	
		$this->cache->delete('product');
	}
	
	public function deleteComment($comment_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "comment WHERE comment_id = '" . (int)$comment_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "comment WHERE parent_id = '" . (int)$comment_id . "'");
		
		$this->cache->delete('product');
	}
	public function deleteCommentURL($url) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "comment WHERE url = '" . $url . "'");
		
		$this->cache->delete('product');
	}

	public function approvalComment($comment_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "comment SET status = 1 WHERE comment_id = '" . (int)$comment_id . "'");
	
		$this->cache->delete('product');
	}
	
	public function unapprovalComment($comment_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "comment SET status = 0 WHERE comment_id = '" . (int)$comment_id . "'");
	
		$this->cache->delete('product');
	}
	
	public function getComment($comment_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE comment_id = '" . (int)$comment_id . "'");
		
		return $query->row;
	}
	
	public function getCommentByParentId($parent_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE comment_id = '" . (int)$parent_id . "'");
		
		return $query->row;
	}

	public function getComments($data = array()) {
		$sql = "SELECT * FROM (SELECT * FROM " . DB_PREFIX . "comment ORDER BY status ASC) as comment GROUP BY url";	
		
		$sort_data = array(
			'comment_id'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY comment_id";	
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
	
	public function getTotalComments() {
		$query = $this->db->query("SELECT COUNT(*) as total FROM " . DB_PREFIX . "comment GROUP BY url");
		
		return $query->rows;
	}
	
	public function getTotalCommentsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment WHERE status = '0'");
		
		return $query->row['total'];
	}	
	
	
	//
	public function addComment($url,$data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "comment SET name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', url = '" . $this->db->escape($url) . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "',status = 1, date_added = NOW(), date_modified = NOW()");
	
	}
	
	public function addCommentChild($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "comment SET name = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', url = '" . $this->db->escape($data['url']) . "', parent_id = '" . (int)$data['parent_id'] . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', status = 1, rank = 1, date_added = NOW()");
		
	}
	
	public function getCommentURL($url) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE url = '" . $url . "'");
		
		return $query->row;
	}
	
	public function getTotalCommentsByUrlParent($url) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment WHERE url = '" . $this->db->escape($url) . "' AND parent_id = 0");
		
		return $query->row['total'];
	}
	
	public function getTotalCommentsByUrlOff($url) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment WHERE url = '" . $this->db->escape($url) . "' AND status = 0");
		
		return $query->row['total'];
	}
	
	public function getTotalCommentsByUrlAll($url) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment WHERE url = '" . $this->db->escape($url) . "'");
		
		return $query->row['total'];
	}
	
	public function getCommentsByUrlParent($url, $start = 0, $limit = 20) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE url = '" . $this->db->escape($url) . "' AND parent_id = 0 ORDER BY date_modified DESC, date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
		
		return $query->rows;
	}
	public function getCommentsByUrlByParent($parent_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "comment WHERE parent_id = ". (int)$parent_id ." ORDER BY date_added");
		return $query->rows;
	}
}
?>