<?php 
class ControllerNewsletterNewsletter extends Controller { 
	
	public function index() { 
		$this->language->load('newsletter/confirm');
		$this->load->model('catalog/newsletter');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			
		}	
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->data['breadcrumbs'] = array(); 
	
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('common/home'),
				'text'      => $this->language->get('text_home'),
				'separator' => false
			); 
					
			$this->data['breadcrumbs'][] = array(
				'href'      => $this->url->link('newsletter/newsletter'),
				'text'      => $this->language->get('text_confirm'),
				'separator' => $this->language->get('text_separator')
			);
			
			
			$this->data['heading_title'] = $this->language->get('heading_title');
			
			$this->data['button_continue'] = $this->language->get('button_continue');
	
			$this->data['continue'] = $this->url->link('common/home');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/newsletter/newsletter.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/newsletter/newsletter.tpl';
			} else {
				$this->template = 'default/template/newsletter/newsletter.tpl';
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
?>