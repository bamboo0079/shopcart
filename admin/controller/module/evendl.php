<?php
class ControllerModuleEvendl extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/evendl');

		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('evendl', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('module/evendl', 'token=' . $this->session->data['token'], 'SSL'));
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
			'href'      => $this->url->link('module/evendl', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/evendl', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		$this->load->model('catalog/product');
	
		/*Mien Nam 1ngay*/
		if (isset($this->request->post['khmsg1nevendl_product'])) {
			$this->data['khmsg1nevendl_product'] = $this->request->post['khmsg1nevendl_product'];
		} else {
			$this->data['khmsg1nevendl_product'] = $this->config->get('khmsg1nevendl_product');
		}	
				
		if (isset($this->request->post['khmsg1nevendl_product'])) {
			$khmsg1nevendl_product = explode(',', $this->request->post['khmsg1nevendl_product']);
		} else {		
			$khmsg1nevendl_product = explode(',', $this->config->get('khmsg1nevendl_product'));
		}
		
		$this->data['khmsg1nevendl_product_box'] = array();
		
		foreach ($khmsg1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Nam 3 ngay*/
		if (isset($this->request->post['khmsg3nevendl_product'])) {
			$this->data['khmsg3nevendl_product'] = $this->request->post['khmsg3nevendl_product'];
		} else {
			$this->data['khmsg3nevendl_product'] = $this->config->get('khmsg3nevendl_product');
		}	
				
		if (isset($this->request->post['khmsg3nevendl_product'])) {
			$khmsg3nevendl_product = explode(',', $this->request->post['khmsg3nevendl_product']);
		} else {		
			$khmsg3nevendl_product = explode(',', $this->config->get('khmsg3nevendl_product'));
		}
		
		$this->data['khmsg3nevendl_product_box'] = array();
		
		foreach ($khmsg3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Mien Nam 6 ngay tro len*/
		if (isset($this->request->post['khmsg6nevendl_product'])) {
			$this->data['khmsg6nevendl_product'] = $this->request->post['khmsg6nevendl_product'];
		} else {
			$this->data['khmsg6nevendl_product'] = $this->config->get('khmsg6nevendl_product');
		}	
				
		if (isset($this->request->post['khmsg6nevendl_product'])) {
			$khmsg6nevendl_product = explode(',', $this->request->post['khmsg6nevendl_product']);
		} else {		
			$khmsg6nevendl_product = explode(',', $this->config->get('khmsg6nevendl_product'));
		}
		
		$this->data['khmsg6nevendl_product_box'] = array();
		
		foreach ($khmsg6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsg6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		// mien tay 
		/*Mien Nam 1ngay*/
		if (isset($this->request->post['khmmt1nevendl_product'])) {
			$this->data['khmmt1nevendl_product'] = $this->request->post['khmmt1nevendl_product'];
		} else {
			$this->data['khmmt1nevendl_product'] = $this->config->get('khmmt1nevendl_product');
		}	
				
		if (isset($this->request->post['khmmt1nevendl_product'])) {
			$khmmt1nevendl_product = explode(',', $this->request->post['khmmt1nevendl_product']);
		} else {		
			$khmmt1nevendl_product = explode(',', $this->config->get('khmmt1nevendl_product'));
		}
		
		$this->data['khmmt1nevendl_product_box'] = array();
		
		foreach ($khmmt1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmmt1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*Mien Nam 3 ngay*/
		if (isset($this->request->post['khmmt3nevendl_product'])) {
			$this->data['khmmt3nevendl_product'] = $this->request->post['khmmt3nevendl_product'];
		} else {
			$this->data['khmmt3nevendl_product'] = $this->config->get('khmmt3nevendl_product');
		}	
				
		if (isset($this->request->post['khmmt3nevendl_product'])) {
			$khmmt3nevendl_product = explode(',', $this->request->post['khmmt3nevendl_product']);
		} else {		
			$khmmt3nevendl_product = explode(',', $this->config->get('khmmt3nevendl_product'));
		}
		
		$this->data['khmmt3nevendl_product_box'] = array();
		
		foreach ($khmmt3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmmt3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Mien Nam 6 ngay tro len*/
		if (isset($this->request->post['khmmt6nevendl_product'])) {
			$this->data['khmmt6nevendl_product'] = $this->request->post['khmmt6nevendl_product'];
		} else {
			$this->data['khmmt6nevendl_product'] = $this->config->get('khmmt6nevendl_product');
		}	
				
		if (isset($this->request->post['khmmt6nevendl_product'])) {
			$khmmt6nevendl_product = explode(',', $this->request->post['khmmt6nevendl_product']);
		} else {		
			$khmmt6nevendl_product = explode(',', $this->config->get('khmmt6nevendl_product'));
		}
		
		$this->data['khmmt6nevendl_product_box'] = array();
		
		foreach ($khmmt6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmmt6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		// end
		/*Vung tau 1ngay*/
		if (isset($this->request->post['khmvt1nevendl_product'])) {
			$this->data['khmvt1nevendl_product'] = $this->request->post['khmvt1nevendl_product'];
		} else {
			$this->data['khmvt1nevendl_product'] = $this->config->get('khmvt1nevendl_product');
		}	
				
		if (isset($this->request->post['khmvt1nevendl_product'])) {
			$khmvt1nevendl_product = explode(',', $this->request->post['khmvt1nevendl_product']);
		} else {		
			$khmvt1nevendl_product = explode(',', $this->config->get('khmvt1nevendl_product'));
		}
		
		$this->data['khmvt1nevendl_product_box'] = array();
		
		foreach ($khmvt1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmvt1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}		
		
		
		/*vt 3 ngay*/
		if (isset($this->request->post['khmvt3nevendl_product'])) {
			$this->data['khmvt3nevendl_product'] = $this->request->post['khmvt3nevendl_product'];
		} else {
			$this->data['khmvt3nevendl_product'] = $this->config->get('khmvt3nevendl_product');
		}	
				
		if (isset($this->request->post['khmvt3nevendl_product'])) {
			$khmvt3nevendl_product = explode(',', $this->request->post['khmvt3nevendl_product']);
		} else {		
			$khmvt3nevendl_product = explode(',', $this->config->get('khmvt3nevendl_product'));
		}
		
		$this->data['khmvt3nevendl_product_box'] = array();
		
		foreach ($khmvt3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmvt3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*vt 6 ngay tro len*/
		if (isset($this->request->post['khmvt6nevendl_product'])) {
			$this->data['khmvt6nevendl_product'] = $this->request->post['khmvt6nevendl_product'];
		} else {
			$this->data['khmvt6nevendl_product'] = $this->config->get('khmvt6nevendl_product');
		}	
				
		if (isset($this->request->post['khmvt6nevendl_product'])) {
			$khmvt6nevendl_product = explode(',', $this->request->post['khmvt6nevendl_product']);
		} else {		
			$khmvt6nevendl_product = explode(',', $this->config->get('khmvt6nevendl_product'));
		}
		
		$this->data['khmvt6nevendl_product_box'] = array();
		
		foreach ($khmvt6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmvt6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Phú Quốc 1 - 2 ngày*/
		if (isset($this->request->post['khmpq1nevendl_product'])) {
			$this->data['khmpq1nevendl_product'] = $this->request->post['khmpq1nevendl_product'];
		} else {
			$this->data['khmpq1nevendl_product'] = $this->config->get('khmpq1nevendl_product');
		}	
				
		if (isset($this->request->post['khmpq1nevendl_product'])) {
			$khmpq1nevendl_product = explode(',', $this->request->post['khmpq1nevendl_product']);
		} else {		
			$khmpq1nevendl_product = explode(',', $this->config->get('khmpq1nevendl_product'));
		}
		
		$this->data['khmpq1nevendl_product_box'] = array();
		
		foreach ($khmpq1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Phú Quốc 3 ngày*/
		if (isset($this->request->post['khmpq3nevendl_product'])) {
			$this->data['khmpq3nevendl_product'] = $this->request->post['khmpq3nevendl_product'];
		} else {
			$this->data['khmpq3nevendl_product'] = $this->config->get('khmpq3nevendl_product');
		}	
				
		if (isset($this->request->post['khmpq3nevendl_product'])) {
			$khmpq3nevendl_product = explode(',', $this->request->post['khmpq3nevendl_product']);
		} else {		
			$khmpq3nevendl_product = explode(',', $this->config->get('khmpq3nevendl_product'));
		}
		
		$this->data['khmpq3nevendl_product_box'] = array();
		
		foreach ($khmpq3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Phú Quốc 6 ngày*/
		if (isset($this->request->post['khmpq6nevendl_product'])) {
			$this->data['khmpq6nevendl_product'] = $this->request->post['khmpq6nevendl_product'];
		} else {
			$this->data['khmpq6nevendl_product'] = $this->config->get('khmpq6nevendl_product');
		}	
				
		if (isset($this->request->post['khmpq6nevendl_product'])) {
			$khmpq6nevendl_product = explode(',', $this->request->post['khmpq6nevendl_product']);
		} else {		
			$khmpq6nevendl_product = explode(',', $this->config->get('khmpq6nevendl_product'));
		}
		
		$this->data['khmpq6nevendl_product_box'] = array();
		
		foreach ($khmpq6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpq6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/*Phan Thiết 1n*/
		if (isset($this->request->post['khmpt1nevendl_product'])) {
			$this->data['khmpt1nevendl_product'] = $this->request->post['khmpt1nevendl_product'];
		} else {
			$this->data['khmpt1nevendl_product'] = $this->config->get('khmpt1nevendl_product');
		}	
				
		if (isset($this->request->post['khmpt1nevendl_product'])) {
			$khmpt1nevendl_product = explode(',', $this->request->post['khmpt1nevendl_product']);
		} else {		
			$khmpt1nevendl_product = explode(',', $this->config->get('khmpt1nevendl_product'));
		}
		
		$this->data['khmpt1nevendl_product_box'] = array();
		
		foreach ($khmpt1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*Phan Thiết 3n*/
		if (isset($this->request->post['khmpt3nevendl_product'])) {
			$this->data['khmpt3nevendl_product'] = $this->request->post['khmpt3nevendl_product'];
		} else {
			$this->data['khmpt3nevendl_product'] = $this->config->get('khmpt3nevendl_product');
		}	
				
		if (isset($this->request->post['khmpt3nevendl_product'])) {
			$khmpt3nevendl_product = explode(',', $this->request->post['khmpt3nevendl_product']);
		} else {		
			$khmpt3nevendl_product = explode(',', $this->config->get('khmpt3nevendl_product'));
		}
		
		$this->data['khmpt3nevendl_product_box'] = array();
		
		foreach ($khmpt3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*Phan Thiết 6n tro len*/
		if (isset($this->request->post['khmpt6nevendl_product'])) {
			$this->data['khmpt6nevendl_product'] = $this->request->post['khmpt6nevendl_product'];
		} else {
			$this->data['khmpt6nevendl_product'] = $this->config->get('khmpt6nevendl_product');
		}	
				
		if (isset($this->request->post['khmpt6nevendl_product'])) {
			$khmpt6nevendl_product = explode(',', $this->request->post['khmpt6nevendl_product']);
		} else {		
			$khmpt6nevendl_product = explode(',', $this->config->get('khmpt6nevendl_product'));
		}
		
		$this->data['khmpt6nevendl_product_box'] = array();
		
		foreach ($khmpt6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmpt6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*da lat 1n*/
		if (isset($this->request->post['khmdl1nevendl_product'])) {
			$this->data['khmdl1nevendl_product'] = $this->request->post['khmdl1nevendl_product'];
		} else {
			$this->data['khmdl1nevendl_product'] = $this->config->get('khmdl1nevendl_product');
		}	
				
		if (isset($this->request->post['khmdl1nevendl_product'])) {
			$khmdl1nevendl_product = explode(',', $this->request->post['khmdl1nevendl_product']);
		} else {		
			$khmdl1nevendl_product = explode(',', $this->config->get('khmdl1nevendl_product'));
		}
		
		$this->data['khmdl1nevendl_product_box'] = array();
		
		foreach ($khmdl1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdl1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*dl 3n*/
		if (isset($this->request->post['khmdl3nevendl_product'])) {
			$this->data['khmdl3nevendl_product'] = $this->request->post['khmdl3nevendl_product'];
		} else {
			$this->data['khmdl3nevendl_product'] = $this->config->get('khmdl3nevendl_product');
		}	
				
		if (isset($this->request->post['khmdl3nevendl_product'])) {
			$khmdl3nevendl_product = explode(',', $this->request->post['khmdl3nevendl_product']);
		} else {		
			$khmdl3nevendl_product = explode(',', $this->config->get('khmdl3nevendl_product'));
		}
		
		$this->data['khmdl3nevendl_product_box'] = array();
		
		foreach ($khmdl3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdl3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*dl 6n tro len*/
		if (isset($this->request->post['khmdl6nevendl_product'])) {
			$this->data['khmdl6nevendl_product'] = $this->request->post['khmdl6nevendl_product'];
		} else {
			$this->data['khmdl6nevendl_product'] = $this->config->get('khmdl6nevendl_product');
		}	
				
		if (isset($this->request->post['khmdl6nevendl_product'])) {
			$khmdl6nevendl_product = explode(',', $this->request->post['khmdl6nevendl_product']);
		} else {		
			$khmdl6nevendl_product = explode(',', $this->config->get('khmdl6nevendl_product'));
		}
		
		$this->data['khmdl6nevendl_product_box'] = array();
		
		foreach ($khmdl6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdl6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*nha trang 1n*/
		if (isset($this->request->post['khmnt1nevendl_product'])) {
			$this->data['khmnt1nevendl_product'] = $this->request->post['khmnt1nevendl_product'];
		} else {
			$this->data['khmnt1nevendl_product'] = $this->config->get('khmnt1nevendl_product');
		}	
				
		if (isset($this->request->post['khmnt1nevendl_product'])) {
			$khmnt1nevendl_product = explode(',', $this->request->post['khmnt1nevendl_product']);
		} else {		
			$khmnt1nevendl_product = explode(',', $this->config->get('khmnt1nevendl_product'));
		}
		
		$this->data['khmnt1nevendl_product_box'] = array();
		
		foreach ($khmnt1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmnt1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}	
		/*nt 3n*/
		if (isset($this->request->post['khmnt3nevendl_product'])) {
			$this->data['khmnt3nevendl_product'] = $this->request->post['khmnt3nevendl_product'];
		} else {
			$this->data['khmnt3nevendl_product'] = $this->config->get('khmnt3nevendl_product');
		}	
				
		if (isset($this->request->post['khmnt3nevendl_product'])) {
			$khmnt3nevendl_product = explode(',', $this->request->post['khmnt3nevendl_product']);
		} else {		
			$khmnt3nevendl_product = explode(',', $this->config->get('khmnt3nevendl_product'));
		}
		
		$this->data['khmnt3nevendl_product_box'] = array();
		
		foreach ($khmnt3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmnt3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/*nt 6n tro len*/
		if (isset($this->request->post['khmnt6nevendl_product'])) {
			$this->data['khmnt6nevendl_product'] = $this->request->post['khmnt6nevendl_product'];
		} else {
			$this->data['khmnt6nevendl_product'] = $this->config->get('khmnt6nevendl_product');
		}	
				
		if (isset($this->request->post['khmnt6nevendl_product'])) {
			$khmnt6nevendl_product = explode(',', $this->request->post['khmnt6nevendl_product']);
		} else {		
			$khmnt6nevendl_product = explode(',', $this->config->get('khmnt6nevendl_product'));
		}
		
		$this->data['khmnt6nevendl_product_box'] = array();
		
		foreach ($khmnt6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmnt6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}						
		/* Đà Nẵng 1 -2 ngày*/
		if (isset($this->request->post['khmdn1nevendl_product'])) {
			$this->data['khmdn1nevendl_product'] = $this->request->post['khmdn1nevendl_product'];
		} else {
			$this->data['khmdn1nevendl_product'] = $this->config->get('khmdn1nevendl_product');
		}	
				
		if (isset($this->request->post['khmdn1nevendl_product'])) {
			$khmdn1nevendl_product = explode(',', $this->request->post['khmdn1nevendl_product']);
		} else {		
			$khmdn1nevendl_product = explode(',', $this->config->get('khmdn1nevendl_product'));
		}
		
		$this->data['khmdn1nevendl_product_box'] = array();
		
		foreach ($khmdn1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Đà Nẵng 3 ngày*/
		if (isset($this->request->post['khmdn3nevendl_product'])) {
			$this->data['khmdn3nevendl_product'] = $this->request->post['khmdn3nevendl_product'];
		} else {
			$this->data['khmdn3nevendl_product'] = $this->config->get('khmdn3nevendl_product');
		}	
				
		if (isset($this->request->post['khmdn3nevendl_product'])) {
			$khmdn3nevendl_product = explode(',', $this->request->post['khmdn3nevendl_product']);
		} else {		
			$khmdn3nevendl_product = explode(',', $this->config->get('khmdn3nevendl_product'));
		}
		
		$this->data['khmdn3nevendl_product_box'] = array();
		
		foreach ($khmdn3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Đà Nẵng 6 ngày*/
		if (isset($this->request->post['khmdn6nevendl_product'])) {
			$this->data['khmdn6nevendl_product'] = $this->request->post['khmdn6nevendl_product'];
		} else {
			$this->data['khmdn6nevendl_product'] = $this->config->get('khmdn6nevendl_product');
		}	
				
		if (isset($this->request->post['khmdn6nevendl_product'])) {
			$khmdn6nevendl_product = explode(',', $this->request->post['khmdn6nevendl_product']);
		} else {		
			$khmdn6nevendl_product = explode(',', $this->config->get('khmdn6nevendl_product'));
		}
		
		$this->data['khmdn6nevendl_product_box'] = array();
		
		foreach ($khmdn6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmdn6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		
		/* Hội an 1 -2 ngày*/
		if (isset($this->request->post['khmha1nevendl_product'])) {
			$this->data['khmha1nevendl_product'] = $this->request->post['khmha1nevendl_product'];
		} else {
			$this->data['khmha1nevendl_product'] = $this->config->get('khmha1nevendl_product');
		}	
				
		if (isset($this->request->post['khmha1nevendl_product'])) {
			$khmha1nevendl_product = explode(',', $this->request->post['khmha1nevendl_product']);
		} else {		
			$khmha1nevendl_product = explode(',', $this->config->get('khmha1nevendl_product'));
		}
		
		$this->data['khmha1nevendl_product_box'] = array();
		
		foreach ($khmha1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmha1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* HA 3 ngày*/
		if (isset($this->request->post['khmha3nevendl_product'])) {
			$this->data['khmha3nevendl_product'] = $this->request->post['khmha3nevendl_product'];
		} else {
			$this->data['khmha3nevendl_product'] = $this->config->get('khmha3nevendl_product');
		}	
				
		if (isset($this->request->post['khmha3nevendl_product'])) {
			$khmha3nevendl_product = explode(',', $this->request->post['khmha3nevendl_product']);
		} else {		
			$khmha3nevendl_product = explode(',', $this->config->get('khmha3nevendl_product'));
		}
		
		$this->data['khmha3nevendl_product_box'] = array();
		
		foreach ($khmha3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmha3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* HA 6 ngày*/
		if (isset($this->request->post['khmha6nevendl_product'])) {
			$this->data['khmha6nevendl_product'] = $this->request->post['khmha6nevendl_product'];
		} else {
			$this->data['khmha6nevendl_product'] = $this->config->get('khmha6nevendl_product');
		}	
				
		if (isset($this->request->post['khmha6nevendl_product'])) {
			$khmha6nevendl_product = explode(',', $this->request->post['khmha6nevendl_product']);
		} else {		
			$khmha6nevendl_product = explode(',', $this->config->get('khmha6nevendl_product'));
		}
		
		$this->data['khmha6nevendl_product_box'] = array();
		
		foreach ($khmha6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmha6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}

		/* Huế 1 -2 ngày*/
		if (isset($this->request->post['khmhue1nevendl_product'])) {
			$this->data['khmhue1nevendl_product'] = $this->request->post['khmhue1nevendl_product'];
		} else {
			$this->data['khmhue1nevendl_product'] = $this->config->get('khmhue1nevendl_product');
		}	
				
		if (isset($this->request->post['khmhue1nevendl_product'])) {
			$khmhue1nevendl_product = explode(',', $this->request->post['khmhue1nevendl_product']);
		} else {		
			$khmhue1nevendl_product = explode(',', $this->config->get('khmhue1nevendl_product'));
		}
		
		$this->data['khmhue1nevendl_product_box'] = array();
		
		foreach ($khmhue1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhue1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Huế 3 ngày*/
		if (isset($this->request->post['khmhue3nevendl_product'])) {
			$this->data['khmhue3nevendl_product'] = $this->request->post['khmhue3nevendl_product'];
		} else {
			$this->data['khmhue3nevendl_product'] = $this->config->get('khmhue3nevendl_product');
		}	
				
		if (isset($this->request->post['khmhue3nevendl_product'])) {
			$khmhue3nevendl_product = explode(',', $this->request->post['khmhue3nevendl_product']);
		} else {		
			$khmhue3nevendl_product = explode(',', $this->config->get('khmhue3nevendl_product'));
		}
		
		$this->data['khmhue3nevendl_product_box'] = array();
		
		foreach ($khmhue3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhue3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Huế 6 ngày*/
		if (isset($this->request->post['khmhue6nevendl_product'])) {
			$this->data['khmhue6nevendl_product'] = $this->request->post['khmhue6nevendl_product'];
		} else {
			$this->data['khmhue6nevendl_product'] = $this->config->get('khmhue6nevendl_product');
		}	
				
		if (isset($this->request->post['khmhue6nevendl_product'])) {
			$khmhue6nevendl_product = explode(',', $this->request->post['khmhue6nevendl_product']);
		} else {		
			$khmhue6nevendl_product = explode(',', $this->config->get('khmhue6nevendl_product'));
		}
		
		$this->data['khmhue6nevendl_product_box'] = array();
		
		foreach ($khmhue6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhue6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 1 - 2 ngày*/
		if (isset($this->request->post['khmhn1nevendl_product'])) {
			$this->data['khmhn1nevendl_product'] = $this->request->post['khmhn1nevendl_product'];
		} else {
			$this->data['khmhn1nevendl_product'] = $this->config->get('khmhn1nevendl_product');
		}	
				
		if (isset($this->request->post['khmhn1nevendl_product'])) {
			$khmhn1nevendl_product = explode(',', $this->request->post['khmhn1nevendl_product']);
		} else {		
			$khmhn1nevendl_product = explode(',', $this->config->get('khmhn1nevendl_product'));
		}
		
		$this->data['khmhn1nevendl_product_box'] = array();
		
		foreach ($khmhn1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 3 ngày*/
		if (isset($this->request->post['khmhn3nevendl_product'])) {
			$this->data['khmhn3nevendl_product'] = $this->request->post['khmhn3nevendl_product'];
		} else {
			$this->data['khmhn3nevendl_product'] = $this->config->get('khmhn3nevendl_product');
		}	
				
		if (isset($this->request->post['khmhn3nevendl_product'])) {
			$khmhn3nevendl_product = explode(',', $this->request->post['khmhn3nevendl_product']);
		} else {		
			$khmhn3nevendl_product = explode(',', $this->config->get('khmhn3nevendl_product'));
		}
		
		$this->data['khmhn3nevendl_product_box'] = array();
		
		foreach ($khmhn3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hà Nội 6 ngày*/
		if (isset($this->request->post['khmhn6nevendl_product'])) {
			$this->data['khmhn6nevendl_product'] = $this->request->post['khmhn6nevendl_product'];
		} else {
			$this->data['khmhn6nevendl_product'] = $this->config->get('khmhn6nevendl_product');
		}	
				
		if (isset($this->request->post['khmhn6nevendl_product'])) {
			$khmhn6nevendl_product = explode(',', $this->request->post['khmhn6nevendl_product']);
		} else {		
			$khmhn6nevendl_product = explode(',', $this->config->get('khmhn6nevendl_product'));
		}
		
		$this->data['khmhn6nevendl_product_box'] = array();
		
		foreach ($khmhn6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhn6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hạ long 1 - 2 ngày*/
		if (isset($this->request->post['khmhl1nevendl_product'])) {
			$this->data['khmhl1nevendl_product'] = $this->request->post['khmhl1nevendl_product'];
		} else {
			$this->data['khmhl1nevendl_product'] = $this->config->get('khmhl1nevendl_product');
		}	
				
		if (isset($this->request->post['khmhl1nevendl_product'])) {
			$khmhl1nevendl_product = explode(',', $this->request->post['khmhl1nevendl_product']);
		} else {		
			$khmhl1nevendl_product = explode(',', $this->config->get('khmhl1nevendl_product'));
		}
		
		$this->data['khmhl1nevendl_product_box'] = array();
		
		foreach ($khmhl1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhl1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* Hạ long 3 ngày*/
		if (isset($this->request->post['khmhl3nevendl_product'])) {
			$this->data['khmhl3nevendl_product'] = $this->request->post['khmhl3nevendl_product'];
		} else {
			$this->data['khmhl3nevendl_product'] = $this->config->get('khmhl3nevendl_product');
		}	
				
		if (isset($this->request->post['khmhl3nevendl_product'])) {
			$khmhl3nevendl_product = explode(',', $this->request->post['khmhl3nevendl_product']);
		} else {		
			$khmhl3nevendl_product = explode(',', $this->config->get('khmhl3nevendl_product'));
		}
		
		$this->data['khmhl3nevendl_product_box'] = array();
		
		foreach ($khmhl3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhl3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* ha long 6 ngày*/
		if (isset($this->request->post['khmhl6nevendl_product'])) {
			$this->data['khmhl6nevendl_product'] = $this->request->post['khmhl6nevendl_product'];
		} else {
			$this->data['khmhl6nevendl_product'] = $this->config->get('khmhl6nevendl_product');
		}	
				
		if (isset($this->request->post['khmhl6nevendl_product'])) {
			$khmhl6nevendl_product = explode(',', $this->request->post['khmhl6nevendl_product']);
		} else {		
			$khmhl6nevendl_product = explode(',', $this->config->get('khmhl6nevendl_product'));
		}
		
		$this->data['khmhl6nevendl_product_box'] = array();
		
		foreach ($khmhl6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmhl6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* sa pa 1 - 2 ngày*/
		if (isset($this->request->post['khmsp1nevendl_product'])) {
			$this->data['khmsp1nevendl_product'] = $this->request->post['khmsp1nevendl_product'];
		} else {
			$this->data['khmsp1nevendl_product'] = $this->config->get('khmsp1nevendl_product');
		}	
				
		if (isset($this->request->post['khmsp1nevendl_product'])) {
			$khmsp1nevendl_product = explode(',', $this->request->post['khmsp1nevendl_product']);
		} else {		
			$khmsp1nevendl_product = explode(',', $this->config->get('khmsp1nevendl_product'));
		}
		
		$this->data['khmsp1nevendl_product_box'] = array();
		
		foreach ($khmsp1nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsp1nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* sa pa 3 ngày*/
		if (isset($this->request->post['khmsp3nevendl_product'])) {
			$this->data['khmsp3nevendl_product'] = $this->request->post['khmsp3nevendl_product'];
		} else {
			$this->data['khmsp3nevendl_product'] = $this->config->get('khmsp3nevendl_product');
		}	
				
		if (isset($this->request->post['khmsp3nevendl_product'])) {
			$khmsp3nevendl_product = explode(',', $this->request->post['khmsp3nevendl_product']);
		} else {		
			$khmsp3nevendl_product = explode(',', $this->config->get('khmsp3nevendl_product'));
		}
		
		$this->data['khmsp3nevendl_product_box'] = array();
		
		foreach ($khmsp3nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsp3nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		/* sa pa 6 ngày*/
		if (isset($this->request->post['khmsp6nevendl_product'])) {
			$this->data['khmsp6nevendl_product'] = $this->request->post['khmsp6nevendl_product'];
		} else {
			$this->data['khmsp6nevendl_product'] = $this->config->get('khmsp6nevendl_product');
		}	
				
		if (isset($this->request->post['khmsp6nevendl_product'])) {
			$khmsp6nevendl_product = explode(',', $this->request->post['khmsp6nevendl_product']);
		} else {		
			$khmsp6nevendl_product = explode(',', $this->config->get('khmsp6nevendl_product'));
		}
		
		$this->data['khmsp6nevendl_product_box'] = array();
		
		foreach ($khmsp6nevendl_product as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['khmsp6nevendl_product_box'][] = array(
					'product_id' => $product_info['product_id'],
					'model'       => $product_info['model'],
					'name'       => $product_info['name']
				);
			}
		}
		if (isset($this->request->post['evendl_customtitle'])) {
			$this->data['evendl_customtitle'] = $this->request->post['evendl_customtitle'];
		} else {
			$this->data['evendl_customtitle'] = $this->config->get('evendl_customtitle');
		}
		
		if (isset($this->request->post['evendl_title'])) {
			$this->data['evendl_title'] = $this->request->post['evendl_title'];
		} else {
			$this->data['evendl_title'] = $this->config->get('evendl_title');
		}
		
		if (isset($this->request->post['evendl_metakey'])) {
			$this->data['evendl_metakey'] = $this->request->post['evendl_metakey'];
		} else {
			$this->data['evendl_metakey'] = $this->config->get('evendl_metakey');
		}
		
		if (isset($this->request->post['evendl_metadesc'])) {
			$this->data['evendl_metadesc'] = $this->request->post['evendl_metadesc'];
		} else {
			$this->data['evendl_metadesc'] = $this->config->get('evendl_metadesc');
		}
		
		if (isset($this->request->post['evendl_desc'])) {
			$this->data['evendl_desc'] = $this->request->post['evendl_desc'];
		} else {
			$this->data['evendl_desc'] = $this->config->get('evendl_desc');
		}	
		
		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/evendl.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/evendl')) {
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