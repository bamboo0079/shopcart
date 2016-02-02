<?php  
class ControllerCommentLoad extends Controller {
	public function index() {
    	$this->language->load('comment/write');
		
		$this->load->model('catalog/comment');
		$this->data['token'] = $this->session->data['token'];

		$this->data['text_no_comments'] = $this->language->get('text_no_comments');
		$this->data['text_reply'] = $this->language->get('text_reply');
		$this->data['text_wait'] = $this->language->get('text_wait');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$this->data['comments'] = array();
		
		$comment_total = $this->model_catalog_comment->getTotalCommentsByUrlParent($this->request->get['url']);
			
		$results = $this->model_catalog_comment->getCommentsByUrlParent($this->request->get['url'], ($page - 1) * 20, 20);
      		
		foreach ($results as $result) {
			
			$child = array();
			
			$childs = $this->model_catalog_comment->getCommentsByUrlByParent($result['comment_id'],$this->request->get['url']);
			if($childs){
				foreach($childs as $child_info){
					$child[] = array(
						'comment_id'	=>	$child_info['comment_id'],
						'name'	=>	$child_info['name'],
						'email'	=>	$child_info['email'],
						'text'	=>	$child_info['text'],
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
				'text'       => $result['text'],
				'child'       => $child,
				'rating'     => (int)$result['rating'],
        		'comments'    => sprintf($this->language->get('text_comments'), (int)$comment_total),
        		'date_added' => date($this->language->get('date_format_short').' H:i:s', strtotime($result['date_added']))
        	);
      	}			
		
		$pagination = new Pagination();
		$pagination->total = $comment_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit'); 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('comment/load', 'url=' . $this->request->get['url'] . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();
		
		$this->template = 'comment/comment.tpl';
		
		$this->response->setOutput($this->render());
	}
}
?>