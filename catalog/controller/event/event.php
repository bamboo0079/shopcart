<?php 
	class ControllerEventEvent extends Controller {
		public function index(){			
			$this->language->load('promotion/duonglich');
			$this->load->model('catalog/product');
			$this->load->model('catalog/tag');
			$this->load->model('tool/image');
			$this->load->model('event/event');			
			$event = $this->model_event_event->getEventIDByAlias(substr($_SERVER['REQUEST_URI'],1));

			$this->data['breadcrumbs'] = array();
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home'),
				'separator' => false
			);
			$this->data['breadcrumbs'][] = array(
				'text'      => $event['customtitle'],
				'href'      => $this->url->link('event/event'),      		
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle($event['event_title']);
			$this->document->setDescription($event['event_description']);
			$this->document->setKeywords($event['event_keywords']);
			$this->data['heading_title'] = $event['event_customtitle'];
			$this->data['url'] = $this->url->link('event/event');
			$this->data['desc'] = html_entity_decode($event['event_contents'], ENT_QUOTES, 'UTF-8');
			
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');

			if (file_exists('catalog/view/theme/' . $event['event_code'] . '/stylesheet/carousel.css')) {
				$this->document->addStyle('catalog/view/theme/' . $event['event_code'] . '/stylesheet/carousel.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
			}
			
			$this->data['text_local_start_1'] = $this->language->get('text_local_start_1');
			$this->data['text_local_start_2'] = $this->language->get('text_local_start_2');
			$this->data['text_local_start_3'] = $this->language->get('text_local_start_3');
			$this->data['text_promotion_content_label'] = $this->language->get('text_promotion_content_label');
			$this->data['even_date'] = 2;
			
			$this->data['text_name'] = $this->language->get('text_name');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_start_time_holiday'] = $this->language->get('text_start_time_holiday');
			
			$this->data['text_top'] = $this->language->get('text_top');
			$this->data['text_promotion'] = $this->language->get('text_promotion');
			$this->data['text_location'] = $this->language->get('text_location');
			$this->data['text_sg'] = $this->language->get('text_sg');
			$this->data['text_dn'] = $this->language->get('text_dn');
			$this->data['text_pt'] = $this->language->get('text_pt');
			$this->data['text_saigon'] = $this->language->get('text_saigon');
			$this->data['text_danang'] = $this->language->get('text_danang');
			$this->data['text_phanthiet'] = $this->language->get('text_phanthiet');
			$this->data['text_list_location'] = $this->language->get('text_list_location');
			
			$this->data['entry_price'] = $this->language->get('entry_price');
			$this->data['entry_duration'] = $this->language->get('entry_duration');
			$this->data['entry_start_time'] = $this->language->get('entry_start_time');
			$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
			$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
			
			/**********************cats**********************/
			/*carosual*/
			$cat_id_promotion = 76; /* id tag am lich*/
			$this->data['cats'] = array();
			$cats = $this->model_catalog_tag->getTags($cat_id_promotion); /* lay cac tag con co tag duong lich la cha*/
			foreach($cats as $item) {
				if($item['image'] && file_exists(DIR_IMAGE . $item['image'])){
					$name = ($item['name_menu'])?$item['name_menu']:$item['name'];
					$array = array('Tour Du Lịch ','Tết Dương Lịch','Tết Dương Lịch 2016','2016');
					$name = str_replace($array,'',$name);
					$product_total = $this->model_catalog_tag->getTotalProductByTagId($item['tag_id']); 
					
					$this->data['cats'][] = array(
						'id'		=>	$item['tag_id'],
						'name'		=>	$name . ' ' .sprintf($this->language->get('text_product_total'),$product_total),
						'thumb'		=>	$this->model_tool_image->onesize($item['image'],250,150),
						'href'    	=> 	$this->url->link('product/tag', 'tag_id=' . $item['tag_id']),
					);
				}
			}
			/**********************cats**********************/
			/*carosual*/
			/**********************products**********************/
			$this->data['products'] = array();
			$event_group = $this->model_event_event->getEventGroup($event['id']);


			

			foreach ($event_group as $key => $value) {
				if($value['value'] != null){
					$product = explode(',', $value['value']);
					if($product){
						foreach($product as $product_id){
							$result = $this->model_catalog_product->getProduct($product_id);
							if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
								$image = $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
							} else {
								$image = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_width'));
							}
							if ((float)$result['special']) {
								$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$special = false;
							}
							if ((float)$result['price']) {
								$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							if(isset($result['custom_link'])){
								$custom_link = '&path=' . $result['custom_link'];
							}else{
								$custom_link = "";
							}
							

							//  san pham o day 
							$this->data['options'] = array();
							$option_even = array();
							foreach ($this->model_catalog_product->getProductOptionsDL($result['product_id']) as $option) { 
								if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
									$option_value_data = array();

									foreach ($option['option_value'] as $option_value) {
										if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
											if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
												$price = $this->currency->format($option_value['price']);
											} else {
												$price = false;
											}
											$option_value_data[0] = array(
												'product_option_value_id' => $option_value['product_option_value_id'],
												'option_value_id'         => $option_value['option_value_id'],
												'name'                    => $option_value['name'],
												'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
												'price'                   => $price,
												
											);
										}
									}
									
									$option_even[] = array(
										'product_option_id' => $option['product_option_id'],
										'option_id'         => $option['option_id'],
										'name'              => $option['name'],
										'type'              => $option['type'],
										'category'              => $option['category'],
										'class'              => $option['class'],
										'option_value'      => $option_value_data,
										'required'          => $option['required']
									);			
								}

							}
							$location = '';
							if(preg_match('/Sài Gòn/', $value['name'])) {
								$location = 'Sài Gòn';
							}
							if(preg_match('/Miền Tây/', $value['name'])) {
								$location = 'Miền Tây';
							}
							if(preg_match('/Vũng Tàu/', $value['name'])) {
								$location = 'Vũng Tàu';
							}
							if(preg_match('/Phú Quốc/', $value['name'])) {
								$location = 'Phú Quốc';
							}
							if(preg_match('/Phan Thiết/', $value['name'])) {
								$location = 'Phan Thiết';
							}
							if(preg_match('/Đà Lạt/', $value['name'])) {
								$location = 'Đà Lạt';
							}
							if(preg_match('/Nha Trang/', $value['name'])) {
								$location = 'Nha Trang';
							}
							if(preg_match('/Đà Nẵng/', $value['name'])) {
								$location = 'Đà Nẵng';
							}
							if(preg_match('/Hội An/', $value['name'])) {
								$location = 'Hội An';
							}
							if(preg_match('/Huế/', $value['name'])) {
								$location = 'Huế';
							}
							if(preg_match('/Hà Nội/', $value['name'])) {
								$location = 'Hà Nội';
							}
							if(preg_match('/Hạ Long/', $value['name'])) {
								$location = 'Hạ Long';
							}
							if(preg_match('/Sapa/', $value['name'])) {
								$location = 'Sapa';
							}
							$this->data['products'][] = array(
								'product_id'  => $result['product_id'],
								'location'	  => $location,
								'thumb'       => $image,
								'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
								'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
								'model'    	 => $result['model'],
								'schedule_title'		=>$result['schedule'],
								'schedule'		=>cutString($result['schedule'],18),
								'price'			=>$price,
								'special'		=> $result['special'],
								'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
								'special'     => ($special)?$special:'Liên hệ',
								'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id']),

								'product_option_id' => $option_even,
							);
							$option_even = array();
						}
					}
				}
			}
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/event/event.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/event/event.tpl';
			} else {
				$this->template = 'default/template/promotion/duonglich.tpl';
			}
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'module/comment'
			);
			$this->response->setOutput($this->render());
		}
	}
?>