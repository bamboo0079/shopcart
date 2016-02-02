<?php
class ControllerModuleKhtetamlich extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/khtetamlich');

		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('khtetamlich', $this->request->post);		
			
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
			'href'      => $this->url->link('module/khtetamlich', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/khtetamlich', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		$this->load->model('catalog/product');
	
		/*Mien Nam*/
		if (isset($this->request->post['khmntal_product'])) {
			$this->data['khmntal_product'] = $this->request->post['khmntal_product'];
		} else {
			$this->data['khmntal_product'] = $this->config->get('khmntal_product');
		}	
				
		if (isset($this->request->post['khmntal_product'])) {
			$khmntal_product = explode(',', $this->request->post['khmntal_product']);
		} else {		
			$khmntal_product = explode(',', $this->config->get('khmntal_product'));
		}
		
		$this->data['khmntal_product_box'] = array();
		
		foreach ($khmntal_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmntal_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Trung*/
		if (isset($this->request->post['khmttal_product'])) {
			$this->data['khmttal_product'] = $this->request->post['khmttal_product'];
		} else {
			$this->data['khmttal_product'] = $this->config->get('khmttal_product');
		}	
				
		if (isset($this->request->post['khmttal_product'])) {
			$khmttal_product = explode(',', $this->request->post['khmttal_product']);
		} else {		
			$khmttal_product = explode(',', $this->config->get('khmttal_product'));
		}
		
		$this->data['khmttal_product_box'] = array();
		
		foreach ($khmttal_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmttal_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		/*Mien Bac*/
		if (isset($this->request->post['khmbtal_product'])) {
			$this->data['khmbtal_product'] = $this->request->post['khmbtal_product'];
		} else {
			$this->data['khmbtal_product'] = $this->config->get('khmbtal_product');
		}	
				
		if (isset($this->request->post['khmbtal_product'])) {
			$khmbtal_product = explode(',', $this->request->post['khmbtal_product']);
		} else {		
			$khmbtal_product = explode(',', $this->config->get('khmbtal_product'));
		}
		
		$this->data['khmbtal_product_box'] = array();
		
		foreach ($khmbtal_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmbtal_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		if (isset($this->request->post['khtetamlich_customtitle'])) {
			$this->data['khtetamlich_customtitle'] = $this->request->post['khtetamlich_customtitle'];
		} else {
			$this->data['khtetamlich_customtitle'] = $this->config->get('khtetamlich_customtitle');
		}
		
		if (isset($this->request->post['khtetamlich_title'])) {
			$this->data['khtetamlich_title'] = $this->request->post['khtetamlich_title'];
		} else {
			$this->data['khtetamlich_title'] = $this->config->get('khtetamlich_title');
		}
		
		if (isset($this->request->post['khtetamlich_metakey'])) {
			$this->data['khtetamlich_metakey'] = $this->request->post['khtetamlich_metakey'];
		} else {
			$this->data['khtetamlich_metakey'] = $this->config->get('khtetamlich_metakey');
		}
		
		if (isset($this->request->post['khtetamlich_metadesc'])) {
			$this->data['khtetamlich_metadesc'] = $this->request->post['khtetamlich_metadesc'];
		} else {
			$this->data['khtetamlich_metadesc'] = $this->config->get('khtetamlich_metadesc');
		}
		
		if (isset($this->request->post['khtetamlich_desc'])) {
			$this->data['khtetamlich_desc'] = $this->request->post['khtetamlich_desc'];
		} else {
			$this->data['khtetamlich_desc'] = $this->config->get('khtetamlich_desc');
		}	
		
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/khtetamlich.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/khtetamlich')) {
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