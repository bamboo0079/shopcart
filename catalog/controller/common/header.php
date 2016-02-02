<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
        /*dsjsdkfdskfdskfdsfldsjfldsfjkldjsfkljsdklfjldksf*/
		$this->data['title'] = $this->document->getTitle();

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (isset($this->session->data['error']) && !empty($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		}
        $this->data['edit'] = $this->url->link('account/account', '', 'SSL');
        $this->data['password'] = $this->url->link('account/password', '', 'SSL');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['return'] = $this->url->link('account/return', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['name'] = $this->config->get('config_name');
		$this->data['meta'] = $this->document->getMetas();	

		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}

		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}		

		$this->language->load('common/header');

		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_search_desc'] = sprintf($this->language->get('text_search_desc'), html_entity_decode($this->config->get('text_search_desc_content'), ENT_QUOTES, 'UTF-8'));
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_guide_order'] = $this->language->get('text_guide_order');
		$this->data['text_checkout'] = $this->language->get('text_checkout');
		$this->data['text_news'] = $this->language->get('text_news');
        $this->data['text_edit'] = $this->language->get('text_edit');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['text_guide_order_code'] = $this->language->get('text_guide_order_code');
        $this->data['text_guide_order_code_error'] = $this->language->get('text_guide_order_code_error');
        $this->data['text_guide_order_title'] = $this->language->get('text_guide_order_title');
        $this->data['text_guide_order_code'] = $this->language->get('text_guide_order_code');
        $this->data['text_guide_order_phone'] = $this->language->get('text_guide_order_phone');
        $this->data['text_guide_order_phone_error'] = $this->language->get('text_guide_order_phone_error');
        $this->data['text_guide_order_phone_number_error'] = $this->language->get('text_guide_order_phone_number_error');

		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['news'] = $this->url->link('news/all', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		//text
		$this->data['text_user'] = $this->customer->getLastName().' '.$this->customer->getFirstName();
		$this->data['text_logout'] = $this->language->get('text_logout');
		$this->data['text_logout_header'] = $this->language->get('text_logout_header');
		$this->data['text_confirm_logout'] = $this->language->get('text_confirm_logout');
		$this->data['text_chuongtrinh'] = $this->language->get('text_chuongtrinh');
		$this->data['text_about'] = $this->language->get('text_about');
		$this->data['text_guide_booking'] = $this->language->get('text_guide_booking');
		$this->data['text_guide_payment'] = $this->language->get('text_guide_payment');
		
		//url
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$this->data['chuongtrinh'] = $this->url->link('information/information', 'information_id=10');
		$this->data['about'] = $this->url->link('information/information', 'information_id=4');
		$this->data['guide_booking'] = $this->url->link('information/information', 'information_id=9');
		$this->data['guide_payment'] = $this->url->link('information/information', 'information_id=8');
		
		//Tour Khuyen mai
		$this->data['text_tour_date'] = $this->language->get('text_tour_date');
		$this->data['tour_date'] = array(
		);
		
		//Tour Khuyen mai
		$this->data['text_tour_promotion'] = $this->language->get('text_tour_promotion');
		$this->data['tour_promotion'] = array(
			EVENT_NAME     => HTTP_SERVER . EVENT_SEO,
			//'Tour Du Lịch Lễ 2/9/2015'     => HTTP_SERVER . 'tour-du-lich-ngay-le-2-9.html',
		);
		
		$this->load->model('catalog/tag');
		$this->data['text_tour_dkh'] = $this->language->get('text_tour_dkh');
		$this->data['text_tour_xv'] = $this->language->get('text_tour_xv');
		$this->data['tour_xv'] = $this->url->link('product/category', 'path=87');
		//Tour Xuyen Viet 
		$this->data['tour_dkh'] = array();
		$categories = $this->model_catalog_category->getCategories(87);
		
		foreach ($categories as $item) {
			$this->data['tour_dkh'][] = array(
				'category_id'	=>	$item['category_id'],
				'name'	=>	$item['name_menu']?$item['name_menu']:$item['name'],
				'href'  => $this->url->link('product/category', 'path='. $item['category_id'])
			);
		}
		//Tour Xuyen Viet 1
		$this->data['tour_xv1'] = array();
		$this->data['text_tour_xv1'] = $this->language->get('text_tour_xv1');
		
		$array_tour_xv1 = array(216,217,218,219,220,221,222,223);
		foreach($array_tour_xv1 as $item){
			$result = $this->model_catalog_tag->getTag($item);
			$this->data['tour_xv1'][] = array(
				'tag_id'	=>	$result['tag_id'],
				'name'	=>	$result['name_menu']?$result['name_menu']:$result['name'],
				'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'])
			);
		}
		//Tour Xuyen Viet 2
		$this->data['tour_xv2'] = array();
		$this->data['text_tour_xv2'] = $this->language->get('text_tour_xv2');
		
		$array_tour_xv1 = array(224,225,226,227,228,229,230);
		foreach($array_tour_xv1 as $item){
			$result = $this->model_catalog_tag->getTag($item);
			$this->data['tour_xv2'][] = array(
				'tag_id'	=>	$result['tag_id'],
				'name'	=>	$result['name_menu']?$result['name_menu']:$result['name'],
				'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id'])
			);
		}

        $this->data['action'] = $this->url->link('order/check');
		/**********Tour Theo Ngày**********/
		$this->data['tour_tn'] = array();
		$array_tour_tn = array(168,170,119,117,85,126,127);
		foreach($array_tour_tn as $id){
			$result = $this->model_catalog_tag->getTag($id);
			if($result){
				$level_2_data = array();
				$result_2 = $this->model_catalog_tag->getTagsByParentId($id);
				foreach ($result_2 as $item_2) {
					$data_2 = $this->model_catalog_tag->getTag($item_2);
					if($data_2){
						$name_2 = $data_2['name_menu']?$data_2['name_menu']:$data_2['name'];
						$array_repalce = array('/Du Lịch Miền Tây/','/Du Lịch Phú Quốc/','/Du Lịch Đà Lạt/','/Du Lịch Nha Trang/','/Du Lịch Đà Nẵng/','/Du Lịch Hội An/','/Du Lịch Huế/');
						$name_2 = 'Chùm '.preg_replace($array_repalce,'',$name_2);
						$level_2_data[] = array(
							'tag_id'	=>	$data_2['tag_id'],
							'name'	=>	$name_2,
							'href'  => $this->url->link('product/tag', 'tag_id='. $data_2['tag_id'])
						);
					}
				}
				$name_1 = $result['name_menu']?$result['name_menu']:$result['name'];
				$name_1 = str_replace('Tour du lịch ','',$name_1);
				$name_1 = str_replace(' Chất Lượng Cao','',$name_1);
				$this->data['tour_tn'][] = array(
					'tag_id'	=>	$result['tag_id'],
					'name'	=>	$name_1,
					'href'  => $this->url->link('product/tag', 'tag_id='. $result['tag_id']),
					'level_2_data' => $level_2_data
				);
			}
		}
		
		
		$this->language->load('module/cart');
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();

		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array(); 

			$results = $this->model_setting_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}

				$sort_order = array(); 

				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $total_data);			
			}		
		}
		$this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
		
		// Daniel's robot detector
		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// A dirty hack to try to set a cookie for the multi-store feature
		$this->load->model('setting/store');

		$this->data['stores'] = array();

		if ($this->config->get('config_shared') && $status) {
			$this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();

			$stores = $this->model_setting_store->getStores();

			foreach ($stores as $store) {
				$this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			}
		}

		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category_1) {
			if ($category_1['top']) {
				//level_2
				$level_2_data = array();
	
				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
	
				foreach ($categories_2 as $category_2) {
					//level_3
					$level_3_data = array();
	
					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
	
					foreach ($categories_3 as $category_3) {
						$level_3_data[] = array(
							'category_id' => $category_3['category_id'],
							'name'        => ($category_3['name_menu'])?$category_3['name_menu']:$category_3['name'],
							'href'  => $this->url->link('product/category', 'path=' . $category_3['category_id'])
						);
					}
	
					$level_2_data[] = array(
						'category_id' => $category_2['category_id'],	
						'name'        => ($category_2['name_menu'])?$category_2['name_menu']:$category_2['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category_2['category_id']),
						'children'    => $level_3_data
					);					
				}
				//level_1
				$this->data['categories'][] = array(
					'category_id' => $category_1['category_id'],
					'name'        => ($category_1['name_menu'])?$category_1['name_menu']:$category_1['name'],
					'href'  => $this->url->link('product/category', 'path=' . $category_1['category_id']),
					'children'    => $level_2_data
				);
			}
		}

		$this->data['image_support'] = $server . 'image/data/logo/img-tongdai.png';
		$this->data['logo'] = $server . 'image/data/logo/logo-vft.png';

		$this->load->model('catalog/news_category');

		$this->load->model('catalog/news');

		$this->data['news_categories'] = array();

		$news_categories = $this->model_catalog_news_category->getNewsCategories(0);

		foreach ($news_categories as $news_category) {
			$this->data['news_categories'][] = array(
				'news_category_id' => $news_category['news_category_id'],
				'name'        => $news_category['name'],
				'href'        => $this->url->link('news/news_category', 'news_category_id=' . $news_category['news_category_id'])
			);	
		}
		

		$this->children = array(
			'module/language',
			'module/currency',
			'module/counter_mail',
			'module/cart'
		);
		$this->data['config_template'] = $this->config->get('config_template');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}

		$this->render();
	} 	
}
?>
