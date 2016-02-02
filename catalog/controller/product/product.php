<?php
class ControllerProductProduct extends Controller {
	private $error = array();
	public function index() {
		switch (EVENT_CODE) {
			case 'TDL_':
				$this->eventDL();
				break;
			case 'TAL_':
				$this->eventAL();
				break;
			case 'GT_':
				$this->eventGT();
				break;
			default:
				$this->eventdefault();
				break;
		}
	}
	public function print_product(){
		switch (EVENT_CODE) {
			case 'TDL_':
				$this->print_productDL();
				break;
			case 'TAL_':
				$this->print_productAL();
				break;
			case 'GT_':
				$this->print_productGT();
				break;
			default:
				$this->print_productdefault();
				break;
		}
	}
	public function print_productdefault(){
		$this->language->load('product/product');
		$this->load->model('tool/image');
		$this->data['title'] = $this->language->get('heading_title');
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}
		/*print*/
		if (isset($this->request->get['product_part'])) {
			$product_part = $this->request->get['product_part'];
		} else {
			$product_part = 0;
		}
		if (isset($this->request->get['copy'])=="true") {
			$this->data['copy_active'] = false;
		} else {
			$this->data['copy_active'] = true;
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($product_part) . "'");
		if ($query->num_rows) {
			$url     = explode('=', $query->row['query']);
			$product_id = $url[1];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		if($product_info){
			$this->document->setTitle($product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id), 'canonical');
			$this->data['text_highlights']   = $this->language->get('text_highlights');
			$this->data['text_included']     = $this->language->get('text_included');
			$this->data['text_notincluded']  = $this->language->get('text_notincluded');
			$this->data['text_info']    	 = $this->language->get('text_info');
			$this->data['text_meeting']      = $this->language->get('text_meeting');
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['heading_title']     = $product_info['name'];
			$this->data['product_id']         = $product_id;
			$this->data['duration']        = $product_info['duration'];
			$this->data['model']             = $product_info['model'];
			$this->data['name']           = $product_info['name'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['header']          = html_entity_decode($this->config->get('header_site'), ENT_QUOTES, 'UTF-8');
			$this->data['footer']          = html_entity_decode($this->config->get('footer_site'), ENT_QUOTES, 'UTF-8');
			$this->data['policy']          = array();
			if (isset($product_info['policy'])) {
				$this->load->model('catalog/policy');
				$policy               = $this->model_catalog_policy->getPolicy($product_info['policy']);
				if($policy){
					$this->data['policy'] = array(
						'name' => $policy['name'],
						'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
					);
				}
			}
			$this->data['description']      = $this->replace_tag(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'));
			$this->data['shortdescription'] = $this->replace_tag(html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8'));
			$this->data['highlights']       = $this->replace_tag(html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8'));
			$this->data['included']         = $this->replace_tag(html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8'));
			$this->data['info']         	= $this->replace_tag(html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8'));
			$this->data['meeting']          = $this->replace_tag(html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8'));
			$this->data['notincluded'] 		= $this->replace_tag(html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8'));
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($product_id);
			$this->load->model('catalog/attribute_meal');
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'                  => $result['attribute_meal_id'],
							'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
							'name'                          		=> $result['name']
						);
					}
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	 	 	=> $product_detail['product_detail_id'],
					'meals' 	 					=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($product_id);
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration < 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION	*/
			/*UPDATE DATE PROMOTION 2*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			/*Price*/
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$this->data['phuthu'] = array(22,28,96,97,99);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;
			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}

			$this->data['link'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id);
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/print_product.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/print_product.tpl';
			} else {
				$this->template = 'default/template/product/print_product.tpl';
			}
			$this->response->setOutput($this->render());
		}else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),				'separator' => $this->language->get('text_separator')
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

	public function print_productGT(){
		$tourgroup = 3;
		$price1 = $price2 = $price3 = '';
		$this->language->load('product/product');
		$this->load->model('tool/image');
		$this->data['title'] = $this->language->get('heading_title');
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}
		/*print*/
		if (isset($this->request->get['product_part'])) {
			$product_part = $this->request->get['product_part'];
		} else {
			$product_part = 0;
		}
		if (isset($this->request->get['copy'])=="true") {
			$this->data['copy_active'] = false;
		} else {
			$this->data['copy_active'] = true;
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($product_part) . "'");
		if ($query->num_rows) {
			$url     = explode('=', $query->row['query']);
			$product_id = $url[1];
		} else {
			$product_id = 0;
		}
		if (isset($product_id)) {
			/* Khoa end*/
			if($this->event->check($product_id)) {
				$this->data['event'] = 'event';
				$json = json_decode($this->event->check($product_id));
				$match = explode('#',$json->name);
				// print_r($match);
				// exit();
				if (isset($match[3]) && $match[3] != 0 && !empty($match[3])) {
					if($match[3] <= 3) {
						$this->data['grouptour'] = 1;
					}elseif($match[3] >= 4 && $match[3] <= 6) {
						$this->data['grouptour'] = 2;
					}else{
						$this->data['grouptour'] = 3;
					}
				} else {
					$this->data['grouptour'] = 4 ;

				}
			}
		}
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		if($product_info){
			$this->document->setTitle($product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id), 'canonical');
			$this->data['text_highlights']   = $this->language->get('text_highlights');
			$this->data['text_included']     = $this->language->get('text_included');
			$this->data['text_notincluded']  = $this->language->get('text_notincluded');
			$this->data['text_info']    	 = $this->language->get('text_info');
			$this->data['text_meeting']      = $this->language->get('text_meeting');
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['heading_title']     = $product_info['name'];
			$this->data['product_id']         = $product_id;
			$this->data['duration']        = $product_info['duration'];
			$this->data['model']             = $product_info['model'];
			$this->data['name']           = $product_info['name'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['header']          = html_entity_decode($this->config->get('header_site'), ENT_QUOTES, 'UTF-8');
			$this->data['footer']          = html_entity_decode($this->config->get('footer_site'), ENT_QUOTES, 'UTF-8');
			$this->data['policy']          = array();
			if (isset($product_info['policy'])) {
				$this->load->model('catalog/policy');
				$policy               = $this->model_catalog_policy->getPolicy($product_info['policy']);
				if($policy){
					$this->data['policy'] = array(
						'name' => $policy['name'],
						'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
					);
				}
			}
			$this->data['description']      = $this->replace_tag(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'));
			$this->data['shortdescription'] = $this->replace_tag(html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8'));
			$this->data['highlights']       = $this->replace_tag(html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8'));
			$this->data['included']         = $this->replace_tag(html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8'));
			$this->data['info']         	= $this->replace_tag(html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8'));
			$this->data['meeting']          = $this->replace_tag(html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8'));
			$this->data['notincluded'] 		= $this->replace_tag(html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8'));
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($product_id);
			$this->load->model('catalog/attribute_meal');
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'                  => $result['attribute_meal_id'],
							'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
							'name'                          		=> $result['name']
						);
					}
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	 	 	=> $product_detail['product_detail_id'],
					'meals' 	 					=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($product_id);
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration < 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION	*/
			/*UPDATE DATE PROMOTION 2*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			/*Price*/
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$this->data['phuthu'] = array(22,28,96,97,99);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;
			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			$this->data['link'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id);
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/print_product.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/print_product.tpl';
			} else {
				$this->template = 'default/template/product/print_product.tpl';
			}
			$this->response->setOutput($this->render());
		}else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),				'separator' => $this->language->get('text_separator')
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
	public function print_productAL(){
		$tourgroup = 3;
		$price1 = $price2 = $price3 = '';
		$this->language->load('product/product');
		$this->load->model('tool/image');
		$this->data['title'] = $this->language->get('heading_title');
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}
		/*print*/
		if (isset($this->request->get['product_part'])) {
			$product_part = $this->request->get['product_part'];
		} else {
			$product_part = 0;
		}
		if (isset($this->request->get['copy'])=="true") {
			$this->data['copy_active'] = false;
		} else {
			$this->data['copy_active'] = true;
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($product_part) . "'");
		if ($query->num_rows) {
			$url     = explode('=', $query->row['query']);
			$product_id = $url[1];
		} else {
			$product_id = 0;
		}
		if (isset($product_id)) {
			/* Khoa end*/
			if($this->event->check($product_id)) {
				$this->data['event'] = 'event';
				$json = json_decode($this->event->check($product_id));
				$match = explode('#',$json->name);
				// print_r($match);
				// exit();
				if (isset($match[3]) && $match[3] != 0 && !empty($match[3])) {
					if($match[3] <= 3) {
						$this->data['grouptour'] = 1;
					}elseif($match[3] >= 4 && $match[3] <= 6) {
						$this->data['grouptour'] = 2;
					}else{
						$this->data['grouptour'] = 3;
					}
				} else {
					$this->data['grouptour'] = 4 ;

				}
			}
		}
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		if($product_info){
			$this->document->setTitle($product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id), 'canonical');
			$this->data['text_highlights']   = $this->language->get('text_highlights');
			$this->data['text_included']     = $this->language->get('text_included');
			$this->data['text_notincluded']  = $this->language->get('text_notincluded');
			$this->data['text_info']    	 = $this->language->get('text_info');
			$this->data['text_meeting']      = $this->language->get('text_meeting');
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['heading_title']     = $product_info['name'];
			$this->data['product_id']         = $product_id;
			$this->data['duration']        = $product_info['duration'];
			$this->data['model']             = $product_info['model'];
			$this->data['name']           = $product_info['name'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['header']          = html_entity_decode($this->config->get('header_site'), ENT_QUOTES, 'UTF-8');
			$this->data['footer']          = html_entity_decode($this->config->get('footer_site'), ENT_QUOTES, 'UTF-8');
			$this->data['policy']          = array();
			if (isset($product_info['policy'])) {
				$this->load->model('catalog/policy');
				$policy               = $this->model_catalog_policy->getPolicy($product_info['policy']);
				if($policy){
					$this->data['policy'] = array(
						'name' => $policy['name'],
						'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
					);
				}
			}
			$this->data['description']      = $this->replace_tag(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'));
			$this->data['shortdescription'] = $this->replace_tag(html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8'));
			$this->data['highlights']       = $this->replace_tag(html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8'));
			$this->data['included']         = $this->replace_tag(html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8'));
			$this->data['info']         	= $this->replace_tag(html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8'));
			$this->data['meeting']          = $this->replace_tag(html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8'));
			$this->data['notincluded'] 		= $this->replace_tag(html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8'));
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($product_id);
			$this->load->model('catalog/attribute_meal');
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'                  => $result['attribute_meal_id'],
							'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
							'name'                          		=> $result['name']
						);
					}
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	 	 	=> $product_detail['product_detail_id'],
					'meals' 	 					=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($product_id);
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration < 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION	*/
			/*UPDATE DATE PROMOTION 2*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			/*Price*/
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$this->data['phuthu'] = array(22,28,96,97,99);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;
			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			$this->data['link'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id);
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/print_product.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/print_product.tpl';
			} else {
				$this->template = 'default/template/product/print_product.tpl';
			}
			$this->response->setOutput($this->render());
		}else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),				'separator' => $this->language->get('text_separator')
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

	public function print_productDL(){
		$tourgroup = 3;
		$price1 = $price2 = $price3 = '';
		$this->language->load('product/product');
		$this->load->model('tool/image');
		$this->data['title'] = $this->language->get('heading_title');
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}
		/*print*/
		if (isset($this->request->get['product_part'])) {
			$product_part = $this->request->get['product_part'];
		} else {
			$product_part = 0;
		}
		if (isset($this->request->get['copy'])=="true") {
			$this->data['copy_active'] = false;
		} else {
			$this->data['copy_active'] = true;
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($product_part) . "'");
		if ($query->num_rows) {
			$url     = explode('=', $query->row['query']);
			$product_id = $url[1];
		} else {
			$product_id = 0;
		}
		if (isset($product_id)) {
			if($this->cart->filtertour($product_id) == 0){
				$this->data['event'] = 'event';
				$this->data['linkbannergroup'] = 'http://www.vietfuntravel.com.vn/image/data/banner-promotion/tet-2016/tour-1-den-2-ngay.jpg';
				$this->data['start'] = 99000;
				$this->data['end'] = 119000;
				$tourgroup = 0; // dat co de lay gia khuyen mai nhom < 5 nguoi
			}elseif($this->cart->filtertour($product_id) == 1){
				$this->data['event'] = 'event';
				$this->data['linkbannergroup'] = 'http://www.vietfuntravel.com.vn/image/data/banner-promotion/tet-2016/tour-4-ngay.jpg';
				// kiem tra event nhom tren va duoi 5 nguoi
				$this->data['start'] = 129000;
				$this->data['end'] = 219000;
				$tourgroup = 1; // dat co de lay gia khuyen mai nhom >= 5 nguoi
				// ket thuc
			}
		}
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		if($product_info){
			$this->document->setTitle($product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id), 'canonical');
			$this->data['text_highlights']   = $this->language->get('text_highlights');
			$this->data['text_included']     = $this->language->get('text_included');
			$this->data['text_notincluded']  = $this->language->get('text_notincluded');
			$this->data['text_info']    	 = $this->language->get('text_info');
			$this->data['text_meeting']      = $this->language->get('text_meeting');
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['heading_title']     = $product_info['name'];
			$this->data['product_id']         = $product_id;
			$this->data['duration']        = $product_info['duration'];
			$this->data['model']             = $product_info['model'];
			$this->data['name']           = $product_info['name'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['header']          = html_entity_decode($this->config->get('header_site'), ENT_QUOTES, 'UTF-8');
			$this->data['footer']          = html_entity_decode($this->config->get('footer_site'), ENT_QUOTES, 'UTF-8');
			$this->data['policy']          = array();
			if (isset($product_info['policy'])) {
				$this->load->model('catalog/policy');
				$policy               = $this->model_catalog_policy->getPolicy($product_info['policy']);
				if($policy){
					$this->data['policy'] = array(
						'name' => $policy['name'],
						'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
					);
				}
			}
			$this->data['description']      = $this->replace_tag(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'));
			$this->data['shortdescription'] = $this->replace_tag(html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8'));
			$this->data['highlights']       = $this->replace_tag(html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8'));
			$this->data['included']         = $this->replace_tag(html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8'));
			$this->data['info']         	= $this->replace_tag(html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8'));
			$this->data['meeting']          = $this->replace_tag(html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8'));
			$this->data['notincluded'] 		= $this->replace_tag(html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8'));
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($product_id);
			$this->load->model('catalog/attribute_meal');
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'                  => $result['attribute_meal_id'],
							'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
							'name'                          		=> $result['name']
						);
					}
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	 	 	=> $product_detail['product_detail_id'],
					'meals' 	 					=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($product_id);
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration < 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION	*/
			/*UPDATE DATE PROMOTION 2*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			/*Price*/
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$this->data['phuthu'] = array(22,28,96,97,99);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;
			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if($tourgroup == 0){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 99000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 119000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if($tourgroup == 1){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 129000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 219000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_1'				  => $price1,
								'price_2'				  => $price2,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			$this->data['link'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $product_id);
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/print_product.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/print_product.tpl';
			} else {
				$this->template = 'default/template/product/print_product.tpl';
			}
			$this->response->setOutput($this->render());
		}else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),				'separator' => $this->language->get('text_separator')
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

	public function replace_tag($e)    {
		$e = preg_replace('/[<]font [^>]*[>]/', '', $e);
		/*$e = preg_replace('/[<]li style="*"[^>]*[>]/','', $e);*/
		$e = preg_replace('/[<]span style="font-size(.*?)"[^>]*[>]/', '', $e);
		$e = preg_replace('/[<]span style="font-family(.*?)"[^>]*[>]/', '', $e);
		$e = preg_replace('/[<]span style="outline: none; font-family(.*?)"[^>]*[>]/', '', $e);
		$e = preg_replace('/[<]br[^>]*[>]/', '', $e);
		$e = preg_replace('/<(p|div)>(\s|&nbsp;)*<\/\1>/', '', $e);
		/*$e = preg_replace('/(<[span>]+) style=".*?"/i', '$1', $e);    */
		return $e;
	}

	public function review() {
		$this->language->load('product/product');
		$this->load->model('catalog/review');
		$this->data['text_no_reviews'] = $this->language->get('text_no_reviews');
		$guest = $this->language->get('guest');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$this->data['reviews'] = array();
		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);
		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);
		foreach ($results as $result) {
			$this->data['reviews'][] = array(
				'author'     => $result['author']?$result['author']:$guest,
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}
		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');
		$this->data['pagination'] = $pagination->render();		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/review.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/review.tpl';
		} else {
			$this->template = 'default/template/product/review.tpl';
		}
		$this->response->setOutput($this->render());
	}

	public function getRecurringDescription() {
		$this->language->load('product/product');
		$this->load->model('catalog/product');
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		if (isset($this->request->post['profile_id'])) {
			$profile_id = $this->request->post['profile_id'];
		} else {
			$profile_id = 0;
		}
		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$profile_info = $this->model_catalog_product->getProfile($product_id, $profile_id);
		$json = array();
		if ($product_info && $profile_info) {
			if (!$json) {
				$frequencies = array(
					'day' => $this->language->get('text_day'),
					'week' => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month' => $this->language->get('text_month'),
					'year' => $this->language->get('text_year'),
				);
				if ($profile_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($profile_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $profile_info['trial_cycle'], $frequencies[$profile_info['trial_frequency']], $profile_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}
				$price = $this->currency->format($this->tax->calculate($profile_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
				if ($profile_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $profile_info['cycle'], $frequencies[$profile_info['frequency']], $profile_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_until_canceled_description'), $price, $profile_info['cycle'], $frequencies[$profile_info['frequency']], $profile_info['duration']);				}				$json['success'] = $text;
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function write() {
		$this->language->load('product/product');
		$this->load->model('catalog/review');
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}
			if (!isset($json['error'])) {
				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);
				$json['success'] = $this->language->get('text_success');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function captcha() {
		$this->load->library('captcha');
		$captcha = new Captcha();
		$this->session->data['captcha'] = $captcha->getCode();
		$captcha->showImage();
	}

	public function upload() {
		$this->language->load('product/product');
		$json = array();
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
				$json['error'] = $this->language->get('error_filename');
			}
			/* Allowed file extension types*/
			$allowed = array();
			$filetypes = explode("\n", $this->config->get('config_file_extension_allowed'));
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}
			/* Allowed file mime types*/
			$allowed = array();
			$filetypes = explode("\n", $this->config->get('config_file_mime_allowed'));
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			if (!in_array($this->request->files['file']['type'], $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		if (!$json && is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
			$file = basename($filename) . '.' . md5(mt_rand());
			/* Hide the uploaded file name so people can not link to it directly.	*/
			$json['file'] = $this->encryption->encrypt($file);
			move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
			$json['success'] = $this->language->get('text_upload');
		}
		$this->response->setOutput(json_encode($json));
	}

	/* Khoa chia  function index thanh nhieu phan nho va goi tai index()*/
	public function EventGT()
	{
		$tourgroup = 3;
		$price1 = $price2 = $price3 = '';
		$this->language->load('product/product');
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false		);
		$this->load->model('catalog/category');
		$this->load->model('catalog/manufacturer');
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);
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
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);
			if ($manufacturer_info) {
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id='.$this->request->get['manufacturer_id'] . $url),
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			);
		}
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		$this->data['grouptour'] = 0;

		if (isset($product_id)) {
			/* bat dieu kien kiem tra thu vien event, neu la chuoi JSON, san pham thuoc dieu kien cua thu vien, neu khong se return 0*/

			if(isJSON($this->event->check($product_id))){
				$this->data['promotion_date_start'] = EVENT_START;
				$this->data['promotion_date_start2'] = EVENT_START;
				$this->data['promotion_date_end'] = EVENT_END;
			} else{
				$this->data['promotion_date_start'] = '0000-00-00';
				$this->data['promotion_date_start2'] = '0000-00-00';
				$this->data['promotion_date_end'] = '0000-00-00';
			}

			/* Khoa end*/
			if($this->event->check($product_id)) {
				$this->data['event'] = 'event';
				$json = json_decode($this->event->check($product_id));
				$match = explode('#',$json->name);
				$match = explode(' ',$match[3]);
				if (isset($match[0]) && (int)$match[0] != 0 && !empty($match[0])) {
					if((int)$match[0] <= 3) {
						$this->data['linkbannergroup'] = HTTP_SERVER.'/image/data/banner-promotion/nguyendan/1-3n.jpg';
						$this->data['grouptour'] = 1;
					}elseif((int)$match[0] >= 4) {
						$this->data['linkbannergroup'] = HTTP_SERVER.'/image/data/banner-promotion/nguyendan/4-6n.jpg';
						$this->data['grouptour'] = 2;
					}
				}
			}
		}

		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		if ($product_info) {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if ($product_info['custom_breadcrumb']) {
				/* Set parent category breadcrumb	*/
				$category_parent = $this->model_catalog_category->getParentByCategoriesId($product_info['custom_breadcrumb']);
				foreach ($category_parent as $path_id) {
					$category_info = $this->model_catalog_category->getCategory($path_id);
					if ($category_info) {
						$this->data['breadcrumbs'][] = array(
							'text'      => $category_info['name'],
							'href'      => $this->url->link('product/category', 'path=' . $path_id),'separator' => $this->language->get('text_separator')
						);
					}
				}
				/* Set the last category breadcrumb		*/
				$category_info = $this->model_catalog_category->getCategory($product_info['custom_breadcrumb']);
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $product_info['custom_breadcrumb']),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']),
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle(($product_info['custom_title'])?$product_info['custom_title']:$product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/minitip/jquery.miniTip.min.js');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery-scrolltofixed-min.js');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/minitip/miniTip.min.css');
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
			}
			if($product_info['robot_index']){
				$this->document->addMeta('noindex, nofollow','','robots');
			}
			$this->data['heading_title'] = ($product_info['name_tour'])?$product_info['name_tour']:$product_info['name'];
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_review'] = sprintf($this->language->get('text_review'),
				$this->data['heading_title']);
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
			/*V2*/
			$this->data['text_percent'] = $this->language->get('text_percent');
			$this->data['text_price_special'] = $this->language->get('text_price_special');
			$this->data['text_price_special1'] = $this->language->get('text_price_special1');
			$this->data['text_time_special'] = $this->language->get('text_time_special');
			$this->data['text_time_special1'] = $this->language->get('text_time_special1');
			$this->data['text_price_save'] = $this->language->get('text_price_save');
			$this->data['text_info'] = $this->language->get('text_info');
			$this->data['text_info_details'] = $this->language->get('text_info_details');
			$this->data['text_desc'] = sprintf($this->language->get('text_desc'),$this->data['heading_title']);
			$this->data['text_highlights'] = $this->language->get('text_highlights');
			$this->data['text_schedule'] = $this->language->get('text_schedule');
			$this->data['text_price_details'] = sprintf($this->language->get('text_price_details'),$this->data['heading_title']);
			$this->data['text_type'] = $this->language->get('text_type');
			$this->data['text_price_list'] = $this->language->get('text_price_list');
			$this->data['text_hotel_details'] = sprintf($this->language->get('text_hotel_details'),$this->data['heading_title']);
			$this->data['text_location'] = $this->language->get('text_location');
			$this->data['text_hotel'] = $this->language->get('text_hotel');
			$this->data['text_slideshow'] = $this->language->get('text_slideshow');
			$this->data['text_terms'] = $this->language->get('text_terms');
			$this->data['text_not_menu'] = $this->language->get('text_not_menu');
			/*END V2*/
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			/*V2*/
			$this->data['entry_duration'] = $this->language->get('entry_duration');
			$this->data['entry_departure'] = $this->language->get('entry_departure');
			$this->data['entry_start_time'] = $this->language->get('entry_start_time');
			$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
			$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
			$this->data['entry_not_start_time'] = $this->language->get('entry_not_start_time');
			$this->data['entry_location_to'] = $this->language->get('entry_location_to');
			$this->data['entry_location_from'] = $this->language->get('entry_location_from');
			$this->data['entry_transport'] = $this->language->get('entry_transport');
			$this->data['entry_schedule'] = $this->language->get('entry_schedule');
			$this->data['entry_included'] = $this->language->get('entry_included');
			$this->data['entry_notincluded'] = $this->language->get('entry_notincluded');
			$this->data['entry_info_extra'] = $this->language->get('entry_info_extra');
			$this->data['entry_meeting'] = $this->language->get('entry_meeting');
			$this->data['entry_tag'] = $this->language->get('entry_tag');
			$this->data['entry_model'] = $this->language->get('entry_model');
			/*END V2*/
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_car_rent'] = $this->language->get('button_car_rent');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->load->model('catalog/review');
			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
			$this->data['tab_related'] = $this->language->get('tab_related');
			/*V2*/
			$this->data['tab_schedule'] = $this->language->get('tab_schedule');
			$this->data['tab_price'] = $this->language->get('tab_price');
			$this->data['tab_hotel'] = $this->language->get('tab_hotel');
			$this->data['tab_payment'] = $this->language->get('tab_payment');
			$this->data['tab_terms'] = $this->language->get('tab_terms');
			$this->data['tab_info'] = $this->language->get('tab_info');
			$this->data['tab_menu'] = $this->language->get('tab_menu');
			/*END V2*/
			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['model'] = $product_info['model'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['start_time'] = $product_info['start_time'];//			
			$this->data['start_time_holiday'] = $product_info['start_time_holiday'];
			$this->data['start_time_tet'] = $product_info['start_time_tet'];
			$this->data['not_start_time'] = $product_info['not_start_time'];
			$this->data['departure'] = $product_info['departure'];
			$this->data['location_to'] = $product_info['location_to'];
			$this->data['location_from'] = $product_info['location_from'];
			$this->data['transport'] = $product_info['transport'];
			$this->data['duration'] = $product_info['duration'];
			$this->data['sub_duration'] = $product_info['sub_duration'];
			$this->data['schedule'] = $product_info['schedule'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['print_product'] = 'print/' . str_replace(HTTP_SERVER, '', $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']));
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration <= 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION						
				//UPDATE DATE PROMOTION 2	*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			if ($product_info['quantity'] <= 0) {
				$this->data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $product_info['quantity'];
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}
			$this->load->model('tool/image');
			if ($product_info['image'] && file_exists(DIR_IMAGE . $product_info['image'])) {
				$this->data['popup'] = $this->model_tool_image->onesize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			}
			if ($product_info['image']&& file_exists(DIR_IMAGE . $product_info['image'])) {				$this->data['thumb'] = $this->model_tool_image->cropsize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			}
			$this->data['images'] = array();
			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'))				);
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $product_info['price'] != 0) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['price'] = false;
			}
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$price_save = $product_info['price'] - $product_info['special'];
			if($price_save > 0){
				$this->data['price_save'] = $this->currency->format($this->tax->calculate($price_save, $product_info['tax_class_id'],
					$this->config->get('config_tax')));
				/*$this->data['percent'] = ceil(($price_save / $product_info['price']) * 100);*/
				$this->data['percent'] = $this->currency->format($price_save);
			} else {
				$this->data['price_save'] = false;
				$this->data['percent'] = false;
			}
			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$this->data['tax'] = false;
			}
			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
			$this->data['discounts'] = array();
			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
			$this->data['policy'] = array();
			if ($product_info['policy']) {
				$this->load->model('catalog/policy');
				$policy = $this->model_catalog_policy->getPolicy($product_info['policy']);
				$this->data['policy'] = array(
					'name' => $policy['name'],
					'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
				);
			}
			$this->data['phuthu'] = array(22,28,96,97,99,117);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;

			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if($tourgroup == 0){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 99000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 119000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if($tourgroup == 1){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 129000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 219000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}


							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_1'				  => $price1,
								'price_2'				  => $price2,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay		*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			if ($product_info['minimum']) {
				$this->data['minimum'] = $product_info['minimum'];
			} else {
				$this->data['minimum'] = 1;
			}
			if($product_info['delay_book']){
				$this->data['day'] = date($this->language->get('date_format_short'), time() + ($product_info['delay_book'] * 86400));
			}else{
				$this->data['day'] = date($this->language->get('date_format_short'), time());
			}
			$this->data['delay_book'] = (int)$product_info['delay_book'];
			$this->data['product_type'] = (int)$product_info['product_type'];
			$this->data['product_class'] = (int)$product_info['product_class'];

			$this->data['promotion1_date_start'] = $this->language->get('promotion1_date_start');
			$this->data['promotion1_date_end'] = $this->language->get('promotion1_date_end');
			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$this->data['rating'] = (int)$product_info['rating'];
			$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
			$this->data['url'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']);			$this->data['review_no'] = $product_info['reviews'];
			$this->data['quantity'] = $product_info['quantity'];
			$this->data['shortdescription'] = html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8');
			$this->data['highlights'] = html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8');
			$this->data['included'] = html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8');			$this->data['notincluded'] = html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8');
			$this->data['info'] = html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8');
			$this->data['meeting'] = html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8');
			$this->data['terms'] = html_entity_decode($product_info['terms'], ENT_QUOTES, 'UTF-8');
			$this->data['suggest'] = html_entity_decode($product_info['suggest'], ENT_QUOTES, 'UTF-8');
			$this->data['payment_content'] = html_entity_decode($this->config->get('payment_content'), ENT_QUOTES, 'UTF-8');
			$this->data['payment_menu'] = html_entity_decode($this->config->get('payment_menu'), ENT_QUOTES, 'UTF-8');
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($this->request->get['product_id']);
			$this->load->model('catalog/attribute_meal');
			$this->data['check_menu'] = false;
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'           => $result['attribute_meal_id'],
							'image'                       => HTTP_SERVER . 'image/' . $result['image'],
							'name'                         => $result['name']
						);
					}
				}
				if($product_detail['menu']){
					$this->data['check_menu'] = true;
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	=> $product_detail['product_detail_id'],
					'meals' 	 			=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'),$this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->load->model('account/customer');
			if ($this->customer->isLogged()) {
				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
				$this->data['customer_name'] = $customer_info['lastname'].' '.$customer_info['firstname'];
			}else{
				$this->data['customer_name'] = false;
			}
			$this->data['products'] = array();
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'],
						$result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
			$data = array(
				'product_id'	=> $product_id,
				'filter_duration'	=> $product_info['duration'],
				'filter_category'	=> $product_info['custom_breadcrumb']
			);
			$this->data['products_orther'] = array();
			$results = $this->model_catalog_product->getOrtherProducts($data);
			/*var_dump($results)*/;
			shuffle($results);
			$results = array_slice($results, 0, 6);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $result['price'] != 0) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}
				$this->data['products_orther'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => cutString($result['name'],20),
					'full_name'    	 => $result['name'],
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday'],
					'start_time_tet'    	 => $result['start_time_tet'],
					'departure'    	 => $result['departure'],
					'location_to'    	 => $result['location_to'],
					'location_from'    	 => $result['location_from'],
					'transport'    	 => $result['transport'],
					'duration'    	 => $result['duration'],
					'schedule'    	 => $result['schedule'],
					'product_type'    	 => $result['product_type'],
					'price'   	 => $price?$price:$this->language->get('text_contact'),
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $result['product_id'])
				);
			}
			/*Tags*/
			$this->load->model('catalog/tag');
			$this->data['tags'] = array();
			$tags = $this->model_catalog_product->getTags($product_info['product_id']);
			foreach($tags as $item){
				$result = $this->model_catalog_tag->getTag($item['tag_id']);
				if($result){
					$this->data['tags'][] = array(
						'name'	=>	$result['name_menu']?$result['name_menu']:$result['name'],
						'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'])					);
				}
			}
			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');
			$this->data['profiles'] = $this->model_catalog_product->getProfiles($product_info['product_id']);
			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			if($product_info['product_type'] == 0){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/product.tpl';
				} else {
					$this->template = 'default/template/product/product.tpl';
				}
			}
			if($product_info['product_type'] == 1){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/openbus.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/openbus.tpl';
				} else {
					$this->template = 'default/template/product/openbus.tpl';
				}
			}elseif($product_info['product_type'] == 2){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/car_rent.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/car_rent.tpl';
				} else {
					$this->template = 'default/template/product/car_rent.tpl';
				}
			}elseif($product_info['product_type'] == 3){
				$this->template = $this->config->get('config_template') .'/template/product/tour_special_tet.tpl';
			}
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'module/comment'
			);
			$this->response->setOutput($this->render());
		} else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle($this->language->get('text_error'));
			$this->data['heading_title'] = $this->language->get('text_error');
			$this->data['text_error'] = $this->language->get('text_error');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['continue'] = $this->url->link('common/home');
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

	public function EventAL()
	{
		$tourgroup = 3;
		$price1 = $price2 = $price3 = '';
		$this->language->load('product/product');
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false		);
		$this->load->model('catalog/category');
		$this->load->model('catalog/manufacturer');
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);
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
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);
			if ($manufacturer_info) {
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id='.$this->request->get['manufacturer_id'] . $url),
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			);
		}
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		$this->data['grouptour'] = 0;

		if (isset($product_id)) {
			/* bat dieu kien kiem tra thu vien event, neu la chuoi JSON, san pham thuoc dieu kien cua thu vien, neu khong se return 0*/

			if(isJSON($this->event->check($product_id))){
				$this->data['promotion_date_start'] = EVENT_START;
				$this->data['promotion_date_start2'] = EVENT_START;
				$this->data['promotion_date_end'] = EVENT_END;
			} else{
				$this->data['promotion_date_start'] = '0000-00-00';
				$this->data['promotion_date_start2'] = '0000-00-00';
				$this->data['promotion_date_end'] = '0000-00-00';
			}

			/* Khoa end*/
			if($this->event->check($product_id)) {
				$this->data['event'] = 'event';
				$json = json_decode($this->event->check($product_id));
				$match = explode('#',$json->name);
				// print_r($match);
				// exit();
				if (isset($match[3]) && $match[3] != 0 && !empty($match[3])) {
					if($match[3] <= 3) {
						$this->data['linkbannergroup'] = HTTP_SERVER.'/image/data/banner-promotion/nguyendan/1-3n.jpg';
						$this->data['grouptour'] = 1;
					}elseif($match[3] >= 4 && $match[3] <= 6) {
						$this->data['linkbannergroup'] = HTTP_SERVER.'/image/data/banner-promotion/nguyendan/4-6n.jpg';
						$this->data['grouptour'] = 2;
					}else{
						$this->data['linkbannergroup'] = HTTP_SERVER.'/image/data/banner-promotion/nguyendan/7n.jpg';
						$this->data['grouptour'] = 3;
					}
				} else {
					$this->data['grouptour'] = 4 ;

				}
			}
		}

		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		if ($product_info) {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if ($product_info['custom_breadcrumb']) {
				/* Set parent category breadcrumb	*/
				$category_parent = $this->model_catalog_category->getParentByCategoriesId($product_info['custom_breadcrumb']);
				foreach ($category_parent as $path_id) {
					$category_info = $this->model_catalog_category->getCategory($path_id);
					if ($category_info) {
						$this->data['breadcrumbs'][] = array(
							'text'      => $category_info['name'],
							'href'      => $this->url->link('product/category', 'path=' . $path_id),'separator' => $this->language->get('text_separator')
						);
					}
				}
				/* Set the last category breadcrumb		*/
				$category_info = $this->model_catalog_category->getCategory($product_info['custom_breadcrumb']);
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $product_info['custom_breadcrumb']),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']),
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle(($product_info['custom_title'])?$product_info['custom_title']:$product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/minitip/jquery.miniTip.min.js');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery-scrolltofixed-min.js');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/minitip/miniTip.min.css');
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
			}
			if($product_info['robot_index']){
				$this->document->addMeta('noindex, nofollow','','robots');
			}
			$this->data['heading_title'] = ($product_info['name_tour'])?$product_info['name_tour']:$product_info['name'];
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_review'] = sprintf($this->language->get('text_review'),
				$this->data['heading_title']);
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
			/*V2*/
			$this->data['text_percent'] = $this->language->get('text_percent');
			$this->data['text_price_special'] = $this->language->get('text_price_special');
			$this->data['text_price_special1'] = $this->language->get('text_price_special1');
			$this->data['text_time_special'] = $this->language->get('text_time_special');
			$this->data['text_time_special1'] = $this->language->get('text_time_special1');
			$this->data['text_price_save'] = $this->language->get('text_price_save');
			$this->data['text_info'] = $this->language->get('text_info');
			$this->data['text_info_details'] = $this->language->get('text_info_details');
			$this->data['text_desc'] = sprintf($this->language->get('text_desc'),$this->data['heading_title']);
			$this->data['text_highlights'] = $this->language->get('text_highlights');
			$this->data['text_schedule'] = $this->language->get('text_schedule');
			$this->data['text_price_details'] = sprintf($this->language->get('text_price_details'),$this->data['heading_title']);
			$this->data['text_type'] = $this->language->get('text_type');
			$this->data['text_price_list'] = $this->language->get('text_price_list');
			$this->data['text_hotel_details'] = sprintf($this->language->get('text_hotel_details'),$this->data['heading_title']);
			$this->data['text_location'] = $this->language->get('text_location');
			$this->data['text_hotel'] = $this->language->get('text_hotel');
			$this->data['text_slideshow'] = $this->language->get('text_slideshow');
			$this->data['text_terms'] = $this->language->get('text_terms');
			$this->data['text_not_menu'] = $this->language->get('text_not_menu');
			/*END V2*/
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			/*V2*/
			$this->data['entry_duration'] = $this->language->get('entry_duration');
			$this->data['entry_departure'] = $this->language->get('entry_departure');
			$this->data['entry_start_time'] = $this->language->get('entry_start_time');
			$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
			$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
			$this->data['entry_not_start_time'] = $this->language->get('entry_not_start_time');
			$this->data['entry_location_to'] = $this->language->get('entry_location_to');
			$this->data['entry_location_from'] = $this->language->get('entry_location_from');
			$this->data['entry_transport'] = $this->language->get('entry_transport');
			$this->data['entry_schedule'] = $this->language->get('entry_schedule');
			$this->data['entry_included'] = $this->language->get('entry_included');
			$this->data['entry_notincluded'] = $this->language->get('entry_notincluded');
			$this->data['entry_info_extra'] = $this->language->get('entry_info_extra');
			$this->data['entry_meeting'] = $this->language->get('entry_meeting');
			$this->data['entry_tag'] = $this->language->get('entry_tag');
			$this->data['entry_model'] = $this->language->get('entry_model');
			/*END V2*/
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_car_rent'] = $this->language->get('button_car_rent');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->load->model('catalog/review');
			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
			$this->data['tab_related'] = $this->language->get('tab_related');
			/*V2*/
			$this->data['tab_schedule'] = $this->language->get('tab_schedule');
			$this->data['tab_price'] = $this->language->get('tab_price');
			$this->data['tab_hotel'] = $this->language->get('tab_hotel');
			$this->data['tab_payment'] = $this->language->get('tab_payment');
			$this->data['tab_terms'] = $this->language->get('tab_terms');
			$this->data['tab_info'] = $this->language->get('tab_info');
			$this->data['tab_menu'] = $this->language->get('tab_menu');
			/*END V2*/
			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['model'] = $product_info['model'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['start_time'] = $product_info['start_time'];//			
			$this->data['start_time_holiday'] = $product_info['start_time_holiday'];
			$this->data['start_time_tet'] = $product_info['start_time_tet'];
			$this->data['not_start_time'] = $product_info['not_start_time'];
			$this->data['departure'] = $product_info['departure'];
			$this->data['location_to'] = $product_info['location_to'];
			$this->data['location_from'] = $product_info['location_from'];
			$this->data['transport'] = $product_info['transport'];
			$this->data['duration'] = $product_info['duration'];
			$this->data['sub_duration'] = $product_info['sub_duration'];
			$this->data['schedule'] = $product_info['schedule'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['print_product'] = 'print/' . str_replace(HTTP_SERVER, '', $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']));
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration <= 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION						
				//UPDATE DATE PROMOTION 2	*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			if ($product_info['quantity'] <= 0) {
				$this->data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $product_info['quantity'];
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}
			$this->load->model('tool/image');
			if ($product_info['image'] && file_exists(DIR_IMAGE . $product_info['image'])) {
				$this->data['popup'] = $this->model_tool_image->onesize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			}
			if ($product_info['image']&& file_exists(DIR_IMAGE . $product_info['image'])) {				$this->data['thumb'] = $this->model_tool_image->cropsize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			}
			$this->data['images'] = array();
			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'))				);
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $product_info['price'] != 0) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['price'] = false;
			}
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$price_save = $product_info['price'] - $product_info['special'];
			if($price_save > 0){
				$this->data['price_save'] = $this->currency->format($this->tax->calculate($price_save, $product_info['tax_class_id'],
					$this->config->get('config_tax')));
				/*$this->data['percent'] = ceil(($price_save / $product_info['price']) * 100);*/
				$this->data['percent'] = $this->currency->format($price_save);
			} else {
				$this->data['price_save'] = false;
				$this->data['percent'] = false;
			}
			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$this->data['tax'] = false;
			}
			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
			$this->data['discounts'] = array();
			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
			$this->data['policy'] = array();
			if ($product_info['policy']) {
				$this->load->model('catalog/policy');
				$policy = $this->model_catalog_policy->getPolicy($product_info['policy']);
				$this->data['policy'] = array(
					'name' => $policy['name'],
					'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
				);
			}
			$this->data['phuthu'] = array(22,28,96,97,99,117);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;
			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if($tourgroup == 0){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 99000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 119000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if($tourgroup == 1){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 129000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 219000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_1'				  => $price1,
								'price_2'				  => $price2,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay		*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			if ($product_info['minimum']) {
				$this->data['minimum'] = $product_info['minimum'];
			} else {
				$this->data['minimum'] = 1;
			}
			if($product_info['delay_book']){
				$this->data['day'] = date($this->language->get('date_format_short'), time() + ($product_info['delay_book'] * 86400));
			}else{
				$this->data['day'] = date($this->language->get('date_format_short'), time());
			}
			$this->data['delay_book'] = (int)$product_info['delay_book'];
			$this->data['product_type'] = (int)$product_info['product_type'];
			$this->data['product_class'] = (int)$product_info['product_class'];

			$this->data['promotion1_date_start'] = $this->language->get('promotion1_date_start');
			$this->data['promotion1_date_end'] = $this->language->get('promotion1_date_end');
			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$this->data['rating'] = (int)$product_info['rating'];
			$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
			$this->data['url'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']);			$this->data['review_no'] = $product_info['reviews'];
			$this->data['quantity'] = $product_info['quantity'];
			$this->data['shortdescription'] = html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8');
			$this->data['highlights'] = html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8');
			$this->data['included'] = html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8');			$this->data['notincluded'] = html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8');
			$this->data['info'] = html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8');
			$this->data['meeting'] = html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8');
			$this->data['terms'] = html_entity_decode($product_info['terms'], ENT_QUOTES, 'UTF-8');
			$this->data['suggest'] = html_entity_decode($product_info['suggest'], ENT_QUOTES, 'UTF-8');
			$this->data['payment_content'] = html_entity_decode($this->config->get('payment_content'), ENT_QUOTES, 'UTF-8');
			$this->data['payment_menu'] = html_entity_decode($this->config->get('payment_menu'), ENT_QUOTES, 'UTF-8');
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($this->request->get['product_id']);
			$this->load->model('catalog/attribute_meal');
			$this->data['check_menu'] = false;
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'           => $result['attribute_meal_id'],
							'image'                       => HTTP_SERVER . 'image/' . $result['image'],
							'name'                         => $result['name']
						);
					}
				}
				if($product_detail['menu']){
					$this->data['check_menu'] = true;
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	=> $product_detail['product_detail_id'],
					'meals' 	 			=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'),$this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->load->model('account/customer');
			if ($this->customer->isLogged()) {
				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
				$this->data['customer_name'] = $customer_info['lastname'].' '.$customer_info['firstname'];
			}else{
				$this->data['customer_name'] = false;
			}
			$this->data['products'] = array();
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'],
						$result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
			$data = array(
				'product_id'	=> $product_id,
				'filter_duration'	=> $product_info['duration'],
				'filter_category'	=> $product_info['custom_breadcrumb']
			);
			$this->data['products_orther'] = array();
			$results = $this->model_catalog_product->getOrtherProducts($data);
			/*var_dump($results)*/;
			shuffle($results);
			$results = array_slice($results, 0, 6);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $result['price'] != 0) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}
				$this->data['products_orther'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => cutString($result['name'],20),
					'full_name'    	 => $result['name'],
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday'],
					'start_time_tet'    	 => $result['start_time_tet'],
					'departure'    	 => $result['departure'],
					'location_to'    	 => $result['location_to'],
					'location_from'    	 => $result['location_from'],
					'transport'    	 => $result['transport'],
					'duration'    	 => $result['duration'],
					'schedule'    	 => $result['schedule'],
					'product_type'    	 => $result['product_type'],
					'price'   	 => $price?$price:$this->language->get('text_contact'),
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $result['product_id'])
				);
			}
			/*Tags*/
			$this->load->model('catalog/tag');
			$this->data['tags'] = array();
			$tags = $this->model_catalog_product->getTags($product_info['product_id']);
			foreach($tags as $item){
				$result = $this->model_catalog_tag->getTag($item['tag_id']);
				if($result){
					$this->data['tags'][] = array(
						'name'	=>	$result['name_menu']?$result['name_menu']:$result['name'],
						'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'])					);
				}
			}
			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');
			$this->data['profiles'] = $this->model_catalog_product->getProfiles($product_info['product_id']);
			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			if($product_info['product_type'] == 0){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/product.tpl';
				} else {
					$this->template = 'default/template/product/product.tpl';
				}
			}
			if($product_info['product_type'] == 1){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/openbus.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/openbus.tpl';
				} else {
					$this->template = 'default/template/product/openbus.tpl';
				}
			}elseif($product_info['product_type'] == 2){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/car_rent.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/car_rent.tpl';
				} else {
					$this->template = 'default/template/product/car_rent.tpl';
				}
			}elseif($product_info['product_type'] == 3){
				$this->template = $this->config->get('config_template') .'/template/product/tour_special_tet.tpl';
			}
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'module/comment'
			);
			$this->response->setOutput($this->render());
		} else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle($this->language->get('text_error'));
			$this->data['heading_title'] = $this->language->get('text_error');
			$this->data['text_error'] = $this->language->get('text_error');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['continue'] = $this->url->link('common/home');
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

	public function EventDL()
	{
		$tourgroup = 3;
		$price1 = $price2 = $price3 = '';
		$this->language->load('product/product');
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false		);
		$this->load->model('catalog/category');
		$this->load->model('catalog/manufacturer');
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);
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
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);
			if ($manufacturer_info) {
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id='.$this->request->get['manufacturer_id'] . $url),
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			);
		}
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($product_id)) {
			if($this->cart->filtertour($product_id) == 0){
				$this->data['event'] = 'event';
				$this->data['linkbannergroup'] = 'http://www.vietfuntravel.com.vn/image/data/banner-promotion/tet-2016/tour-1-den-2-ngay.jpg';
				$this->data['start'] = 99000;
				$this->data['end'] = 119000;
				$tourgroup = 0; // dat co de lay gia khuyen mai nhom < 5 nguoi
			}elseif($this->cart->filtertour($product_id) == 1){
				$this->data['event'] = 'event';
				$this->data['linkbannergroup'] = 'http://www.vietfuntravel.com.vn/image/data/banner-promotion/tet-2016/tour-4-ngay.jpg';
				// kiem tra event nhom tren va duoi 5 nguoi
				$this->data['start'] = 129000;
				$this->data['end'] = 219000;
				$tourgroup = 1; // dat co de lay gia khuyen mai nhom >= 5 nguoi
				// ket thuc
			}
		}

		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		if ($product_info) {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if ($product_info['custom_breadcrumb']) {
				/* Set parent category breadcrumb	*/
				$category_parent = $this->model_catalog_category->getParentByCategoriesId($product_info['custom_breadcrumb']);
				foreach ($category_parent as $path_id) {
					$category_info = $this->model_catalog_category->getCategory($path_id);
					if ($category_info) {
						$this->data['breadcrumbs'][] = array(
							'text'      => $category_info['name'],
							'href'      => $this->url->link('product/category', 'path=' . $path_id),'separator' => $this->language->get('text_separator')
						);
					}
				}
				/* Set the last category breadcrumb		*/
				$category_info = $this->model_catalog_category->getCategory($product_info['custom_breadcrumb']);
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $product_info['custom_breadcrumb']),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']),
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle(($product_info['custom_title'])?$product_info['custom_title']:$product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/minitip/jquery.miniTip.min.js');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery-scrolltofixed-min.js');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/minitip/miniTip.min.css');
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
			}
			if($product_info['robot_index']){
				$this->document->addMeta('noindex, nofollow','','robots');
			}
			$this->data['heading_title'] = ($product_info['name_tour'])?$product_info['name_tour']:$product_info['name'];
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_review'] = sprintf($this->language->get('text_review'),
				$this->data['heading_title']);
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
			/*V2*/
			$this->data['text_percent'] = $this->language->get('text_percent');
			$this->data['text_price_special'] = $this->language->get('text_price_special');
			$this->data['text_price_special1'] = $this->language->get('text_price_special1');
			$this->data['text_time_special'] = $this->language->get('text_time_special');
			$this->data['text_time_special1'] = $this->language->get('text_time_special1');
			$this->data['text_price_save'] = $this->language->get('text_price_save');
			$this->data['text_info'] = $this->language->get('text_info');
			$this->data['text_info_details'] = $this->language->get('text_info_details');
			$this->data['text_desc'] = sprintf($this->language->get('text_desc'),$this->data['heading_title']);
			$this->data['text_highlights'] = $this->language->get('text_highlights');
			$this->data['text_schedule'] = $this->language->get('text_schedule');
			$this->data['text_price_details'] = sprintf($this->language->get('text_price_details'),$this->data['heading_title']);
			$this->data['text_type'] = $this->language->get('text_type');
			$this->data['text_price_list'] = $this->language->get('text_price_list');
			$this->data['text_hotel_details'] = sprintf($this->language->get('text_hotel_details'),$this->data['heading_title']);
			$this->data['text_location'] = $this->language->get('text_location');
			$this->data['text_hotel'] = $this->language->get('text_hotel');
			$this->data['text_slideshow'] = $this->language->get('text_slideshow');
			$this->data['text_terms'] = $this->language->get('text_terms');
			$this->data['text_not_menu'] = $this->language->get('text_not_menu');
			/*END V2*/
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			/*V2*/
			$this->data['entry_duration'] = $this->language->get('entry_duration');
			$this->data['entry_departure'] = $this->language->get('entry_departure');
			$this->data['entry_start_time'] = $this->language->get('entry_start_time');
			$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
			$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
			$this->data['entry_not_start_time'] = $this->language->get('entry_not_start_time');
			$this->data['entry_location_to'] = $this->language->get('entry_location_to');
			$this->data['entry_location_from'] = $this->language->get('entry_location_from');
			$this->data['entry_transport'] = $this->language->get('entry_transport');
			$this->data['entry_schedule'] = $this->language->get('entry_schedule');
			$this->data['entry_included'] = $this->language->get('entry_included');
			$this->data['entry_notincluded'] = $this->language->get('entry_notincluded');
			$this->data['entry_info_extra'] = $this->language->get('entry_info_extra');
			$this->data['entry_meeting'] = $this->language->get('entry_meeting');
			$this->data['entry_tag'] = $this->language->get('entry_tag');
			$this->data['entry_model'] = $this->language->get('entry_model');
			/*END V2*/
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_car_rent'] = $this->language->get('button_car_rent');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->load->model('catalog/review');
			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
			$this->data['tab_related'] = $this->language->get('tab_related');
			/*V2*/
			$this->data['tab_schedule'] = $this->language->get('tab_schedule');
			$this->data['tab_price'] = $this->language->get('tab_price');
			$this->data['tab_hotel'] = $this->language->get('tab_hotel');
			$this->data['tab_payment'] = $this->language->get('tab_payment');
			$this->data['tab_terms'] = $this->language->get('tab_terms');
			$this->data['tab_info'] = $this->language->get('tab_info');
			$this->data['tab_menu'] = $this->language->get('tab_menu');
			/*END V2*/
			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['model'] = $product_info['model'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];
			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['start_time'] = $product_info['start_time'];//			
			$this->data['start_time_holiday'] = $product_info['start_time_holiday'];
			$this->data['start_time_tet'] = $product_info['start_time_tet'];
			$this->data['not_start_time'] = $product_info['not_start_time'];
			$this->data['departure'] = $product_info['departure'];
			$this->data['location_to'] = $product_info['location_to'];
			$this->data['location_from'] = $product_info['location_from'];
			$this->data['transport'] = $product_info['transport'];
			$this->data['duration'] = $product_info['duration'];
			$this->data['sub_duration'] = $product_info['sub_duration'];
			$this->data['schedule'] = $product_info['schedule'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['print_product'] = 'print/' . str_replace(HTTP_SERVER, '', $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']));
			/*UPDATE DATE PROMOTION*/
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration <= 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			/*END UPDATE DATE PROMOTION						
				//UPDATE DATE PROMOTION 2	*/
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			/*END UPDATE DATE PROMOTION 2*/
			if ($product_info['quantity'] <= 0) {
				$this->data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $product_info['quantity'];
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}
			$this->load->model('tool/image');
			if ($product_info['image'] && file_exists(DIR_IMAGE . $product_info['image'])) {
				$this->data['popup'] = $this->model_tool_image->onesize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			}
			if ($product_info['image']&& file_exists(DIR_IMAGE . $product_info['image'])) {				$this->data['thumb'] = $this->model_tool_image->cropsize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			}
			$this->data['images'] = array();
			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'))				);
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $product_info['price'] != 0) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['price'] = false;
			}
			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}
			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}
			$price_save = $product_info['price'] - $product_info['special'];
			if($price_save > 0){
				$this->data['price_save'] = $this->currency->format($this->tax->calculate($price_save, $product_info['tax_class_id'],
					$this->config->get('config_tax')));
				/*$this->data['percent'] = ceil(($price_save / $product_info['price']) * 100);*/
				$this->data['percent'] = $this->currency->format($price_save);
			} else {
				$this->data['price_save'] = false;
				$this->data['percent'] = false;
			}
			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$this->data['tax'] = false;
			}
			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
			$this->data['discounts'] = array();
			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
			$this->data['policy'] = array();
			if ($product_info['policy']) {
				$this->load->model('catalog/policy');
				$policy = $this->model_catalog_policy->getPolicy($product_info['policy']);
				$this->data['policy'] = array(
					'name' => $policy['name'],
					'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
				);
			}
			$this->data['phuthu'] = array(22,28,96,97,99,117);
			$this->data['check_maybay'] = $this->data['check_vetau'] = false;
			$this->data['options'] = array();
			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();
					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if($tourgroup == 0){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 99000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 119000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if($tourgroup == 1){
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price1 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 129000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price1 = false;
								}
								if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
									$price2 = $this->currency->format($this->tax->calculate(((int)$option_value['price'] - 219000), $product_info['tax_class_id'], $this->config->get('config_tax')));
								} else {
									$price2 = false;
								}
							}
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_1'				  => $price1,
								'price_2'				  => $price2,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					/*Check Ve May Bay		*/
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					/*Check Vé tàu*/
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			if ($product_info['minimum']) {
				$this->data['minimum'] = $product_info['minimum'];
			} else {
				$this->data['minimum'] = 1;
			}
			if($product_info['delay_book']){
				$this->data['day'] = date($this->language->get('date_format_short'), time() + ($product_info['delay_book'] * 86400));
			}else{
				$this->data['day'] = date($this->language->get('date_format_short'), time());
			}
			$this->data['delay_book'] = (int)$product_info['delay_book'];
			$this->data['product_type'] = (int)$product_info['product_type'];
			$this->data['product_class'] = (int)$product_info['product_class'];
			$this->data['promotion_date_start'] = $this->language->get('promotion_date_start');
			$this->data['promotion_date_end'] = $this->language->get('promotion_date_end');
			$this->data['promotion1_date_start'] = $this->language->get('promotion1_date_start');
			$this->data['promotion1_date_end'] = $this->language->get('promotion1_date_end');
			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$this->data['rating'] = (int)$product_info['rating'];
			$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
			$this->data['url'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']);			$this->data['review_no'] = $product_info['reviews'];
			$this->data['quantity'] = $product_info['quantity'];
			$this->data['shortdescription'] = html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8');
			$this->data['highlights'] = html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8');
			$this->data['included'] = html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8');			$this->data['notincluded'] = html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8');
			$this->data['info'] = html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8');
			$this->data['meeting'] = html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8');
			$this->data['terms'] = html_entity_decode($product_info['terms'], ENT_QUOTES, 'UTF-8');
			$this->data['suggest'] = html_entity_decode($product_info['suggest'], ENT_QUOTES, 'UTF-8');
			$this->data['payment_content'] = html_entity_decode($this->config->get('payment_content'), ENT_QUOTES, 'UTF-8');
			$this->data['payment_menu'] = html_entity_decode($this->config->get('payment_menu'), ENT_QUOTES, 'UTF-8');
			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($this->request->get['product_id']);
			$this->load->model('catalog/attribute_meal');
			$this->data['check_menu'] = false;
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'           => $result['attribute_meal_id'],
							'image'                       => HTTP_SERVER . 'image/' . $result['image'],
							'name'                         => $result['name']
						);
					}
				}
				if($product_detail['menu']){
					$this->data['check_menu'] = true;
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	=> $product_detail['product_detail_id'],
					'meals' 	 			=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'),$this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}
			/*Attribute Meal*/
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}
			$this->load->model('account/customer');
			if ($this->customer->isLogged()) {
				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
				$this->data['customer_name'] = $customer_info['lastname'].' '.$customer_info['firstname'];
			}else{
				$this->data['customer_name'] = false;
			}
			$this->data['products'] = array();
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'],
						$result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
			$data = array(
				'product_id'	=> $product_id,
				'filter_duration'	=> $product_info['duration'],
				'filter_category'	=> $product_info['custom_breadcrumb']
			);
			$this->data['products_orther'] = array();
			$results = $this->model_catalog_product->getOrtherProducts($data);
			/*var_dump($results)*/;
			shuffle($results);
			$results = array_slice($results, 0, 6);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $result['price'] != 0) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}
				$this->data['products_orther'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => cutString($result['name'],20),
					'full_name'    	 => $result['name'],
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday'],
					'start_time_tet'    	 => $result['start_time_tet'],
					'departure'    	 => $result['departure'],
					'location_to'    	 => $result['location_to'],
					'location_from'    	 => $result['location_from'],
					'transport'    	 => $result['transport'],
					'duration'    	 => $result['duration'],
					'schedule'    	 => $result['schedule'],
					'product_type'    	 => $result['product_type'],
					'price'   	 => $price?$price:$this->language->get('text_contact'),
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $result['product_id'])
				);
			}
			/*Tags*/
			$this->load->model('catalog/tag');
			$this->data['tags'] = array();
			$tags = $this->model_catalog_product->getTags($product_info['product_id']);
			foreach($tags as $item){
				$result = $this->model_catalog_tag->getTag($item['tag_id']);
				if($result){
					$this->data['tags'][] = array(
						'name'	=>	$result['name_menu']?$result['name_menu']:$result['name'],
						'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'])					);
				}
			}
			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');
			$this->data['profiles'] = $this->model_catalog_product->getProfiles($product_info['product_id']);
			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			if($product_info['product_type'] == 0){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/product.tpl';
				} else {
					$this->template = 'default/template/product/product.tpl';
				}
			}
			if($product_info['product_type'] == 1){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/openbus.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/openbus.tpl';
				} else {
					$this->template = 'default/template/product/openbus.tpl';
				}
			}elseif($product_info['product_type'] == 2){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/car_rent.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/car_rent.tpl';
				} else {
					$this->template = 'default/template/product/car_rent.tpl';
				}
			}elseif($product_info['product_type'] == 3){
				$this->template = $this->config->get('config_template') .'/template/product/tour_special_tet.tpl';
			}
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'module/comment'
			);
			$this->response->setOutput($this->render());
		} else {
			$url = '';
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
				'separator' => $this->language->get('text_separator')
			);
			$this->document->setTitle($this->language->get('text_error'));
			$this->data['heading_title'] = $this->language->get('text_error');
			$this->data['text_error'] = $this->language->get('text_error');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['continue'] = $this->url->link('common/home');
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

	public function EventDefault()
	{
		$this->language->load('product/product');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->load->model('catalog/category');

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);

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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url),
					'separator' => $this->language->get('text_separator')
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			if ($product_info['custom_breadcrumb']) {
				// Set parent category breadcrumb
				$category_parent = $this->model_catalog_category->getParentByCategoriesId($product_info['custom_breadcrumb']);
				foreach ($category_parent as $path_id) {
					$category_info = $this->model_catalog_category->getCategory($path_id);

					if ($category_info) {
						$this->data['breadcrumbs'][] = array(
							'text'      => $category_info['name'],
							'href'      => $this->url->link('product/category', 'path=' . $path_id),
							'separator' => $this->language->get('text_separator')
						);
					}
				}

				// Set the last category breadcrumb
				$category_info = $this->model_catalog_category->getCategory($product_info['custom_breadcrumb']);
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $product_info['custom_breadcrumb']),
						'separator' => $this->language->get('text_separator')
					);
				}
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle(($product_info['custom_title'])?$product_info['custom_title']:$product_info['name']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/minitip/jquery.miniTip.min.js');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery-scrolltofixed-min.js');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/minitip/miniTip.min.css');

			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
			}
			if($product_info['robot_index']){
				$this->document->addMeta('noindex, nofollow','','robots');
			}
			$this->data['heading_title'] = ($product_info['name_tour'])?$product_info['name_tour']:$product_info['name'];

			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_review'] = sprintf($this->language->get('text_review'),$this->data['heading_title']);
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');

			//V2
			$this->data['text_percent'] = $this->language->get('text_percent');
			$this->data['text_price_special'] = "Giá Ngày Lễ";//$this->language->get('text_price_special');
			$this->data['text_price_special1'] = $this->language->get('text_price_special1');
			$this->data['text_time_special'] = $this->language->get('text_time_special');
			$this->data['text_time_special1'] = $this->language->get('text_time_special1');
			$this->data['text_price_save'] = $this->language->get('text_price_save');
			$this->data['text_info'] = $this->language->get('text_info');
			$this->data['text_info_details'] = $this->language->get('text_info_details');
			$this->data['text_desc'] = sprintf($this->language->get('text_desc'),$this->data['heading_title']);
			$this->data['text_highlights'] = $this->language->get('text_highlights');
			$this->data['text_schedule'] = $this->language->get('text_schedule');
			$this->data['text_price_details'] = sprintf($this->language->get('text_price_details'),$this->data['heading_title']);
			$this->data['text_type'] = $this->language->get('text_type');
			$this->data['text_price_list'] = $this->language->get('text_price_list');
			$this->data['text_hotel_details'] = sprintf($this->language->get('text_hotel_details'),$this->data['heading_title']);
			$this->data['text_location'] = $this->language->get('text_location');
			$this->data['text_hotel'] = $this->language->get('text_hotel');
			$this->data['text_slideshow'] = $this->language->get('text_slideshow');
			$this->data['text_terms'] = $this->language->get('text_terms');
			$this->data['text_not_menu'] = $this->language->get('text_not_menu');
			//END V2

			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');

			//V2
			$this->data['entry_duration'] = $this->language->get('entry_duration');
			$this->data['entry_departure'] = $this->language->get('entry_departure');
			$this->data['entry_start_time'] = $this->language->get('entry_start_time');
			$this->data['entry_start_time_holiday'] = $this->language->get('entry_start_time_holiday');
			$this->data['entry_start_time_tet'] = $this->language->get('entry_start_time_tet');
			$this->data['entry_not_start_time'] = $this->language->get('entry_not_start_time');
			$this->data['entry_location_to'] = $this->language->get('entry_location_to');
			$this->data['entry_location_from'] = $this->language->get('entry_location_from');
			$this->data['entry_transport'] = $this->language->get('entry_transport');
			$this->data['entry_schedule'] = $this->language->get('entry_schedule');
			$this->data['entry_included'] = $this->language->get('entry_included');
			$this->data['entry_notincluded'] = $this->language->get('entry_notincluded');
			$this->data['entry_info_extra'] = $this->language->get('entry_info_extra');
			$this->data['entry_meeting'] = $this->language->get('entry_meeting');
			$this->data['entry_tag'] = $this->language->get('entry_tag');
			$this->data['entry_model'] = $this->language->get('entry_model');
			//END V2

			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_car_rent'] = $this->language->get('button_car_rent');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
			$this->data['tab_related'] = $this->language->get('tab_related');

			//V2
			$this->data['tab_schedule'] = $this->language->get('tab_schedule');
			$this->data['tab_price'] = $this->language->get('tab_price');
			$this->data['tab_hotel'] = $this->language->get('tab_hotel');
			$this->data['tab_payment'] = $this->language->get('tab_payment');
			$this->data['tab_terms'] = $this->language->get('tab_terms');
			$this->data['tab_info'] = $this->language->get('tab_info');
			$this->data['tab_menu'] = $this->language->get('tab_menu');
			//END V2

			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['model'] = $product_info['model'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];

			$this->data['promotion_title'] = $this->config->get('promotion_title');
			$this->data['promotion_title2'] = $this->config->get('promotion_title2');
			$this->data['start_time'] = $product_info['start_time'];
			//$this->data['start_time_holiday'] = $product_info['start_time_holiday'];
			$this->data['start_time_tet'] = $product_info['start_time_tet'];
			$this->data['not_start_time'] = $product_info['not_start_time'];
			$this->data['departure'] = $product_info['departure'];
			$this->data['location_to'] = $product_info['location_to'];
			$this->data['location_from'] = $product_info['location_from'];
			$this->data['transport'] = $product_info['transport'];
			$this->data['duration'] = $product_info['duration'];
			$this->data['sub_duration'] = $product_info['sub_duration'];
			$this->data['schedule'] = $product_info['schedule'];
			$this->data['product_class'] = $product_info['product_class'];
			$this->data['print_product'] = 'print/' . str_replace(HTTP_SERVER, '', $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']));

			//UPDATE DATE PROMOTION
			$this->data['promotion_date'] = $price_date1 = $price_date2 = $price_date3 = '';
			$duration = explode(' ',$product_info['duration']);
			$duration = $duration[0];
			if($duration > 5){
				$this->data['promotion_date'] = 3;
				$price_date1 = '220000';
				$price_date2 = '230000';
				$price_date3 = '240000';
			}elseif($duration >= 2 && $duration <= 5){
				$this->data['promotion_date'] = 2;
				$price_date1 = '150000';
				$price_date2 = '160000';
				$price_date3 = '170000';
			}else{
				$this->data['promotion_date'] = 1;
				$price_date1 = '80000';
				$price_date2 = '90000';
				$price_date3 = '100000';
			}
			//END UPDATE DATE PROMOTION

			//UPDATE DATE PROMOTION 2
			$this->data['promotion_date2'] = $price_date12 = $price_date22 = $price_date32 = '';
			$price_date12 = '100000';
			$price_date22 = '150000';
			$price_date32 = '200000';
			//END UPDATE DATE PROMOTION 2

			if ($product_info['quantity'] <= 0) {
				$this->data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $product_info['quantity'];
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image'] && file_exists(DIR_IMAGE . $product_info['image'])) {
				$this->data['popup'] = $this->model_tool_image->onesize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			}

			if ($product_info['image']&& file_exists(DIR_IMAGE . $product_info['image'])) {
				$this->data['thumb'] = $this->model_tool_image->cropsize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			}

			$this->data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'))
				);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $product_info['price'] != 0) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special'] = false;
			}

			if ((float)$product_info['special1']) {
				$this->data['special1'] = $this->currency->format($this->tax->calculate($product_info['special1'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['special1'] = false;
			}

			$price_save = $product_info['price'] - $product_info['special'];
			if($price_save > 0){
				$this->data['price_save'] = $this->currency->format($this->tax->calculate($price_save, $product_info['tax_class_id'], $this->config->get('config_tax')));
				$this->data['percent'] = ceil(($price_save / $product_info['price']) * 100);
			} else {
				$this->data['price_save'] = false;
				$this->data['percent'] = false;
			}


			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$this->data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$this->data['discounts'] = array();

			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}

			$this->data['policy'] = array();
			if ($product_info['policy']) {
				$this->load->model('catalog/policy');
				$policy = $this->model_catalog_policy->getPolicy($product_info['policy']);
				$this->data['policy'] = array(
					'name' => $policy['name'],
					'description' => html_entity_decode($policy['description'], ENT_QUOTES, 'UTF-8')
				);
			}
			$this->data['phuthu'] = array(22,28,96,97,99,117);

			$this->data['check_maybay'] = $this->data['check_vetau'] = false;

			$this->data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
					$option_value_data = array();

					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
								$price = $this->currency->format($this->tax->calculate(($option_value['price']), $product_info['tax_class_id'], $this->config->get('config_tax')));
							} else {
								$price = false;
							}
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->onesize($option_value['image'], 50, 50),
								'price'                   => $price,
								'price_text' => $option_value['price'],
								'price1' => $option_value['price'] - $price_date1,
								'price2' => $option_value['price'] - $price_date2,
								'price3' => $option_value['price'] - $price_date3,
								'price12' => $option_value['price'] - $price_date12,
								'price22' => $option_value['price'] - $price_date22,
								'price32' => $option_value['price'] - $price_date32,
								'price_prefix'            => ''
							);
						}
					}
					//Check Ve May Bay
					if($option['class'] == 1){
						$this->data['check_maybay'] = true;
					}
					//Check Vé tàu
					if($option['class'] == 3){
						$this->data['check_vetau'] = true;
					}

					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'product_option_id' => $option['product_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'category'              => $option['category'],
						'class'              => $option['class'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
			if ($product_info['minimum']) {
				$this->data['minimum'] = $product_info['minimum'];
			} else {
				$this->data['minimum'] = 1;
			}
			if($product_info['delay_book']){
				$this->data['day'] = date($this->language->get('date_format_short'), time() + ($product_info['delay_book'] * 86400));
			}else{
				$this->data['day'] = date($this->language->get('date_format_short'), time());
			}

			$this->data['delay_book'] = (int)$product_info['delay_book'];
			$this->data['product_type'] = (int)$product_info['product_type'];
			$this->data['product_class'] = (int)$product_info['product_class'];
			$this->data['promotion_date_start'] = $this->language->get('promotion_date_start');
			$this->data['promotion_date_end'] = $this->language->get('promotion_date_end');
			$this->data['promotion1_date_start'] = $this->language->get('promotion1_date_start');
			$this->data['promotion1_date_end'] = $this->language->get('promotion1_date_end');
			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$this->data['rating'] = (int)$product_info['rating'];
			$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
			$this->data['url'] = $this->url->link('product/product', 'path=' . $product_info['custom_link'].'&product_id=' . $this->request->get['product_id']);
			$this->data['review_no'] = $product_info['reviews'];
			$this->data['quantity'] = $product_info['quantity'];
			$this->data['shortdescription'] = html_entity_decode($product_info['shortdescription'], ENT_QUOTES, 'UTF-8');
			$this->data['highlights'] = html_entity_decode($product_info['highlights'], ENT_QUOTES, 'UTF-8');
			$this->data['included'] = html_entity_decode($product_info['included'], ENT_QUOTES, 'UTF-8');
			$this->data['notincluded'] = html_entity_decode($product_info['notincluded'], ENT_QUOTES, 'UTF-8');
			$this->data['info'] = html_entity_decode($product_info['info'], ENT_QUOTES, 'UTF-8');
			$this->data['meeting'] = html_entity_decode($product_info['meeting'], ENT_QUOTES, 'UTF-8');
			$this->data['terms'] = html_entity_decode($product_info['terms'], ENT_QUOTES, 'UTF-8');
			$this->data['suggest'] = html_entity_decode($product_info['suggest'], ENT_QUOTES, 'UTF-8');

			$this->data['payment_content'] = html_entity_decode($this->config->get('payment_content'), ENT_QUOTES, 'UTF-8');
			$this->data['payment_menu'] = html_entity_decode($this->config->get('payment_menu'), ENT_QUOTES, 'UTF-8');

			$this->data['product_details'] = array();
			$product_details = $this->model_catalog_product->getProductDetails($this->request->get['product_id']);

			$this->load->model('catalog/attribute_meal');

			$this->data['check_menu'] = false;
			foreach ($product_details as $product_detail) {
				if ($product_detail['image'] && file_exists(DIR_IMAGE . $product_detail['image'])) {
					$image = $product_detail['image'];
				} else {
					$image = 'no_image.jpg';
				}
				$product_detail_meals = array();
				$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();

				foreach ($attribute_meal_info as $result) {
					$s = $this->model_catalog_product->getProductDetailMeal($product_detail['product_detail_id'],$result['attribute_meal_id']);
					if($s){
						$product_detail_meals[] = array(
							'attribute_meal_id'                  => $result['attribute_meal_id'],
							'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
							'name'                          		=> $result['name']
						);
					}
				}
				if($product_detail['menu']){
					$this->data['check_menu'] = true;
				}
				$this->data['product_details'][] = array(
					'product_detail_id' 	 	 	=> $product_detail['product_detail_id'],
					'meals' 	 					=> $product_detail_meals,
					'label' 	 					=> $product_detail['label'],
					'title' 	 					=> $product_detail['title'],
					'text' 		 					=> html_entity_decode($product_detail['text'], ENT_QUOTES, 'UTF-8'),
					'menu' 		 					=> html_entity_decode($product_detail['menu'], ENT_QUOTES, 'UTF-8'),
					'image'      					=> $image,
					'thumb'      					=> $this->model_tool_image->cropsize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
					'status' 	 					=> $product_detail['status'],
					'sort_order' 					=> $product_detail['sort_order']
				);
			}

			//Attribute Meal
			$this->data['attribute_meals'] = array();
			$attribute_meal_info = $this->model_catalog_attribute_meal->getAttributeMeals();
			foreach ($attribute_meal_info as $result) {
				$this->data['attribute_meals'][] = array(
					'attribute_meal_id'                  => $result['attribute_meal_id'],
					'image'                          		=> HTTP_SERVER . 'image/' . $result['image'],
					'name'                          		=> $result['name']
				);
			}

			$this->load->model('account/customer');
			if ($this->customer->isLogged()) {
				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
				$this->data['customer_name'] = $customer_info['lastname'].' '.$customer_info['firstname'];
			}else{
				$this->data['customer_name'] = false;
			}

			$this->data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data = array(
				'product_id'	=> $product_id,
				'filter_duration'	=> $product_info['duration'],
				'filter_category'	=> $product_info['custom_breadcrumb']
			);

			$this->data['products_orther'] = array();

			$results = $this->model_catalog_product->getOrtherProducts($data);
			//var_dump($results);
			shuffle($results);
			$results = array_slice($results, 0, 6);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					$tooltip = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image = false;
					$tooltip = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') && $result['price'] != 0) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				if(isset($result['custom_link'])){
					$custom_link = '&path=' . $result['custom_link'];
				}

				$this->data['products_orther'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'tooltip'       => $tooltip,
					'name'    	 => cutString($result['name'],20),
					'full_name'    	 => $result['name'],
					'model'    	 => $result['model'],
					'start_time'    	 => $result['start_time'],
					'start_time_holiday'    	 => $result['start_time_holiday'],
					'start_time_tet'    	 => $result['start_time_tet'],
					'departure'    	 => $result['departure'],
					'location_to'    	 => $result['location_to'],
					'location_from'    	 => $result['location_from'],
					'transport'    	 => $result['transport'],
					'duration'    	 => $result['duration'],
					'schedule'    	 => $result['schedule'],
					'product_type'    	 => $result['product_type'],
					'price'   	 => $price?$price:$this->language->get('text_contact'),
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', $custom_link . '&product_id=' . $result['product_id'])
				);
			}

			//Tags
			$this->load->model('catalog/tag');

			$this->data['tags'] = array();

			$tags = $this->model_catalog_product->getTags($product_info['product_id']);

			foreach($tags as $item){
				$result = $this->model_catalog_tag->getTag($item['tag_id']);
				if($result){
					$this->data['tags'][] = array(
						'name'	=>	$result['name_menu']?$result['name_menu']:$result['name'],
						'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'])
					);
				}
			}

			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');
			$this->data['profiles'] = $this->model_catalog_product->getProfiles($product_info['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			if($product_info['product_type'] == 0){

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/product.tpl';
				} else {
					$this->template = 'default/template/product/product.tpl';
				}
			}if($product_info['product_type'] == 1){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/openbus.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/openbus.tpl';
				} else {
					$this->template = 'default/template/product/openbus.tpl';
				}
			}elseif($product_info['product_type'] == 2){
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/car_rent.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/product/car_rent.tpl';
				} else {
					$this->template = 'default/template/product/car_rent.tpl';
				}
			}elseif($product_info['product_type'] == 3){

				$this->template = 'default/template/product/tour_special_tet.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'module/comment'
			);

			$this->response->setOutput($this->render());
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

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