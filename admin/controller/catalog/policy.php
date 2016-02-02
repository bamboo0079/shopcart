<?php
class ControllerCatalogPolicy extends Controller
{
    private $error = array();
    public function index()
    {
        $this->load->language('catalog/policy');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/policy');
        $this->getList();
    }
    public function insert()
    {
        $this->load->language('catalog/policy');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/policy');
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_policy->addpolicy($this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $url                            = '';
            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }
            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }
            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }
            $this->redirect($this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }
        $this->getForm();
    }
    public function update()
    {
        $this->load->language('catalog/policy');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/policy');
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_policy->editpolicy($this->request->get['policy_id'], $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $url                            = '';
            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }
            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }
            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }
            $this->redirect($this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }
        $this->getForm();
    }
    public function delete()
    {
        $this->load->language('catalog/policy');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/policy');
        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $policy_id) {
                $this->model_catalog_policy->deletepolicy($policy_id);
            }
            $this->session->data['success'] = $this->language->get('text_success');
            $url                            = '';
            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }
            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }
            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }
            $this->redirect($this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }
        $this->getList();
    }
    private function getList()
    {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'id.name';
        }
        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        $url = '';
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $this->data['breadcrumbs']   = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );
        $this->data['insert']        = $this->url->link('catalog/policy/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete']        = $this->url->link('catalog/policy/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['policys']       = array();
        $data                        = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );
        $policy_total                = $this->model_catalog_policy->getTotalPolicys();
        $results                     = $this->model_catalog_policy->getPolicys($data);
        foreach ($results as $result) {
            $action                  = array();
            $action[]                = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('catalog/policy/update', 'token=' . $this->session->data['token'] . '&policy_id=' . $result['policy_id'] . $url, 'SSL')
            );
            $this->data['policys'][] = array(
                'policy_id' => $result['policy_id'],
                'name' => $result['name'],
                'category' => $result['category'],
                'sort_order' => $result['sort_order'],
                'status' => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected' => isset($this->request->post['selected']) && in_array($result['policy_id'], $this->request->post['selected']),
                'action' => $action
            );
        }
        $this->data['heading_title']     = $this->language->get('heading_title');
        $this->data['text_no_results']   = $this->language->get('text_no_results');
        $this->data['column_name']       = $this->language->get('column_name');
        $this->data['column_category']   = $this->language->get('column_category');
        $this->data['column_sort_order'] = $this->language->get('column_sort_order');
        $this->data['column_status']     = $this->language->get('column_status');
        $this->data['column_action']     = $this->language->get('column_action');
        $this->data['button_insert']     = $this->language->get('button_insert');
        $this->data['button_delete']     = $this->language->get('button_delete');
        $this->data['categories']        = array(
            '0' => 'Tour ghép đoàn',
            '1' => 'Tour riêng'
        );
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        $url = '';
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $this->data['sort_title']      = $this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . '&sort=id.title' . $url, 'SSL');
        $this->data['sort_sort_order'] = $this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . '&sort=i.sort_order' . $url, 'SSL');
        $url                           = '';
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        $pagination               = new Pagination();
        $pagination->total        = $policy_total;
        $pagination->page         = $page;
        $pagination->limit        = $this->config->get('config_admin_limit');
        $pagination->text         = $this->language->get('text_pagination');
        $pagination->url          = $this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
        $this->data['pagination'] = $pagination->render();
        $this->data['sort']       = $sort;
        $this->data['order']      = $order;
        $this->template           = 'catalog/policy_list.tpl';
        $this->children           = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }
    private function getForm()
    {
        $this->data['heading_title']     = $this->language->get('heading_title');
        $this->data['text_default']      = $this->language->get('text_default');
        $this->data['text_enabled']      = $this->language->get('text_enabled');
        $this->data['text_disabled']     = $this->language->get('text_disabled');
        $this->data['entry_name']        = $this->language->get('entry_name');
        $this->data['entry_description'] = $this->language->get('entry_description');
        $this->data['entry_category']    = $this->language->get('entry_category');
        $this->data['entry_store']       = $this->language->get('entry_store');
        $this->data['entry_keyword']     = $this->language->get('entry_keyword');
        $this->data['entry_sort_order']  = $this->language->get('entry_sort_order');
        $this->data['entry_status']      = $this->language->get('entry_status');
        $this->data['entry_layout']      = $this->language->get('entry_layout');
        $this->data['button_save']       = $this->language->get('button_save');
        $this->data['button_cancel']     = $this->language->get('button_cancel');
        $this->data['tab_general']       = $this->language->get('tab_general');
        $this->data['tab_data']          = $this->language->get('tab_data');
        $this->data['tab_design']        = $this->language->get('tab_design');
        $this->data['token']             = $this->session->data['token'];
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        if (isset($this->error['name'])) {
            $this->data['error_name'] = $this->error['name'];
        } else {
            $this->data['error_name'] = array();
        }
        if (isset($this->error['description'])) {
            $this->data['error_description'] = $this->error['description'];
        } else {
            $this->data['error_description'] = array();
        }
        $url = '';
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $this->data['breadcrumbs']   = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );
        if (!isset($this->request->get['policy_id'])) {
            $this->data['action'] = $this->url->link('catalog/policy/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('catalog/policy/update', 'token=' . $this->session->data['token'] . '&policy_id=' . $this->request->get['policy_id'] . $url, 'SSL');
        }
        $this->data['cancel'] = $this->url->link('catalog/policy', 'token=' . $this->session->data['token'] . $url, 'SSL');
        if (isset($this->request->get['policy_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $policy_info = $this->model_catalog_policy->getpolicy($this->request->get['policy_id']);
        }
        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();
        if (isset($this->request->post['policy_description'])) {
            $this->data['policy_description'] = $this->request->post['policy_description'];
        } elseif (isset($this->request->get['policy_id'])) {
            $this->data['policy_description'] = $this->model_catalog_policy->getpolicyDescriptions($this->request->get['policy_id']);
        } else {
            $this->data['policy_description'] = array();
        }
        $this->data['categories'] = array(
            '0' => 'Tour ghép đoàn',
            '1' => 'Tour riêng'
        );
        if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } elseif (isset($policy_info)) {
            $this->data['status'] = $policy_info['status'];
        } else {
            $this->data['status'] = 1;
        }
        $this->load->model('setting/store');
        $this->data['stores'] = $this->model_setting_store->getStores();
        if (isset($this->request->post['policy_store'])) {
            $this->data['policy_store'] = $this->request->post['policy_store'];
        } elseif (isset($policy_info)) {
            $this->data['policy_store'] = $this->model_catalog_policy->getpolicyStores($this->request->get['policy_id']);
        } else {
            $this->data['policy_store'] = array(
                0
            );
        }
        if (isset($this->request->post['category'])) {
            $this->data['category'] = $this->request->post['category'];
        } elseif (isset($policy_info)) {
            $this->data['category'] = $policy_info['category'];
        } else {
            $this->data['category'] = '';
        }
        if (isset($this->request->post['sort_order'])) {
            $this->data['sort_order'] = $this->request->post['sort_order'];
        } elseif (isset($policy_info)) {
            $this->data['sort_order'] = $policy_info['sort_order'];
        } else {
            $this->data['sort_order'] = '';
        }
        if (isset($this->request->post['policy_layout'])) {
            $this->data['policy_layout'] = $this->request->post['policy_layout'];
        } elseif (isset($policy_info)) {
            $this->data['policy_layout'] = $this->model_catalog_policy->getpolicyLayouts($this->request->get['policy_id']);
        } else {
            $this->data['policy_layout'] = array();
        }
        $this->load->model('design/layout');
        $this->data['layouts'] = $this->model_design_layout->getLayouts();
        $this->template        = 'catalog/policy_form.tpl';
        $this->children        = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }
    private function validateForm()
    {
        if (!$this->user->hasPermission('modify', 'catalog/policy')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        foreach ($this->request->post['policy_description'] as $language_id => $value) {
            if ((strlen(utf8_decode($value['name'])) < 3) || (strlen(utf8_decode($value['name'])) > 255)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }
            if (strlen(utf8_decode($value['description'])) < 3) {
                $this->error['description'][$language_id] = $this->language->get('error_description');
            }
        }
        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    private function validateDelete()
    {
        if (!$this->user->hasPermission('modify', 'catalog/policy')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        $this->load->model('setting/store');
        foreach ($this->request->post['selected'] as $policy_id) {
            if ($this->config->get('config_account_id') == $policy_id) {
                $this->error['warning'] = $this->language->get('error_account');
            }
            if ($this->config->get('config_checkout_id') == $policy_id) {
                $this->error['warning'] = $this->language->get('error_checkout');
            }
            if ($this->config->get('config_affiliate_id') == $policy_id) {
                $this->error['warning'] = $this->language->get('error_affiliate');
            }
        }
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
?>