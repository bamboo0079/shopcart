<?php
class ControllerOrderCheck extends Controller{
    public function index(){
        $this->language->load('order/check');
        $this->load->model('checkout/order');
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            if ((utf8_strlen($this->request->post['phone']) < 9) || (utf8_strlen($this->request->post['phone']) > 11)) {
                $this->error['order_phone'] = $this->language->get('error_phone');
            }
            if(!$this->error){
                $result = $this->model_checkout_order->checkorder($this->request->post['order_code'],str_replace(' ','',$this->request->post['phone']));
                if(!empty($result)){
                    $this->redirect($this->url->link('order/view/invoice','order_id='.$this->encryption->encrypt(str_replace(' ','',$this->request->post['order_code'])).'&status=1'));
                }else{

                   $this->data['breadcrumbs'][] = array(
                        'text'      => $this->language->get('text_error'),
                        'href'      => $this->url->link('error/not_found'),
                        'separator' => $this->language->get('text_separator')
                    );
                    $this->document->setTitle($this->language->get('text_errors'));

                    $this->data['heading_title'] = $this->language->get('heading_title');

                    $this->data['text_error'] = $this->language->get('text_errors');

                    $this->data['button_continue'] = $this->language->get('button_continue');
                    
                    $this->data['continue'] = $this->url->link('common/home');

                    if(file_exists(DIR_TEMPLATE . $this->config->get('config_template'). '/template/error/not_found.tpl')){
                        $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
                    }else{
                        $this->template = '/template/error/not_found.tpl';
                    }
                    $this->children = array(
                        'common/content_top',
                        'common/content_bottom',
                        'common/footer',
                        'common/header'
                    );
                    $this->response->setOutput($this->render());
                }
                // end
            }else{
               $this->data['breadcrumbs'][] = array(
                    'text'      => $this->language->get('text_error'),
                    'href'      => $this->url->link('error/not_found'),
                    'separator' => $this->language->get('text_separator')
                );

                $this->document->setTitle($this->language->get('text_errors'));

                $this->data['heading_title'] = $this->language->get('text_errors');

                $this->data['text_error'] = $this->language->get('text_errors');

                $this->data['button_continue'] = $this->language->get('button_continue');

                $this->data['continue'] = $this->url->link('common/home');

                $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                    $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
                } else {
                    $this->template = 'default/template/error/not_found.tpl';
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


    }

}
?>