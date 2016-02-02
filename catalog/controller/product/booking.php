<?php  
class ControllerProductBooking extends Controller {
	public function index() { 
		$this->language->load('product/booking');
	
		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		if (isset($this->request->get['id'])) {
			$product_id = (int)$this->encryption->decrypt($this->request->get['id']);
		} else {
			$product_id = 0;
		}
		
		$this->data['breadcrumbs'] = array();
	
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),			
			'separator' => false
		);
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		if ($product_info) {
			$this->document->setTitle(sprintf($this->language->get('heading_title'),$product_info['name']));
			//text
			$this->data['heading_title'] = sprintf($this->language->get('heading_title'),$product_info['name']);
	
			$this->data['text_product'] = $this->language->get('text_product');
			$this->data['text_name'] = $this->language->get('text_name');
			$this->data['text_image'] = $this->language->get('text_image');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_empty'] = $this->language->get('text_empty');
			$this->data['text_back'] = $this->language->get('text_back');
			$this->data['text_login'] = $this->language->get('text_login');
			
			//data
			$this->data['href'] = $this->url->link('product/product', 'product_id=' . $product_id);
			$this->data['name'] = $product_info['name'];
			
			
			
	
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/booking.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/booking.tpl';
			} else {
				$this->template = 'default/template/product/booking.tpl';
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
		}else{
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/booking', 'id=' . $product_id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
}
?>