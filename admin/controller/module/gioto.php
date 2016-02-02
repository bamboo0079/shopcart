<?php
class ControllerModuleGioto extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/gioto');

		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('gioto', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			//$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
				
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/gioto', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/gioto', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		$this->load->model('catalog/product');
	
		/*Mien Nam*/
		if (isset($this->request->post['khmngt_product'])) {
			$this->data['khmngt_product'] = $this->request->post['khmngt_product'];
		} else {
			$this->data['khmngt_product'] = $this->config->get('khmngt_product');
		}	
				
		if (isset($this->request->post['khmngt_product'])) {
			$khmngt_product = explode(',', $this->request->post['khmngt_product']);
		} else {		
			$khmngt_product = explode(',', $this->config->get('khmngt_product'));
		}
		
		$this->data['khmngt_product_box'] = array();
		
		foreach ($khmngt_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmngt_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Trung*/
		if (isset($this->request->post['khmtgt_product'])) {
			$this->data['khmtgt_product'] = $this->request->post['khmtgt_product'];
		} else {
			$this->data['khmtgt_product'] = $this->config->get('khmtgt_product');
		}	
				
		if (isset($this->request->post['khmtgt_product'])) {
			$khmtgt_product = explode(',', $this->request->post['khmtgt_product']);
		} else {		
			$khmtgt_product = explode(',', $this->config->get('khmtgt_product'));
		}
		
		$this->data['khmtgt_product_box'] = array();
		
		foreach ($khmtgt_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmtgt_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		/*Mien Bac*/
		if (isset($this->request->post['khmbgt_product'])) {
			$this->data['khmbgt_product'] = $this->request->post['khmbgt_product'];
		} else {
			$this->data['khmbgt_product'] = $this->config->get('khmbgt_product');
		}	
				
		if (isset($this->request->post['khmbgt_product'])) {
			$khmbgt_product = explode(',', $this->request->post['khmbgt_product']);
		} else {		
			$khmbgt_product = explode(',', $this->config->get('khmbgt_product'));
		}
		
		$this->data['khmbgt_product_box'] = array();
		
		foreach ($khmbgt_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmbgt_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		if (isset($this->request->post['gioto_customtitle'])) {
			$this->data['gioto_customtitle'] = $this->request->post['gioto_customtitle'];
		} else {
			$this->data['gioto_customtitle'] = $this->config->get('gioto_customtitle');
		}
		
		if (isset($this->request->post['gioto_title'])) {
			$this->data['gioto_title'] = $this->request->post['gioto_title'];
		} else {
			$this->data['gioto_title'] = $this->config->get('gioto_title');
		}
		
		if (isset($this->request->post['gioto_metakey'])) {
			$this->data['gioto_metakey'] = $this->request->post['gioto_metakey'];
		} else {
			$this->data['gioto_metakey'] = $this->config->get('gioto_metakey');
		}
		
		if (isset($this->request->post['gioto_metadesc'])) {
			$this->data['gioto_metadesc'] = $this->request->post['gioto_metadesc'];
		} else {
			$this->data['gioto_metadesc'] = $this->config->get('gioto_metadesc');
		}
		
		if (isset($this->request->post['gioto_desc'])) {
			$this->data['gioto_desc'] = $this->request->post['gioto_desc'];
		} else {
			$this->data['gioto_desc'] = $this->config->get('gioto_desc');
		}	
		
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/gioto.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/gioto')) {
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