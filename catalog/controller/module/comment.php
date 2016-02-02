<?php  
class ControllerModuleComment extends Controller {
	protected function index() {
		$this->language->load('comment/write');
	
		$this->load->model('catalog/comment');
		
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('catalog/tag');
		$this->load->model('catalog/news');
		
		
		$this->data['heading_title'] = '';
		if (isset($this->request->get['product_id'])) {
			$product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
			$this->data['heading_title'] = ($product_info['name_tour'])?$product_info['name_tour']:$product_info['name'];
		}elseif (isset($this->request->get['tag_id'])) {
			$tag_info = $this->model_catalog_tag->getTag($this->request->get['tag_id']);
			$this->data['heading_title'] = $tag_info['name'];
		}elseif (isset($this->request->get['path'])) {
			$category_info = $this->model_catalog_category->getCategory($this->request->get['path']);
			$this->data['heading_title'] = $category_info['name'];
		}elseif (isset($this->request->get['news_id'])) {
			$news_info = $this->model_catalog_news->getNews($this->request->get['news_id']);
			$this->data['heading_title'] = $news_info['name'];
		}elseif ($this->request->get['_route_']== trim("tour-du-lich-he.html")) {
			$this->data['heading_title'] = "tour du lịch hè 2015";
		}elseif ($this->request->get['_route_']== trim("tour-du-lich-ngay-le-2-9.html")) {
			$this->data['heading_title'] = "tour du lịch 2-9-2015";
		}elseif ($this->request->get['_route_']== trim("tour-du-lich-tet-duong-lich.html")) {
			$this->data['heading_title'] = "TOUR DU LỊCH TẾT DƯƠNG LỊCH 2016";
		}
		
		if($this->customer->isLogged()){
			$this->data['customer_name'] = $this->customer->getLastName().' '.$this->customer->getFirstName();
			$this->data['customer_email'] = $this->customer->getEmail();
			$this->data['customer_phone'] = $this->customer->getTelephone();
		}else{
			$this->data['customer_name'] = '';
			$this->data['customer_email'] = '';
			$this->data['customer_phone'] = '';
		}	

		$this->data['text_no_comments'] = $this->language->get('text_no_comments');
		$this->data['text_reply'] = $this->language->get('text_reply');
		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_qtv'] = $this->language->get('text_qtv');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$this->data['comments'] = array();
		$url = ltrim($this->request->server['REQUEST_URI'], "/");
		$comment_total = $this->model_catalog_comment->getTotalCommentsByUrlParent($url);
			
		$results = $this->model_catalog_comment->getCommentsByUrlParent($url, ($page - 1) * 500, 500);
			
		foreach ($results as $result) {
			
			$child = array();
			
			$childs = $this->model_catalog_comment->getCommentsByUrlByParent($result['comment_id']);
			if($childs){
				foreach($childs as $child_info){
					$child[] = array(
						'comment_id'	=>	$child_info['comment_id'],
						'name'	=>	$child_info['name'],
						'email'	=>	$child_info['email'],
						'rank'	=>	$child_info['rank'],
						'text'	=>	GetLinkByText($child_info['text']),
						'rating'	=>	$child_info['rating'],
						'date_added'	=>	date($this->language->get('date_format_short').' H:i:s', strtotime($child_info['date_added']))
					);
				}
			}else{
				$child = false;
			}
			$this->data['comments'][] = array(
				'comment_id'     => $result['comment_id'],
				'name'     => $result['name'],
				'email'     => $result['email'],
				'rank'	=>	$result['rank'],
				'text'       => GetLinkByText($result['text']),
				'child'       => $child,
				'rating'     => (int)$result['rating'],
				'comments'    => sprintf($this->language->get('text_comments'), (int)$comment_total),
				'date_added' => date($this->language->get('date_format_short').' H:i:s', strtotime($result['date_added']))
			);
		}			
		
		$pagination_comment = new Pagination();
		$pagination_comment->total = $comment_total;
		$pagination_comment->page = $page;
		$pagination_comment->limit = 500; 
		$pagination_comment->text = $this->language->get('text_pagination');
		$pagination_comment->url = $this->url->link('comment/load', 'url=' . $url . '&page={page}');
			
		$this->data['pagination_comment'] = $pagination_comment->render();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/comment.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/comment.tpl';
		} else {
			$this->template = 'default/template/module/comment.tpl';
		}

		$this->render();
	}
}
?>