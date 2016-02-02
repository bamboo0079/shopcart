<?php
class ControllerFeedProduct extends Controller {
	public function index() {
		if ($this->config->get('google_sitemap_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$this->load->model('tool/image'); 
			$this->load->model('catalog/product');
			
			//Product
			$products = $this->model_catalog_product->getProducts();
			$count = 1;
			foreach ($products as $product) {
				if($product['status']){
					//Image
					if ($product['image'] && file_exists(DIR_IMAGE . $product['image'])) {
						$image = $this->model_tool_image->cropsize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					} else {
						$image = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_width'));
					}
					
					//Price
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $product['price'] != 0) {
						$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}
					
					//Special
					if ((float)$product['special']) {
						$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}
					
					if(isset($product['custom_link'])){
						$custom_link = '&path=' . $product['custom_link'];
					}
					$output .= '<item>';
					$output .= '<stt>' . $count . '</stt>';
					$output .= '<model>' . $product['model'] . '</model>';
					$output .= '<name>' . $product['name'] . '</name>';
					$output .= '<start_time>' . $product['start_time'] . '</start_time>';
					$output .= '<location_from>' . $product['location_from'] . '</location_from>';
					$output .= '<transport>' . $product['transport'] . '</transport>';
					$output .= '<price>' . $price . '</price>';
					($special)?$output .= '<special>' . $special . '</special>':'';
					($product['date_start'])?$output .= '<date_start>' . $product['date_start'] . '</date_start>':'';
					($product['date_end'])?$output .= '<date_end>' . $product['date_end'] . '</date_end>':'';
					($product['customer_group_id'])?$output .= '<customer_group_id>' . $product['customer_group_id'] . '</customer_group_id>':'';
					$output .= '<priority>' . $product['priority'] . '</priority>';
					$output .= '<duration>' . $product['duration'] . '</duration>';
					$output .= '<schedule>' . $product['schedule'] . '</schedule>';
					$output .= '<class>' . $product['product_class'] . '</class>';
					$output .= '<viewed>' . $product['viewed'] . '</viewed>';
					$output .= '<date_added>' . $product['date_added'] . '</date_added>';
					$output .= '<date_modified>' . $product['date_modified'] . '</date_modified>';
					$output .= '<image>' . $image . '</image>';
					$output .= '<url>' . $this->url->link('product/product',  $custom_link . '&product_id=' . $product['product_id']) . '</url>';
					$output .= '</item>';
					$count++;
				}
			}

			$output .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}
}
?>