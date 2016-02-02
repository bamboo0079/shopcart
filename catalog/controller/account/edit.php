<?php
class ControllerAccountEdit extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/edit', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}
		
		$this->document->addScript('catalog/view/javascript/jquery/form-validator/jquery.form-validator.js');

		$this->language->load('account/edit');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/customer');
		
		//Update change mail 04-12-2014
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if($this->request->post['email'] == $this->request->post['old_email']){
				$this->model_account_customer->editCustomer($this->request->post);
	
				$this->session->data['success'] = $this->language->get('text_success');
				
				$this->redirect($this->url->link('account/account', '', 'SSL'));
			}else{
				$code = md5(uniqid(rand()));
				
				$this->model_account_customer->editCustomerNotEmail($this->request->post);
				
				$check = $this->model_account_customer->getChangeEmail($this->customer->getId());
				
				if($check!=NULL){
					$this->model_account_customer->deleteChangeEmail($this->customer->getId());
				}
				
				$this->model_account_customer->addChangeEmail($this->request->post,$code);
				
				$this->error['attention'] = sprintf($this->language->get('text_check_mail'),$this->request->post['old_email']);
			}
		}
		//end

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),     	
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),        	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_edit'),
			'href'      => $this->url->link('account/edit', '', 'SSL'),       	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_your_details'] = $this->language->get('text_your_details');

		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_birthday'] = $this->language->get('entry_birthday');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_fax'] = $this->language->get('entry_fax');
		
		$this->data['text_placeholder_lastname'] = $this->language->get('text_placeholder_lastname');
		$this->data['text_placeholder_firstname'] = $this->language->get('text_placeholder_firstname');
		$this->data['text_placeholder_birthday'] = $this->language->get('text_placeholder_birthday');
		$this->data['text_placeholder_email'] = $this->language->get('text_placeholder_email');
		$this->data['text_placeholder_telephone'] = $this->language->get('text_placeholder_telephone');
		$this->data['text_placeholder_fax'] = $this->language->get('text_placeholder_fax');
		
		$this->data['lang_error_lastname'] = $this->language->get('error_lastname');
		$this->data['lang_error_firstname'] = $this->language->get('error_firstname');
		$this->data['lang_error_birthday_day'] = $this->language->get('error_birthday_day');
		$this->data['lang_error_birthday_month'] = $this->language->get('error_birthday_month');
		$this->data['lang_error_birthday_year'] = $this->language->get('error_birthday_year');
		$this->data['lang_error_email'] = $this->language->get('error_email');
		$this->data['lang_error_telephone'] = $this->language->get('error_telephone');
		
		$this->data['text_day'] = $this->language->get('text_day');
		$this->data['text_month'] = $this->language->get('text_month');
		$this->data['text_year'] = $this->language->get('text_year');

		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_back'] = $this->language->get('button_back');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['attention'])) {
			$this->data['attention'] = $this->error['attention'];
		} else {
			$this->data['attention'] = '';
		}

		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}	
		
		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}
		
		if (isset($this->error['birthday'])) {
			$this->data['error_birthday'] = $this->error['error_birthday'];
		} else {
			$this->data['error_birthday'] = '';
		}

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}	

		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}	

		$this->data['action'] = $this->url->link('account/edit', '', 'SSL');

		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		}
		
		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		}elseif (isset($customer_info)) {
			$this->data['lastname'] = $customer_info['lastname'];
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		}elseif (isset($customer_info)) {
			$this->data['firstname'] = $customer_info['firstname'];
		} else {
			$this->data['firstname'] = '';
		}
		
		if(isset($customer_info['birthday'])){
			$birthday = explode('-',$customer_info['birthday']);
		}
		
		if (isset($this->request->post['birthday_day'])) {
			$this->data['birthday_day'] = $this->request->post['birthday_day'];
		}elseif (isset($birthday)) {
			$this->data['birthday_day'] = $birthday[2];
		} else {
			$this->data['birthday_day'] = '';
		}
		
		if (isset($this->request->post['birthday_month'])) {
			$this->data['birthday_month'] = $this->request->post['birthday_month'];
		}elseif (isset($birthday)) {
			$this->data['birthday_month'] = $birthday[1];
		} else {
			$this->data['birthday_month'] = '';
		}
		
		if (isset($this->request->post['birthday_year'])) {
			$this->data['birthday_year'] = $this->request->post['birthday_year'];
		}elseif (isset($birthday)) {
			$this->data['birthday_year'] = $birthday[0];
		} else {
			$this->data['birthday_year'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} elseif (isset($customer_info)) {
			$this->data['email'] = $customer_info['email'];
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$this->data['telephone'] = $this->request->post['telephone'];
		} elseif (isset($customer_info)) {
			$this->data['telephone'] = $customer_info['telephone'];
		} else {
			$this->data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$this->data['fax'] = $this->request->post['fax'];
		} elseif (isset($customer_info)) {
			$this->data['fax'] = $customer_info['fax'];
		} else {
			$this->data['fax'] = '';
		}

		$this->data['back'] = $this->url->link('account/account', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/edit.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/edit.tpl';
		} else {
			$this->template = 'default/template/account/edit.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);

		$this->response->setOutput($this->render());	
	}

	protected function validate() {
		if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 255)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}
		
		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 255)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}
		
		if ((utf8_strlen($this->request->post['birthday_day']) < 1) || (utf8_strlen($this->request->post['birthday_month']) < 1) || (utf8_strlen($this->request->post['birthday_year']) < 1)) {
			$this->error['birthday'] = $this->language->get('error_birthday');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if (($this->customer->getEmail() != $this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		if ((utf8_strlen($this->request->post['telephone']) < 9) || (utf8_strlen($this->request->post['telephone']) > 11)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>