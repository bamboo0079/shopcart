<?php
class ControllerFeedProductOptionHe extends Controller {
	public function index() {
		if ($this->config->get('google_sitemap_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$this->load->model('tool/image'); 
			$this->load->model('catalog/product');
			//Product
			$product_option_data = $this->model_catalog_product->getProductOptionsXML(2);
			$count = 1;
			foreach ($product_option_data as $product_option) {
				if(isset($product_option['model']) && $product_option['model'] != "VF1881" && $product_option['model'] != "VF1882"){
					$output .= '<item>';
					$output .= '<stt>' . $count . '</stt>';
					$output .= '<model>' . $product_option['model'] . '</model>';
					$output .= '<product_option_id>' . $product_option['product_option_id'] . '</product_option_id>';
					$output .= '<option_id>' . $product_option['option_id'] . '</option_id>';
					$output .= '<required>' . $product_option['required'] . '</required>';
					$output .= '<option_value>';
					if($product_option['option_value']){
						foreach ($product_option['option_value'] as $key => $value) {
							$output .= '<itemvalue>';
							$output .= '<product_option_value_id>'.$value['product_option_value_id'].'</product_option_value_id>';
							$output .= '<option_value_id>' . $value['option_value_id'] . '</option_value_id>';
							$output .= '<quantity>'. $value['quantity'] .'</quantity>';
							$output .= '<subtract>'. $value['subtract'] .'</subtract>';
							$output .= '<price>'. $value['price'] .'</price>';
							$output .= '<price_prefix>'. $value['price_prefix'] .'</price_prefix>';
							$output .= '<weight>'. $value['weight'] .'</weight>';
							$output .= '<weight_prefix>'. $value['weight_prefix'] .'</weight_prefix>';
							$output .= '</itemvalue>';
						}
					}
					$output .= '</option_value>';
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