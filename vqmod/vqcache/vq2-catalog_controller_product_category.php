<?php 

class ControllerProductCategory extends Controller {  

	public function index() { 

		$this->language->load('product/category');



		$this->load->model('catalog/category');



		$this->load->model('catalog/product');



		$this->load->model('tool/image'); 



		if (isset($this->request->get['filter'])) {

			$filter = $this->request->get['filter'];

		} else {

			$filter = '';

		}



		if (isset($this->request->get['sort'])) {

			$sort = $this->request->get['sort'];

		} else {

			$sort = 'p.sort_order';

		}



		if (isset($this->request->get['order'])) {

			$order = $this->request->get['order'];

		} else {

			$order = 'ASC';

		}



		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else { 

			$page = 1;

		}	



		if (isset($this->request->get['limit'])) {

			$limit = $this->request->get['limit'];

		} else {

			$limit = $this->config->get('config_catalog_limit');

		}



		$this->data['breadcrumbs'] = array();



		$this->data['breadcrumbs'][] = array(

			'text'      => $this->language->get('text_home'),

			'href'      => $this->url->link('common/home'),

			'separator' => false

		);



		if (isset($this->request->get['path'])) {

			$url = '';



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}	



			if (isset($this->request->get['order'])) {

				$url .= '&amp;order=' . $this->request->get['order'];

			}	



			if (isset($this->request->get['limit'])) {

				$url .= '&limit=' . $this->request->get['limit'];

			}



			$path = '';



			$parts = explode('_', (string)$this->request->get['path']);



			$category_id = (int)array_pop($parts);



			foreach ($parts as $path_id) {

				if (!$path) {

					$path = (int)$path_id;

				} else {

					$path .= '_' . (int)$path_id;

				}



				$category_info = $this->model_catalog_category->getCategory($path_id);



				if ($category_info) {

					$this->data['breadcrumbs'][] = array(

						'text'      => $category_info['name'],

						'href'      => $this->url->link('product/category', 'path=' . $path . $url),

						'separator' => $this->language->get('text_separator')

					);

				}

			}

		} else {

			$category_id = 0;

		}



		$category_info = $this->model_catalog_category->getCategory($category_id);



		if ($category_info) {

			$this->document->setTitle($category_info['custom_title']?$category_info['custom_title']:$category_info['name']);

			$this->document->setDescription($category_info['meta_description']);

			$this->document->setKeywords($category_info['meta_keyword']);

			$pathx = explode('_', $this->request->get['path']);

			$pathx = end($pathx);

			$this->document->addLink($this->url->link('product/category', 'path=' . $pathx ), 'canonical');

			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');



			$this->data['heading_title'] = $category_info['name'];

			$this->data['url'] = $this->url->link('product/category', 'path=' . $pathx);



			$this->data['text_refine'] = $this->language->get('text_refine');

			$this->data['text_empty'] = $this->language->get('text_empty');			

			$this->data['text_quantity'] = $this->language->get('text_quantity');

			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');

			$this->data['text_model'] = $this->language->get('text_model');

			$this->data['text_price'] = $this->language->get('text_price');

			$this->data['text_percent'] = $this->language->get('text_percent');

			$this->data['text_price_save'] = $this->language->get('text_price_save');

			$this->data['text_tax'] = $this->language->get('text_tax');

			$this->data['text_points'] = $this->language->get('text_points');

			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

			$this->data['text_display'] = $this->language->get('text_display');

			$this->data['text_list'] = $this->language->get('text_list');

			$this->data['text_grid'] = $this->language->get('text_grid');

			$this->data['text_sort'] = $this->language->get('text_sort');

			$this->data['text_limit'] = $this->language->get('text_limit');

			$this->data['text_contact'] = $this->language->get('text_contact');

			

			$this->data['entry_price'] = $this->language->get('entry_price');

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



			$this->data['button_cart'] = $this->language->get('button_cart');

			$this->data['button_car_rent'] = $this->language->get('button_car_rent');

			$this->data['button_wishlist'] = $this->language->get('button_wishlist');

			$this->data['button_compare'] = $this->language->get('button_compare');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['button_view_more'] = $this->language->get('button_view_more');

			$this->data['button_view_more_car'] = $this->language->get('button_view_more_car');



			// Set the last category breadcrumb		

			$url = '';



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}	



