<?php 
class ControllerInformationEmployee extends Controller {
	public function index() {  
		$this->language->load('information/information');

		$this->load->model('catalog/employee');
		
		$this->load->model('tool/image'); 

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		if (isset($this->request->get['employee_id'])) {
			$employee_id = (int)$this->request->get['employee_id'];
		} else {
			$employee_id = 0;
		}

		$employee_info = $this->model_catalog_employee->getEmployee($employee_id);

		if ($employee_info) {
			$this->document->setTitle($employee_info['custom_title']?$employee_info['custom_title']:$employee_info['name']);
			$this->document->addLink($this->url->link('employee/employee', 'employee_id=' .  $employee_id), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->data['breadcrumbs'][] = array(
				'text'      => $employee_info['name'],
				'href'      => $this->url->link('employee/employee', 'employee_id=' .  $employee_id),      		
				'separator' => $this->language->get('text_separator')
			);

			$this->data['heading_title'] = $employee_info['name'];

			$this->data['button_continue'] = $this->language->get('button_continue');
			
			if ($employee_info['image']) {
				$this->data['image'] = $this->model_tool_image->onesize($employee_info['image_view'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['image'] = '';
			}
			
			$this->data['short_description'] = nl2br(html_entity_decode($employee_info['short_description'], ENT_QUOTES, 'UTF-8'));

			$this->data['description'] = html_entity_decode($employee_info['description'], ENT_QUOTES, 'UTF-8');

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/employee.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/employee.tpl';
			} else {
				$this->template = 'default/template/information/employee.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
		} else {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('employee/employee', 'employee_id=' . $employee_id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');
			$this->data['error_tmp']=1;
				$this->data['heading_title_page'] = $this->language->get('heading_title_error_site');
				$this->data['heading_title_error'] = $this->language->get('heading_title_error');
				$this->data['text_special_error'] = $this->language->get('text_special_error');
				$this->data['text_account_error'] = $this->language->get('text_account_error');
				$this->data['text_edit_error'] = $this->language->get('text_edit_error');
				$this->data['text_password_error'] = $this->language->get('text_password_error');
				$this->data['text_address_error'] = $this->language->get('text_address_error');
				$this->data['text_history_error'] = $this->language->get('text_history_error');
				$this->data['text_download_error'] = $this->language->get('text_download_error');
				$this->data['text_cart_error'] = $this->language->get('text_cart_error');
				$this->data['text_checkout_error'] = $this->language->get('text_checkout_error');
				$this->data['text_search_error'] = $this->language->get('text_search_error');
				$this->data['text_information_error'] = $this->language->get('text_information_error');
				$this->data['text_contact_error'] = $this->language->get('text_contact_error');

				$this->load->model('catalog/category');
				$this->load->model('catalog/product');

				$this->data['categories'] = array();

				$categories_1 = $this->model_catalog_category->getCategories(0);

				foreach ($categories_1 as $category_1) {
					$level_2_data = array();

					$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

					foreach ($categories_2 as $category_2) {
						$level_3_data = array();

						$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

						foreach ($categories_3 as $category_3) {
							$level_3_data[] = array(
								'name' => ($category_3['name_menu'])?$category_3['name_menu']:$category_3['name'],
								'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
							);
						}

						$level_2_data[] = array(
							'name'     => ($category_2['name_menu'])?$category_2['name_menu']:$category_2['name'],
							'children' => $level_3_data,
							'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])	
						);					
					}

					$this->data['categories'][] = array(
						'name'     => ($category_1['name_menu'])?$category_1['name_menu']:$category_1['name'],
						'children' => $level_2_data,
						'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'])
					);
				}

				$this->data['special'] = $this->url->link('product/special');
				$this->data['account'] = $this->url->link('account/account', '', 'SSL');
				$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
				$this->data['password'] = $this->url->link('account/password', '', 'SSL');
				$this->data['address'] = $this->url->link('account/address', '', 'SSL');
				$this->data['history'] = $this->url->link('account/order', '', 'SSL');
				$this->data['download'] = $this->url->link('account/download', '', 'SSL');
				$this->data['cart'] = $this->url->link('checkout/cart');
				$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
				$this->data['search'] = $this->url->link('product/search');
				$this->data['contact'] = $this->url->link('information/contact');

				$this->load->model('catalog/information');

				$this->data['informations'] = array();

				foreach ($this->model_catalog_information->getInformations() as $result) {
					$this->data['informations'][] = array(
						'title' => $result['title'],
						'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
					);
				}

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
		}
	}

}
?>