<?php
class ModelCatalogMailTemplate extends Model {
	public function getMailTemplate($mail_template_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "mail_template mt LEFT JOIN " . DB_PREFIX . "mail_template_description mtd ON (mt.mail_template_id = mtd.mail_template_id) WHERE mt.mail_template_id = '" . (int)$mail_template_id . "' AND mtd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
	
		return $query->row;
	}
	
	public function getMailTemplates() {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "mail_template mt LEFT JOIN " . DB_PREFIX . "mail_template_description mtd ON (mt.mail_template_id = mtd.mail_template_id) WHERE mtd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY mt.sort_order, LCASE(mtd.name) ASC");
		
		return $query->rows;
	}
	
	public function getCounter($mail_template_id) {
		$query = $this->db->query("SELECT counter FROM " . DB_PREFIX . "mail_template WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	
		if (isset($query->row['counter'])) {
			return $query->row['counter'];
		} else {
			return 0;	
		}
	}
	/// dev trung , chức năng mail tracking, xét cho từng user.
	public function checkMail($id_mail){
		$sl = $this->db->query("SELECT customer_id FROM  " . DB_PREFIX . "customer WHERE customer_id = '" . $id_mail. "'");
		return $sl->row;
	}
	public function checkMailNewsLitter($id_mail){
		$sl = $this->db->query("SELECT id FROM  " . DB_PREFIX . "newsletter WHERE id = '" . $id_mail. "'");
		return $sl->row;
	}
	public function checkMailId($code){
		$query = $this->db->query("SELECT mt.mail_template_id FROM " . DB_PREFIX . "mail_template mt  WHERE code = '" . $this->db->escape($code) . "'");
		return $query->row;
	}
	public function updateMailViewCustom($id_mail,$id,$ip,$browse){
		$sl = $this->db->query("SELECT mail_view_id FROM  mail_view WHERE customer_id = '" . $id_mail. "' AND  mail_template_id = '" . $id. "'");
		$data=$sl->row;
		if ($data>0) {
			$this->db->query("UPDATE mail_view SET view = (view + 1),date_modified =NOW() WHERE mail_template_id = '" . (int)$id . "' AND customer_id= '".$id_mail."'");
		}if($data==NULL) {
			$this->db->query("INSERT INTO mail_view SET customer_id = '" . $id_mail. "', view = 1, mail_template_id = '" .$id. "', ip = '".$ip. "', equipment = '" . $browse . "', date_added =NOW()");
		}
	}
	public function updateNewsMailViewCustom($id_mail,$id,$ip,$browse){
		$sl = $this->db->query("SELECT mail_view_id FROM  mail_newsletter_view WHERE id_mail = '" . $id_mail. "' AND  mail_template_id = '" . $id. "'");
		$data=$sl->row;
		if ($data>0) {
			$this->db->query("UPDATE mail_newsletter_view SET view = (view + 1),date_modified =NOW() WHERE mail_template_id = '" . (int)$id . "' AND id_mail= '".$id_mail."'");
		}if($data==NULL) {
			$this->db->query("INSERT INTO mail_newsletter_view SET id_mail = '" . $id_mail. "', view = 1, mail_template_id = '" .$id. "', ip = '".$ip. "', equipment = '" . $browse . "', date_added =NOW()");
		}
	}
	public function updateMailClickCustom($id_mail,$id,$ip,$browse){
		$sl = $this->db->query("SELECT mail_view_id FROM  mail_click WHERE customer_id = '" . $id_mail. "' AND  mail_template_id = '" . $id. "'");
		$data=$sl->row;
		if ($data>0) {
			$this->db->query("UPDATE mail_click SET click = (click + 1),date_modified =NOW() WHERE mail_template_id = '" . (int)$id . "' AND customer_id= '".$id_mail."'");
		}if($data==NULL) {
			$this->db->query("INSERT INTO mail_click SET customer_id = '" . $id_mail. "', click = 1, mail_template_id = '" .$id. "', ip = '".$ip. "', equipment = '" . $browse . "', date_added =NOW()");
		}
	}
	public function updateNewsMailClickCustom($id_mail,$id,$ip,$browse){
		$sl = $this->db->query("SELECT mail_view_id FROM  mail_newsletter_click WHERE id_mail = '" . $id_mail. "' AND  mail_template_id = '" . $id. "'");
		$data=$sl->row;
		if ($data>0) {
			$this->db->query("UPDATE mail_newsletter_click SET click = (click + 1),date_modified =NOW() WHERE mail_template_id = '" . (int)$id . "' AND id_mail= '".$id_mail."'");
		}if($data==NULL) {
			$this->db->query("INSERT INTO mail_newsletter_click SET id_mail = '" . $id_mail. "', click = 1, mail_template_id = '" .$id. "', ip = '".$ip. "', equipment = '" . $browse . "', date_added =NOW()");
		}
	}
	public function updateClickByCode($code) {
		$this->db->query("UPDATE " . DB_PREFIX . "mail_template SET click = (click + 1) WHERE code = '" . $this->db->escape($code) . "'");
	}
	public function updateCounter($mail_template_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "mail_template SET counter = (counter + 1) WHERE mail_template_id = '" . (int)$mail_template_id . "'");
	}
}
?>