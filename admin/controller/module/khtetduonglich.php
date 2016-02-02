<?php
class ControllerModuleKhtetduonglich extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/khtetduonglich');

		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('khtetduonglich', $this->request->post);		
			
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
			'href'      => $this->url->link('module/khtetduonglich', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/khtetduonglich', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		$this->load->model('catalog/product');
	
		/*Mien Nam*/
		if (isset($this->request->post['khmntdl_product'])) {
			$this->data['khmntdl_product'] = $this->request->post['khmntdl_product'];
		} else {
			$this->data['khmntdl_product'] = $this->config->get('khmntdl_product');
		}	
				
		if (isset($this->request->post['khmntdl_product'])) {
			$khmntdl_product = explode(',', $this->request->post['khmntdl_product']);
		} else {		
			$khmntdl_product = explode(',', $this->config->get('khmntdl_product'));
		}
		
		$this->data['khmntdl_product_box'] = array();
		
		foreach ($khmntdl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmntdl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Trung*/
		if (isset($this->request->post['khmttdl_product'])) {
			$this->data['khmttdl_product'] = $this->request->post['khmttdl_product'];
		} else {
			$this->data['khmttdl_product'] = $this->config->get('khmttdl_product');
		}	
				
		if (isset($this->request->post['khmttdl_product'])) {
			$khmttdl_product = explode(',', $this->request->post['khmttdl_product']);
		} else {		
			$khmttdl_product = explode(',', $this->config->get('khmttdl_product'));
		}
		
		$this->data['khmttdl_product_box'] = array();
		
		foreach ($khmttdl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmttdl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		/*Mien Bac*/
		if (isset($this->request->post['khmbtdl_product'])) {
			$this->data['khmbtdl_product'] = $this->request->post['khmbtdl_product'];
		} else {
			$this->data['khmbtdl_product'] = $this->config->get('khmbtdl_product');
		}	
				
		if (isset($this->request->post['khmbtdl_product'])) {
			$khmbtdl_product = explode(',', $this->request->post['khmbtdl_product']);
		} else {		
			$khmbtdl_product = explode(',', $this->config->get('khmbtdl_product'));
		}
		
		$this->data['khmbtdl_product_box'] = array();
		
		foreach ($khmbtdl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmbtdl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		if (isset($this->request->post['khtetduonglich_customtitle'])) {
			$this->data['khtetduonglich_customtitle'] = $this->request->post['khtetduonglich_customtitle'];
		} else {
			$this->data['khtetduonglich_customtitle'] = $this->config->get('khtetduonglich_customtitle');
		}
		
		if (isset($this->request->post['khtetduonglich_title'])) {
			$this->data['khtetduonglich_title'] = $this->request->post['khtetduonglich_title'];
		} else {
			$this->data['khtetduonglich_title'] = $this->config->get('khtetduonglich_title');
		}
		
		if (isset($this->request->post['khtetduonglich_metakey'])) {
			$this->data['khtetduonglich_metakey'] = $this->request->post['khtetduonglich_metakey'];
		} else {
			$this->data['khtetduonglich_metakey'] = $this->config->get('khtetduonglich_metakey');
		}
		
		if (isset($this->request->post['khtetduonglich_metadesc'])) {
			$this->data['khtetduonglich_metadesc'] = $this->request->post['khtetduonglich_metadesc'];
		} else {
			$this->data['khtetduonglich_metadesc'] = $this->config->get('khtetduonglich_metadesc');
		}
		
		if (isset($this->request->post['khtetduonglich_desc'])) {
			$this->data['khtetduonglich_desc'] = $this->request->post['khtetduonglich_desc'];
		} else {
			$this->data['khtetduonglich_desc'] = $this->config->get('khtetduonglich_desc');
		}	
		
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/khtetduonglich.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/khtetduonglich')) {
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