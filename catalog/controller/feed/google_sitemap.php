<?php
class ControllerFeedGoogleSitemap extends Controller {
	public function index() {
		if ($this->config->get('google_sitemap_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$this->load->model('catalog/product');
			
			//Product
			$products = $this->model_catalog_product->getProducts();

			foreach ($products as $product) {
				if(isset($product['custom_link'])){
					$custom_link = '&path=' . $product['custom_link'];
				}
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('product/product', $custom_link . '&product_id=' . $product['product_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>1.0</priority>';
				$output .= '</url>';
			}
			
			//Cate
			$this->load->model('catalog/category');

			$output .= $this->getCategories(0);
			
			//Tag
			$this->load->model('catalog/tag');

			$output .= $this->getTags(0);
			
			//News
			$this->load->model('catalog/news');

			$news = $this->model_catalog_news->getNewss();

			foreach ($news as $news) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('news/news', 'news_id=' . $news['news_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.5</priority>';
				$output .= '</url>';
			}
			
			//News Cate
			$this->load->model('catalog/news_category');

			$news_categories = $this->model_catalog_news_category->getNewsCategories(0);

			foreach ($news_categories as $news_categories) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('news/news_category', 'news_category_id=' . $news_categories['news_category_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.5</priority>';
				$output .= '</url>';
			}
			
			
			//Information
			$this->load->model('catalog/information');

			$informations = $this->model_catalog_information->getInformations();

			foreach ($informations as $information) {
				$output .= '<url>';
				$output .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.5</priority>';
				$output .= '</url>';
			}

			$output .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}

	protected function getCategories($parent_id, $current_path = '') {
		$output = '';

		$results = $this->model_catalog_category->getCategories($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $result['category_id'];
			}

			$output .= '<url>';
			$output .= '<loc>' . $this->url->link('product/category', 'path=' . $new_path) . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.7</priority>';
			$output .= '</url>';

			$output .= $this->getCategories($result['category_id'], $new_path);
		}

		return $output;
	}
	
	protected function getTags($parent_id, $current_path = '') {
		$output = '';

		$results = $this->model_catalog_tag->getTags($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['tag_id'];
			} else {
				$new_path = $result['tag_id'];
			}

			$output .= '<url>';
			$output .= '<loc>' . $this->url->link('product/tag', 'tag_id=' . $new_path) . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.6</priority>';
			$output .= '</url>';

			$output .= $this->getTags($result['tag_id'], $new_path);
		}

		return $output;
	}
}
?>