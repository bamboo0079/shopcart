<?php
class ControllerModuleHe extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/he');

		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('he', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('module/he', 'token=' . $this->session->data['token'], 'SSL'));
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
			'href'      => $this->url->link('module/he', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/he', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		$this->load->model('catalog/product');
	
		/*Mien Nam 1ngay*/
		if (isset($this->request->post['khmsg1nhe_product'])) {
			$this->data['khmsg1nhe_product'] = $this->request->post['khmsg1nhe_product'];
		} else {
			$this->data['khmsg1nhe_product'] = $this->config->get('khmsg1nhe_product');
		}	
				
		if (isset($this->request->post['khmsg1nhe_product'])) {
			$khmsg1nhe_product = explode(',', $this->request->post['khmsg1nhe-product']);
		} else {		
			$khmsg1nhe_product = explode(',', $this->config->get('khmsg1nhe_product'));
		}
		
		$this->data['khmsg1nhe_product_box'] = array();
		
		foreach ($khmsg1nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg1nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Nam 3 ngay*/
		if (isset($this->request->post['khmsg3nhe_product'])) {
			$this->data['khmsg3nhe_product'] = $this->request->post['khmsg3nhe_product'];
		} else {
			$this->data['khmsg3nhe_product'] = $this->config->get('khmsg3nhe_product');
		}	
				
		if (isset($this->request->post['khmsg3nhe_product'])) {
			$khmsg3nhe_product = explode(',', $this->request->post['khmsg3nhe_product']);
		} else {		
			$khmsg3nhe_product = explode(',', $this->config->get('khmsg3nhe_product'));
		}
		
		$this->data['khmsg3nhe_product_box'] = array();
		
		foreach ($khmsg3nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg3nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		
		/*Phan Thiết 1n*/
		if (isset($this->request->post['khmpt1nhe_product'])) {
			$this->data['khmpt1nhe_product'] = $this->request->post['khmpt1nhe_product'];
		} else {
			$this->data['khmpt1nhe_product'] = $this->config->get('khmpt1nhe_product');
		}	
				
		if (isset($this->request->post['khmpt1nhe_product'])) {
			$khmpt1nhe_product = explode(',', $this->request->post['khmpt1nhe_product']);
		} else {		
			$khmpt1nhe_product = explode(',', $this->config->get('khmpt1nhe_product'));
		}
		
		$this->data['khmpt1nhe_product_box'] = array();
		
		foreach ($khmpt1nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt1nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Phan Thiết 3n*/
		if (isset($this->request->post['khmpt3nhe_product'])) {
			$this->data['khmpt3nhe_product'] = $this->request->post['khmpt3nhe_product'];
		} else {
			$this->data['khmpt3nhe_product'] = $this->config->get('khmpt3nhe_product');
		}	
				
		if (isset($this->request->post['khmpt3nhe_product'])) {
			$khmpt3nhe_product = explode(',', $this->request->post['khmpt3nhe_product']);
		} else {		
			$khmpt3nhe_product = explode(',', $this->config->get('khmpt3nhe_product'));
		}
		
		$this->data['khmpt3nhe_product_box'] = array();
		
		foreach ($khmpt3nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt3nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		/* Đà Nẵng 1 -2 ngày*/
		if (isset($this->request->post['khmdn1nhe_product'])) {
			$this->data['khmdn1nhe_product'] = $this->request->post['khmdn1nhe_product'];
		} else {
			$this->data['khmdn1nhe_product'] = $this->config->get('khmdn1nhe_product');
		}	
				
		if (isset($this->request->post['khmdn1nhe_product'])) {
			$khmdn1nhe_product = explode(',', $this->request->post['khmdn1nhe_product']);
		} else {		
			$khmdn1nhe_product = explode(',', $this->config->get('khmdn1nhe_product'));
		}
		
		$this->data['khmdn1nhe_product_box'] = array();
		
		foreach ($khmdn1nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn1nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Đà Nẵng 3 ngày*/
		if (isset($this->request->post['khmdn3nhe_product'])) {
			$this->data['khmdn3nhe_product'] = $this->request->post['khmdn3nhe_product'];
		} else {
			$this->data['khmdn3nhe_product'] = $this->config->get('khmdn3nhe_product');
		}	
				
		if (isset($this->request->post['khmdn3nhe_product'])) {
			$khmdn3nhe_product = explode(',', $this->request->post['khmdn3nhe_product']);
		} else {		
			$khmdn3nhe_product = explode(',', $this->config->get('khmdn3nhe_product'));
		}
		
		$this->data['khmdn3nhe_product_box'] = array();
		
		foreach ($khmdn3nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn3nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		
		/* Hà Nội 1 - 2 ngày*/
		if (isset($this->request->post['khmhn1nhe_product'])) {
			$this->data['khmhn1nhe_product'] = $this->request->post['khmhn1nhe_product'];
		} else {
			$this->data['khmhn1nhe_product'] = $this->config->get('khmhn1nhe_product');
		}	
				
		if (isset($this->request->post['khmhn1nhe_product'])) {
			$khmhn1nhe_product = explode(',', $this->request->post['khmhn1nhe_product']);
		} else {		
			$khmhn1nhe_product = explode(',', $this->config->get('khmhn1nhe_product'));
		}
		
		$this->data['khmhn1nhe_product_box'] = array();
		
		foreach ($khmhn1nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn1nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 3 ngày*/
		if (isset($this->request->post['khmhn3nhe_product'])) {
			$this->data['khmhn3nhe_product'] = $this->request->post['khmhn3nhe_product'];
		} else {
			$this->data['khmhn3nhe_product'] = $this->config->get('khmhn3nhe_product');
		}	
				
		if (isset($this->request->post['khmhn3nhe_product'])) {
			$khmhn3nhe_product = explode(',', $this->request->post['khmhn3nhe_product']);
		} else {		
			$khmhn3nhe_product = explode(',', $this->config->get('khmhn3nhe_product'));
		}
		
		$this->data['khmhn3nhe_product_box'] = array();
		
		foreach ($khmhn3nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn3nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Phú Quốc 1 - 2 ngày*/
		if (isset($this->request->post['khmpq1nhe_product'])) {
			$this->data['khmpq1nhe_product'] = $this->request->post['khmpq1nhe_product'];
		} else {
			$this->data['khmpq1nhe_product'] = $this->config->get('khmpq1nhe_product');
		}	
				
		if (isset($this->request->post['khmpq1nhe_product'])) {
			$khmpq1nhe_product = explode(',', $this->request->post['khmpq1nhe_product']);
		} else {		
			$khmpq1nhe_product = explode(',', $this->config->get('khmpq1nhe_product'));
		}
		
		$this->data['khmpq1nhe_product_box'] = array();
		
		foreach ($khmpq1nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq1nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Phú Quốc 3 ngày*/
		if (isset($this->request->post['khmpq3nhe_product'])) {
			$this->data['khmpq3nhe_product'] = $this->request->post['khmpq3nhe_product'];
		} else {
			$this->data['khmpq3nhe_product'] = $this->config->get('khmpq3nhe_product');
		}	
				
		if (isset($this->request->post['khmpq3nhe_product'])) {
			$khmpq3nhe_product = explode(',', $this->request->post['khmpq3nhe_product']);
		} else {		
			$khmpq3nhe_product = explode(',', $this->config->get('khmpq3nhe_product'));
		}
		
		$this->data['khmpq3nhe_product_box'] = array();
		
		foreach ($khmpq3nhe_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq3nhe_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		if (isset($this->request->post['he_customtitle'])) {
			$this->data['he_customtitle'] = $this->request->post['he_customtitle'];
		} else {
			$this->data['he_customtitle'] = $this->config->get('he_customtitle');
		}
		
		if (isset($this->request->post['he_title'])) {
			$this->data['he_title'] = $this->request->post['he_title'];
		} else {
			$this->data['he_title'] = $this->config->get('he_title');
		}
		
		if (isset($this->request->post['he_metakey'])) {
			$this->data['he_metakey'] = $this->request->post['he_metakey'];
		} else {
			$this->data['he_metakey'] = $this->config->get('he_metakey');
		}
		
		if (isset($this->request->post['he_metadesc'])) {
			$this->data['he_metadesc'] = $this->request->post['he_metadesc'];
		} else {
			$this->data['he_metadesc'] = $this->config->get('he_metadesc');
		}
		
		if (isset($this->request->post['he_desc'])) {
			$this->data['he_desc'] = $this->request->post['he_desc'];
		} else {
			$this->data['he_desc'] = $this->config->get('he_desc');
		}	
		
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/he.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/he')) {
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