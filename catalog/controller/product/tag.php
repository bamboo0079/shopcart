<?php

class ControllerProductTag extends Controller {

	public function index() {

		$this->language->load('product/tag');



		$this->load->model('catalog/tag');



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



		if (isset($this->request->get['tag_id'])) {

			$tag_id = (int)$this->request->get['tag_id'];

		} else {

			$tag_id = 0;

		}



		$tag_info = $this->model_catalog_tag->getTag($tag_id);



		if ($tag_info) {

			$this->document->setTitle($tag_info['custom_title']?$tag_info['custom_title']:$tag_info['name']);

			$this->document->setDescription($tag_info['meta_description']);

			$this->document->setKeywords($tag_info['meta_keyword']);

			$this->document->addLink($this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id']), 'canonical');

			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');

			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');

			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');

			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');

			$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');



			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {

				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');

			} else {

				$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');

			}



			$this->data['heading_title'] = $tag_info['name_menu']?$tag_info['name_menu']:$tag_info['name'];

			$this->data['url'] = $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id']);

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



			// Set the last tag breadcrumb

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

				'text'      => $tag_info['name'],

				'href'      => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id']),

				'separator' => $this->language->get('text_separator')

			);

			if ($tag_info['image'] && file_exists(DIR_IMAGE . $tag_info['image'])) {

				$this->data['thumb'] = $this->model_tool_image->onesize($tag_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));

			} else {

				$this->data['thumb'] = false;

			}



			$this->data['description'] = html_entity_decode($tag_info['description'], ENT_QUOTES, 'UTF-8');

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



			$this->data['tags'] = array();



			$results = $this->model_catalog_tag->getTags($tag_id);



			foreach ($results as $result) {

				$data = array(

					'filter_tag_id'  => $result['tag_id'],

					'filter_sub_tag' => true

				);



				$product_total_tag = $this->model_catalog_product->getTotalProducts($data);



				$this->data['tags'][] = array(

					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total_tag . ')' : ''),

					'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'] . $url)

				);

			}



			$this->data['products'] = array();



			$data = array(

				'tag_id' => $tag_id,

				'start'              => ($page - 1) * $limit,

				'limit'              => $limit

			);



			$product_total = $this->model_catalog_tag->getTotalProductByTagId($tag_id);



			$products = $this->model_catalog_tag->getTagProduct($data);



			foreach ($products as $item) {

				$result = $this->model_catalog_product->getProduct($item['product_id']);

				if($result){

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



					if ((float)$result['special1']) {

						$special1 = $this->currency->format($this->tax->calculate($result['special1'], $result['tax_class_id'], $this->config->get('config_tax')));

					} else {

						$special1 = false;

					}


					$price_save_c = $result['price'] - $result['special'];

					if($price_save_c > 0){

						$price_save = $this->currency->format($this->tax->calculate($price_save_c, $result['tax_class_id'], $this->config->get('config_tax')));



//						$percent = ceil(($price_save_c / $result['price']) * 100);

						$percent = $this->currency->format(ceil($price_save_c ));

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

						'start_time_holiday'    	 => $result['start_time_holiday'],

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

						'price'   	 => !empty($result['special']) ? $this->currency->format($result['special']) : $price ? $price : $this->language->get('text_contact'),
//						'price'   	 => $price ? $price:$this->language->get('text_contact'),

						'special'     => $special,

						'saleoff' => $price_save_c > 0 && $this->currency->format($price_save_c) !=  $price ? $this->currency->format($price_save_c) : 0,

						'special1'     => $special1,

						'price_save'       => $price_save,

						'percent'       => $percent,

						'tax'         => $tax,

						'rating'      => $result['rating'],

						'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),

						'href'        => $this->url->link('product/product', $custom_link . '&product_id=' . $result['product_id'] . $url)

					);

				}

			}
