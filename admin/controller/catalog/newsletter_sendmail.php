<?php 
class ControllerCatalogNewsletterSendmail extends Controller {
	private $error = array();
	 
	public function index() {
		$this->load->language('catalog/newsletter_sendmail');
 
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		$this->data['text_customer_all'] = $this->language->get('text_customer_all');	
		$this->data['text_customer'] = $this->language->get('text_customer');	
		$this->data['text_customer_group'] = $this->language->get('text_customer_group');
		$this->data['text_affiliate_all'] = $this->language->get('text_affiliate_all');	
		$this->data['text_affiliate'] = $this->language->get('text_affiliate');	
		$this->data['text_product'] = $this->language->get('text_product');	

		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_to'] = $this->language->get('entry_to');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_customer'] = $this->language->get('entry_customer');
		$this->data['entry_affiliate'] = $this->language->get('entry_affiliate');
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_subject'] = $this->language->get('entry_subject');
		$this->data['entry_message'] = $this->language->get('entry_message');
		
		$this->data['button_send'] = $this->language->get('button_send');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['token'] = $this->session->data['token'];

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/contact', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
    	$this->data['cancel'] = $this->url->link('sale/contact', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('sale/mail_template');
		$this->data['mail_templates'] = $this->model_sale_mail_template->getMailTemplates();
		$this->load->model('setting/store');
		$this->load->model('catalog/newsletter');
		$this->data['email_total'] = $this->model_catalog_newsletter->getTotalNewsLetters();
		$this->data['stores'] = $this->model_setting_store->getStores();
				
		$this->template = 'catalog/newsletter_sendmail.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function send() {
		$this->load->language('sale/contact');
		
		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$this->user->hasPermission('modify', 'catalog/newsletter_sendmail')) {
				$json['error']['warning'] = $this->language->get('error_permission');
			}
					
			if (!$this->request->post['subject']) {
				$json['error']['subject'] = $this->language->get('error_subject');
			}
	
			if (!$this->request->post['message']) {
				$json['error']['message'] = $this->language->get('error_message');
			}
			
			if (!$json) {
				$this->load->model('setting/store');
			
				$store_info = $this->model_setting_store->getStore($this->request->post['store_id']);			
				
				if ($store_info) {
					$store_name = $store_info['name'];
				} else {
					$store_name = $this->config->get('config_name');
				}
	
				$this->load->model('catalog/newsletter');
	
				if (isset($this->request->get['page'])) {
					$page = $this->request->get['page'];
				} else {
					$page = 1;
				}
								
				$email_total = 0;
							
				$emails = array();
				
				switch ($this->request->post['to']) {
					case 'newsletter':
						$customer_data = array(
							'start'             => ($page - 1) * 10,
							'limit'             => 10
						);
						
						$email_total = $this->model_catalog_newsletter->getTotalNewsLetters();
							
						$results = $this->model_catalog_newsletter->getNewsLetters($customer_data);
					
						foreach ($results as $result) {
							$emails[] = $result['email'];
						}
						break;									
				}
				
				if ($emails) {
					$start = ($page - 1) * 10;
					$end = $start + 10;
					////
						$this->load->model('catalog/newsletter');
						$id_status = $this->model_catalog_newsletter->getMailStatusById($this->request->post['mail_template']);
						$total = $this->model_catalog_newsletter->getTotalNewsLetters();
						if (!empty($id_status['id'])) {
							$this->model_catalog_newsletter->updatetMailStatusById($this->request->post['mail_template'],$total);							
						}else{
							$this->model_catalog_newsletter->addMailStatusById($this->request->post['mail_template'],$total);
						}
					///
					if ($end < $email_total) {
						$json['success'] = sprintf($this->language->get('text_sent'), $start, $email_total);
					} else { 
						$json['success'] = $this->language->get('text_success');
					}				
						
					if ($end < $email_total) {
						$json['next'] = str_replace('&amp;', '&', $this->url->link('catalog/newsletter_sendmail/send', 'token=' . $this->session->data['token'] . '&page=' . ($page + 1)));
					} else {
						$json['next'] = '';
					}
										
					foreach ($emails as $email) {
					$ms = $this->request->post['message'];
					if($this->request->post['to'] = 'newsletter_module'){

						$result = $this->model_catalog_newsletter->getNewsLetterByEmailId($email);
						if ($result['id']) {
							$id_custom = base64_encode($result['id']."+trungbt93");
						}else{
							$id_custom = "";
						}
						$ms = preg_replace('/%%id_custom%%/',trim("&in=".$id_custom), $ms);
						$ms = preg_replace('/%%id_mail%%/', trim("&id_in=".$result['id']), $ms);
						$ms = preg_replace('/%%name%%/', $result['name'], $ms);
						$ms = preg_replace('/%%email%%/', $result['email'], $ms);
					}		
					$message  = '<html dir="ltr" lang="en">' . "\n";
					$message .= '  <head>' . "\n";
					$message .= '    <title>' . $this->request->post['subject'] . '</title>' . "\n";
					$message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
					$message .= '  </head>' . "\n";
					$message .= '  <body>' . html_entity_decode($ms, ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
					$message .= '</html>' . "\n";
					
					
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
						$mail->setSender($store_name);
						$mail->setSubject(html_entity_decode($this->request->post['subject'], ENT_QUOTES, 'UTF-8'));					
						$mail->setHtml($message);
						$mail->send();
					}
				}
			}
		}
		
		$this->response->setOutput(json_encode($json));	
	}
}
?>