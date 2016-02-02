<?php  
class ControllerModuleCounterMail extends Controller {
	protected function index() {
		$this->load->model('catalog/mail_template');
		if (isset($this->request->get['cm'])) {
			$id = $this->model_catalog_mail_template->checkMailId($this->request->get['cm']);
			if (isset($this->request->get['im']) && $id!=NULL) {
				$id_custom = explode("+",base64_decode($this->request->get['im']));
				$data_mail=$this->model_catalog_mail_template->checkMail((int)$id_custom[0]);
				if ($data_mail!=NULL) {
					$ip=$_SERVER['REMOTE_ADDR'];
					$browse=$_SERVER['HTTP_USER_AGENT'];
					$this->model_catalog_mail_template->updateMailClickCustom((int)$id_custom[0],$id['mail_template_id'],$ip,$browse);
				}
			}
			if (isset($this->request->get['in']) && $id!=NULL) {
				$id_custom = explode("+",base64_decode($this->request->get['in']));
				$data_mail=$this->model_catalog_mail_template->checkMailNewsLitter((int)$id_custom[0]);
				if ($data_mail!=NULL) {
					$ip=$_SERVER['REMOTE_ADDR'];
					$browse=$_SERVER['HTTP_USER_AGENT'];
					$this->model_catalog_mail_template->updateNewsMailClickCustom((int)$id_custom[0],$id['mail_template_id'],$ip,$browse);
				}
			}
			$this->model_catalog_mail_template->updateClickByCode($this->request->get['cm']);
		}
	}
}
?>