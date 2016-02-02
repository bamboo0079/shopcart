<?php
class ControllerFeedOption extends Controller {
	public function index() {
		if ($this->config->get('google_sitemap_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$this->load->model('tool/image'); 
			$this->load->model('catalog/option');
			//Option
			$option_data = $this->model_catalog_option->getOptions();
			$count = 1;
			foreach ($option_data as $option) {
					$output .= '<item>';
					$output .= '<stt>' . $count . '</stt>';
					$output .= '<option_id>' . $option['option_id'] . '</option_id>';
					$output .= '<type>' . $option['type'] . '</type>';
					$output .= '<sort_order>' . $option['sort_order'] . '</sort_order>';
					$output .= '<category>' . $option['category'] . '</category>';
					$output .= '<class>' . $option['class'] . '</class>';
					$output .= '<language_id>' . $option['language_id'] . '</language_id>';
					$output .= '<name>'. $option['name'] .'</name>';
					$output .= '<option_value>';
					if($option['option_value']){
						foreach ($option['option_value'] as $key => $value) {
							$output .= '<itemvalue>';
							$output .= '<stt>' . $key . '</stt>';
							$output .= '<option_value_id>'. $value['option_value_id'] .'</option_value_id>';
							$output .= '<image>'. $value['image'] .'</image>';
							$output .= '<sort_order>'. $value['sort_order'] .'</sort_order>';
							$output .= '<language_id>'. $value['language_id'] .'</language_id>';
							$output .= '<name>'. $value['name'] .'</name>';
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
?>