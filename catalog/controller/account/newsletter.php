<?php
class ControllerAccountNewsletter extends Controller {
    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/newsletter', '', 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->language->load('account/newsletter');
        $this->language->load('account/account');
        $this->load->model('account/customer');

//        $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
        $customer_newsletter = $this->model_account_customer->getCustomer($this->customer->getId());
        $this->data['radio'] = $customer_newsletter['newsletter'];

        $this->document->setTitle($this->language->get('heading_title'));

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->model_account_customer->editNewsletter($this->request->post['newsletter']);
            if($this->request->post['newsletter'] == 0){
                $this->session->data['success'] = $this->language->get('text_success_un');
            }else{
                $this->session->data['success'] = $this->language->get('text_success');
            }

            $this->redirect($this->url->link('account/newsletter', '', 'SSL'));
        }
        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_account'),
            'href'      => $this->url->link('account/account', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_newsletter'),
            'href'      => $this->url->link('account/newsletter', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');

        $this->data['entry_newsletter'] = $this->language->get('entry_newsletter');

        $this->data['text_update'] = $this->language->get('text_update');
        $this->data['button_back'] = $this->language->get('button_back');

        $this->data['action'] = $this->url->link('account/newsletter', '', 'SSL');

        $this->data['newsletter'] = $this->customer->getNewsletter();

        $this->data['back'] = $this->url->link('account/account', '', 'SSL');

        $this->data['edit'] = $this->url->link('account/account', '', 'SSL');
        $this->data['password'] = $this->url->link('account/password', '', 'SSL');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['return'] = $this->url->link('account/return', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

        $this->data['text_my_account'] = $this->language->get('text_my_account');
        $this->data['text_my_orders'] = $this->language->get('text_my_orders');
        $this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
        $this->data['text_edit'] = $this->language->get('text_edit');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_address'] = $this->language->get('text_address');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['entry_update'] = $this->language->get('entry_update');
        $this->data['active'] = 'newsletter';

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/newsletter.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/newsletter.tpl';
        } else {
            $this->template = 'default/template/account/newsletter.tpl';
        }

        $this->children = array(
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }
}
?>