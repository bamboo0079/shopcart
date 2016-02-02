<?php
class ControllerModuleEven29 extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/even29');

		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('even29', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('module/even29', 'token=' . $this->session->data['token'], 'SSL'));
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
			'href'      => $this->url->link('module/even29', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/even29', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		$this->load->model('catalog/product');
	
		/*Mien Nam 1ngay*/
		if (isset($this->request->post['khmsg1neven29_product'])) {
			$this->data['khmsg1neven29_product'] = $this->request->post['khmsg1neven29_product'];
		} else {
			$this->data['khmsg1neven29_product'] = $this->config->get('khmsg1neven29_product');
		}	
				
		if (isset($this->request->post['khmsg1neven29_product'])) {
			$khmsg1neven29_product = explode(',', $this->request->post['khmsg1neven29_product']);
		} else {		
			$khmsg1neven29_product = explode(',', $this->config->get('khmsg1neven29_product'));
		}
		
		$this->data['khmsg1neven29_product_box'] = array();
		
		foreach ($khmsg1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Nam 3 ngay*/
		if (isset($this->request->post['khmsg3neven29_product'])) {
			$this->data['khmsg3neven29_product'] = $this->request->post['khmsg3neven29_product'];
		} else {
			$this->data['khmsg3neven29_product'] = $this->config->get('khmsg3neven29_product');
		}	
				
		if (isset($this->request->post['khmsg3neven29_product'])) {
			$khmsg3neven29_product = explode(',', $this->request->post['khmsg3neven29_product']);
		} else {		
			$khmsg3neven29_product = explode(',', $this->config->get('khmsg3neven29_product'));
		}
		
		$this->data['khmsg3neven29_product_box'] = array();
		
		foreach ($khmsg3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Mien Nam 6 ngay tro len*/
		if (isset($this->request->post['khmsg6neven29_product'])) {
			$this->data['khmsg6neven29_product'] = $this->request->post['khmsg6neven29_product'];
		} else {
			$this->data['khmsg6neven29_product'] = $this->config->get('khmsg6neven29_product');
		}	
				
		if (isset($this->request->post['khmsg6neven29_product'])) {
			$khmsg6neven29_product = explode(',', $this->request->post['khmsg6neven29_product']);
		} else {		
			$khmsg6neven29_product = explode(',', $this->config->get('khmsg6neven29_product'));
		}
		
		$this->data['khmsg6neven29_product_box'] = array();
		
		foreach ($khmsg6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		// mien tay 
		/*Mien Nam 1ngay*/
		if (isset($this->request->post['khmmt1neven29_product'])) {
			$this->data['khmmt1neven29_product'] = $this->request->post['khmmt1neven29_product'];
		} else {
			$this->data['khmmt1neven29_product'] = $this->config->get('khmmt1neven29_product');
		}	
				
		if (isset($this->request->post['khmmt1neven29_product'])) {
			$khmmt1neven29_product = explode(',', $this->request->post['khmmt1neven29_product']);
		} else {		
			$khmmt1neven29_product = explode(',', $this->config->get('khmmt1neven29_product'));
		}
		
		$this->data['khmmt1neven29_product_box'] = array();
		
		foreach ($khmmt1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmmt1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Nam 3 ngay*/
		if (isset($this->request->post['khmmt3neven29_product'])) {
			$this->data['khmmt3neven29_product'] = $this->request->post['khmmt3neven29_product'];
		} else {
			$this->data['khmmt3neven29_product'] = $this->config->get('khmmt3neven29_product');
		}	
				
		if (isset($this->request->post['khmmt3neven29_product'])) {
			$khmmt3neven29_product = explode(',', $this->request->post['khmmt3neven29_product']);
		} else {		
			$khmmt3neven29_product = explode(',', $this->config->get('khmmt3neven29_product'));
		}
		
		$this->data['khmmt3neven29_product_box'] = array();
		
		foreach ($khmmt3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmmt3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Mien Nam 6 ngay tro len*/
		if (isset($this->request->post['khmmt6neven29_product'])) {
			$this->data['khmmt6neven29_product'] = $this->request->post['khmmt6neven29_product'];
		} else {
			$this->data['khmmt6neven29_product'] = $this->config->get('khmmt6neven29_product');
		}	
				
		if (isset($this->request->post['khmmt6neven29_product'])) {
			$khmmt6neven29_product = explode(',', $this->request->post['khmmt6neven29_product']);
		} else {		
			$khmmt6neven29_product = explode(',', $this->config->get('khmmt6neven29_product'));
		}
		
		$this->data['khmmt6neven29_product_box'] = array();
		
		foreach ($khmmt6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmmt6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		// end
		/*Vung tau 1ngay*/
		if (isset($this->request->post['khmvt1neven29_product'])) {
			$this->data['khmvt1neven29_product'] = $this->request->post['khmvt1neven29_product'];
		} else {
			$this->data['khmvt1neven29_product'] = $this->config->get('khmvt1neven29_product');
		}	
				
		if (isset($this->request->post['khmvt1neven29_product'])) {
			$khmvt1neven29_product = explode(',', $this->request->post['khmvt1neven29_product']);
		} else {		
			$khmvt1neven29_product = explode(',', $this->config->get('khmvt1neven29_product'));
		}
		
		$this->data['khmvt1neven29_product_box'] = array();
		
		foreach ($khmvt1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmvt1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*vt 3 ngay*/
		if (isset($this->request->post['khmvt3neven29_product'])) {
			$this->data['khmvt3neven29_product'] = $this->request->post['khmvt3neven29_product'];
		} else {
			$this->data['khmvt3neven29_product'] = $this->config->get('khmvt3neven29_product');
		}	
				
		if (isset($this->request->post['khmvt3neven29_product'])) {
			$khmvt3neven29_product = explode(',', $this->request->post['khmvt3neven29_product']);
		} else {		
			$khmvt3neven29_product = explode(',', $this->config->get('khmvt3neven29_product'));
		}
		
		$this->data['khmvt3neven29_product_box'] = array();
		
		foreach ($khmvt3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmvt3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*vt 6 ngay tro len*/
		if (isset($this->request->post['khmvt6neven29_product'])) {
			$this->data['khmvt6neven29_product'] = $this->request->post['khmvt6neven29_product'];
		} else {
			$this->data['khmvt6neven29_product'] = $this->config->get('khmvt6neven29_product');
		}	
				
		if (isset($this->request->post['khmvt6neven29_product'])) {
			$khmvt6neven29_product = explode(',', $this->request->post['khmvt6neven29_product']);
		} else {		
			$khmvt6neven29_product = explode(',', $this->config->get('khmvt6neven29_product'));
		}
		
		$this->data['khmvt6neven29_product_box'] = array();
		
		foreach ($khmvt6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmvt6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Phú Quốc 1 - 2 ngày*/
		if (isset($this->request->post['khmpq1neven29_product'])) {
			$this->data['khmpq1neven29_product'] = $this->request->post['khmpq1neven29_product'];
		} else {
			$this->data['khmpq1neven29_product'] = $this->config->get('khmpq1neven29_product');
		}	
				
		if (isset($this->request->post['khmpq1neven29_product'])) {
			$khmpq1neven29_product = explode(',', $this->request->post['khmpq1neven29_product']);
		} else {		
			$khmpq1neven29_product = explode(',', $this->config->get('khmpq1neven29_product'));
		}
		
		$this->data['khmpq1neven29_product_box'] = array();
		
		foreach ($khmpq1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Phú Quốc 3 ngày*/
		if (isset($this->request->post['khmpq3neven29_product'])) {
			$this->data['khmpq3neven29_product'] = $this->request->post['khmpq3neven29_product'];
		} else {
			$this->data['khmpq3neven29_product'] = $this->config->get('khmpq3neven29_product');
		}	
				
		if (isset($this->request->post['khmpq3neven29_product'])) {
			$khmpq3neven29_product = explode(',', $this->request->post['khmpq3neven29_product']);
		} else {		
			$khmpq3neven29_product = explode(',', $this->config->get('khmpq3neven29_product'));
		}
		
		$this->data['khmpq3neven29_product_box'] = array();
		
		foreach ($khmpq3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Phú Quốc 6 ngày*/
		if (isset($this->request->post['khmpq6neven29_product'])) {
			$this->data['khmpq6neven29_product'] = $this->request->post['khmpq6neven29_product'];
		} else {
			$this->data['khmpq6neven29_product'] = $this->config->get('khmpq6neven29_product');
		}	
				
		if (isset($this->request->post['khmpq6neven29_product'])) {
			$khmpq6neven29_product = explode(',', $this->request->post['khmpq6neven29_product']);
		} else {		
			$khmpq6neven29_product = explode(',', $this->config->get('khmpq6neven29_product'));
		}
		
		$this->data['khmpq6neven29_product_box'] = array();
		
		foreach ($khmpq6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/*Phan Thiết 1n*/
		if (isset($this->request->post['khmpt1neven29_product'])) {
			$this->data['khmpt1neven29_product'] = $this->request->post['khmpt1neven29_product'];
		} else {
			$this->data['khmpt1neven29_product'] = $this->config->get('khmpt1neven29_product');
		}	
				
		if (isset($this->request->post['khmpt1neven29_product'])) {
			$khmpt1neven29_product = explode(',', $this->request->post['khmpt1neven29_product']);
		} else {		
			$khmpt1neven29_product = explode(',', $this->config->get('khmpt1neven29_product'));
		}
		
		$this->data['khmpt1neven29_product_box'] = array();
		
		foreach ($khmpt1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Phan Thiết 3n*/
		if (isset($this->request->post['khmpt3neven29_product'])) {
			$this->data['khmpt3neven29_product'] = $this->request->post['khmpt3neven29_product'];
		} else {
			$this->data['khmpt3neven29_product'] = $this->config->get('khmpt3neven29_product');
		}	
				
		if (isset($this->request->post['khmpt3neven29_product'])) {
			$khmpt3neven29_product = explode(',', $this->request->post['khmpt3neven29_product']);
		} else {		
			$khmpt3neven29_product = explode(',', $this->config->get('khmpt3neven29_product'));
		}
		
		$this->data['khmpt3neven29_product_box'] = array();
		
		foreach ($khmpt3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*Phan Thiết 6n tro len*/
		if (isset($this->request->post['khmpt6neven29_product'])) {
			$this->data['khmpt6neven29_product'] = $this->request->post['khmpt6neven29_product'];
		} else {
			$this->data['khmpt6neven29_product'] = $this->config->get('khmpt6neven29_product');
		}	
				
		if (isset($this->request->post['khmpt6neven29_product'])) {
			$khmpt6neven29_product = explode(',', $this->request->post['khmpt6neven29_product']);
		} else {		
			$khmpt6neven29_product = explode(',', $this->config->get('khmpt6neven29_product'));
		}
		
		$this->data['khmpt6neven29_product_box'] = array();
		
		foreach ($khmpt6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*da lat 1n*/
		if (isset($this->request->post['khmdl1neven29_product'])) {
			$this->data['khmdl1neven29_product'] = $this->request->post['khmdl1neven29_product'];
		} else {
			$this->data['khmdl1neven29_product'] = $this->config->get('khmdl1neven29_product');
		}	
				
		if (isset($this->request->post['khmdl1neven29_product'])) {
			$khmdl1neven29_product = explode(',', $this->request->post['khmdl1neven29_product']);
		} else {		
			$khmdl1neven29_product = explode(',', $this->config->get('khmdl1neven29_product'));
		}
		
		$this->data['khmdl1neven29_product_box'] = array();
		
		foreach ($khmdl1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdl1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*dl 3n*/
		if (isset($this->request->post['khmdl3neven29_product'])) {
			$this->data['khmdl3neven29_product'] = $this->request->post['khmdl3neven29_product'];
		} else {
			$this->data['khmdl3neven29_product'] = $this->config->get('khmdl3neven29_product');
		}	
				
		if (isset($this->request->post['khmdl3neven29_product'])) {
			$khmdl3neven29_product = explode(',', $this->request->post['khmdl3neven29_product']);
		} else {		
			$khmdl3neven29_product = explode(',', $this->config->get('khmdl3neven29_product'));
		}
		
		$this->data['khmdl3neven29_product_box'] = array();
		
		foreach ($khmdl3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdl3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*dl 6n tro len*/
		if (isset($this->request->post['khmdl6neven29_product'])) {
			$this->data['khmdl6neven29_product'] = $this->request->post['khmdl6neven29_product'];
		} else {
			$this->data['khmdl6neven29_product'] = $this->config->get('khmdl6neven29_product');
		}	
				
		if (isset($this->request->post['khmdl6neven29_product'])) {
			$khmdl6neven29_product = explode(',', $this->request->post['khmdl6neven29_product']);
		} else {		
			$khmdl6neven29_product = explode(',', $this->config->get('khmdl6neven29_product'));
		}
		
		$this->data['khmdl6neven29_product_box'] = array();
		
		foreach ($khmdl6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdl6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*nha trang 1n*/
		if (isset($this->request->post['khmnt1neven29_product'])) {
			$this->data['khmnt1neven29_product'] = $this->request->post['khmnt1neven29_product'];
		} else {
			$this->data['khmnt1neven29_product'] = $this->config->get('khmnt1neven29_product');
		}	
				
		if (isset($this->request->post['khmnt1neven29_product'])) {
			$khmnt1neven29_product = explode(',', $this->request->post['khmnt1neven29_product']);
		} else {		
			$khmnt1neven29_product = explode(',', $this->config->get('khmnt1neven29_product'));
		}
		
		$this->data['khmnt1neven29_product_box'] = array();
		
		foreach ($khmnt1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmnt1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*nt 3n*/
		if (isset($this->request->post['khmnt3neven29_product'])) {
			$this->data['khmnt3neven29_product'] = $this->request->post['khmnt3neven29_product'];
		} else {
			$this->data['khmnt3neven29_product'] = $this->config->get('khmnt3neven29_product');
		}	
				
		if (isset($this->request->post['khmnt3neven29_product'])) {
			$khmnt3neven29_product = explode(',', $this->request->post['khmnt3neven29_product']);
		} else {		
			$khmnt3neven29_product = explode(',', $this->config->get('khmnt3neven29_product'));
		}
		
		$this->data['khmnt3neven29_product_box'] = array();
		
		foreach ($khmnt3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmnt3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*nt 6n tro len*/
		if (isset($this->request->post['khmnt6neven29_product'])) {
			$this->data['khmnt6neven29_product'] = $this->request->post['khmnt6neven29_product'];
		} else {
			$this->data['khmnt6neven29_product'] = $this->config->get('khmnt6neven29_product');
		}	
				
		if (isset($this->request->post['khmnt6neven29_product'])) {
			$khmnt6neven29_product = explode(',', $this->request->post['khmnt6neven29_product']);
		} else {		
			$khmnt6neven29_product = explode(',', $this->config->get('khmnt6neven29_product'));
		}
		
		$this->data['khmnt6neven29_product_box'] = array();
		
		foreach ($khmnt6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmnt6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}						
		/* Đà Nẵng 1 -2 ngày*/
		if (isset($this->request->post['khmdn1neven29_product'])) {
			$this->data['khmdn1neven29_product'] = $this->request->post['khmdn1neven29_product'];
		} else {
			$this->data['khmdn1neven29_product'] = $this->config->get('khmdn1neven29_product');
		}	
				
		if (isset($this->request->post['khmdn1neven29_product'])) {
			$khmdn1neven29_product = explode(',', $this->request->post['khmdn1neven29_product']);
		} else {		
			$khmdn1neven29_product = explode(',', $this->config->get('khmdn1neven29_product'));
		}
		
		$this->data['khmdn1neven29_product_box'] = array();
		
		foreach ($khmdn1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Đà Nẵng 3 ngày*/
		if (isset($this->request->post['khmdn3neven29_product'])) {
			$this->data['khmdn3neven29_product'] = $this->request->post['khmdn3neven29_product'];
		} else {
			$this->data['khmdn3neven29_product'] = $this->config->get('khmdn3neven29_product');
		}	
				
		if (isset($this->request->post['khmdn3neven29_product'])) {
			$khmdn3neven29_product = explode(',', $this->request->post['khmdn3neven29_product']);
		} else {		
			$khmdn3neven29_product = explode(',', $this->config->get('khmdn3neven29_product'));
		}
		
		$this->data['khmdn3neven29_product_box'] = array();
		
		foreach ($khmdn3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Đà Nẵng 6 ngày*/
		if (isset($this->request->post['khmdn6neven29_product'])) {
			$this->data['khmdn6neven29_product'] = $this->request->post['khmdn6neven29_product'];
		} else {
			$this->data['khmdn6neven29_product'] = $this->config->get('khmdn6neven29_product');
		}	
				
		if (isset($this->request->post['khmdn6neven29_product'])) {
			$khmdn6neven29_product = explode(',', $this->request->post['khmdn6neven29_product']);
		} else {		
			$khmdn6neven29_product = explode(',', $this->config->get('khmdn6neven29_product'));
		}
		
		$this->data['khmdn6neven29_product_box'] = array();
		
		foreach ($khmdn6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		
		/* Hội an 1 -2 ngày*/
		if (isset($this->request->post['khmha1neven29_product'])) {
			$this->data['khmha1neven29_product'] = $this->request->post['khmha1neven29_product'];
		} else {
			$this->data['khmha1neven29_product'] = $this->config->get('khmha1neven29_product');
		}	
				
		if (isset($this->request->post['khmha1neven29_product'])) {
			$khmha1neven29_product = explode(',', $this->request->post['khmha1neven29_product']);
		} else {		
			$khmha1neven29_product = explode(',', $this->config->get('khmha1neven29_product'));
		}
		
		$this->data['khmha1neven29_product_box'] = array();
		
		foreach ($khmha1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmha1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* HA 3 ngày*/
		if (isset($this->request->post['khmha3neven29_product'])) {
			$this->data['khmha3neven29_product'] = $this->request->post['khmha3neven29_product'];
		} else {
			$this->data['khmha3neven29_product'] = $this->config->get('khmha3neven29_product');
		}	
				
		if (isset($this->request->post['khmha3neven29_product'])) {
			$khmha3neven29_product = explode(',', $this->request->post['khmha3neven29_product']);
		} else {		
			$khmha3neven29_product = explode(',', $this->config->get('khmha3neven29_product'));
		}
		
		$this->data['khmha3neven29_product_box'] = array();
		
		foreach ($khmha3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmha3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* HA 6 ngày*/
		if (isset($this->request->post['khmha6neven29_product'])) {
			$this->data['khmha6neven29_product'] = $this->request->post['khmha6neven29_product'];
		} else {
			$this->data['khmha6neven29_product'] = $this->config->get('khmha6neven29_product');
		}	
				
		if (isset($this->request->post['khmha6neven29_product'])) {
			$khmha6neven29_product = explode(',', $this->request->post['khmha6neven29_product']);
		} else {		
			$khmha6neven29_product = explode(',', $this->config->get('khmha6neven29_product'));
		}
		
		$this->data['khmha6neven29_product_box'] = array();
		
		foreach ($khmha6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmha6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Huế 1 -2 ngày*/
		if (isset($this->request->post['khmhue1neven29_product'])) {
			$this->data['khmhue1neven29_product'] = $this->request->post['khmhue1neven29_product'];
		} else {
			$this->data['khmhue1neven29_product'] = $this->config->get('khmhue1neven29_product');
		}	
				
		if (isset($this->request->post['khmhue1neven29_product'])) {
			$khmhue1neven29_product = explode(',', $this->request->post['khmhue1neven29_product']);
		} else {		
			$khmhue1neven29_product = explode(',', $this->config->get('khmhue1neven29_product'));
		}
		
		$this->data['khmhue1neven29_product_box'] = array();
		
		foreach ($khmhue1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhue1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Huế 3 ngày*/
		if (isset($this->request->post['khmhue3neven29_product'])) {
			$this->data['khmhue3neven29_product'] = $this->request->post['khmhue3neven29_product'];
		} else {
			$this->data['khmhue3neven29_product'] = $this->config->get('khmhue3neven29_product');
		}	
				
		if (isset($this->request->post['khmhue3neven29_product'])) {
			$khmhue3neven29_product = explode(',', $this->request->post['khmhue3neven29_product']);
		} else {		
			$khmhue3neven29_product = explode(',', $this->config->get('khmhue3neven29_product'));
		}
		
		$this->data['khmhue3neven29_product_box'] = array();
		
		foreach ($khmhue3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhue3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Huế 6 ngày*/
		if (isset($this->request->post['khmhue6neven29_product'])) {
			$this->data['khmhue6neven29_product'] = $this->request->post['khmhue6neven29_product'];
		} else {
			$this->data['khmhue6neven29_product'] = $this->config->get('khmhue6neven29_product');
		}	
				
		if (isset($this->request->post['khmhue6neven29_product'])) {
			$khmhue6neven29_product = explode(',', $this->request->post['khmhue6neven29_product']);
		} else {		
			$khmhue6neven29_product = explode(',', $this->config->get('khmhue6neven29_product'));
		}
		
		$this->data['khmhue6neven29_product_box'] = array();
		
		foreach ($khmhue6neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhue6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 1 - 2 ngày*/
		if (isset($this->request->post['khmhn1neven29_product'])) {
			$this->data['khmhn1neven29_product'] = $this->request->post['khmhn1neven29_product'];
		} else {
			$this->data['khmhn1neven29_product'] = $this->config->get('khmhn1neven29_product');
		}	
				
		if (isset($this->request->post['khmhn1neven29_product'])) {
			$khmhn1neven29_product = explode(',', $this->request->post['khmhn1neven29_product']);
		} else {		
			$khmhn1neven29_product = explode(',', $this->config->get('khmhn1neven29_product'));
		}
		
		$this->data['khmhn1neven29_product_box'] = array();
		
		foreach ($khmhn1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 3 ngày*/
		if (isset($this->request->post['khmhn3neven29_product'])) {
			$this->data['khmhn3neven29_product'] = $this->request->post['khmhn3neven29_product'];
		} else {
			$this->data['khmhn3neven29_product'] = $this->config->get('khmhn3neven29_product');
		}	
				
		if (isset($this->request->post['khmhn3neven29_product'])) {
			$khmhn3neven29_product = explode(',', $this->request->post['khmhn3neven29_product']);
		} else {		
			$khmhn3neven29_product = explode(',', $this->config->get('khmhn3neven29_product'));
		}
		
		$this->data['khmhn3neven29_product_box'] = array();
		
		foreach ($khmhn3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 6 ngày*/
		if (isset($this->request->post['khmhn6neven29_product'])) {
			$this->data['khmhn6neven29_product'] = $this->request->post['khmhn6neven29_product'];
		} else {
			$this->data['khmhn6neven29_product'] = $this->config->get('khmhn6neven29_product');
		}	
				
		if (isset($this->request->post['khmhn6neven29_product'])) {
			$khmhn6neven29_product = explode(',', $this->request->post['khmhn6neven29_product']);
		} else {		
			$khmhn6neven29_product = explode(',', $this->config->get('khmhn6neven29_product'));
		}
		
		$this->data['khmhn6neven29_product_box'] = array();
		
		foreach ($khmhn3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hạ long 1 - 2 ngày*/
		if (isset($this->request->post['khmhl1neven29_product'])) {
			$this->data['khmhl1neven29_product'] = $this->request->post['khmhl1neven29_product'];
		} else {
			$this->data['khmhl1neven29_product'] = $this->config->get('khmhl1neven29_product');
		}	
				
		if (isset($this->request->post['khmhl1neven29_product'])) {
			$khmhl1neven29_product = explode(',', $this->request->post['khmhl1neven29_product']);
		} else {		
			$khmhl1neven29_product = explode(',', $this->config->get('khmhl1neven29_product'));
		}
		
		$this->data['khmhl1neven29_product_box'] = array();
		
		foreach ($khmhl1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhl1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hạ long 3 ngày*/
		if (isset($this->request->post['khmhl3neven29_product'])) {
			$this->data['khmhl3neven29_product'] = $this->request->post['khmhl3neven29_product'];
		} else {
			$this->data['khmhl3neven29_product'] = $this->config->get('khmhl3neven29_product');
		}	
				
		if (isset($this->request->post['khmhl3neven29_product'])) {
			$khmhl3neven29_product = explode(',', $this->request->post['khmhl3neven29_product']);
		} else {		
			$khmhl3neven29_product = explode(',', $this->config->get('khmhl3neven29_product'));
		}
		
		$this->data['khmhl3neven29_product_box'] = array();
		
		foreach ($khmhl3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhl3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* ha long 6 ngày*/
		if (isset($this->request->post['khmhl6neven29_product'])) {
			$this->data['khmhl6neven29_product'] = $this->request->post['khmhl6neven29_product'];
		} else {
			$this->data['khmhl6neven29_product'] = $this->config->get('khmhl6neven29_product');
		}	
				
		if (isset($this->request->post['khmhl6neven29_product'])) {
			$khmhl6neven29_product = explode(',', $this->request->post['khmhl6neven29_product']);
		} else {		
			$khmhl6neven29_product = explode(',', $this->config->get('khmhl6neven29_product'));
		}
		
		$this->data['khmhl6neven29_product_box'] = array();
		
		foreach ($khmhl3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhl6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* sa pa 1 - 2 ngày*/
		if (isset($this->request->post['khmsp1neven29_product'])) {
			$this->data['khmsp1neven29_product'] = $this->request->post['khmsp1neven29_product'];
		} else {
			$this->data['khmsp1neven29_product'] = $this->config->get('khmsp1neven29_product');
		}	
				
		if (isset($this->request->post['khmsp1neven29_product'])) {
			$khmsp1neven29_product = explode(',', $this->request->post['khmsp1neven29_product']);
		} else {		
			$khmsp1neven29_product = explode(',', $this->config->get('khmsp1neven29_product'));
		}
		
		$this->data['khmsp1neven29_product_box'] = array();
		
		foreach ($khmsp1neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsp1neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* sa pa 3 ngày*/
		if (isset($this->request->post['khmsp3neven29_product'])) {
			$this->data['khmsp3neven29_product'] = $this->request->post['khmsp3neven29_product'];
		} else {
			$this->data['khmsp3neven29_product'] = $this->config->get('khmsp3neven29_product');
		}	
				
		if (isset($this->request->post['khmsp3neven29_product'])) {
			$khmsp3neven29_product = explode(',', $this->request->post['khmsp3neven29_product']);
		} else {		
			$khmsp3neven29_product = explode(',', $this->config->get('khmsp3neven29_product'));
		}
		
		$this->data['khmsp3neven29_product_box'] = array();
		
		foreach ($khmsp3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsp3neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* sa pa 6 ngày*/
		if (isset($this->request->post['khmsp6neven29_product'])) {
			$this->data['khmsp6neven29_product'] = $this->request->post['khmsp6neven29_product'];
		} else {
			$this->data['khmsp6neven29_product'] = $this->config->get('khmsp6neven29_product');
		}	
				
		if (isset($this->request->post['khmsp6neven29_product'])) {
			$khmsp6neven29_product = explode(',', $this->request->post['khmsp6neven29_product']);
		} else {		
			$khmsp6neven29_product = explode(',', $this->config->get('khmsp6neven29_product'));
		}
		
		$this->data['khmsp6neven29_product_box'] = array();
		
		foreach ($khmsp3neven29_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsp6neven29_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		if (isset($this->request->post['even29_customtitle'])) {
			$this->data['even29_customtitle'] = $this->request->post['even29_customtitle'];
		} else {
			$this->data['even29_customtitle'] = $this->config->get('even29_customtitle');
		}
		
		if (isset($this->request->post['even29_title'])) {
			$this->data['even29_title'] = $this->request->post['even29_title'];
		} else {
			$this->data['even29_title'] = $this->config->get('even29_title');
		}
		
		if (isset($this->request->post['even29_metakey'])) {
			$this->data['even29_metakey'] = $this->request->post['even29_metakey'];
		} else {
			$this->data['even29_metakey'] = $this->config->get('even29_metakey');
		}
		
		if (isset($this->request->post['even29_metadesc'])) {
			$this->data['even29_metadesc'] = $this->request->post['even29_metadesc'];
		} else {
			$this->data['even29_metadesc'] = $this->config->get('even29_metadesc');
		}
		
		if (isset($this->request->post['even29_desc'])) {
			$this->data['even29_desc'] = $this->request->post['even29_desc'];
		} else {
			$this->data['even29_desc'] = $this->config->get('even29_desc');
		}	
		
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/even29.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/even29')) {
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