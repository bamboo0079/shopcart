<?php
class ControllerAccountConfirmEmail extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('account/confirm_email');
		$this->load->model('account/customer');
		if($this->request->get['code']){
			$code = $this->request->get['code'];
			
			$check = $this->model_account_customer->getChangeEmailByCode($code);
			
			if($check!=NULL){
				//update new email
				$this->model_account_customer->updateChangeEmailByCode($check['new_email'],$check['customer_id']);
				//delete record req
				$this->model_account_customer->deleteChangeEmail($check['customer_id']);
				
				$this->session->data['success'] = sprintf($this->language->get('text_success'), $this->url->link('account/login', '', 'SSL'));
			}else{
				
				$this->session->data['error_warning'] = $this->language->get('text_check_mail');
			}
			$this->customer->logout();
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}
		
	}
}
?>