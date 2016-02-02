<?php
class ControllerAccountPassword extends Controller {
    private $error = array();

    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/password', '', 'SSL');
            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }
        $this->language->load('account/password');
        $this->language->load('account/account');
        $this->load->model('account/customer');
        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->load->model('account/customer');

            $this->model_account_customer->editPassword($this->customer->getEmail(), $this->request->post['password']);

            $this->session->data['success'] = $this->language->get('text_success');


            $this->redirect($this->url->link('account/password', '', 'SSL'));
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
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('account/password', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );


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
        $this->data['text_wishlist'] = $this->language->get('text_wishlist');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_download'] = $this->language->get('text_download');
        $this->data['text_reward'] = $this->language->get('text_reward');
        $this->data['text_return'] = $this->language->get('text_return');
        $this->data['text_transaction'] = $this->language->get('text_transaction');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['text_recurring'] = $this->language->get('text_recurring');
        $this->data['entry_update'] = $this->language->get('entry_update');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_password'] = $this->language->get('text_password');

        $this->data['entry_password'] = $this->language->get('entry_password');
        $this->data['entry_password_old'] = $this->language->get('entry_password_old');
        $this->data['entry_confirm'] = $this->language->get('entry_confirm');

        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_back'] = $this->language->get('button_back');

        if (isset($this->error['password'])) {
            $this->data['error_password'] = $this->error['password'];
        } else {
            $this->data['error_password'] = '';
        }

        if (isset($this->error['confirm'])) {
            $this->data['error_confirm'] = $this->error['confirm'];
        } else {
            $this->data['error_confirm'] = '';
        }
        if (isset($this->error['password_old'])) {
            $this->data['error_password_old'] = $this->error['error_password_old'];
        } else {
            $this->data['error_password_old'] = '';
        }

        $this->data['action'] = $this->url->link('account/password', '', 'SSL');

        if (isset($this->request->post['password'])) {
            $this->data['password'] = $this->request->post['password'];
        } else {
            $this->data['password'] = '';
        }

        if (isset($this->request->post['confirm'])) {
            $this->data['confirm'] = $this->request->post['confirm'];
        } else {
            $this->data['confirm'] = '';
        }

        $this->data['back'] = $this->url->link('account/account', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/password.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/password.tpl';
        } else {
            $this->template = 'default/template/account/password.tpl';
        }
        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        $this->data['active'] = 'password';
        $this->children = array(
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

    protected function validate() {
        $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
        $sal_sql = $customer_info['salt'];
        $pass = $this->db->escape(sha1($sal_sql . sha1($sal_sql . sha1($this->request->post['password_old']))));
        if($pass != $customer_info['password']){
            $this->error['password_old'] = $this->language->get('error_password_old');
            $this->language->get('error_password_old');
        }
        if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
            $this->error['password'] = $this->language->get('error_password');
        }

        if ($this->request->post['confirm'] != $this->request->post['password']) {
            $this->error['confirm'] = $this->language->get('error_confirm');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
?>
