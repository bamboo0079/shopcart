<?php 

class ControllerFeedBanner extends Controller {

	public function index() {

		if ($this->config->get('google_sitemap_status')) {

			$output  = '<?xml version="1.0" encoding="UTF-8"?>';

			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

			$this->load->model('tool/image'); 

			$this->load->model('setting/setting');



			$this->data['modules'] = $this->config->get('banner_siteDiaDiem_module');

			$count = 1;

			if($this->data['modules']){

				foreach ($this->data['modules'] as $key => $value) {

					if($value['status']){

						if ($value['image'] && file_exists(DIR_IMAGE . $value['image'])) {

							$image = HTTP_SERVER.'image/'.$value['image'];

						} else {

							$image = $this->model_tool_image->cropsize('no_image.jpg', $value['width'], $value['height']);

						}

					if(isset($value['custom_link'])){

						$custom_link = '&path=' . $value['image'];

					}

					$output .= '<item>';

					$output .= '<stt>' . $count . '</stt>';

					$output .= '<name>' . $value['name'] . '</name>';

					$output .= '<title>'.$value['title'].'</title>';

					$output .= '<link>'.$value['link'].'</link>';

					$output .= '<image>' . $image . '</image>';

					$output .= '<width>'.$value['width'].'</width>';

					$output .= '<height>'.$value['height'].'</height>';

					$output .= '</item>';

					$count++;
				}

				}

			}

			$output .= '</urlset>';



			$this->response->addHeader('Content-Type: application/xml');

			$this->response->setOutput($output);

		}

	}

}

?>