<?php  
class ControllerModuleCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
			$category_id = $parts[0];
		} else {
			$this->data['category_id'] = 0;
			$category_id = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
		$parent_info = $this->model_catalog_category->getParentByCategoriesId($category_id);
		if($parent_info){
			foreach($parent_info as $item){
				if($item != 0){
					$parent_id = $item;
					break;
				}else{
					$parent_id = $category_id;
				}
			}
		}else{
			$parent_id = 0;
		}
		
		$nofollow = '';
		if(isset($this->request->get['product_id'])) {
			$nofollow = 'nofollow';
		}
		
		$array_catefix = array(87,137,210,203);
		
		//Get Current CatID
		if(in_array($parent_id,$array_catefix)){
			$this->data['check_box'] = true;
		}else{
			$this->data['check_box'] = false;
		}
		if($category_id){
			$this->data['category_current_info'] = $this->model_catalog_category->getCategory($parent_id);
			
			$this->data['category_current'] = array();
			
			$categories = $this->model_catalog_category->getCategories($parent_id);
			foreach ($categories as $category_1) {
				//level_2
				$level_2_data = array();
	
				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
	
				foreach ($categories_2 as $category_2) {
					//level_3
					$level_3_data = array();
	
					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
	
					foreach ($categories_3 as $category_3) {
						$level_3_data[] = array(
							'category_id' => $category_3['category_id'],
							'name'        => ($category_3['name_menu'])?$category_3['name_menu']:$category_3['name'],
							'rel' 		=> $nofollow,
							'href'  => $this->url->link('product/category', 'path=' . $category_3['category_id'])
						);
					}
	
					$level_2_data[] = array(
						'category_id' => $category_2['category_id'],	
						'name'        => ($category_2['name_menu'])?$category_2['name_menu']:$category_2['name'],
						'rel' 		=> $nofollow,
						'href'  => $this->url->link('product/category', 'path=' . $category_2['category_id']),
						'children'    => $level_3_data
					);					
				}
				//level_1
				$this->data['category_current'][] = array(
					'category_id' => $category_1['category_id'],
					'name'        => ($category_1['name_menu'])?$category_1['name_menu']:$category_1['name'],
					'rel' 		=> $nofollow,
					'href'  => $this->url->link('product/category', 'path=' . $category_1['category_id']),
					'children'    => $level_2_data
				);
			}
		}else{
			$this->data['category_current_info'] = NULL;
			
		}
		
		//Get All -> Remove CatID
		$this->data['categories'] = array();
		
		if($parent_id){
			$categories = $this->model_catalog_category->getAllCategoriesRemoveCatId($parent_id);
		}else{
			$categories = $this->model_catalog_category->getCategories($parent_id);
		}

		foreach ($categories as $category_1) {
			if ($category_1['menu']) {
				//level_2
				$level_2_data = array();
				$check_box = false;
	
				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
	
				foreach ($categories_2 as $category_2) {
					//level_3
					$level_3_data = array();
	
					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
	
					foreach ($categories_3 as $category_3) {
						$level_3_data[] = array(
							'category_id' => $category_3['category_id'],
							'name'        => ($category_3['name_menu'])?$category_3['name_menu']:$category_3['name'],
							'rel' 		=> $nofollow,
							'href'  => $this->url->link('product/category', 'path=' . $category_3['category_id'])
						);
					}
	
					$level_2_data[] = array(
						'category_id' => $category_2['category_id'],	
						'name'        => ($category_2['name_menu'])?$category_2['name_menu']:$category_2['name'],
						'rel' 		=> $nofollow,
						'href'  => $this->url->link('product/category', 'path=' . $category_2['category_id']),
						'children'    => $level_3_data
					);					
				}
				//level_1
				if(in_array($category_1['category_id'],$array_catefix)){
					$check_box = true;
				}
				$this->data['categories'][] = array(
					'category_id' => $category_1['category_id'],
					'check_box' 	=> $check_box,
					'name'        => ($category_1['name_menu'])?$category_1['name_menu']:$category_1['name'],
					'rel' 		=> $nofollow,
					'href'  => $this->url->link('product/category', 'path=' . $category_1['category_id']),
					'children'    => $level_2_data
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}

		$this->render();
	}
}
?>