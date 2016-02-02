<?php
class ControllerCommonSeoUrl extends Controller {
	 /* SEO Custom URL */
	private $url_list = array (
		'common/home' => '',
		'error/not_found'               =>   'not-found',
		'news/all'						=>   'blog',
		'product/booking' 				=>   'booking',
		'newsletter/newsletter'   		=>   'newsletter',
		'newsletter/confirm'   			=>   'newsletter/confirm',
		'newsletter/active'   			=>   'newsletter/active',
		'onecheckout/checkout'          =>   'thanh-toan',
		'checkout/checkout'             =>   'thanh-toan',
		'checkout/cart'                 =>   'thanh-toan/gio-hang',
		'order/check'                 	=>   'order-check',
		'account/order/info'   			=>   'order-info',
		'checkout/voucher'              =>   'thanh-toan/phieu-qua-tang',
		'checkout/success'              =>   'thanh-toan/thanh-cong',
		'account/account'               =>   'tai-khoan',
		'account/register'              =>   'tai-khoan/dang-ky',
		'account/wishlist'              =>   'tai-khoan/yeu-thich',
		'account/logout'                =>   'tai-khoan/dang-xuat',
		'account/login'                 =>   'tai-khoan/dang-nhap',
		'account/recurring'             =>   'tai-khoan/thanh-toan-dinh-ky',
		'account/voucher'               =>   'tai-khoan/phieu-qua-tang',
		'account/forgotten'             =>   'tai-khoan/quen-mat-khau',
		'account/download'              =>   'tai-khoan/tai-ve',
		'account/return'                =>   'tai-khoan/doi-tra-hang',
		'account/return/insert'         =>   'tai-khoan/doi-tra-hang/yeu-cau',
		'account/transaction'           =>   'tai-khoan/giao-dich',
		'account/password'              =>   'tai-khoan/mat-khau',
		'account/edit'                  =>   'tai-khoan/chinh-sua',
		'account/address'               =>   'tai-khoan/dia-chi',
		'account/reward'                =>   'tai-khoan/diem-thuong',
		'account/newsletter'            =>   'tai-khoan/nhan-tin-tuc',
		'account/order'                 =>   'tai-khoan/don-hang',
		'account/confirm_email'         =>   'tai-khoan/xac-nhan-doi-mail',
		
		'order/view/invoice'            =>   'order/view/invoice',
		'order/view/confirm'            =>   'order/view/confirm',
		
		'promotion/duonglich'           =>   'tour-du-lich-tet-duong-lich.html',
		'promotion/amlich'              =>   'tour-du-lich-tet-nguyen-dan.html',
		'promotion/gioto'               =>   'tour-du-lich-ngay-le-30-4.html',
		'event/event'               	=>   'tour-du-lich-he.html',
		'promotion/even29'              =>   'tour-du-lich-ngay-le-2-9.html',
		
		
		'product/list'               	=>   'bang-gia-tour-du-lich.html',
		
		'mail_template/mail'            =>   'mail-template',
		'mail_template/mail/counter'    =>   'mail-template/counter',
		 
		'affiliate/account'             =>   'tiep-thi/tai-khoan',
		'affiliate/login'               =>   'tiep-thi/dang-nhap',
		'affiliate/register'            =>   'tiep-thi/dang-ky',
		'affiliate/transaction'         =>   'tiep-thi/giao-dich', 
		'affiliate/tracking'            =>   'tiep-thi/theo-doi',
		'affiliate/payment'             =>   'tiep-thi/cong-thanh-toan',
		'affiliate/forgotten'           =>   'tiep-thi/quen-mat-khau',
		 
		'information/contact'           =>   'trang/lien-he',
		'information/sitemap'           =>   'trang/sitemap',
		
		'feed/google_sitemap'           =>   'sitemap.xml',
		'feed/product'           		=>   'data-xml/product.xml',
		'feed/banner'           		=>   'banner-xml/banner.xml',
		'feed/option'					=> 	 'option.xml',
		'feed/product_option'			=>   'product-option.xml',
		'feed/product_option_gioto'		=>   'product-option-gioto.xml',
		'feed/product_option_he'		=>   'product-option-he.xml',
		'feed/product_new'				=> 	 'product-new.xml',
		
		'product/special'               =>   'san-pham/noi-bat',
		'product/search'               	=>   'tim-kiem',
		'product/manufacturer'          =>   'thuong-hieu',
		'module/currency'               =>   'tien-te',
		'product/allproduct'            =>   'tat-ca-san-pham',
	);
	/* SEO Custom URL */
	public function index() {
		// redirects
		$redirects = $this->config->get('redirects');
		if (isset($this->request->get['_route_'])) {
			$_route = $this->request->get['_route_'];
		}else{
			$_route = $_SERVER['REQUEST_URI'];
		}
		
		if($redirects){
			foreach($redirects as $redirect){
				if($_route == $redirect['okeyword'] || $_route == html_entity_decode($redirect['okeyword'])){
					header('Location: /' . $redirect['nkeyword'],true,$redirect['type']);
					die();
				}
			}
		}
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
			foreach ($parts as $part) {
				$xml = explode('.', $part);
				if(count($xml) == 2 && $xml[1]=="xml") {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($xml[0].".html") . "'");
					if(isset($query->row['query'])){ 
						$url = explode('=', $query->row['query']);
						if ($url[0] == 'tag_id') {
							$this->request->get['path_xml'] = $url;
						}
						if($url[0] == 'product_id') {
							$this->request->get['path_xml'] = $url[1];
						}
					}
				}else{
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($parts[0] == 'print') {
                    $this->request->get['route']     = 'product/product/print_product';
                    $this->request->get['product_part'] = end($parts);
                }elseif ($query->num_rows) {
					$url = explode('=', $query->row['query']);

					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}	
					
					//news
					if ($url[0] == 'news_id') {
						$this->request->get['news_id'] = $url[1];
					}

					if ($url[0] == 'M') {
						$this->request->get['M'] = $url[1];
					}
					
					if ($url[0] == 'news_category_id') {
						if (!isset($this->request->get['news_category_id'])) {
							$this->request->get['news_category_id'] = $url[1];
						} else {
							$this->request->get['news_category_id'] .= '_' . $url[1];
						}
					}
					
					//Tag
					if ($url[0] == 'tag_id') {
						$this->request->get['tag_id'] = $url[1];
					}
					//Manufacturer
					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}
					//Information
					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}
					/* Khoa them route load event*/
					//Event
					if ($url[0] == 'event_id') {
						$this->request->get['event_id'] = $url[1];
					}
					/* Khoa End*/

