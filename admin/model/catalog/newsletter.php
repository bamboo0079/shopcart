<?php
class ModelCatalogNewsLetter extends Model {
	public function addNewsLetter($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter SET email = '" . $this->db->escape($data['email']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
		
		$id = $this->db->getLastId();
		
		foreach ($data['newsletter_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_description SET id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		if (isset($data['newsletter_category'])) {
			foreach ($data['newsletter_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_to_category SET id = '" . (int)$id . "', category_id = '" . (int)$category_id . "'");
			}
		}
		
		$this->cache->delete('newsletter');
		
	}
	
	public function editNewsLetter($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "newsletter SET email = '" . $this->db->escape($data['email']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_description WHERE id = '" . (int)$id . "'");
		foreach ($data['newsletter_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_description SET id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_to_category WHERE id = '" . (int)$id . "'");
		if (isset($data['newsletter_category'])) {
			foreach ($data['newsletter_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter_to_category SET id = '" . (int)$id . "', category_id = '" . (int)$category_id . "'");
			}
		}
		
		$this->cache->delete('newsletter');
		
	}
	
	public function deleteNewsLetter($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_description WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter_to_category WHERE id = '" . (int)$id . "'");
	}
	
	public function getNewsLetter($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter c LEFT JOIN " . DB_PREFIX . "newsletter_description nd ON (c.id = nd.id) LEFT JOIN " . DB_PREFIX . "newsletter_to_category sc ON (c.id = sc.id) WHERE c.id = '" . (int)$id . "'");
		
		return $query->row;
	}
	
	public function getNewsLetterByEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter c LEFT JOIN " . DB_PREFIX . "newsletter_description nd ON (c.id = nd.id) LEFT JOIN " . DB_PREFIX . "newsletter_to_category sc ON (c.id = sc.id) WHERE c.email = '" . $this->db->escape($email) . "'");
		
		return $query->row;
	}
	public function getNewsLetterByEmailId($email) {
		$query = $this->db->query("SELECT c.id,c.email,c.status,c.sort_order,nd.language_id,nd.name,sc.category_id FROM " . DB_PREFIX . "newsletter c LEFT JOIN " . DB_PREFIX . "newsletter_description nd ON (c.id = nd.id) LEFT JOIN " . DB_PREFIX . "newsletter_to_category sc ON (c.id = sc.id) WHERE c.email = '" . $this->db->escape($email) . "'");
		
		return $query->row;
	}
	public function getNewsLetters($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "newsletter c LEFT JOIN " . DB_PREFIX . "newsletter_description nd ON (c.id = nd.id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  
		
		$sort_data = array(
			'c.id',
			'nd.name',
			'c.status',
			'c.sort_order'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.id";	
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
	public function getNewsLetterCategories($id) {
		$newsletter_category_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter_to_category WHERE id = '" . (int)$id . "'");
		
		foreach ($query->rows as $result) {
			$newsletter_category_data[] = $result['category_id'];
		}

		return $newsletter_category_data;
	}
	
	public function getTotalNewsLetters() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "newsletter");
		
		return $query->row['total'];
	}
	
	public function getNewsLetterDescriptions($id) {
		$newsletter_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "newsletter_description WHERE id = '" . (int)$id . "'");
		
		foreach ($query->rows as $result) {
			$newsletter_description_data[$result['language_id']] = array(
				'name'             				=> $result['name']
			);
		}
		
		return $newsletter_description_data;
	}
	public function getMailStatusById($mail_template_id){
		$query= $this->db->query("SELECT * FROM mail_newsletter WHERE mail_template_id = '" . ((int)$mail_template_id) . "'");
		return $query->row;
	}
	public function updatetMailStatusById($mail_template_id,$total){
		$this->db->query("UPDATE mail_newsletter SET total = '".(int)$total."',success = '".(int)$total."', date_modified = NOW()  WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	}
	public function addMailStatusById($mail_template_id,$total){
		$this->db->query("INSERT INTO mail_newsletter SET mail_template_id ='".(int)$mail_template_id."',total = '" . (int)$total . "',success = '".(int)$total."',error=0, date_added = NOW()");
	}
	
	public function getTotalMailClick($mail_view_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM mail_newsletter_click WHERE mail_template_id= '" . (int)$mail_view_id . "'");

		return $query->row['total'];
	}
	public function getTotalMailViews($mail_view_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM mail_newsletter_view WHERE mail_template_id= '" . (int)$mail_view_id . "'");

		return $query->row['total'];
	}
	public function getDataCustomers($data=array()) {
		$sql = "SELECT mt.mail_template_id, mt.code, mt.sort_order, mtd.name, mts.total, mts.success, mts.error, mts.date_added  FROM " . DB_PREFIX . "mail_template mt LEFT JOIN " . DB_PREFIX . "mail_template_description mtd ON (mt.mail_template_id = mtd.mail_template_id) LEFT JOIN mail_newsletter mts ON (mt.mail_template_id = mts.mail_template_id) WHERE mtd.language_id = '" . ((int)$this->config->get('config_language_id')) . "'";
		
		
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
	public function getMailClick($mail_template_id , $data=array()) {
		$sql ="SELECT mv.mail_view_id, mv.click, mv.ip, mv.equipment, mv.date_added, mv.date_modified,nd.name as fullname, ne.email, mt.name  FROM mail_newsletter_click mv LEFT JOIN " . DB_PREFIX . "newsletter  ne ON (mv.id_mail = ne.id) LEFT JOIN " . DB_PREFIX . "newsletter_description  nd ON (ne.id = nd.id) LEFT JOIN " . DB_PREFIX . "mail_template_description  mt ON (mv.mail_template_id = mt.mail_template_id)  WHERE mt.mail_template_id = '" . (int)$mail_template_id . "' ";
		if (!empty($data['filter_customer'])) {
			$implode[] = " nd.name LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}
		if (!empty($data['filter_email'])) {
			$implode[] = "ne.email LIKE '%" . $this->db->escape($data['filter_email']) . "%'";
		}
		if (!empty($data['filter_viewViews'])) {
			$implode[] = "mv.click LIKE '%" . $this->db->escape($data['filter_viewViews']) . "%'";
		}
		if (!empty($data['filter_ip'])) {
			$implode[] = "mv.ip LIKE '%" . $this->db->escape($data['filter_ip']) . "%'";
		}
		if (!empty($data['filter_browser'])) {
			$implode[] = "mv.equipment LIKE '%" . $this->db->escape($data['filter_browser']) . "%'";
		}
		if (!empty($data['filter_date_added'])) {
			$implode[] = "mv.date_added LIKE '%" . $this->db->escape($data['filter_date_added']) . "%'";
		}
		if (!empty($data['filter_date_modifile'])) {
			$implode[] = "mv.date_modified LIKE '%" . $this->db->escape($data['filter_date_modifile']) . "%'";
		}
		if (isset($implode)) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	

			$sql .= "LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	

		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function deleteMailClick($mail_view_id) {
		$this->db->query("DELETE FROM mail_newsletter_click WHERE mail_view_id = '" . (int)$mail_view_id . "'");
	}
	public function getMailViews($mail_template_id , $data=array()) {
		$sql ="SELECT mv.mail_view_id, mv.view, mv.ip, mv.equipment, mv.date_added, mv.date_modified,nd.name as fullname, ne.email, mt.name  FROM mail_newsletter_view mv LEFT JOIN " . DB_PREFIX . "newsletter  ne ON (mv.id_mail = ne.id) LEFT JOIN " . DB_PREFIX . "newsletter_description  nd ON (ne.id = nd.id) LEFT JOIN " . DB_PREFIX . "mail_template_description  mt ON (mv.mail_template_id = mt.mail_template_id)  WHERE mt.mail_template_id = '" . (int)$mail_template_id . "' ";
		if (!empty($data['filter_customer'])) {
			$implode[] = "nd.name LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}
		if (!empty($data['filter_email'])) {
			$implode[] = "cs.email LIKE '%" . $this->db->escape($data['filter_email']) . "%'";
		}
		if (!empty($data['filter_viewViews'])) {
			$implode[] = "mv.view LIKE '%" . $this->db->escape($data['filter_viewViews']) . "%'";
		}
		if (!empty($data['filter_ip'])) {
			$implode[] = "mv.ip LIKE '%" . $this->db->escape($data['filter_ip']) . "%'";
		}
		if (!empty($data['filter_browser'])) {
			$implode[] = "mv.equipment LIKE '%" . $this->db->escape($data['filter_browser']) . "%'";
		}
		if (!empty($data['filter_date_added'])) {
			$implode[] = "mv.date_added LIKE '%" . $this->db->escape($data['filter_date_added']) . "%'";
		}
		if (!empty($data['filter_date_modifile'])) {
			$implode[] = "mv.date_modified LIKE '%" . $this->db->escape($data['filter_date_modifile']) . "%'";
		}
		if (isset($implode)) {
			$sql .= " AND " . implode(" AND ", $implode);
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
	public function deleteMailViews($mail_view_id) {
		$this->db->query("DELETE FROM mail_newsletter_view WHERE mail_view_id = '" . (int)$mail_view_id . "'");
	}
	public function resetMailTemplate($mail_template_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "mail_template SET counter = '" . (int)$data['counter'] . "', click = '" . (int)$data['click'] . "' WHERE mail_template_id = '" . (int)$mail_template_id . "'");

		$this->db->query("UPDATE mail_newsletter SET total = '0', success = '0', error = '0', date_added = '', date_modified = ''  WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_newsletter_click WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_newsletter_view WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	}
	
}
?>