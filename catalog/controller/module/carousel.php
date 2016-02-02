<?php  
class ControllerModuleCarousel extends Controller {
	protected function index($setting) {
		static $module = 0;
		$this->load->model('catalog/product'); 
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->data['button_view_more'] = $this->language->get('button_view_more');

		$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
		}

		$this->data['limit'] = $setting['limit'];
		$this->data['scroll'] = $setting['scroll'];
		
		//featured_product1
		$this->data['products'] = array();
		
		$products1 = explode(',', $this->config->get('carousel_product'));
		
		$products1 = array_slice($products1, 0, (int)$setting['limit']);
		
		foreach ($products1 as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->onesize($product_info['image'], $setting['width'], $setting['height']);
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
					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $product_info['product_id'])
				);
			}
		}
		

		$this->data['module'] = $module++; 

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/carousel.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/carousel.tpl';
		} else {
			$this->template = 'default/template/module/carousel.tpl';
		}

		$this->render(); 
	}
	
}
?>