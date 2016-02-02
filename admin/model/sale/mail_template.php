<?php 
class ModelSaleMailTemplate extends Model {
	public function addMailTemplate($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "mail_template SET code = '" . $this->db->escape($data['code']) . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");

		$mail_template_id = $this->db->getLastId();

		foreach ($data['mail_template_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "mail_template_description SET mail_template_id = '" . (int)$mail_template_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', text = '" . $this->db->escape($value['text']) . "'");
		}
	}

	public function editMailTemplate($mail_template_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "mail_template SET sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE mail_template_id = '" . (int)$mail_template_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "mail_template_description WHERE mail_template_id = '" . (int)$mail_template_id . "'");

		foreach ($data['mail_template_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "mail_template_description SET mail_template_id = '" . (int)$mail_template_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', text = '" . $this->db->escape($value['text']) . "'");
		}
	}

	public function deleteMailTemplate($mail_template_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "mail_template WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "mail_template_description WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_view WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_click WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_status WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	}

	public function getMailTemplate($mail_template_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mail_template WHERE mail_template_id = '" . (int)$mail_template_id . "'");

		return $query->row;
	}

	public function getMailTemplates($data = array()) {
		$sql = "SELECT mt.mail_template_id, mt.code, mt.counter, mt.click, mt.sort_order, mts.success, mtd.name FROM " . DB_PREFIX . "mail_template mt LEFT JOIN " . DB_PREFIX . "mail_template_description mtd ON (mt.mail_template_id = mtd.mail_template_id) LEFT JOIN mail_status mts ON (mt.mail_template_id = mts.mail_template_id) WHERE mtd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		

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

	public function getMailTemplateDescriptions($mail_template_id) {
		$mail_template_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mail_template_description WHERE mail_template_id = '" . (int)$mail_template_id . "'");

		foreach ($query->rows as $result) {
			$mail_template_data[$result['language_id']] = array(
				'name' => $result['name'],
				'text' => $result['text']
			);
		}

		return $mail_template_data;
	}

	public function getTotalMailTemplates() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "mail_template");

		return $query->row['total'];
	}	
	public function getMailTemplateAuto($mail_template_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mail_template mt LEFT JOIN " . DB_PREFIX . "mail_template_description mtd ON (mt.mail_template_id = mtd.mail_template_id) WHERE mt.mail_template_id = '" . (int)$mail_template_id . "'");
		
		return $query->row;
	}
	
	public function resetMailTemplate($mail_template_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "mail_template SET counter = '" . (int)$data['counter'] . "', click = '" . (int)$data['click'] . "' WHERE mail_template_id = '" . (int)$mail_template_id . "'");

		$this->db->query("UPDATE mail_status SET total = '0', success = '0', error = '0', customer_group_id ='0', date_added = '', date_modified = ''  WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_click WHERE mail_template_id = '" . (int)$mail_template_id . "'");
		$this->db->query("DELETE FROM mail_view WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	}
	/* dev Đức Trung*/
	public function getMailViews($mail_template_id , $data=array()) {
		$sql ="SELECT mv.mail_view_id, mv.view, mv.ip, mv.equipment, mv.date_added, mv.date_modified, cs.firstname, cs.lastname, cs.email, mt.name  FROM mail_view mv LEFT JOIN " . DB_PREFIX . "customer  cs ON (mv.customer_id = cs.customer_id) LEFT JOIN " . DB_PREFIX . "mail_template_description  mt ON (mv.mail_template_id = mt.mail_template_id) WHERE mt.mail_template_id = '" . (int)$mail_template_id . "' ";
		if (!empty($data['filter_customer'])) {
			$implode[] = "CONCAT(cs.lastname, ' ', cs.firstname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
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
	public function getTotalMailViews($mail_view_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM mail_view WHERE mail_template_id= '" . (int)$mail_view_id . "'");

		return $query->row['total'];
	}	
	public function getMailClick($mail_template_id , $data=array()) {
		$sql ="SELECT mv.mail_view_id, mv.click, mv.ip, mv.equipment, mv.date_added, mv.date_modified, cs.firstname, cs.lastname, cs.email, mt.name  FROM mail_click mv LEFT JOIN " . DB_PREFIX . "customer  cs ON (mv.customer_id = cs.customer_id) LEFT JOIN " . DB_PREFIX . "mail_template_description  mt ON (mv.mail_template_id = mt.mail_template_id) WHERE mt.mail_template_id = '" . (int)$mail_template_id . "' ";
		if (!empty($data['filter_customer'])) {
			$implode[] = "CONCAT(cs.lastname, ' ', cs.firstname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}
		if (!empty($data['filter_email'])) {
			$implode[] = "cs.email LIKE '%" . $this->db->escape($data['filter_email']) . "%'";
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
	public function getTotalMailClick($mail_view_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM mail_click WHERE mail_template_id= '" . (int)$mail_view_id . "'");

		return $query->row['total'];
	}
	public function deleteMailViews($mail_view_id) {
		$this->db->query("DELETE FROM mail_view WHERE mail_view_id = '" . (int)$mail_view_id . "'");
	}
	public function deleteMailClick($mail_view_id) {
		$this->db->query("DELETE FROM mail_click WHERE mail_view_id = '" . (int)$mail_view_id . "'");
	}
	public function getDataCustomers($data=array()) {
		$sql = "SELECT mt.mail_template_id, mt.code, mtd.name, mts.total, mts.success, mts.error, mts.date_added  FROM " . DB_PREFIX . "mail_template mt LEFT JOIN " . DB_PREFIX . "mail_template_description mtd ON (mt.mail_template_id = mtd.mail_template_id) LEFT JOIN mail_status mts ON (mt.mail_template_id = mts.mail_template_id) WHERE mtd.language_id = '" . ((int)$this->config->get('config_language_id')) . "'";
		
		
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
	public function getTotalCustomers($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	public function getMailStatusById($mail_template_id){
		$query= $this->db->query("SELECT * FROM mail_status WHERE mail_template_id = '" . ((int)$mail_template_id) . "'");
		return $query->row;
	}
	public function updatetMailStatusById($mail_template_id,$total,$customer_group_id){
		$this->db->query("UPDATE mail_status SET total = (total + '".(int)$total."'),success = (success + '".(int)$total."'),customer_group_id = '".$customer_group_id."', date_modified = NOW()  WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	}
	public function addMailStatusById($mail_template_id,$total,$customer_group_id){
		$this->db->query("INSERT INTO mail_status SET mail_template_id ='".(int)$mail_template_id."',total = '" . (int)$total . "',success = '".(int)$total."',error=0,customer_group_id = '".(int)$customer_group_id."', date_added = NOW()");
	}	
	// end 
}
?>