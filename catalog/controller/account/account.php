<?php
class ControllerAccountAccount extends Controller {
    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->language->load('account/account');
        $this->language->load('account/edit');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        // load data form edit
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/edit', '', 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->document->addScript('catalog/view/javascript/jquery/form-validator/jquery.form-validator.js');

        $this->language->load('account/edit');
        $this->load->model('account/customer');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['attention'])) {
            $this->data['attention'] = $this->error['attention'];
        } else {
            $this->data['attention'] = '';
        }

        if (isset($this->error['firstname'])) {
            $this->data['error_firstname'] = $this->error['firstname'];
        } else {
            $this->data['error_firstname'] = '';
        }

        if (isset($this->error['lastname'])) {
            $this->data['error_lastname'] = $this->error['lastname'];
        } else {
            $this->data['error_lastname'] = '';
        }

        if (isset($this->error['birthday'])) {
            $this->data['error_birthday'] = $this->error['error_birthday'];
        } else {
            $this->data['error_birthday'] = '';
        }

        if (isset($this->error['email'])) {
            $this->data['error_email'] = $this->error['email'];
        } else {
            $this->data['error_email'] = '';
        }

        if (isset($this->error['telephone'])) {
            $this->data['error_telephone'] = $this->error['telephone'];
        } else {
            $this->data['error_telephone'] = '';
        }

        $this->data['action'] = $this->url->link('account/edit', '', 'SSL');

        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
        }

        if (isset($this->request->post['lastname'])) {
            $this->data['lastname'] = $this->request->post['lastname'];
        }elseif (isset($customer_info)) {
            $this->data['lastname'] = $customer_info['lastname'];
        } else {
            $this->data['lastname'] = '';
        }

        if (isset($this->request->post['firstname'])) {
            $this->data['firstname'] = $this->request->post['firstname'];
        }elseif (isset($customer_info)) {
            $this->data['firstname'] = $customer_info['firstname'];
        } else {
            $this->data['firstname'] = '';
        }

        if(isset($customer_info['birthday'])){
            $birthday = explode('-',$customer_info['birthday']);
        }

        if (isset($this->request->post['birthday_day'])) {
            $this->data['birthday_day'] = $this->request->post['birthday_day'];
        }elseif (isset($birthday)) {
            $this->data['birthday_day'] = $birthday[2];
        } else {
            $this->data['birthday_day'] = '';
        }

        if (isset($this->request->post['birthday_month'])) {
            $this->data['birthday_month'] = $this->request->post['birthday_month'];
        }elseif (isset($birthday)) {
            $this->data['birthday_month'] = $birthday[1];
        } else {
            $this->data['birthday_month'] = '';
        }

        if (isset($this->request->post['birthday_year'])) {
            $this->data['birthday_year'] = $this->request->post['birthday_year'];
        }elseif (isset($birthday)) {
            $this->data['birthday_year'] = $birthday[0];
        } else {
            $this->data['birthday_year'] = '';
        }

        if (isset($this->request->post['email'])) {
            $this->data['email'] = $this->request->post['email'];
        } elseif (isset($customer_info)) {
            $this->data['email'] = $customer_info['email'];
        } else {
            $this->data['email'] = '';
        }

        if (isset($this->request->post['telephone'])) {
            $this->data['telephone'] = $this->request->post['telephone'];
        } elseif (isset($customer_info)) {
            $this->data['telephone'] = $customer_info['telephone'];
        } else {
            $this->data['telephone'] = '';
        }

        if (isset($this->request->post['fax'])) {
            $this->data['fax'] = $this->request->post['fax'];
        } elseif (isset($customer_info)) {
            $this->data['fax'] = $customer_info['fax'];
        } else {
            $this->data['fax'] = '';
        }
        //end



        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_account'),
            'href'      => $this->url->link('account/account', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_my_account'] = $this->language->get('text_my_account');
        $this->data['text_my_orders'] = $this->language->get('text_my_orders');
        $this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
        $this->data['text_edit'] = $this->language->get('text_edit');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_address'] = $this->language->get('text_address');
        $this->data['text_wishlist'] = $this->language->get('text_wishlist');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_download'] = $this->language->get('text_download');
        $this->data['text_reward'] = $this->language->get('text_reward');
        $this->data['text_return'] = $this->language->get('text_return');
        $this->data['text_transaction'] = $this->language->get('text_transaction');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['text_recurring'] = $this->language->get('text_recurring');

        $this->data['edit'] = $this->url->link('account/account', '', 'SSL');
        $this->data['password'] = $this->url->link('account/password', '', 'SSL');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['return'] = $this->url->link('account/return', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

        $this->data['text_your_details'] = $this->language->get('text_your_details');

        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_birthday'] = $this->language->get('entry_birthday');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_fax'] = $this->language->get('entry_fax');
        $this->data['entry_update'] = $this->language->get('entry_update');

        $this->data['text_placeholder_lastname'] = $this->language->get('text_placeholder_lastname');
        $this->data['text_placeholder_firstname'] = $this->language->get('text_placeholder_firstname');
        $this->data['text_placeholder_birthday'] = $this->language->get('text_placeholder_birthday');
        $this->data['text_placeholder_email'] = $this->language->get('text_placeholder_email');
        $this->data['text_placeholder_telephone'] = $this->language->get('text_placeholder_telephone');
        $this->data['text_placeholder_fax'] = $this->language->get('text_placeholder_fax');

        $this->data['lang_error_lastname'] = $this->language->get('error_lastname');
        $this->data['lang_error_firstname'] = $this->language->get('error_firstname');
        $this->data['lang_error_birthday_day'] = $this->language->get('error_birthday_day');
        $this->data['lang_error_birthday_month'] = $this->language->get('error_birthday_month');
        $this->data['lang_error_birthday_year'] = $this->language->get('error_birthday_year');
        $this->data['lang_error_email'] = $this->language->get('error_email');
        $this->data['lang_error_telephone'] = $this->language->get('error_telephone');

        $this->data['text_day'] = $this->language->get('text_day');
        $this->data['text_month'] = $this->language->get('text_month');
        $this->data['text_year'] = $this->language->get('text_year');

        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_back'] = $this->language->get('button_back');
        $this->data['entry_update'] = $this->language->get('entry_update');
        $this->data['active'] = 'account';

        if ($this->config->get('reward_status')) {
            $this->data['reward'] = $this->url->link('account/reward', '', 'SSL');
        } else {
            $this->data['reward'] = '';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/account.tpl';
        } else {
            $this->template = 'default/template/account/account.tpl';
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