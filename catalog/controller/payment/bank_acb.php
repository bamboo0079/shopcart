<?php
class ControllerPaymentBankAcb extends Controller {
	protected function index() {
		$this->language->load('payment/bank_acb');

		$this->data['text_instruction'] = $this->language->get('text_instruction');
		$this->data['text_description'] = $this->language->get('text_description');
		$this->data['text_payment'] = $this->language->get('text_payment');

		$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['bank'] = html_entity_decode($this->config->get('bank_acb_bank_' . $this->config->get('config_language_id')), ENT_QUOTES, 'UTF-8');

		$this->data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/bank_acb.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/bank_acb.tpl';
		} else {
			$this->template = 'default/template/payment/bank_acb.tpl';
		}	

		$this->render(); 
	}

	public function confirm() {
		$this->language->load('payment/bank_acb');

		$this->load->model('checkout/order');

		$comment = html_entity_decode($this->config->get('bank_acb_bank_' . $this->config->get('config_language_id')), ENT_QUOTES, 'UTF-8');

		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('bank_acb_order_status_id'), $comment, true);
	}
}
?>