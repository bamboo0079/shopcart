<?php
class ControllerCatalogNewsLetter extends Controller {
	private $error = array();
 
	public function index() {
		$this->load->language('catalog/newsletter');
		$this->load->model('catalog/newsletter_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/newsletter');
		
		$this->getList();
	}
	public function detail() {
		$this->load->language('catalog/newsletter');
		$this->load->model('catalog/newsletter_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/newsletter');
		
		$this->getDetail();
	}
	public function success() {
		$this->load->language('catalog/newsletter');
		$this->load->model('catalog/newsletter_category');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/newsletter');
		
		$this->getDetailSuccess();
	}

	public function insert() {
		$this->load->language('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/newsletter');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_newsletter->addNewsLetter($this->request->post);
			
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
						
			$this->redirect($this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
	public function viewClick(){
		$this->language->load('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/newsletter');

		$this->clickList();
	}
	public function viewViews(){
		$this->language->load('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/newsletter');

		$this->viewList();
	}
	public function deleteViews() {
		$this->language->load('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/newsletter');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $mail_view_id) {
				$this->model_catalog_newsletter->deleteMailViews($mail_view_id);
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

			$this->redirect($this->url->link('catalog/newsletter/success', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getDetailSuccess();
	}
	public function reset() {
		$this->language->load('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/newsletter');

		if (isset($this->request->get['mail_template_id'])) {
			$this->model_catalog_newsletter->resetMailTemplate($this->request->get['mail_template_id']);

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

			$this->redirect($this->url->link('catalog/newsletter/success', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getDetailSuccess();
	}
	public function deleteClick() {
		$this->language->load('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/newsletter');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $mail_view_id) {
				$this->model_catalog_newsletter->deleteMailClick($mail_view_id);
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

			$this->redirect($this->url->link('catalog/newsletter/success', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getDetailSuccess();
	}
	public function update() {
		$this->load->language('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/newsletter');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_newsletter->editNewsLetter($this->request->get['id'], $this->request->post);
			
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
						
			$this->redirect($this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() { 
		$this->load->language('catalog/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/newsletter');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $id) {
				$this->model_catalog_newsletter->deleteNewsLetter($id);
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
						
			$this->redirect($this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'c.date_added';
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
			'href'      => $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		$this->data['insert'] = $this->url->link('catalog/newsletter/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/newsletter/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$this->data['items'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$total = $this->model_catalog_newsletter->getTotalNewsLetters();
	
		$results = $this->model_catalog_newsletter->getNewsLetters($data);
    	foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/newsletter/update', 'token=' . $this->session->data['token'] . '&id=' . $result['id'] . $url, 'SSL')
			);
			$categories = $this->model_catalog_newsletter->getNewsLetterCategories($result['id']);
			$cate_name = '';
			foreach($categories as $category){
				$rs = $this->model_catalog_newsletter_category->getCategory($category);
				$cate_name .= '- '.$rs['name'].'</br>';
			}	
			$this->data['items'][] = array(
				'id'  => $result['id'],
				'name'       => $result['name'],
				'category'       => $cate_name,
				'email'     => $result['email'],
				'sort_order'     => $result['sort_order'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected'   => isset($this->request->post['selected']) && in_array($result['comment_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_id'] = $this->language->get('column_id');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_category'] = $this->language->get('column_category');
		$this->data['column_yahoo'] = $this->language->get('column_yahoo');
		$this->data['column_skype'] = $this->language->get('column_skype');
		$this->data['column_email'] = $this->language->get('column_email');
		$this->data['column_phone'] = $this->language->get('column_phone');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_action'] = $this->language->get('column_action');			
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_config'] = $this->language->get('button_config');
 
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
		
		$this->data['sort_id'] = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . '&sort=c.id' . $url, 'SSL');
		$this->data['sort_name'] = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . '&sort=nd.name' . $url, 'SSL');
		$this->data['sort_order'] = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . '&sort=c.sort_order' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/newsletter_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
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
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_yahoo'] = $this->language->get('entry_yahoo');
		$this->data['entry_skype'] = $this->language->get('entry_skype');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_phone'] = $this->language->get('entry_phone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
 		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
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
			'href'      => $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
										
		if (!isset($this->request->get['id'])) { 
			$this->data['action'] = $this->url->link('catalog/newsletter/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/newsletter/update', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$info = $this->model_catalog_newsletter->getNewsLetter($this->request->get['id']);
		}
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['newsletter_description'])) {
			$this->data['newsletter_description'] = $this->request->post['newsletter_description'];
		} elseif (isset($info)) {
			$this->data['newsletter_description'] = $this->model_catalog_newsletter->getNewsLetterDescriptions($this->request->get['id']);
		} else {
			$this->data['newsletter_description'] = '';
		}	
		
		$this->load->model('catalog/newsletter_category');
				
		$this->data['categories'] = $this->model_catalog_newsletter_category->getCategories(0);
		//var_dump($this->data['categories']);
		
		if (isset($this->request->post['newsletter_category'])) {
			$this->data['newsletter_category'] = $this->request->post['newsletter_category'];
		} elseif (isset($info)) {
			$this->data['newsletter_category'] = $this->model_catalog_newsletter->getNewsLetterCategories($this->request->get['id']);
		} else {
			$this->data['newsletter_category'] = array();
		}	
		
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} elseif (isset($info)) {
			$this->data['email'] = $info['email'];
		} else {
			$this->data['email'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($info)) {
			$this->data['sort_order'] = $info['sort_order'];
		} else {
			$this->data['sort_order'] = 1;
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($info)) {
			$this->data['status'] = $info['status'];
		} else {
			$this->data['status'] = 1;
		}
		
		

		$this->template = 'catalog/newsletter_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}	
		
		if ((utf8_strlen($this->request->post['email']) < 1) || (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {
      		$this->error['email'] = $this->language->get('error_email');
    	}
		
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	// Đức Trung dev 
	protected function getDetail() {
		$this->load->model('sale/mail_template');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';


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
			'href'      => $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('sale/mail_template/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('sale/mail_template/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['mail_templates'] = array();

		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$mail_template_total = $this->model_sale_mail_template->getTotalMailTemplates();
		$total_customer = $this->model_catalog_newsletter->getDataCustomers($data);
		foreach ($total_customer as $result) {
			$action = array();

			$viewViews = $this->url->link('catalog/newsletter/success', 'token=' . $this->session->data['token']. $url, 'SSL');
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('sale/mail_template/update', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL')
			);

			$this->data['mail_templates'][] = array(
				'mail_template_id' => $result['mail_template_id'],
				'name'               => $result['name'],
				'code'               => $result['code'],
				'total'         			=> $result['total'],
				'success'         		=> $result['success'],
				'error'         		=> $result['error'],
				'date_added'         => $result['date_added'],
				'selected'           => isset($this->request->post['selected']) && in_array($result['mail_template_id'], $this->request->post['selected']),
				'action'             => $action,
				'viewViews'	=>$viewViews
			);
		}	

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_code'] = $this->language->get('column_code');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['column_success'] = $this->language->get('column_success');
		$this->data['column_fail'] = $this->language->get('column_fail');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['date'] = $this->language->get('date');
		$this->data['column_action'] = $this->language->get('column_action');		

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

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_name'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.name' . $url, 'SSL');
		$this->data['sort_counter'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.counter' . $url, 'SSL');
		$this->data['sort_click'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.click' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.sort_order' . $url, 'SSL');

		$url = '';

		$pagination = new Pagination();
		$pagination->total = $mail_template_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		$this->data["total_chart"]=$mail_template_total;
		$this->data['pagination'] = $pagination->render();
		$this->template = 'sale/mail_template_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getDetailSuccess() {
		$this->load->model('sale/mail_template');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
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
			'href'      => $this->url->link('catalog/newsletter/detail', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('sale/mail_template/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('sale/mail_template/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['mail_templates'] = array();

		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$mail_template_total = $this->model_sale_mail_template->getTotalMailTemplates();

		$results = $this->model_catalog_newsletter->getDataCustomers($data);

		foreach ($results as $result) {
			$action = array();

			$viewViews = $this->url->link('catalog/newsletter/viewViews', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL');
			$viewClick = $this->url->link('catalog/newsletter/viewClick', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL');
			$action[] = array(
				'text' => $this->language->get('text_reset'),
				'href' => $this->url->link('catalog/newsletter/reset', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL')
			);

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('sale/mail_template/update', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL')
			);

			$total_mail_click = $this->model_catalog_newsletter->getTotalMailClick($result['mail_template_id']);
			$total_mail_view = $this->model_catalog_newsletter->getTotalMailViews($result['mail_template_id']);
			$this->data['mail_templates'][] = array(
				'mail_template_id' => $result['mail_template_id'],
				'name'               => $result['name'],
				'code'         			=> $result['code'],
				'success'			=>$result['success'],
				'counter'         		=>$total_mail_view,
				'click'         		=>$total_mail_click,
				'sort_order'         => $result['sort_order'],
				'selected'           => isset($this->request->post['selected']) && in_array($result['mail_template_id'], $this->request->post['selected']),
				'action'             => $action,
				'viewViews'	=>$viewViews,
				'viewClick'	=>$viewClick
			);
		}	

		$this->data['heading_title_success'] = $this->language->get('heading_title_success');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_code'] = $this->language->get('column_code');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['column_counter'] = $this->language->get('column_counter');
		$this->data['column_click'] = $this->language->get('column_click');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');		

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

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';
		$pagination = new Pagination();
		$pagination->total = $mail_template_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		$this->data["total_chart"]=$mail_template_total;
		$this->data['pagination'] = $pagination->render();
		$this->template = 'catalog/mail_success_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function viewList() {
		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}
		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}
		if (isset($this->request->get['filter_viewViews'])) {
			$filter_viewViews = $this->request->get['filter_viewViews'];
		} else {
			$filter_viewViews = null;
		}
		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}
		if (isset($this->request->get['filter_browser'])) {
			$filter_browser = $this->request->get['filter_browser'];
		} else {
			$filter_browser = null;
		}
		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}
		if (isset($this->request->get['filter_date_modifile'])) {
			$filter_date_modifile = $this->request->get['filter_date_modifile'];
		} else {
			$filter_date_modifile = null;
		}
	
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

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
			'href'      => $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['delete'] = $this->url->link('catalog/newsletter/deleteViews', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['mail_templates'] = array();
		$data = array(
			'filter_customer'           => $filter_customer, 
			'filter_email'             	=> $filter_email, 
			'filter_viewViews' 			=> $filter_viewViews, 
			'filter_ip' 				=> $filter_ip, 
			'filter_browser'            => $filter_browser, 
			'filter_date_added'        	=> $filter_date_added,
			'filter_date_modifile'      => $filter_date_modifile,
			'start'                    	=> ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                    	=> $this->config->get('config_admin_limit')
		);
		if (isset($this->request->get['mail_template_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$results = $this->model_catalog_newsletter->getMailViews($this->request->get['mail_template_id'],$data);
			$mail_template_total = $this->model_catalog_newsletter->getTotalMailViews($this->request->get['mail_template_id']);
			$tota = $this->model_catalog_newsletter->getMailViews($this->request->get['mail_template_id']);
		}
		if (isset($this->request->get['mail_template_id'])) {
				$this->data['mail_template_id']=$this->request->get['mail_template_id'];
			}
		if (!empty($results[0]['name'])) {
			$this->data['name_mail'] =$results[0]['name'];
		}else{
			$this->data['name_mail'] ="Dữ liệu trống";
		}
		$total_view=0;
		foreach ($tota as $key) {
			
			$total_view= $total_view + $key['view'];
		}
		foreach ($results as $result) {
			if (!empty($result['date_modified'])) {
				$date_modified = date("H:i:s d-m-Y", strtotime($result['date_modified']));
			}else{
				$date_modified = date("H:i:s d-m-Y", strtotime($result['date_added']));
			}
			$this->data['mail_templates'][] = array(
				'mail_view_id' => $result['mail_view_id'],
				'view'               => $result['view'],
				'ip'         			=> $result['ip'],
				'equipment'         		=> cutString($result['equipment'],5),
				'date_added'         		=>date("H:i:s d-m-Y", strtotime($result['date_added'])),
				'date_modified'         => $date_modified,
				'name'         => $result['fullname'],
				'email'         => $result['email'],
			);
		}	
		$this->data['total_view']=$total_view;
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_customer'] = $this->language->get('column_customer');
		$this->data['column_mail'] = $this->language->get('column_mail');
		$this->data['column_viewViews'] = $this->language->get('column_viewViews');
		$this->data['column_ip'] = $this->language->get('column_ip');
		$this->data['column_browser'] = $this->language->get('column_browser');	
		$this->data['column_date'] = $this->language->get('column_date');	
		$this->data['column_modifile'] = $this->language->get('column_modifile');		

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['token'] = $this->session->data['token'];
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

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		$url = '';

		$pagination = new Pagination();
		$pagination->total = $mail_template_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/newsletter/viewViews', 'token=' . $this->session->data['token'] . $url . '&page={page}&mail_template_id='.trim($this->request->get["mail_template_id"]).'', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_email'] = $filter_email;
		$this->data['filter_viewViews'] = $filter_viewViews;
		$this->data['filter_ip'] = $filter_ip;
		$this->data['filter_browser'] = $filter_browser;
		$this->data['filter_date_modifile'] = $filter_date_modifile;
		$this->data['filter_date_added'] = $filter_date_added;

		$this->template = 'catalog/mail_view_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	protected function clickList() {
		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}
		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}
		if (isset($this->request->get['filter_viewViews'])) {
			$filter_viewViews = $this->request->get['filter_viewViews'];
		} else {
			$filter_viewViews = null;
		}
		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}
		if (isset($this->request->get['filter_browser'])) {
			$filter_browser = $this->request->get['filter_browser'];
		} else {
			$filter_browser = null;
		}
		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}
		if (isset($this->request->get['filter_date_modifile'])) {
			$filter_date_modifile = $this->request->get['filter_date_modifile'];
		} else {
			$filter_date_modifile = null;
		}
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

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
			'href'      => $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);
		$this->data['delete'] = $this->url->link('catalog/newsletter/deleteClick', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['mail_templates'] = array();
		$data = array(
			'filter_customer'           => $filter_customer, 
			'filter_email'             	=> $filter_email, 
			'filter_viewViews' 			=> $filter_viewViews, 
			'filter_ip' 				=> $filter_ip, 
			'filter_browser'            => $filter_browser, 
			'filter_date_added'        	=> $filter_date_added,
			'filter_date_modifile'      => $filter_date_modifile,
			'start'                    	=> ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                    	=> $this->config->get('config_admin_limit')
			);
		if (isset($this->request->get['mail_template_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$results = $this->model_catalog_newsletter->getMailClick($this->request->get['mail_template_id'],$data);
			$mail_template_total = $this->model_catalog_newsletter->getTotalMailClick($this->request->get['mail_template_id']);
			$tota = $this->model_catalog_newsletter->getMailClick($this->request->get['mail_template_id']);
		}
		if (isset($this->request->get['mail_template_id'])) {
				$this->data['mail_template_id']=$this->request->get['mail_template_id'];
			}
		if (!empty($results[0]['name'])) {
			$this->data['name_mail'] = $results[0]['name'];
		}else{
			$this->data['name_mail'] = "Dữ liệu rỗng";
		}
		$total_view=0;
		foreach ($tota as $key) {
			
			$total_view= $total_view + $key['click'];
		}
		foreach ($results as $result) {
			if (!empty($result['date_modified'])) {
				$date_modified = date("H:i:s d-m-Y", strtotime($result['date_modified']));
			}else{
				$date_modified = date("H:i:s d-m-Y", strtotime($result['date_added']));
			}
			$this->data['mail_templates'][] = array(
				'mail_view_id' => $result['mail_view_id'],
				'view'               => $result['click'],
				'ip'         			=> $result['ip'],
				'equipment'         		=> cutString($result['equipment'],5),
				'date_added'         		=> date("H:i:s d-m-Y", strtotime($result['date_added'])),
				'date_modified'         => $date_modified,
				'name'         => $result['fullname'],
				'email'         => $result['email'],
			);
		}	
		$this->data['total_view']=$total_view;

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_customer'] = $this->language->get('column_customer');
		$this->data['column_mail'] = $this->language->get('column_mail');
		$this->data['column_viewViews'] = $this->language->get('column_viewViews');
		$this->data['column_ip'] = $this->language->get('column_ip');
		$this->data['column_browser'] = $this->language->get('column_browser');	
		$this->data['column_date'] = $this->language->get('column_date');	
		$this->data['column_modifile'] = $this->language->get('column_modifile');		

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['token'] = $this->session->data['token'];
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
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		$url = '';

		$pagination = new Pagination();
		$pagination->total = $mail_template_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/newsletter/viewClick', 'token=' . $this->session->data['token'] . $url . '&page={page}&mail_template_id='.trim($this->request->get["mail_template_id"]).'', 'SSL');

		$this->data['pagination'] = $pagination->render();


		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_email'] = $filter_email;
		$this->data['filter_viewViews'] = $filter_viewViews;
		$this->data['filter_ip'] = $filter_ip;
		$this->data['filter_browser'] = $filter_browser;
		$this->data['filter_date_modifile'] = $filter_date_modifile;
		$this->data['filter_date_added'] = $filter_date_added;

		$this->template = 'catalog/mail_click_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}	
}
?>