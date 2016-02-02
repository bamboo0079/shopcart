<?php  
class ControllerModuleNewsCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/news_category');

		$this->data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['news_category_id'])) {
			$parts = explode('_', (string)$this->request->get['news_category_id']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$this->data['news_category_id'] = $parts[0];
		} else {
			$this->data['news_category_id'] = 0;
		}

		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}

		$this->load->model('catalog/news_category');

		$this->load->model('catalog/news');

		$this->data['categories'] = array();

		$categories = $this->model_catalog_news_category->getNewsCategories(0);

		foreach ($categories as $news_category) {
			$total = $this->model_catalog_news->getTotalNewss(array('filter_news_category_id' => $news_category['news_category_id']));

			$children_data = array();

			$children = $this->model_catalog_news_category->getNewsCategories($news_category['news_category_id']);
//var_dump($children);
			foreach ($children as $child) {
				$data = array(
					'filter_news_category_id'  => $child['news_category_id'],
					'filter_sub_news_category' => true
				);

				$news_total = $this->model_catalog_news->getTotalNewss($data);

				$total += $news_total;

				$children_data[] = array(
					'news_category_id' => $child['news_category_id'],
					'name'        => $child['name'] . ($this->config->get('config_news_count') ? ' (' . $news_total . ')' : ''),
					'href'        => $this->url->link('news/news_category', 'news_category_id=' . $news_category['news_category_id'] . '_' . $child['news_category_id'])	
				);		
			}

			$this->data['categories'][] = array(
				'news_category_id' => $news_category['news_category_id'],
				'name'        => $news_category['name'] . ($this->config->get('config_news_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('news/news_category', 'news_category_id=' . $news_category['news_category_id'])
			);	
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news_category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news_category.tpl';
		} else {
			$this->template = 'default/template/module/news_category.tpl';
		}

		$this->render();
	}
}
?>