<?php
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');

		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_about'] = $this->language->get('text_about');
		$this->data['text_work'] = $this->language->get('text_work');
		$this->data['text_payment'] = $this->language->get('text_payment');
		$this->data['text_tuts'] = $this->language->get('text_tuts');
		$this->data['text_policy_protect'] = $this->language->get('text_policy_protect');
		$this->data['text_policy_cancel'] = $this->language->get('text_policy_cancel');
		$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		$this->data['text_contact'] = $this->language->get('text_contact');

		$this->data['text_service'] = $this->language->get('text_service');
		$this->data['text_information'] = $this->language->get('text_information');
		$this->data['text_list_promotion'] = $this->language->get('text_list_promotion');
		$this->data['text_feedback'] = $this->language->get('text_feedback');
		$this->data['text_feedback_content'] = $this->language->get('text_feedback_content');
		$this->data['text_newsletter_title_label'] = $this->language->get('text_newsletter_title_label');
		$this->data['text_newsletter_title_em'] = $this->language->get('text_newsletter_title_em');
		$this->data['text_newsletter_button'] = $this->language->get('text_newsletter_button');

		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_phone'] = $this->language->get('text_phone');
		$this->data['text_website'] = $this->language->get('text_website');
		$this->data['text_fax'] = $this->language->get('text_fax');
		$this->data['text_email'] = $this->language->get('text_email');
		$this->data['text_copy'] = $this->language->get('text_copy');
		$this->data['text_copy2'] = $this->language->get('text_copy2');


		$this->data['home'] = $this->url->link('common/home');
		$this->data['about'] = $this->url->link('information/information', 'information_id=4');
		$this->data['payment'] = $this->url->link('information/information', 'information_id=8');
		$this->data['tuts'] = $this->url->link('information/information', 'information_id=9');
		$this->data['policy_protect'] = $this->url->link('information/information', 'information_id=3');
		$this->data['policy_cancel'] = $this->url->link('information/information', 'information_id=11');
		$this->data['work'] = $this->url->link('information/information', 'information_id=13');
		$this->data['sitemap'] = $this->url->link('information/sitemap');
		$this->data['contact'] = $this->url->link('information/contact');

		$this->data['store'] = $this->config->get('config_name');
		$this->data['address'] = nl2br($this->config->get('config_address'));
		$this->data['telephone'] = $this->config->get('config_telephone');
		$this->data['fax'] = $this->config->get('config_fax');
		$this->data['config_email'] = $this->config->get('config_email');

		$this->data['title'] = $this->document->getTitle();
		$this->data['logo'] = HTTP_SERVER . 'image/' . $this->config->get('config_logo');

		$this->data['tour_promotion'] = array(
			'Tour Du Lịch Giỗ Tổ'     => 'http://www.dulichgioto.com/',
			'Tour Du Lịch 30/4'     => 'http://www.dulich304.com/',
			'Tour Du Lịch Hè'     => 'http://www.tourhe.net/',
			'Tour Du Lịch 2/9'     => 'http://dulich29.net/',
		);


		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}

		if(isset($this->request->get['product_id'])) {
			$this->data['footer_content'] = html_entity_decode($this->config->get('footer_product_content'), ENT_QUOTES, 'UTF-8');
		}elseif (isset($this->request->get['path'])) {
			$this->data['footer_content'] = html_entity_decode($this->config->get('footer_category_content'), ENT_QUOTES, 'UTF-8');
		}elseif (isset($this->request->get['tag_id'])) {
			$this->data['footer_content'] = html_entity_decode($this->config->get('footer_tag_content'), ENT_QUOTES, 'UTF-8');
		}else{
			$this->data['footer_content'] = html_entity_decode($this->config->get('footer_content'), ENT_QUOTES, 'UTF-8');
		}

		$this->data['footer_top_tag_content'] = html_entity_decode($this->config->get('footer_top_tag_content'), ENT_QUOTES, 'UTF-8');

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}

		$this->data['display_float_ads'] = $this->config->get('display_float_ads');
		if($this->config->get('float_ads_top')){
			$this->data['float_ads_top'] = $this->config->get('float_ads_top');
		}else{
			$this->data['float_ads_top'] = 0;
		}
		/*Minh code banner left+right*/
		$this->load->model('event/event');
		$image_left = '';
		$image_right = '';
		if(EVENT_ID){
			$event_ads = $this->model_event_event->getEventAds(EVENT_ID,date('Y-m-d'));
		}else{
			$event_ads = $this->model_event_event->getEventAds(0,date('Y-m-d'));
		}
		if(isset($event_ads['image_left'])){
			$image_left = '../image/'.$event_ads['image_left'];
		}
		if(isset($event_ads['image_right'])){
			$image_right = '../image/'.$event_ads['image_right'];
		}
		$this->data['float_left_ads'] = html_entity_decode('<img src="'.$image_left.'" style="width: 185px; height: 655px;"  />', ENT_QUOTES, 'UTF-8');
		$this->data['float_right_ads'] = html_entity_decode('<img src="'.$image_right.'" style="width: 184px; height: 655px;" />', ENT_QUOTES, 'UTF-8');
		/*Minh code banner left+right*/
		$this->children[] = 'common/footer_top';
		$this->children[] = 'common/footer_bottom';
		$this->data['image_support_footer'] = '/image/data/logo/bottom-tong-dai.png';


				$this->children[] = 'common/footer_top';
				$this->children[] = 'common/footer_bottom';
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}

		$this->render();
	}
}
?>