//			print_r($this->data['products']);exit;

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

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=p.sort_order&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_name_asc'),

				'value' => 'pd.name-ASC',

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=pd.name&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_name_desc'),

				'value' => 'pd.name-DESC',

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=pd.name&amp;order=DESC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_price_asc'),

				'value' => 'p.price-ASC',

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=p.price&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_price_desc'),

				'value' => 'p.price-DESC',

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=p.price&amp;order=DESC' . $url)

			);



			if ($this->config->get('config_review_status')) {

				$this->data['sorts'][] = array(

					'text'  => $this->language->get('text_rating_desc'),

					'value' => 'rating-DESC',

					'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=rating&amp;order=DESC' . $url)

				);



				$this->data['sorts'][] = array(

					'text'  => $this->language->get('text_rating_asc'),

					'value' => 'rating-ASC',

					'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=rating&amp;order=ASC' . $url)

				);

			}



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_model_asc'),

				'value' => 'p.model-ASC',

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=p.model&amp;order=ASC' . $url)

			);



			$this->data['sorts'][] = array(

				'text'  => $this->language->get('text_model_desc'),

				'value' => 'p.model-DESC',

				'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . '&sort=p.model&amp;order=DESC' . $url)

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

					'href'  => $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . $url . '&limit=' . $value)

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

			$pagination->url = $this->url->link('product/tag', 'tag_id=' . $this->request->get['tag_id'] . $url . '&page={page}');



			$this->data['pagination'] = $pagination->render();



			$this->data['sort'] = $sort;

			$this->data['order'] = $order;

			$this->data['limit'] = $limit;



			$this->data['continue'] = $this->url->link('common/home');



			//Promotion

			$this->language->load('promotion/duonglich');

			$this->data['text_promotion_content_label'] = $this->language->get('text_promotion_content_label');



			$this->data['text_name'] = $this->language->get('text_name');

			$this->data['text_price'] = $this->language->get('text_price');

			$this->data['text_start_time_holiday'] = $this->language->get('text_start_time_holiday');



			$this->data['text_top'] = $this->language->get('text_top');

			$this->data['text_promotion'] = $this->language->get('text_promotion');

			$this->data['text_location'] = $this->language->get('text_location');

			$this->data['text_sg'] = $this->language->get('text_sg');

			$this->data['text_dn'] = $this->language->get('text_dn');

			$this->data['text_pt'] = $this->language->get('text_pt');

			$this->data['text_hn'] = $this->language->get('text_hn');

			$this->data['text_saigon'] = $this->language->get('text_saigon');

			$this->data['text_danang'] = $this->language->get('text_danang');

			$this->data['text_hanoi'] = $this->language->get('text_hanoi');

			$this->data['text_phanthiet'] = $this->language->get('text_phanthiet');

			$this->data['text_list_location'] = $this->language->get('text_list_location');



			$this->data['entry_start_time'] = $this->language->get('entry_start_time');



			//Promotion Gio To

			$array_title_gioto = array('Tour Du Lịch ','Lễ Giỗ Tổ - 30/4 - 1/5/2015');

			$name_title_gioto = $tag_info['name_menu']?$tag_info['name_menu']:$tag_info['name'];

			$this->data['name_title_gioto'] = 'Tour Du Lịch <span>'.str_replace($array_title_gioto,'',$name_title_gioto).'</span>';

			$this->data['desc_gioto'] = html_entity_decode($this->config->get('khtetgioto_desc'), ENT_QUOTES, 'UTF-8');



			/**********************Cats Duong lich**********************/

			$cat_id_promotion = 232;

			$this->data['cats_gioto'] = array();

			$cats = $this->model_catalog_tag->getTags($cat_id_promotion);

			$this->data['link_promotion_gioto'] = $this->url->link('promotion/gioto');



			foreach($cats as $item) {

				if($item['image'] && file_exists(DIR_IMAGE . $item['image'])){

					$name = ($item['name_menu'])?$item['name_menu']:$item['name'];

					$array = array('Tour Du Lịch ','Lễ Giỗ Tổ - 30/4 - 1/5/2015');

					$name = str_replace($array,'',$name);

					$product_total = $this->model_catalog_tag->getTotalProductByTagId($item['tag_id']);



					$this->data['cats_gioto'][] = array(

						'id'		=>	$item['tag_id'],

						'name'		=>	$name . ' ' .sprintf($this->language->get('text_product_total'),$product_total),

						'thumb'		=>	$this->model_tool_image->onesize($item['image'],250,150),

						'href'    	=> 	$this->url->link('product/tag', 'tag_id=' . $item['tag_id']),

					);

				}

			}



			//Promotion Duong lich

			$array_title_duonglich = array('Tour Du Lịch ','Tết Dương Lịch','Tết Dương Lịch 2016','2016');

			$name_title_duonglich = $tag_info['name_menu']?$tag_info['name_menu']:$tag_info['name'];

			$this->data['name_title_duonglich'] = 'Tour Du Lịch <span>'.str_replace($array_title_duonglich,'',$name_title_duonglich).'</span>';

			$this->data['desc_duonglich'] = html_entity_decode($this->config->get('khtetduonglich_desc'), ENT_QUOTES, 'UTF-8');



			/**********************Cats Duong lich**********************/

			$cat_id_promotion = 275;

			$this->data['cats_duonglich'] = array();

			$cats = $this->model_catalog_tag->getTags($cat_id_promotion);

			$this->data['link_promotion_duonglich'] = $this->url->link('promotion/duonglich');



			foreach($cats as $item) {

				if($item['image'] && file_exists(DIR_IMAGE . $item['image'])){

					$name = ($item['name_menu'])?$item['name_menu']:$item['name'];

					$array = array('Tour Du Lịch ','Tết Dương Lịch','Tết Dương Lịch 2015');

					$name = str_replace($array,'',$name);

					$product_total = $this->model_catalog_tag->getTotalProductByTagId($item['tag_id']);



					$this->data['cats_duonglich'][] = array(

						'id'		=>	$item['tag_id'],

						'name'		=>	$name . ' ' .sprintf($this->language->get('text_product_total'),$product_total),

						'thumb'		=>	$this->model_tool_image->onesize($item['image'],250,150),

						'href'    	=> 	$this->url->link('product/tag', 'tag_id=' . $item['tag_id']),

					);

				}

			}



			//Promotion Am Lịch

			$array_title_amlich = array('Tour Du Lịch ','Tết Nguyên Đán','Tết Nguyên Đán 2015','tết nguyên đán','Tour du lịch ','Tết Âm Lịch','Tour');

			$name_title_amlich = $tag_info['name_menu']?$tag_info['name_menu']:$tag_info['name'];

			$this->data['name_title_amlich'] = 'Tour Du Lịch <span>'.str_replace($array_title_amlich,'',$name_title_amlich).'</span>';

			$this->data['desc_amlich'] = html_entity_decode(EVENT_CONTENTS, ENT_QUOTES, 'UTF-8');



			/**********************Cats Am lich**********************/

			$cat_id_promotion = 76;

			$this->data['cats_amlich'] = array();

			$cats = $this->model_catalog_tag->getTags($cat_id_promotion);

			$this->data['link_promotion_amlich'] = EVENT_SEO;



			foreach($cats as $item) {

				if($item['image'] && file_exists(DIR_IMAGE . $item['image'])){

					$name = ($item['name_menu'])?$item['name_menu']:$item['name'];

					$array = array('Tour Du Lịch ','Tết Nguyên Đán','Tết Nguyên Đán 2015','tết nguyên đán','Tour du lịch ','Tết Âm Lịch','Tour');

					$name = str_replace($array,'',$name);

					$product_total = $this->model_catalog_tag->getTotalProductByTagId($item['tag_id']);



					$this->data['cats_amlich'][] = array(

						'id'		=>	$item['tag_id'],

						'name'		=>	$name . ' ' .sprintf($this->language->get('text_product_total'),$product_total),

						'thumb'		=>	$this->model_tool_image->onesize($item['image'],250,150),

						'href'    	=> 	$this->url->link('product/tag', 'tag_id=' . $item['tag_id']),

					);

				}

			}



			//Promotion Gio To

			$array_gioto = array(244,245,246,233,236,237,241,242,243,240,235,238,239,234);

			//END Promotion Gio To



			//Promotion Duong Lich

			$array_duonglich = array(276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291);

			//END Promotion Duong Lich



			//Promotion Am Lich

			$array_amlich = array(100,101,102,103,104,105,106,107,109,110,111,112,113,181,194);

			//END Promotion Am Lich

			//CHECK Promotion Duong Lich

			if(in_array($this->request->get['tag_id'],$array_gioto)){

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/promotion/gioto_child.tpl')) {

					$this->template = $this->config->get('config_template') . '/template/promotion/gioto_child.tpl';

				} else {

					$this->template = 'default/template/promotion/gioto_child.tpl';

				}

			}

			//CHECK Promotion Duong Lich

			elseif(in_array($this->request->get['tag_id'],$array_duonglich)){

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/promotion/duonglich_child.tpl')) {

					$this->template = $this->config->get('config_template') . '/template/promotion/duonglich_child.tpl';

				} else {

					$this->template = 'default/template/promotion/duonglich_child.tpl';

				}

			}//CHECK Promotion Duong Lich

			elseif(in_array($this->request->get['tag_id'],$array_amlich)){

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/promotion/amlich_child.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/promotion/amlich_child.tpl';

				} else {

					$this->template = 'default/template/promotion/amlich_child.tpl';

				}

			}else{

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/tag.tpl')) {

					$this->template = $this->config->get('config_template') . '/template/product/tag.tpl';

				} else {

					$this->template = 'default/template/product/tag.tpl';

				}

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



			if (isset($this->request->get['tag_id'])) {

				$url .= '&tag_id=' . $this->request->get['tag_id'];

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

				'href'      => $this->url->link('product/tag', $url),

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