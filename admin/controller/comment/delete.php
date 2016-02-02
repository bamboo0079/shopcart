<?php  
class ControllerCommentDelete extends Controller {
	public function index() {
		$this->language->load('comment/write');
		
		$this->load->model('catalog/comment');
		
		$json = array();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			$this->model_catalog_comment->deleteComment($this->request->post['id']);
			
			$json['success'] = $this->language->get('text_success');
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>