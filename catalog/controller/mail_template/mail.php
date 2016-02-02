<?php 
class ControllerMailTemplateMail extends Controller {
	public function index() {  
		$this->load->model('catalog/mail_template');
		
		$this->load->model('tool/image'); 

		if (isset($this->request->get['mail_template_id'])) {
			$mail_template_id = (int)$this->request->get['mail_template_id'];
		} else {
			$mail_template_id = 0;
		}

		$mail_template_info = $this->model_catalog_mail_template->getMailTemplate($mail_template_id);

		if ($mail_template_info) {
			$this->document->setTitle($mail_template_info['name']);
			$this->document->addLink($this->url->link('mail_template/mail', 'mail_template_id=' .  $mail_template_id), 'canonical');

			$this->data['heading_title'] = $mail_template_info['name'];

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['text'] = html_entity_decode($mail_template_info['text'], ENT_QUOTES, 'UTF-8');

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail_template/mail.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/mail_template/mail.tpl';
			} else {
				$this->template = 'default/template/mail_template/mail.tpl';
			}

			$this->children = array(
			);

			$this->response->setOutput($this->render());
		} else {
			$this->language->load('error/not_found');
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('mail_template/mail', 'mail_template_id=' . $mail_template_id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

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
	public function counter() { 
		$this->load->model('catalog/mail_template');
		
		$this->load->model('tool/image'); 

		if (isset($this->request->get['id'])) {
			$id = (int)$this->request->get['id'];
			if (isset($this->request->get['id_mail'])) {
				$id_mail = (int)$this->request->get['id_mail'];
				$data_mail=$this->model_catalog_mail_template->checkMail($id_mail);
				if ($data_mail!=NULL) {
					$ip=$_SERVER['REMOTE_ADDR'];
					$browse=$_SERVER['HTTP_USER_AGENT'];
					$this->model_catalog_mail_template->updateMailViewCustom($id_mail,$id,$ip,$browse);
				}
			}if (isset($this->request->get['id_in'])) {
				$id_mail = (int)$this->request->get['id_in'];
				$data_mail=$this->model_catalog_mail_template->checkMail($id_mail);
				if ($data_mail!=NULL) {
					$ip=$_SERVER['REMOTE_ADDR'];
					$browse=$_SERVER['HTTP_USER_AGENT'];
					$this->model_catalog_mail_template->updateNewsMailViewCustom($id_mail,$id,$ip,$browse);
				}
			}
		} else {
			$id = 0;
		} 
		$this->model_catalog_mail_template->updateCounter($id);
		$counter_info = $this->model_catalog_mail_template->getCounter($id);
		
		if($counter_info){
			$this->CreateCounterImage($counter_info);
		}else {
			$this->language->load('error/not_found');
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('mail_template/mail/counter', 'mail_template_id=' . $id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

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
	protected function CreateCounterImage ($count){
		header("Content-Type: image/png");
		$im = @imagecreate(50, 20);
		$background_color = imagecolorallocate($im, 255, 255, 255);
		$text_color = imagecolorallocate($im, 72, 103, 173);
		imagestring($im, 1, 5, 5,  $count, $text_color);
		imagepng($im);
		imagedestroy($im);
	}
}
?>