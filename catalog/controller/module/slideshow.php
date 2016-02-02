<?php  
class ControllerModuleSlideshow extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/jquery/slides.min.jquery.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/slideshow.css');
		}
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		
		$this->data['banners'] = array();
		
		if (isset($setting['banner_id'])) {
            $current_date = date('Y-m-d');
			$results = $this->model_design_banner->getBanner($setting['banner_id'],$current_date);

            $i = 0;
			foreach ($results as $result) {
                if( $result['start_date'] <= $current_date){
                    if (file_exists(DIR_IMAGE . $result['image'])) {
                        $this->data['banners'][] = array(
                            'title' => $result['title'],
                            'link'  => $result['link'],
                            'image' => HTTP_SERVER .'image/'.$result['image'],
                            'start_date' => $result['start_date']
                        );
                    }
                    $i++;
                }
			}
            if($i==0){
                $results = $this->model_design_banner->getBannerDefault($setting['banner_id']);
                foreach ($results as $result) {
                        if (file_exists(DIR_IMAGE . $result['image'])) {
                            $this->data['banners'][] = array(
                                'title' => $result['title'],
                                'link'  => $result['link'],
                                'image' => HTTP_SERVER .'image/'.$result['image'],
                                'start_date' => $result['start_date']
                            );
                        
                    }
                }
            }
		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/slideshow.tpl';
		} else {
			$this->template = 'default/template/module/slideshow.tpl';
		}
		
		$this->render();
	}
	
	function catchFirstImage($content) {
	  $first_img = ''; 
	  $output = preg_match_all('/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $content, $matches);
	  if(isset($matches[1][0])){
	  	$first_img = $matches[1][0];
		}
	  if(empty($first_img)){ //Defines a default image
	    $first_img = "no_image.jpg";
	  }
	  return $first_img;
	} //end function
	
}
?>