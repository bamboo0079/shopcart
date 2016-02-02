<?php
class ControllerCatalogComment extends Controller {
	private $error = array();
 
	public function index() {
		$this->load->language('catalog/comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/comment');
		
		$this->getList();
	} 

	public function insert() {
		$this->load->language('catalog/comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/comment');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_comment->addcomment($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('catalog/comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/comment');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_comment->editcomment($this->request->get['comment_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	} 

	public function delete() { 
		$this->load->language('catalog/comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/comment');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $url) {
				$this->model_catalog_comment->deleteCommentURL($url);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}
	
	public function approval() { 
		$this->load->language('catalog/comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/comment');
		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $comment_id) {
				$this->model_catalog_comment->approvalComment($comment_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}elseif (isset($this->request->get['id'])) {
			
			$this->model_catalog_comment->approvalComment($this->request->get['id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			//$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		//$this->getList();
	}
	
	public function unapproval() { 
		$this->load->language('catalog/comment');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/comment');
		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $comment_id) {
				$this->model_catalog_comment->unapprovalComment($comment_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}elseif (isset($this->request->get['id'])) {
			
			$this->model_catalog_comment->unapprovalComment($this->request->get['id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			//$this->redirect($this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		//$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'comment_id';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['approval'] = $this->url->link('catalog/comment/approval', 'token=' . $this->session->data['token'] . $url, 'SSL');		
		$this->data['unapproval'] = $this->url->link('catalog/comment/unapproval', 'token=' . $this->session->data['token'] . $url, 'SSL');			
		$this->data['insert'] = $this->url->link('catalog/comment/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/comment/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	
		$this->data['token'] = $this->session->data['token'];

		$this->data['comments'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$comment_total = count($this->model_catalog_comment->getTotalcomments());
		$results = $this->model_catalog_comment->getcomments($data);
 
    	foreach ($results as $result) {
			$action = array();
				
			$action[] = array(
				'text' => $this->language->get('text_view'),
				'href' => $this->url->link('catalog/comment/update', 'token=' . $this->session->data['token'] . '&url=' . $result['url'], 'SSL')
			);
			
			$count_off = $this->model_catalog_comment->getTotalCommentsByUrlOff($result['url']);
			$count_all = $this->model_catalog_comment->getTotalCommentsByUrlAll($result['url']);
						
			$this->data['comments'][] = array(
				'comment_id'  => $result['comment_id'],
				'url'       => $result['url'],
				'count_off'       => $count_off,
				'count_all'       => $count_all,
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'href' 		 => $this->url->link('catalog/comment/update', 'token=' . $this->session->data['token'] . '&url=' . $result['url'], 'SSL'),
				'selected'   => isset($this->request->post['selected']) && in_array($result['comment_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_link'] = $this->language->get('column_link');
		$this->data['column_unapproval'] = $this->language->get('column_unapproval');
		$this->data['column_url'] = $this->language->get('column_url');
		$this->data['column_count'] = $this->language->get('column_count');
		$this->data['column_action'] = $this->language->get('column_action');		
		
		$this->data['button_approval'] = $this->language->get('button_approval');
		$this->data['button_unapproval'] = $this->language->get('button_unapproval');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_name'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$this->data['sort_url'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . '&sort=url' . $url, 'SSL');
		$this->data['sort_rating'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . '&sort=rating' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $comment_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/comment_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	private function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select'] = $this->language->get('text_select');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_parent'] = $this->language->get('entry_parent');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_url'] = $this->language->get('entry_url');
		$this->data['entry_rating'] = $this->language->get('entry_rating');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_text'] = $this->language->get('entry_text');
		$this->data['entry_good'] = $this->language->get('entry_good');
		$this->data['entry_bad'] = $this->language->get('entry_bad');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
 		if (isset($this->error['text'])) {
			$this->data['error_text'] = $this->error['text'];
		} else {
			$this->data['error_text'] = '';
		}
		
 		if (isset($this->error['rating'])) {
			$this->data['error_rating'] = $this->error['rating'];
		} else {
			$this->data['error_rating'] = '';
		}

		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
				
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
										
		if (!isset($this->request->get['comment_id'])) { 
			$this->data['action'] = $this->url->link('catalog/comment/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/comment/update', 'token=' . $this->session->data['token'] . '&comment_id=' . $this->request->get['comment_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['url']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$comment_info = $this->model_catalog_comment->getCommentURL($this->request->get['url']);
		}
		
		$this->data['token'] = $this->session->data['token'];
				
		$this->data['text_no_comments'] = $this->language->get('text_no_comments');
		$this->data['text_reply'] = $this->language->get('text_reply');
		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_qtv'] = $this->language->get('text_qtv');
		$this->data['text_approval'] = $this->language->get('text_approval');
		$this->data['text_unapproval'] = $this->language->get('text_unapproval');
		$this->data['text_delete'] = $this->language->get('text_delete');
		$this->data['text_update'] = $this->language->get('text_update');
		$this->data['text_text_unapproval'] = $this->language->get('text_text_unapproval');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$user_info = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE username = '" . $this->user->getUserName() . "'") -> row;
		$this->data['name_display'] = $user_info['name_display'];
		
		$this->data['url'] = $this->request->get['url'];
		
		$this->data['comments'] = array();
		$url = $this->request->get['url'];
		$comment_total = $this->model_catalog_comment->getTotalCommentsByUrlParent($url);
			
		$results = $this->model_catalog_comment->getCommentsByUrlParent($url, ($page - 1) * 20, 20);
      		
		foreach ($results as $result) {
			
			$child = array();
			
			$childs = $this->model_catalog_comment->getCommentsByUrlByParent($result['comment_id']);
			if($childs){
				foreach($childs as $child_info){
					$child[] = array(
						'comment_id'	=>	$child_info['comment_id'],
						'name'	=>	$child_info['name'],
						'email'	=>	$child_info['email'],
						'link_customer'	=>	$this->url->link('sale/customer', '&filter_email=' . $child_info['email']. '&token='.$this->session->data['token']),
						'phone'	=>	$child_info['phone'],
						'date'	=>	($child_info['date'] != '0000-00-00')?datedata_to_date($child_info['date']):'',
						'rank'	=>	$child_info['rank'],
						'text'	=>	nl2br($child_info['text']),
						'rating'	=>	$child_info['rating'],
						'status'     => (int)$child_info['status'],
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
				'link_customer'	=>	$this->url->link('sale/customer', 'filter_email=' . $result['email']. '&token='.$this->session->data['token']),
				'phone'	=>	$result['phone'],
				'date'	=>	($result['date'] != '0000-00-00')?datedata_to_date($result['date']):'',
				'text'       => nl2br($result['text']),
				'child'       => $child,
				'rating'     => (int)$result['rating'],
				'status'     => (int)$result['status'],
        		'comments'    => sprintf($this->language->get('text_comments'), (int)$comment_total),
        		'date_added' => date($this->language->get('date_format_short').' H:i:s', strtotime($result['date_added']))
        	);
      	}			
		
		$pagination_comment = new Pagination();
		$pagination_comment->total = $comment_total;
		$pagination_comment->page = $page;
		$pagination_comment->limit = $this->config->get('config_admin_limit'); 
		$pagination_comment->text = $this->language->get('text_pagination');
		$pagination_comment->url = $this->url->link('comment/load', 'url=' . $url . '&page={page}');
			
		$this->data['pagination_comment'] = $pagination_comment->render();
		
		
		
		$this->template = 'catalog/comment_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	 public function update_input()
    {
        $json = array();
        if (isset($this->request->get['id'])){
			$this->load->model('catalog/comment');
            if (isset($this->request->get['id'])) {
                $comment_id = $this->request->get['id'];
            } else {
                $comment_id = '';
            }
			$result = $this->model_catalog_comment->getComment($comment_id);
			$json = array(
				'id' => $result['comment_id'],
				'name' => $result['name'],
				'email' => $result['email'],
				'phone' => $result['phone'],
				'date' => $result['date'],
				'text' => html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8'),
				'url' => $result['url'],
				'rating' => $result['rating'],
				'status' => $result['status'],
				'date_added' => $result['date_added'],
				'date_modified' => $result['date_modified']
			);
        }
        $this->response->setOutput(json_encode($json));
    }
	
	public function update_comment() {
		
		$this->load->model('catalog/comment');
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_catalog_comment->editComment($this->request->get['id'], $this->request->post);					
		}
	} 
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/comment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 255)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		}
				
		if (!isset($this->request->post['rating'])) {
			$this->error['rating'] = $this->language->get('error_rating');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/comment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}	
}
?>