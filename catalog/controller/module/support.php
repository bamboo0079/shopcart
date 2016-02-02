<?php
class ControllerModuleSupport extends Controller {
	protected function index($setting) {
		$this->language->load('module/support');

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->load->model('catalog/support_online');
		$this->data['support_online']=array();
		
		$this->data['support_online'] = $this->model_catalog_support_online->getSupportOnlines();
		$this->data['countsp'] = $this->model_catalog_support_online->countSupportOnlines();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/support.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/support.tpl';
		} else {
			$this->template = 'default/template/module/support.tpl';
		}

		$this->render();
	}
}
?>