					//Employee
					if ($url[0] == 'employee_id') {
						$this->request->get['employee_id'] = $url[1];
					}
					//Mail Template
					if ($url[0] == 'mail_template_id') {
						$this->request->get['mail_template_id'] = $url[1];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';
				}
			}
		}
			/* SEO Custom URL */
			if ( $_s = $this->setURL($this->request->get['_route_']) ) {
					$this->request->get['route'] = $_s;
			}/* SEO Custom URL */
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			}
			if (isset($this->request->get['path_xml'])) {
				$this->request->get['route'] = 'feed/hangngay_saigon';
			}
			//news
			elseif (isset($this->request->get['news_id'])) {
				$this->request->get['route'] = 'news/news';
			}elseif (isset($this->request->get['news_category_id'])) {
				$this->request->get['route'] = 'news/news_category';
			}
			//Tag
			elseif (isset($this->request->get['tag_id'])) {
				$this->request->get['route'] = 'product/tag';
			}
			//Order SMS
			elseif(isset($this->request->get['M'])) {
				$this->request->get['route'] = 'account/order/infoSMS';
			}
			//Manufacturer
			elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} 
			//Information
			elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}
			/* Khoa thme route de load event*/
			elseif (isset($this->request->get['event_id'])) {
				$this->request->get['route'] = 'event/event';
			}
			/* Khoa End*/
			//Employee
			elseif (isset($this->request->get['employee_id'])) {
				$this->request->get['route'] = 'information/employee';
			}
			//Mail Template
			elseif (isset($this->request->get['mail_template_id'])) {
				$this->request->get['route'] = 'mail_template/mail';
			}
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));
	
		$url = ''; 
		
		$data = array();
		
		parse_str($url_info['query'], $data);
		
		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id') || ($data['route'] == 'information/employee' && $key == 'employee_id') || ($data['route'] == 'news/news' && $key == 'news_id') || ($data['route'] == 'product/tag' && $key == 'tag_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");
				
					if ($query->num_rows) {
						if($key == 'product_id'){
							$url .= '/' . $query->row['keyword'];
						}elseif($key == 'news_id'){
							$url .= '/' .'blog';
							$url .= '/' . $query->row['keyword'];
						}elseif($key == 'tag_id'){
							$url .= '/' . $query->row['keyword'];
						}else{
							$url .= '/' . $query->row['keyword'];
						}
						
						unset($data[$key]);
					}					
				} elseif ($key == 'path') {
					$categories = explode('_', $value);
					
					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");
				
						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
						}							
					}
					
					unset($data[$key]);
				}elseif ($key == 'news_category_id') {
						$categories = explode('_', $value);
						
						foreach ($categories as $category) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'news_category_id=" . (int)$category . "'");
					
							if ($query->num_rows) {
								$url .= '/' .'cblog';
								$url .= '/' . $query->row['keyword'];
							}							
						}
						
						unset($data[$key]);
					}elseif ($key == 'news_type_id') {
						$categories = explode('_', $value);
						
						foreach ($categories as $category) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'news_type_id=" . (int)$category . "'");
					
							if ($query->num_rows) {
								$url .= '/' . $query->row['keyword'];
							}							
						}
						
						unset($data[$key]);
					}
				 /* SEO Custom URL */
				if( $_u = $this->getURL($data['route']) ){
					$url .= $_u;
					unset($data[$key]);
				}
				/* SEO Custo*/
			}
		}
	
		if ($url) {
			unset($data['route']);
		
			$query = '';
		
			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . $key . '=' . $value;
				}
				
				if ($query) {
					$query = '?' . trim($query, '&');
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
	
	/* SEO Custom URL */
	public function getURL($route) {
			if( count($this->url_list) > 0) {
				 foreach ($this->url_list as $key => $value) {
					if($route == $key) {
						return '/'.$value;
					}
				 }
			}
			return false;
	}
	public function setURL($_route) {
			if( count($this->url_list) > 0 ){
				 foreach ($this->url_list as $key => $value) {
					if($_route == $value) {
						return $key;
					}
				 }
			}
			return false;
	}/* SEO Custom URL */	
}
?>