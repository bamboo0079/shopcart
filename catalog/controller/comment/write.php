<?php  
class ControllerCommentWrite extends Controller {
	public function index() {
		$this->language->load('comment/write');
		
		$this->load->model('catalog/comment');
		
		$json = array();
		
		if ((strlen(utf8_decode($this->request->post['name'])) < 1) || (strlen(utf8_decode($this->request->post['name'])) > 255)) {
			$json['error'] = $this->language->get('error_name');
		}
		
		if (strlen(utf8_decode($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$json['error'] = $this->language->get('error_email');
		}
		
		if ((strlen(utf8_decode($this->request->post['text'])) < 3)) {
			$json['error'] = $this->language->get('error_text');
		}

				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			
			$this->model_catalog_comment->addComment($this->request->get['url'], $this->request->post);
			
			$json['success'] = $this->language->get('text_success');
		}
		
		$this->response->setOutput(json_encode($json));		
	}
	
	public function child() {
		$this->language->load('comment/write');
		
		$this->load->model('catalog/comment');
		
		$json = array();
		
		if ((strlen(utf8_decode($this->request->post['name'])) < 1) || (strlen(utf8_decode($this->request->post['name'])) > 255)) {
			$json['error'] = $this->language->get('error_name');
		}
		
		if (strlen(utf8_decode($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$json['error'] = $this->language->get('error_email');
		}
		
		if ((strlen(utf8_decode($this->request->post['text'])) < 3)) {
			$json['error'] = $this->language->get('error_text');
		}

				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			$this->model_catalog_comment->addCommentChild($this->request->post);
			
			$json['success'] = $this->language->get('text_success');
		}
		
		$this->response->setOutput(json_encode($json));		
	}
}
?>