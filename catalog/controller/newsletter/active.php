<?php 
class ControllerNewsletteractive extends Controller { 
	
	public function index() { 
		$this->language->load('newsletter/active');
		$this->load->model('catalog/newsletter');
		
		$code = $this->request->get['code'];
		$check = $this->model_catalog_newsletter->getNewsLetterVerifyCode($code);
		
		if($check){
			$newsletter_info = $this->model_catalog_newsletter->getNewsLetterbyEmail($check['email']);
			$this->model_catalog_newsletter->updateNewsLetterStatusEmail($newsletter_info['email']);
			$this->model_catalog_newsletter->deleteNewsLetterVerifyEmail($newsletter_info['email']);
			$this->data['text_desc_active'] = $this->language->get('text_desc_active');
			// HTML Mail
			$template = new Template();
			
			$subject = $this->language->get('text_subject');	
				
			$template->data['title'] = $this->language->get('text_subject');
			
			$template->data['text_hello'] = sprintf($this->language->get('text_hello'), $newsletter_info['email'],$newsletter_info['name']);
			$template->data['text_greeting'] = $this->language->get('text_greeting');
			
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/verify_success.tpl')) {
				$html = $template->fetch($this->config->get('config_template') . '/template/mail/verify_success.tpl');
			} else {
				$html = $template->fetch('default/template/mail/verify_success.tpl');
			}
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($newsletter_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setHtml($html);
			$mail->send();
		}else{
			$this->data['text_desc_active'] = $this->language->get('text_desc_code');
		}
		
		$this->document->setTitle($this->language->get('heading_title'));
			
		$this->data['breadcrumbs'] = array(); 

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		); 
				
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('newsletter/confirm'),
			'text'      => $this->language->get('text_confirm'),
			'separator' => $this->language->get('text_separator')
		);
		
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['continue'] = $this->url->link('common/home');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/newsletter/active.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/newsletter/active.tpl';
		} else {
			$this->template = 'default/template/newsletter/active.tpl';
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