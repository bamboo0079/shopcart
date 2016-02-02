<?php
class ControllerModuleConfigProduct extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/config_product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('config_product', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('module/config_product', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['entry_promotion_title'] = $this->language->get('entry_promotion_title');
		$this->data['entry_payment_content'] = $this->language->get('entry_payment_content');
		$this->data['entry_payment_menu'] = $this->language->get('entry_payment_menu');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
				
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/config_product', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/config_product', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		if (isset($this->request->post['promotion_title'])) {
			$this->data['promotion_title'] = $this->request->post['promotion_title'];
		} else {
			$this->data['promotion_title'] = $this->config->get('promotion_title');
		}
		
		if (isset($this->request->post['promotion_title2'])) {
			$this->data['promotion_title2'] = $this->request->post['promotion_title2'];
		} else {
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
		}
		
		if (isset($this->request->post['text_search_desc_content'])) {
			$this->data['text_search_desc_content'] = $this->request->post['text_search_desc_content'];
		} else {
			$this->data['text_search_desc_content'] = $this->config->get('text_search_desc_content');
		}
		
		if (isset($this->request->post['payment_content'])) {
			$this->data['payment_content'] = $this->request->post['payment_content'];
		} else {
			$this->data['payment_content'] = $this->config->get('payment_content');
		}	
		
		if (isset($this->request->post['payment_menu'])) {
			$this->data['payment_menu'] = $this->request->post['payment_menu'];
		} else {
			$this->data['payment_menu'] = $this->config->get('payment_menu');
		}	
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/config_product.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/config_product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>