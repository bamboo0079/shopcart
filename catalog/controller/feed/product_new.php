<?php
class ControllerFeedProductNew extends Controller {
	public function index() {
		if ($this->config->get('google_sitemap_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$this->load->model('tool/image'); 
			$this->load->model('catalog/product');
			
			//Product
			$products = $this->model_catalog_product->getNewProductXML();
			$count = 1;
			foreach ($products as $product) {
				$output .= '<item>';
				$output .= '<stt>'.$count.'</stt>';
				//$output .= '<policy>' . $product['policy'] . '</policy>';
				$output .= '<product_type>' . $product['product_type'] . '</product_type>';
				//$output .= '<product_class>' . $product['product_class'] . '</product_class>';
				$output .= '<model>' . $product['model'] . '</model>';
				$output .= '<location>' . $product['location'] . '</location>';
				$output .= '<price>' . $product['price'] . '</price>';
				$output .= '<tax_class_id>' . $product['tax_class_id'] . '</tax_class_id>';
				$output .= '<quantity>' . $product['quantity'] . '</quantity>';
				$output .= '<minimum>' . $product['minimum'] . '</minimum>';
				$output .= '<subtract>' . $product['subtract'] . '</subtract>';
				$output .= '<stock_status_id>' . $product['stock_status_id'] . '</stock_status_id>';
				$output .= '<shipping>' . $product['shipping'] . '</shipping>';
				$output .= '<keyword>' . $product['keyword']. '</keyword>';
				$output .= '<schedule>' . $product['schedule']. '</schedule>';
				$output .= '<duration>' . $product['duration']. '</duration>';
				if($product['sub_duration']){$output .= '<sub_duration>' . $product['sub_duration']. '</sub_duration>';}
				$output .= '<delay_book>' . $product['delay_book']. '</delay_book>';
				$output .= '<image>' . $product['image']. '</image>';
				$output .= '<date_available>' . $product['date_available']. '</date_available>';
				$output .= '<length>' . $product['length']. '</length>';
				$output .= '<width>' . $product['width']. '</width>';
				$output .= '<date_added>'.$product['date_added'].'</date_added>';
				$output .= '<height>' . $product['height']. '</height>';
				$output .= '<length_class_id>' . $product['length_class_id']. '</length_class_id>';
				$output .= '<weight>' . $product['weight']. '</weight>';
				$output .= '<weight_class_id>' . $product['weight_class_id']. '</weight_class_id>';
				$output .= '<status>' . $product['status']. '</status>';
				$output .= '<sort_order>' . $product['sort_order']. '</sort_order>';
				$output .= '<manufacturer_id>' . $product['manufacturer_id']. '</manufacturer_id>';
				$output .= '<product_store>' . $product['product_store']. '</product_store>';
				$output .= '<points>' . $product['points']. '</points>';
				if($product['product_description']){
					$output .= '<product_description>';
					$output .= '<product_id>'.$product['product_description']['product_id'].'</product_id>';
					$output .= '<language_id>'.$product['product_description']['language_id'].'</language_id>';
					$output .= '<name>'.$product['product_description']['name'].'</name>';
					$output .= '<description>'.$product['product_description']['description'].'</description>';
					$output .= '<custom_title>'.$product['product_description']['custom_title'].'</custom_title>';
					$output .= '<meta_description>'.$product['product_description']['meta_description'].'</meta_description>';
					$output .= '<meta_keyword>'.$product['product_description']['meta_keyword'].'</meta_keyword>';
					$output .= '<name_tour>'.$product['product_description']['name_tour'].'</name_tour>';
					$output .= '<start_time>'.$product['product_description']['start_time'].'</start_time>';
					$output .= '<departure>'.$product['product_description']['departure'].'</departure>';
					$output .= '<transport>'.$product['product_description']['transport'].'</transport>';
					$output .= '<location_from>'.$product['product_description']['location_from'].'</location_from>';
					$output .= '<location_to>'.$product['product_description']['location_to'].'</location_to>';
					$output .= '<shortdescription>'.$product['product_description']['shortdescription'].'</shortdescription>';
					$output .= '<highlights>'.$product['product_description']['highlights'].'</highlights>';
					$output .= '<included>'.$product['product_description']['included'].'</included>';
					$output .= '<notincluded>'.$product['product_description']['notincluded'].'</notincluded>';
					$output .= '<info>'.$product['product_description']['info'].'</info>';
					$output .= '<meeting>'.$product['product_description']['meeting'].'</meeting>';
					$output .= '<terms>'.$product['product_description']['terms'].'</terms>';
					$output .= '<suggest>'.$product['product_description']['suggest'].'</suggest>';
					$output .= '</product_description>';
				}
				if($product['product_detail']){
					$output .= '<product_detail>';
					foreach ($product['product_detail'] as $product_detail) {
						$output .= '<item>';
						$output .= '<product_detail_id>'.$product_detail['product_detail_id'].'</product_detail_id>';
						$output .= '<product_id>'.$product_detail['product_id'].'</product_id>';
						$output .= '<label>'.$product_detail['label'].'</label>';
						$output .= '<title>'.$product_detail['title'].'</title>';
						$output .= '<text>'.$product_detail['text'].'</text>';
						$output .= '<image>'.$product_detail['image'].'</image>';
						$output .= '<status>'.$product_detail['status'].'</status>';
						$output .= '<sort_order>'.$product_detail['sort_order'].'</sort_order>';
						$output .= '<meal>';
						foreach ($product_detail['meal'] as $meal) {
							$output .= '<attribute_meal_id>'.$meal['attribute_meal_id'].'</attribute_meal_id>';
						}
						$output .= '</meal>';
						$output .= '</item>';
					}
					$output .= '</product_detail>';
				}
				if($product['option']){
					$output .= '<option>';
					foreach ($product['option'] as $option) {
						$output .= '<item>';
						$output .= '<product_option_id>' . $option['product_option_id']. '</product_option_id>';
						$output .= '<product_id>' . $option['product_id']. '</product_id>';
						$output .= '<option_id>' . $option['option_id']. '</option_id>';
						$output .= '<required>' . $option['required']. '</required>';
						$output .= '</item>';
					}
					$output .= '</option>';
				}
				if($product['option_value']){
					$output .= '<option_value>';
					foreach ($product['option_value'] as $option_value) {
						$output .= '<item>';
						$output .= '<product_option_value_id>' . $option_value['product_option_value_id']. '</product_option_value_id>';
						$output .= '<product_option_id>' . $option_value['product_option_id']. '</product_option_id>';
						$output .= '<product_id>' . $option_value['product_id']. '</product_id>';
						$output .= '<option_id>' . $option_value['option_id']. '</option_id>';
						$output .= '<option_value_id>' . $option_value['option_value_id']. '</option_value_id>';
						$output .= '<quantity>' . $option_value['quantity']. '</quantity>';
						$output .= '<subtract>' . $option_value['subtract']. '</subtract>';
						$output .= '<price>' . $option_value['price']. '</price>';
						$output .= '<price_prefix>' . $option_value['price_prefix']. '</price_prefix>';
						$output .= '<points>' . $option_value['points']. '</points>';
						$output .= '<points_prefix>' . $option_value['points_prefix']. '</points_prefix>';
						$output .= '<weight>' . $option_value['weight']. '</weight>';
						$output .= '<weight_prefix>' . $option_value['weight_prefix']. '</weight_prefix>';
						$output .= '</item>';
					}
					$output .= '</option_value>';
				}
				if($product['product_special']){
					$output .= '<product_special>';
					$output .= '<product_special_id>'.$product['product_special']['product_special_id'].'</product_special_id>';
					$output .= '<product_id>'.$product['product_special']['product_id'].'</product_id>';
					$output .= '<customer_group_id>'.$product['product_special']['customer_group_id'].'</customer_group_id>';
					$output .= '<priority>'.$product['product_special']['priority'].'</priority>';
					$output .= '<price>'.$product['product_special']['price'].'</price>';
					$output .= '<date_start>'.$product['product_special']['date_start'].'</date_start>';
					$output .= '<date_end>'.$product['product_special']['date_end'].'</date_end>';
					$output .= '</product_special>';
				}
				if($product['product_image']){
					$output .= '<product_image>';
					foreach ($product['product_image'] as $product_image) {
						$output .= '<item>';
						$output .= '<product_image_id>' . $product_image['product_image_id']. '</product_image_id>';
						$output .= '<product_id>' . $product_image['product_id']. '</product_id>';
						$output .= '<image>' . $product_image['image']. '</image>';
						$output .= '<sort_order>' . $product_image['sort_order']. '</sort_order>';
						$output .= '</item>';
					}
					$output .= '</product_image>';
				}
				if($product['product_reward']){
					$output .= '<product_reward>';
					foreach ($product['product_reward'] as $product_reward) {
						$output .= '<item>';
						$output .= '<product_reward_id>' . $product_reward['product_reward_id']. '</product_reward_id>';
						$output .= '<product_id>' . $product_reward['product_id']. '</product_id>';
						$output .= '<customer_group_id>' . $product_reward['customer_group_id']. '</customer_group_id>';
						$output .= '<points>' . $product_reward['points']. '</points>';
						$output .= '</item>';
					}
					$output .= '</product_reward>';
				}
				if($product['product_attribute']){
					$output .= '<product_attribute>';
					foreach ($product['product_attribute'] as $product_attribute) {
						$output .= '<item>';
						$output .= '<attribute_id>'.$product_attribute['attribute_id'].'</attribute_id>';
						$output .= '<language_id>'.$product_attribute['language_id'].'</language_id>';
						$output .= '<text>'.$product_attribute['text'].'</text>';
						$output .= '<attribute_type_id>'.$product_attribute['attribute_type_id'].'</attribute_type_id>';
						$output .= '</item>';
					}
					$output .= '</product_attribute>';
				}
				$output .= '</item>';
				$count++;
			}

			$output .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}
}
?>