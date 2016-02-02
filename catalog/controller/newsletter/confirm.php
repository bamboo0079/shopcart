<?php 
class ControllerNewsletterConfirm extends Controller { 
	
	public function index() { 
		$this->language->load('newsletter/confirm');
		$this->load->model('catalog/newsletter');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$email = $this->request->post['email'];
			$name = $this->request->post['name'];
			$newsletter_info = $this->model_catalog_newsletter->getNewsLetterbyEmail($email);
			if($newsletter_info == NULL){
				//
				$code = md5(uniqid(rand()));
				$check = $this->model_catalog_newsletter->getNewsLetterVerifyEmail($email);
				if($check!=NULL){
					$this->model_catalog_newsletter->deleteNewsLetterVerifyEmail($email);
				}
				
				$this->model_catalog_newsletter->addNewsLetterVerifyEmail($email,$code);
				//
				$this->model_catalog_newsletter->addNewsLetter($this->request->post);
				
				
				$this->data['text_desc_confirm'] = sprintf($this->language->get('text_desc_confirm'),$name,$email);
				
				// HTML Mail
				$template = new Template();
				
				$subject = $this->language->get('text_subject');	
					
				$template->data['title'] = $this->language->get('text_subject');
				
				$template->data['text_hello'] = sprintf($this->language->get('text_hello'), $email,$name);
				$template->data['text_greeting'] = $this->language->get('text_greeting');
				$template->data['text_guide'] = $this->language->get('text_guide');
				$template->data['text_active'] = $this->language->get('text_active');
				$template->data['text_copy'] = $this->language->get('text_copy');
				$template->data['link'] = $this->url->link('newsletter/active','code='.$code);
				//$template->data['link'] = HTTP_SERVER . 'index.php?route=newsletter/active&code=' . $code;
				
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/verify.tpl')) {
					$html = $template->fetch($this->config->get('config_template') . '/template/mail/verify.tpl');
				} else {
					$html = $template->fetch('default/template/mail/verify.tpl');
				}
				
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($email);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($html);
				$mail->send();
				
			}else{
				$url = '';
				$check_status = $this->model_catalog_newsletter->getNewsLetterStatusbyEmail($email);
				if($check_status == 1){
					$this->data['text_desc_confirm'] = sprintf($this->language->get('text_desc_registered'),$name,$email);
				}else{
					$this->data['text_desc_confirm'] = sprintf($this->language->get('text_desc_register'),$name,$email,$url);
				}
			
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
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/newsletter/confirm.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/newsletter/confirm.tpl';
			} else {
				$this->template = 'default/template/newsletter/confirm.tpl';
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
			
		}else{
			$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => '',
        		'separator' => $this->language->get('text_separator')
      		);			
		
      		$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

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