			if (isset($this->request->get['order'])) {

				$url .= '&amp;order=' . $this->request->get['order'];

			}	



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			if (isset($this->request->get['limit'])) {

				$url .= '&limit=' . $this->request->get['limit'];

			}



			$this->data['breadcrumbs'][] = array(

				'text'      => $category_info['name'],

				'href'      => $this->url->link('product/category', 'path=' . $this->request->get['path']),

				'separator' => $this->language->get('text_separator')

			);



			if ($category_info['image']) {

				$this->data['thumb'] = $this->model_tool_image->onesize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));

			} else {

				$this->data['thumb'] = '';

			}



			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

			$this->data['desc_footer'] = html_entity_decode($category_info['desc_footer'], ENT_QUOTES, 'UTF-8');

			$this->data['compare'] = $this->url->link('product/compare');



			$url = '';



			if (isset($this->request->get['filter'])) {

				$url .= '&filter=' . $this->request->get['filter'];

			}	



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}	



			if (isset($this->request->get['order'])) {

				$url .= '&amp;order=' . $this->request->get['order'];

			}	



			if (isset($this->request->get['limit'])) {

				$url .= '&limit=' . $this->request->get['limit'];

			}



			$this->data['categories'] = array();



			$results = $this->model_catalog_category->getCategories($category_id);



			foreach ($results as $result) {

				$data = array(

					'filter_category_id'  => $result['category_id'],

					'filter_sub_category' => true

				);



				$product_total = $this->model_catalog_product->getTotalProducts($data);				



				$this->data['categories'][] = array(

					'name'  => $result['name_menu']?$result['name_menu']:$result['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),

					'href'  => $this->url->link('product/category', 'path='. $result['category_id'] . $url)

				);

			}



			$this->data['products'] = array();



			$data = array(

				'filter_category_id' => $category_id,

				'filter_filter'      => $filter, 

				'sort'               => $sort,

				'order'              => $order,

				'start'              => ($page - 1) * $limit,

				'limit'              => $limit

			);



			$product_total = $this->model_catalog_product->getTotalProducts($data); 



			$results = $this->model_catalog_product->getProducts($data);
/*lay danh sach thu tu tour trong danh muc*/
			$order = $this->model_catalog_category->getCateProduct($category_id);
			$data_order = array();
			foreach ($order as $korder => $vorder) {
				foreach ($results as $kresult => $vresult) {
					if($vresult['product_id'] == $vorder['product_id']){
						$data_order[] = $vresult; /*tach ra nhung tour co thu tu*/
					}	
				}
			}
		
			if($data_order){
				$results = $data_order;
			}



			foreach ($results as $result) {

				if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {

					$image = $this->model_tool_image->cropsize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));

				} else {

					$image = $this->model_tool_image->cropsize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_width'));

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

				

				$price_save_c = $result['price'] - $result['special'];

				if($price_save_c > 0){

					$price_save = $this->currency->format($this->tax->calculate($price_save_c, $result['tax_class_id'], $this->config->get('config_tax')));

//					$percent = ceil(($price_save_c / $result['price']) * 100);

					$percent = $this->currency->format(ceil(($price_save_c)));

				} else {

					$price_save = false;

					$percent = false;

				}	



				if ($this->config->get('config_tax')) {

					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);

				} else {

					$tax = false;

				}				



				if ($this->config->get('config_review_status')) {

					$rating = (int)$result['rating'];

				} else {

					$rating = false;

				}

				

				if(isset($result['custom_link'])){

					$custom_link = '&path=' . $result['custom_link'];

				}

				$this->data['products'][] = array(

					'product_id'  => $result['product_id'],

					'thumb'       => $image,

					'name'        => $result['name_tour']?$result['name_tour']:$result['name'],

					'description' => cutString(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 50),

					'model'    	 => $result['model'],

					'start_time'    	 => $result['start_time'],

//					'start_time_holiday'    	 => $result['start_time_holiday'],

					'start_time_tet'    	 => $result['start_time_tet'],

					'not_start_time'    	 => $result['not_start_time'],

					'departure'    	 => $result['departure'],

					'location_to'    	 => $result['location_to'],

					'location_from'    	 => $result['location_from'],

					'transport'    	 => $result['transport'],

					'duration'    	 => $result['duration'],

					'schedule'    	 => $result['schedule'],

					'product_type'    	 => $result['product_type'],

					'product_class'    	 => $result['product_class'],

					'price'   	 => $price?$price:$this->language->get('text_contact'),

					'special'     => $special,

					'price_save'       => $price_save,

					'percent'       => $percent,

					'tax'         => $tax,

					'rating'      => $result['rating'],

					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),

					'href'        => $this->url->link('product/product',  $custom_link . '&product_id=' . $result['product_id'] . $url)

				);

			}

			$url = '';



			if (isset($this->request->get['filter'])) {

				$url .= '&filter=' . $this->request->get['filter'];

			}



			if (isset($this->request->get['limit'])) {

				$url .= '&limit=' . $this->request->get['limit'];

			}



			$this->data['sorts'] = array();



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_default'),

				'value' => 'p.sort_order-ASC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_name_asc'),

				'value' => 'pd.name-ASC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_name_desc'),

				'value' => 'pd.name-DESC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&amp;order=DESC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_price_asc'),

				'value' => 'p.price-ASC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&amp;order=ASC' . $url)

			); 



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_price_desc'),

				'value' => 'p.price-DESC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&amp;order=DESC' . $url)

			); 



			if ($this->config->get('config_review_status')) {

				$this->data['sorts'][] = array(

					'text'  => $this->language->get('text_rating_desc'),

					'value' => 'rating-DESC',

					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&amp;order=DESC' . $url)

				); 



				$this->data['sorts'][] = array(

					'text'  => $this->language->get('text_rating_asc'),

					'value' => 'rating-ASC',

					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&amp;order=ASC' . $url)

				);

			}



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_model_asc'),

				'value' => 'p.model-ASC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_model_desc'),

				'value' => 'p.model-DESC',

				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&amp;order=DESC' . $url)

			);



			$url = '';



			if (isset($this->request->get['filter'])) {

				$url .= '&filter=' . $this->request->get['filter'];

			}



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}	



			if (isset($this->request->get['order'])) {

				$url .= '&amp;order=' . $this->request->get['order'];

			}



			$this->data['limits'] = array();



			$limits = array_unique(array($this->config->get('config_catalog_limit'), 50, 100, 150, 200));



			sort($limits);



			foreach($limits as $value){

				$this->data['limits'][] = array(

					'text'  => $value,

					'value' => $value,

					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)

				);

			}



			$url = '';



			if (isset($this->request->get['filter'])) {

				$url .= '&filter=' . $this->request->get['filter'];

			}



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}	



			if (isset($this->request->get['order'])) {

				$url .= '&amp;order=' . $this->request->get['order'];

			}



			if (isset($this->request->get['limit'])) {

				$url .= '&limit=' . $this->request->get['limit'];

			}



			$pagination = new Pagination();

			$pagination->total = $product_total;

			$pagination->page = $page;

			$pagination->limit = $limit;

			/*$pagination->text = $this->language->get('text_pagination');*/
			$pagination->text = '';

			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');



			$this->data['pagination'] = $pagination->render();



			$this->data['sort'] = $sort;

			$this->data['order'] = $order;

			$this->data['limit'] = $limit;



			$this->data['continue'] = $this->url->link('common/home');



			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {

				$this->template = $this->config->get('config_template') . '/template/product/category.tpl';

			} else {

				$this->template = 'default/template/product/category.tpl';

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



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}	



			if (isset($this->request->get['order'])) {

				$url .= '&amp;order=' . $this->request->get['order'];

			}



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			if (isset($this->request->get['limit'])) {

				$url .= '&limit=' . $this->request->get['limit'];

			}



			$this->data['breadcrumbs'][] = array(

				'text'      => $this->language->get('text_error'),

				'href'      => $this->url->link('product/category', $url),

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