<?php 
class ControllerSaleMailTemplate extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		$this->getList();
	}
	public function success() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		$this->getListSuccess();
	}
	public function insert() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_mail_template->addMailTemplate($this->request->post);

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

			$this->redirect($this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_mail_template->editMailTemplate($this->request->get['mail_template_id'], $this->request->post);

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

			//$this->redirect($this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $mail_template_id) {
				$this->model_sale_mail_template->deleteMailTemplate($mail_template_id);
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

			$this->redirect($this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}
	
	public function reset() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		if (isset($this->request->get['mail_template_id'])) {
			$this->model_sale_mail_template->resetMailTemplate($this->request->get['mail_template_id']);

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

			$this->redirect($this->url->link('sale/mail_template/success', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
	
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

		$this->data['insert'] = $this->url->link('sale/mail_template/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('sale/mail_template/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['mail_templates'] = array();

		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$mail_template_total = $this->model_sale_mail_template->getTotalMailTemplates();
		$total_customer = $this->model_sale_mail_template->getDataCustomers();
		
		$results = $this->model_sale_mail_template->getMailTemplates($data);

		foreach ($total_customer as $result) {
			$action = array();

			$viewViews = $this->url->link('sale/mail_template/success', 'token=' . $this->session->data['token']. $url, 'SSL');
			// $action[] = array(
			// 	'text' => $this->language->get('text_reset'),
			// 	'href' => $this->url->link('sale/mail_template/reset', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL')
			// );

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

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_text'] = $this->language->get('entry_text');
		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['entry_counter'] = $this->language->get('entry_counter');
		$this->data['entry_click'] = $this->language->get('entry_click');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

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
			$this->data['error_name'] = array();
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
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
			'href'      => $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);
		
		

		if (!isset($this->request->get['mail_template_id'])) {
			$this->data['action'] = $this->url->link('sale/mail_template/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('sale/mail_template/update', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $this->request->get['mail_template_id'] . $url, 'SSL');
		}
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->data['cancel'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['mail_template_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$mail_template_info = $this->model_sale_mail_template->getMailTemplate($this->request->get['mail_template_id']);
			$this->data['id'] = $this->request->get['mail_template_id'];
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['mail_template_description'])) {
			$this->data['mail_template_description'] = $this->request->post['mail_template_description'];
		} elseif (isset($this->request->get['mail_template_id'])) {
			$this->data['mail_template_description'] = $this->model_sale_mail_template->getMailTemplateDescriptions($this->request->get['mail_template_id']);
		} else {
			$this->data['mail_template_description'] = array();
		}
		
		if (isset($this->request->post['code'])) {
			$this->data['code'] = $this->request->post['code'];
		} elseif (!empty($mail_template_info)) {
			$this->data['code'] = $mail_template_info['code'];
		} else {
			$this->data['code'] = '';
		}
		
		if (isset($this->request->post['counter'])) {
			$this->data['counter'] = $this->request->post['counter'];
		} elseif (!empty($mail_template_info)) {
			$this->data['counter'] = $mail_template_info['counter'];
		} else {
			$this->data['counter'] = '';
		}
		
		if (isset($this->request->post['click'])) {
			$this->data['click'] = $this->request->post['click'];
		} elseif (!empty($mail_template_info)) {
			$this->data['click'] = $mail_template_info['click'];
		} else {
			$this->data['click'] = '';
		}

		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($mail_template_info)) {
			$this->data['sort_order'] = $mail_template_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}

		$this->template = 'sale/mail_template_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());	
	}
	protected function getListSuccess() {
		
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
			'href'      => $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'),
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

		$results = $this->model_sale_mail_template->getMailTemplates($data);

		$total_mail_click = $this->model_sale_mail_template->getTotalMailClick($data);

		foreach ($results as $result) {
			$action = array();

			$viewViews = $this->url->link('sale/mail_template/viewViews', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL');
			$viewClick = $this->url->link('sale/mail_template/viewClick', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL');
			$action[] = array(
				'text' => $this->language->get('text_reset'),
				'href' => $this->url->link('sale/mail_template/reset', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL')
			);

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('sale/mail_template/update', 'token=' . $this->session->data['token'] . '&mail_template_id=' . $result['mail_template_id'] . $url, 'SSL')
			);

			$total_mail_click = $this->model_sale_mail_template->getTotalMailClick($result['mail_template_id']);
			$total_mail_view = $this->model_sale_mail_template->getTotalMailViews($result['mail_template_id']);
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
		$this->template = 'sale/mail_success_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	public function autocomplete() {
		$json = array();

		$this->load->model('sale/mail_template');

		$mail_template_info = $this->model_sale_mail_template->getMailTemplateAuto($this->request->get['mail_template_id']);

		if ($mail_template_info) {
			$json = array(
				'mail_template_id'        => $mail_template_info['mail_template_id'],
				'name'              => $mail_template_info['name'],
				'text'              => $mail_template_info['text']
			);
		}

		$this->response->setOutput(json_encode($json));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'sale/mail_template')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['mail_template_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'sale/mail_template')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('sale/mail_template');

		foreach ($this->request->post['selected'] as $mail_template_id) {

			if ($attribute_total) {
				$this->error['warning'] = sprintf($this->language->get('error_attribute'), $attribute_total);
			}
		}

		if (!$this->error) { 
			return true;
		} else {
			return false;
		}
	}
	/*  dev Đức Trung, update mail click and mail view detail*/
	public function viewClick(){
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		$this->clickList();
	}
	public function viewViews(){
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		$this->viewList();
	}
	public function deleteViews() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $mail_view_id) {
				$this->model_sale_mail_template->deleteMailViews($mail_view_id);
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

			$this->redirect($this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}
	public function deleteClick() {
		$this->language->load('sale/mail_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/mail_template');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $mail_view_id) {
				$this->model_sale_mail_template->deleteMailClick($mail_view_id);
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

			$this->redirect($this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
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
			'href'      => $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['delete'] = $this->url->link('sale/mail_template/deleteViews', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['mail_templates'] = array();

		// $data = array(
		// 	'start' => ($page - 1) * $this->config->get('config_admin_limit'),
		// 	'limit' => $this->config->get('config_admin_limit')
		// );
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
			$results = $this->model_sale_mail_template->getMailViews($this->request->get['mail_template_id'],$data);
			$mail_template_total = $this->model_sale_mail_template->getTotalMailViews($this->request->get['mail_template_id']);
			$tota = $this->model_sale_mail_template->getMailViews($this->request->get['mail_template_id']);
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
				'name'         => $result['lastname']." ".$result['firstname'],
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

		$this->data['sort_name'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.name' . $url, 'SSL');
		$this->data['sort_counter'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.counter' . $url, 'SSL');
		$this->data['sort_click'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.click' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $mail_template_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/mail_template/viewViews', 'token=' . $this->session->data['token'] . $url . '&page={page}&mail_template_id='.trim($this->request->get["mail_template_id"]).'', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_email'] = $filter_email;
		$this->data['filter_viewViews'] = $filter_viewViews;
		$this->data['filter_ip'] = $filter_ip;
		$this->data['filter_browser'] = $filter_browser;
		$this->data['filter_date_modifile'] = $filter_date_modifile;
		$this->data['filter_date_added'] = $filter_date_added;

		$this->template = 'sale/mail_view_list.tpl';
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
		$this->data['delete'] = $this->url->link('sale/mail_template/deleteClick', 'token=' . $this->session->data['token'] . $url, 'SSL');

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
			$results = $this->model_sale_mail_template->getMailClick($this->request->get['mail_template_id'],$data);
			$mail_template_total = $this->model_sale_mail_template->getTotalMailClick($this->request->get['mail_template_id']);
			$tota = $this->model_sale_mail_template->getMailClick($this->request->get['mail_template_id']);
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
				'name'         => $result['firstname']." ".$result['lastname'],
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

		$this->data['sort_name'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.name' . $url, 'SSL');
		$this->data['sort_counter'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.counter' . $url, 'SSL');
		$this->data['sort_click'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.click' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'] . '&sort=mt.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $mail_template_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/mail_template/viewClick', 'token=' . $this->session->data['token'] . $url . '&page={page}&mail_template_id='.trim($this->request->get["mail_template_id"]).'', 'SSL');

		$this->data['pagination'] = $pagination->render();


		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_email'] = $filter_email;
		$this->data['filter_viewViews'] = $filter_viewViews;
		$this->data['filter_ip'] = $filter_ip;
		$this->data['filter_browser'] = $filter_browser;
		$this->data['filter_date_modifile'] = $filter_date_modifile;
		$this->data['filter_date_added'] = $filter_date_added;

		$this->template = 'sale/mail_click_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
}
?>