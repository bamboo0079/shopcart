<?php
class ControllerModuleAds extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/ads');
		$this->load->model('event/event');
		$this->load->model('tool/image');
		$this->data['event'] = $this->model_event_event->getEvent();
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_event_event->addAds($this->request->post['ad']);
			unset($this->request->post['ad']);
			$this->model_setting_setting->editSetting('ads', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('module/ads', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		$this->data['entry_tour'] = $this->language->get('entry_tour');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
				
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/ads', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/ads', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
	
		if (isset($this->request->post['display_float_ads'])) {
			$this->data['display_float_ads'] = $this->request->post['display_float_ads'];
		} else {
			$this->data['display_float_ads'] = $this->config->get('display_float_ads');
		}
		
		if (isset($this->request->post['float_ads_top'])) {
			$this->data['float_ads_top'] = $this->request->post['float_ads_top'];
		} else {
			$this->data['float_ads_top'] = $this->config->get('float_ads_top');
		}
		
		if (isset($this->request->post['ad'])) {
			$this->data['ads'] = $this->request->post['ad'];
		} else {
			$this->data['ads'] = $this->model_event_event->getAds();
		}

		foreach ($this->data['ads'] as $key => $value) {
			$this->data['ads'][$key]['thumb_left'] = $this->model_tool_image->resize($value['image_left'],100,100);
			$this->data['ads'][$key]['thumb_right'] = $this->model_tool_image->resize($value['image_right'],100,100);
		}		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/ads.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/ads')) {
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