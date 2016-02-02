<?php  
class ControllerCommentWrite extends Controller {
	public function index() {
		$this->language->load('comment/write');
		
		$this->load->model('catalog/comment');
		
		$json = array();
		
		if ((strlen(utf8_decode($this->request->post['name'])) < 3) || (strlen(utf8_decode($this->request->post['name'])) > 255)) {
			$json['error'] = $this->language->get('error_name');
		}
		
		
		if ((strlen(utf8_decode($this->request->post['text'])) < 3)) {
			$json['error'] = $this->language->get('error_text');
		}

				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			$this->model_catalog_comment->addComment($this->request->get['url'], $this->request->post);
			
			$json['success'] = $this->language->get('text_success');
		}
		
		$this->response->setOutput(json_encode($json));		
	}
	
	public function child() {
		$this->language->load('comment/write');
		
		$this->load->model('catalog/comment');
		
		$json = array();
		
		if ((strlen(utf8_decode($this->request->post['name'])) < 3) || (strlen(utf8_decode($this->request->post['name'])) > 255)) {
			$json['error'] = $this->language->get('error_name');
		}
		
		if ((strlen(utf8_decode($this->request->post['text'])) < 3)) {
			$json['error'] = $this->language->get('error_text');
		}
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			$this->model_catalog_comment->addCommentChild($this->request->post);
			$json['success'] = $this->language->get('text_success');
			
			$info = $this->model_catalog_comment->getComment($this->request->post['parent_id']);
			
			if($this->request->post['send_mail'] == 'on' && $info['email'] != ''){
				// HTML Mail
				$email = $info['email'];
				$name = $info['name'];
				
				$template = new Template();
				
				$subject = $this->language->get('text_subject');	
					
				$template->data['title'] = $this->language->get('text_subject');
				
				$template->data['text_hello'] = sprintf($this->language->get('text_hello'), $email,$name);
				$template->data['text_greeting'] = $this->language->get('text_greeting');
				$template->data['text_greeting'] .= sprintf($this->language->get('text_faq'), $info['text']);
				$template->data['text_greeting'] .= sprintf($this->language->get('text_ans'), $this->request->post['text']);
				
				if (file_exists(DIR_TEMPLATE . 'mail/reply_comment.tpl')) {
					$html = $template->fetch('mail/reply_comment.tpl');
				} else {
					$html = $template->fetch('mail/reply_comment.tpl');
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
			}
			
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>