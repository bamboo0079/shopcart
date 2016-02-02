<?php 
class ControllerPromotionGioto extends Controller {
	public function index() {
		$this->language->load('promotion/gioto');
		
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
			'text'      => $this->config->get('gioto_title'),
			'href'      => $this->url->link('promotion/gioto'),      		
			'separator' => $this->language->get('text_separator')
		);
		$this->document->setTitle($this->config->get('gioto_customtitle'));
		$this->document->setDescription($this->config->get('gioto_metadesc'));
		$this->document->setKeywords($this->config->get('gioto_metakey'));
		$this->data['heading_title'] = $this->config->get('gioto_title');
		$this->data['url'] = $this->url->link('promotion/gioto');
		$this->data['desc'] = html_entity_decode($this->config->get('gioto_desc'), ENT_QUOTES, 'UTF-8');
		
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
		$this->data['text_saigon'] = $this->language->get('text_saigon');
		$this->data['text_danang'] = $this->language->get('text_danang');
		$this->data['text_hanoi'] = $this->language->get('text_hanoi');
		$this->data['text_list_location'] = $this->language->get('text_list_location');
		
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_duration'] = $this->language->get('entry_duration');
		$this->data['entry_start_time'] = $this->language->get('entry_start_time');
		$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
		$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
		
		/**********************cats**********************/
		$cat_id_promotion = 232;
		$this->data['cats'] = array();
		$cats = $this->model_catalog_tag->getTags($cat_id_promotion);
		foreach($cats as $item) {
			if($item['image'] && file_exists(DIR_IMAGE . $item['image'])){
				$name = ($item['name_menu'])?$item['name_menu']:$item['name'];
				$array = array('Tour Du Lịch','Lễ Giỗ Tổ - 30/4 - 1/5/2015');
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
		$product = explode(',', $this->config->get('khmngt_product'));
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
				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}
				$this->data['products1'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'description' => cutString(preg_replace('/\n/', "",strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 50),
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday']?$result['start_time_holiday']:'&nbsp;',
					'start_time_tet'    	 => $result['start_time_tet']?$result['start_time_tet']:'&nbsp;',
					'duration'    	 => $result['duration'],
					'product_type'    	 => $result['product_type'],
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		
		/**********************products2**********************/
		$this->data['products2'] = array();
		$product = explode(',', $this->config->get('khmtgt_product'));
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
				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}
				$this->data['products2'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'description' => cutString(preg_replace('/\n/', "",strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 50),
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday']?$result['start_time_holiday']:'&nbsp;',
					'start_time_tet'    	 => $result['start_time_tet']?$result['start_time_tet']:'&nbsp;',
					'duration'    	 => $result['duration'],
					'product_type'    	 => $result['product_type'],
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		
		/**********************products3**********************/
		$this->data['products3'] = array();
		$product = explode(',', $this->config->get('khmbgt_product'));
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
				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}
				$this->data['products3'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
					'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
					'description' => cutString(preg_replace('/\n/', "",strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 50),
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday']?$result['start_time_holiday']:'&nbsp;',
					'start_time_tet'    	 => $result['start_time_tet']?$result['start_time_tet']:'&nbsp;',
					'duration'    	 => $result['duration'],
					'product_type'    	 => $result['product_type'],
					'special'     => ($special)?$special:'Liên hệ',
					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
				);
			}
		}
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/promotion/gioto.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/promotion/gioto.tpl';
		} else {
			$this->template = 'default/template/promotion/gioto.tpl';
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