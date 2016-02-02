<?php 
class ControllerProductList extends Controller { 	
	public function index() { 
		$this->language->load('promotion/duonglich');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$banggia = $this->config->get('banggia');
		
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text'      => $banggia['title'],
			'href'      => $this->url->link('product/list'),      		
			'separator' => $this->language->get('text_separator')
		);
		
		$this->document->setTitle($banggia['customtitle']);
		$this->document->setDescription($banggia['metadesc']);
		$this->document->setKeywords($banggia['metakey']);
		
		$this->data['heading_title'] = $banggia['title'];
		$this->data['url'] = $this->url->link('product/list');
		$this->data['desc'] = html_entity_decode($banggia['desc'], ENT_QUOTES, 'UTF-8');
	
		$this->data['list_product'] = $this->data['list_product_box'] = array();
	
		$this->data['lists'] = $this->config->get('list_product');
		
		//Product
		
		$products = $this->data['lists'];
		
		foreach($products as $k=>$item){
			
			$product = explode(',', $item['list_product']);
		
			foreach ($product as $product_id) {
				$result = $this->model_catalog_product->getProduct($product_id);
				if ($result) {
					
					if ($result['price'] != 0) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}
					
					if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
						$image = $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					} else {
						$image = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_width'));
					}
					
					if ($result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}
					
					if(isset($result['custom_link'])){
						$custom_link = '&path=' . $result['custom_link'];
					}
					
					$this->data['list_product_box'][$k][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name_tour']?$result['name_tour']:$result['name'],
						'name_title'        => cutString($result['name_tour']?$result['name_tour']:$result['name'],16),
						'description' => cutString(preg_replace('/\n/', "",strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 50),
						'model'    	 => $result['model'],
						'start_time'    	 => $result['start_time'],
						'start_time_holiday'    	 => $result['start_time_holiday']?$result['start_time_holiday']:'&nbsp;',
						'duration'    	 => $result['duration'],
						'product_type'    	 => $result['product_type'],
						'transport'    	 => $result['transport'],
						'price'    	 => $price,
						'special'     => ($special)?$special:'Liên hệ',
						'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'])
					);
					
				}
			}
		}
		
		$this->data['button_view_more'] = $this->language->get('button_view_more');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/list.tpl';
		} else {
			$this->template = 'default/template/product/list.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);

		$this->response->setOutput($this->render());			
	}
}
?>