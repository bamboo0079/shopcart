<?php 
class ControllerPromotionEven29 extends Controller {
	public function index() {
		$this->language->load('promotion/even29');
		$this->load->model('catalog/product');
		$this->load->model('catalog/tag');
		$this->load->model('tool/image');
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->config->get('even29_title'),
			'href'      => $this->url->link('promotion/even29'),      		
			'separator' => $this->language->get('text_separator')
		);
		$this->document->addLink('http://www.vietfuntravel.com.vn/tour-du-lich-ngay-le-2-9.html', 'canonical');
		$this->document->setTitle($this->config->get('even29_customtitle'));
		$this->document->setDescription($this->config->get('even29_metadesc'));
		$this->document->setKeywords($this->config->get('even29_metakey'));
		$this->data['heading_title'] = $this->config->get('even29_title');
		$this->data['url'] = $this->url->link('promotion/even29');
		$this->data['desc'] = html_entity_decode($this->config->get('even29_desc'), ENT_QUOTES, 'UTF-8');
		$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
		}
		$this->data['text_local_start_1'] = $this->language->get('text_local_start_1');
		$this->data['text_local_start_2'] = $this->language->get('text_local_start_2');
		$this->data['text_local_start_3'] = $this->language->get('text_local_start_3');
		$this->data['text_local_start_4'] = $this->language->get('text_local_start_4');
		$this->data['text_local_start_5'] = $this->language->get('text_local_start_5');
		$this->data['text_local_start_6'] = $this->language->get('text_local_start_6');
		$this->data['text_local_start_7'] = $this->language->get('text_local_start_7');
		$this->data['text_promotion_content_label'] = $this->language->get('text_promotion_content_label');
		
		$this->data['text_name'] = $this->language->get('text_name');
		$this->data['text_price'] = $this->language->get('text_price');
		$this->data['text_start_time_holiday'] = $this->language->get('text_start_time_holiday');
		
		$this->data['text_top'] = $this->language->get('text_top');
		$this->data['text_promotion'] = $this->language->get('text_promotion');
		$this->data['text_location'] = $this->language->get('text_location');
		$this->data['text_sg'] = $this->language->get('text_sg');
		$this->data['text_dn'] = $this->language->get('text_dn');
		$this->data['text_hn'] = $this->language->get('text_hn');
		$this->data['text_pt'] = $this->language->get('text_pt');
		$this->data['text_pq'] = $this->language->get('text_pq');
		$this->data['text_saigon'] = $this->language->get('text_saigon');
		$this->data['text_danang'] = $this->language->get('text_danang');
		$this->data['text_hanoi'] = $this->language->get('text_hanoi');
		$this->data['text_phanthiet'] = $this->language->get('text_phanthiet');
		$this->data['text_phuquoc'] = $this->language->get('text_phuquoc');
		$this->data['text_list_location'] = $this->language->get('text_list_location');
		
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_duration'] = $this->language->get('entry_duration');
		$this->data['entry_start_time'] = $this->language->get('entry_start_time');
		$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
		$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
		
		/**********************cats**********************/
		$cat_id_promotion = 255;
		$this->data['cats'] = array();
		$parents = $this->model_catalog_tag->getTags($cat_id_promotion);
		foreach($parents as $item) {
			if($item['image'] && file_exists(DIR_IMAGE . $item['image'])){
				$name = ($item['name_menu'])?$item['name_menu']:$item['name'];
				$array = array('Tour Du Lịch','Tour du lịch','Hè 2015');
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
		/**********************products1**********************/
		$this->data['products1'] = array();
		$product = explode(',', $this->config->get('khmsg1neven29_product'));
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
				$this->data['products1'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		
		/**********************products2**********************/
		$this->data['products2'] = array();
		$product = explode(',', $this->config->get('khmsg3neven29_product'));
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
				$this->data['products2'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		
		/**********************products3**********************/
		$this->data['products3'] = array();
		$product = explode(',', $this->config->get('khmpt1neven29_product'));
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
				$this->data['products3'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		/**********************products4**********************/
		$this->data['products4'] = array();
		$product = explode(',', $this->config->get('khmpt3neven29_product'));
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
				$this->data['products4'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		/**********************products5**********************/
		$this->data['products5'] = array();
		$product = explode(',', $this->config->get('khmdn1neven29_product'));
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
				$this->data['products5'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		/**********************products6**********************/
		$this->data['products6'] = array();
		$product = explode(',', $this->config->get('khmdn3neven29_product'));
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
				$this->data['products6'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		/**********************products7**********************/
		$this->data['products7'] = array();
		$product = explode(',', $this->config->get('khmhn1neven29_product'));
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
				$this->data['products7'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],18),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}

		/**********************products8**********************/
		$this->data['products8'] = array();
		$product = explode(',', $this->config->get('khmhn3neven29_product'));
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
				$this->data['products8'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		/**********************products9**********************/
		$this->data['products9'] = array();
		$product = explode(',', $this->config->get('khmpq1neven29_product'));
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
				$this->data['products9'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		/**********************products10**********************/
		$this->data['products10'] = array();
		$product = explode(',', $this->config->get('khmpq3neven29_product'));
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
				$this->data['products10'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'model'    	 => $result['model'],
					'schedule_title'		=>$result['schedule'],
					'schedule'		=>cutString($result['schedule'],18),
					'price'			=>$price,
					'duration'		=>$result['duration']?$result['duration']:'Nữa ngày',
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/promotion/even29.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/promotion/even29.tpl';
		} else {
			$this->template = 'default/template/promotion/even29.tpl';
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