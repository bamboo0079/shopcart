<?php  
class ControllerModuleCategoryTag extends Controller {
	protected function index($setting) {
		$this->language->load('module/category_tag');
		
		$this->load->model('catalog/category');
		
		if (isset($this->request->get['tag_id'])) {
			$this->data['tag_id'] = $tag_id = $this->request->get['tag_id'];
		} else {
			$this->data['tag_id'] = $tag_id = 0;
		}
		
		$array_tour_tn = array(168,119,117,85,126,127,124);
		$parent = $this->model_catalog_tag->getParentByTagsId($tag_id);
		if(count($parent) == 4){
			$tag_id = array_pop($parent);
		}else{
			$tag_id = $tag_id;
		}
		
		//Get Current TagID
		$this->data['tour_tn_current'] = array();
		if($tag_id && in_array($tag_id,$array_tour_tn)){
			$result = $this->model_catalog_tag->getTag($tag_id);
			if($result){
				$level_2_data = array();
				$result_2 = $this->model_catalog_tag->getTagsByParentId($tag_id);
				foreach ($result_2 as $item_2) {
					$data_2 = $this->model_catalog_tag->getTag($item_2);
					if($data_2){
						$name_2 = $data_2['name_menu']?$data_2['name_menu']:$data_2['name'];
						//$array_repalce = array('/Du Lịch Miền Tây/','/Du Lịch Đà Lạt/','/Du Lịch Nha Trang/','/Du Lịch Đà Nẵng/','/Du Lịch Hội An/','/Du Lịch Huế/','/Du Lịch Sapa/');
						//$name_2 = 'Chùm '.preg_replace($array_repalce,'',$name_2);
						$level_2_data[] = array(
							'tag_id'	=>	$data_2['tag_id'],
							'name'	=>	$name_2,
							'href'  => $this->url->link('product/tag', 'tag_id='. $data_2['tag_id'])
						);
					}
				}
				$name_1 = $result['name_menu']?$result['name_menu']:$result['name'];
				$name_1 = str_replace(' Chất Lượng Cao','',$name_1);
				$this->data['tour_tn_current'][] = array(
					'tag_id'	=>	$result['tag_id'],
					'name'	=>	$name_1,
					'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id']),
					'level_2_data' => $level_2_data
				);
			}
		}
		
		//Get All -> Remove TagID
		$this->data['tour_tn'] = array();
		
		if(in_array($tag_id,$array_tour_tn)){
			$array_tour_tn = array_diff($array_tour_tn,array($tag_id));
		}
		
		foreach($array_tour_tn as $id){
			$result = $this->model_catalog_tag->getTag($id);
			if($result){
				$level_2_data = array();
				$result_2 = $this->model_catalog_tag->getTagsByParentId($id);
				foreach ($result_2 as $item_2) {
					$data_2 = $this->model_catalog_tag->getTag($item_2);
					if($data_2){
						$name_2 = $data_2['name_menu']?$data_2['name_menu']:$data_2['name'];
						//$array_repalce = array('/Du Lịch Miền Tây/','/Du Lịch Đà Lạt/','/Du Lịch Nha Trang/','/Du Lịch Đà Nẵng/','/Du Lịch Hội An/','/Du Lịch Huế/','/Du Lịch Sapa/');
						//$name_2 = 'Chùm '.preg_replace($array_repalce,'',$name_2);
						$level_2_data[] = array(
							'tag_id'	=>	$data_2['tag_id'],
							'name'	=>	$name_2,
							'href'  => $this->url->link('product/tag', 'tag_id='. $data_2['tag_id'])
						);
					}
				}
				$name_1 = $result['name_menu']?$result['name_menu']:$result['name'];
				$name_1 = str_replace(' Chất Lượng Cao','',$name_1);
				$this->data['tour_tn'][] = array(
					'tag_id'	=>	$result['tag_id'],
					'name'	=>	$name_1,
					'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id']),
					'level_2_data' => $level_2_data
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category_tag.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category_tag.tpl';
		} else {
			$this->template = 'default/template/module/category_tag.tpl';
		}

		$this->render();
	}
}
?>