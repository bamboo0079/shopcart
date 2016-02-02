<?php
class ControllerModuleFeaturedBottom extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->language->load('module/featured_bottom'); 
		
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
		
		$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
		$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
		}
		
		
		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$this->data['text_category_featured_bottom'] = $this->config->get('featured_bottom_text_product');
		$this->data['text_category_featured_bottom1'] = $this->config->get('featured_bottom_text_product1');
		
		
		//featured_bottom_product
		$this->data['products'] = array();
		
		$products = explode(',', $this->config->get('featured_bottom_product'));
		
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
					'name'    	 => $product_info['name'],
					'start_time'    	 => $product_info['start_time'],
					'departure'    	 => $product_info['departure'],
					'location_from'    	 => $product_info['location_from'],
					'transport'    	 => $product_info['transport'],
					'duration'    	 => $product_info['duration'],
					'schedule'    	 => $product_info['schedule'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product',  $custom_link . '&product_id=' . $product_info['product_id'])
				);
			}
		}
		
		
		//featured_bottom_product1
		$this->data['products1'] = array();
		
		$products1 = explode(',', $this->config->get('featured_bottom_product1'));
		
		$products1 = array_slice($products1, 0, (int)$setting['limit']);
		
		foreach ($products1 as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->onesize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}


				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $product_info['price'] != 0) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
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
					'name'    	 => $product_info['name'],
					'start_time'    	 => $product_info['start_time'],
					'departure'    	 => $product_info['departure'],
					'location_from'    	 => $product_info['location_from'],
					'transport'    	 => $product_info['transport'],
					'duration'    	 => $product_info['duration'],
					'schedule'    	 => $product_info['schedule'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product',  $custom_link . '&product_id=' . $product_info['product_id'])
				);
			}
		}
		
		
		$this->load->model('catalog/news');
		
		$this->load->model('catalog/news_comment');
		
		$this->data['news'] = array();
		
		$data = array(
			'sort'  => 'n.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 10
		);

		$results = $this->model_catalog_news->getNewss($data);
		$count = 0;
		foreach ($results as $result) {
			$width = ''; $height = '';
			if ($result['image']) {
				$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$firstImgnews = catchFirstImage(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
				if($firstImgnews == 'no_image.jpg'){
					$image = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				}else{
					$image = $firstImgnews; $width = 'width="'.$this->config->get('config_image_product_width').'"'; $height = 'height="'.$this->config->get('config_image_product_height').'"';
				}					
			}
			
			if (empty($result['short_description'])) {
				$short_description = cutString(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 45);
			}else{
				$short_description = cutString(nl2br($result['short_description']), 45);
			}
			$count_comment = $this->model_catalog_news_comment->getTotalCommentsByNewsId($result['news_id']); 
			$comment = sprintf($this->language->get('text_comment'), (int)$count_comment);
					
			$this->data['news'][] = array(
				'news_id'  => $result['news_id'],
				'thumb'       => $image,
				'name'        => ($count > 1)?cutString($result['name'],10):$result['name'],
				'full_name'        => $result['name'],
				'short_description'       => $short_description,
				'date_added'       => date('D, '.$this->language->get('date_format_short'), strtotime($result['date_added'])),	
				'comment'       =>  $comment,							
				'width'      => $width, 
				'height'      => $height, 	
				'viewed'      => sprintf($this->language->get('text_viewed'), (int)$result['viewed']), 
				'href'        => $this->url->link('news/news', 'news_id=' . $result['news_id'])
			);
			$count++;
		}
		
		$this->data['module'] = $module++; 
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured_bottom.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured_bottom.tpl';
		} else {
			$this->template = 'default/template/module/featured_bottom.tpl';
		}

		$this->render();
	}
}
?>