<?php
class ControllerModuleFeaturedMedium extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured_medium'); 
		
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_duration'] = $this->language->get('entry_duration');
		$this->data['entry_departure'] = $this->language->get('entry_departure');
		$this->data['entry_location_from'] = $this->language->get('entry_location_from');
		$this->data['entry_transport'] = $this->language->get('entry_transport');
		$this->data['entry_start_time'] = $this->language->get('entry_start_time');
		$this->data['entry_schedule'] = $this->language->get('entry_schedule');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');
		
		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$this->data['text_category_featured_medium'] = $this->config->get('featured_medium_text_product');
		$this->data['text_category_featured_medium1'] = $this->config->get('featured_medium_text_product1');
		$this->data['text_category_featured_medium2'] = $this->config->get('featured_medium_text_product2');
		
		$this->data['text_featured_medium_why'] = html_entity_decode($this->config->get('featured_medium_why'), ENT_QUOTES, 'UTF-8');
		$this->data['text_featured_medium_camket'] = html_entity_decode($this->config->get('featured_medium_camket'), ENT_QUOTES, 'UTF-8');
		
		
		//featured_medium_product
		$this->data['products'] = array();
		
		$products = explode(',', $this->config->get('featured_medium_product'));
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->onesize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ((float)$product_info['special1']) {
					$special1 = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special1 = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				if(isset($product_info['custom_link'])){
					$custom_link = '&path=' . $product_info['custom_link'];
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'model'    	 => $product_info['model'],
					'name'    	 => cutString($product_info['name'],20),
					'full_name'    	 => $product_info['name'],
					'start_time'    	 => $product_info['start_time'],
					'departure'    	 => $product_info['departure'],
					'location_from'    	 => $product_info['location_from'],
					'transport'    	 => $product_info['transport'],
					'duration'    	 => $product_info['duration'],
					'schedule'    	 => $product_info['schedule'],
					'price'   	 => $price,
					'special' 	 => $special,
					'special1' 	 => $special1,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $product_info['product_id'])
				);
			}
		}
		
		//featured_medium_product1
		$this->data['products1'] = array();
		
		$products1 = explode(',', $this->config->get('featured_medium_product1'));
		
		$products1 = array_slice($products1, 0, (int)$setting['limit']);
		
		foreach ($products1 as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->onesize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ((float)$product_info['special1']) {
					$special1 = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special1 = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				if(isset($product_info['custom_link'])){
					$custom_link = '&path=' . $product_info['custom_link'];
				}
					
				$this->data['products1'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'model'    	 => $product_info['model'],
					'name'    	 => cutString($product_info['name'],20),
					'full_name'    	 => $product_info['name'],
					'start_time'    	 => $product_info['start_time'],
					'departure'    	 => $product_info['departure'],
					'location_from'    	 => $product_info['location_from'],
					'transport'    	 => $product_info['transport'],
					'duration'    	 => $product_info['duration'],
					'schedule'    	 => $product_info['schedule'],
					'price'   	 => $price,
					'special' 	 => $special,
					'special1' 	 => $special1,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $product_info['product_id'])
				);
			}
		}
		
		//featured_medium_product2
		$this->data['products2'] = array();
		
		$products2 = explode(',', $this->config->get('featured_medium_product2'));
		
		$products2 = array_slice($products2, 0, (int)$setting['limit']);
		
		foreach ($products2 as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->onesize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ((float)$product_info['special1']) {
					$special1 = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special1 = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				if(isset($product_info['custom_link'])){
					$custom_link = '&path=' . $product_info['custom_link'];
				}
					
				$this->data['products2'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'model'    	 => $product_info['model'],
					'name'    	 => cutString($product_info['name'],20),
					'full_name'    	 => $product_info['name'],
					'start_time'    	 => $product_info['start_time'],
					'departure'    	 => $product_info['departure'],
					'location_from'    	 => $product_info['location_from'],
					'transport'    	 => $product_info['transport'],
					'duration'    	 => $product_info['duration'],
					'schedule'    	 => $product_info['schedule'],
					'price'   	 => $price,
					'special' 	 => $special,
					'special1' 	 => $special1,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product',  $custom_link . '&product_id=' . $product_info['product_id'])
				);
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured_medium.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured_medium.tpl';
		} else {
			$this->template = 'default/template/module/featured_medium.tpl';
		}

		$this->render();
	}
}
?>