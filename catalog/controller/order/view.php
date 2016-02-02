<?php
class ControllerOrderView extends Controller {
    public function invoice() {

        $this->load->model('catalog/product');

        $this->load->model('checkout/order');

        $this->load->model('account/order');

        $this->load->model('tool/image');

        $this->language->load('error/not_found');

        $this->language->load('order/invoice');

        if (isset($this->request->get['order_id'])) {
            $order_id = (int)$this->encryption->decrypt($this->request->get['order_id']);
        } else {
            $order_id = 0;
        }
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
        $array_allow_status_id = array(5);
        $order_info = $this->model_checkout_order->getOrder($order_id);
//        print_r(in_array($order_info['order_status_id'],$array_allow_status_id)); exit;
        if(isset($this->request->get['status']) && $this->request->get['status']==1){
            $status = $this->request->get['status'];
        }elseif(in_array($order_info['order_status_id'],$array_allow_status_id)){
            $status = in_array($order_info['order_status_id'],$array_allow_status_id);
        }
        if($order_info && $status){
            //Text
            $heading_title = $order_info['order_id']." - Khách hàng: ".$order_info['lastname']." ".$order_info['firstname']." | Viet Fun Travel";
             $heading_title_print = "Viet Fun Travel Đơn hàng ".$order_info['order_id'];
            $this->data['heading_title_print'] = unicode($heading_title_print);
            $this->data['heading_title_text'] = sprintf($this->language->get('heading_title_text'),$heading_title);
            $this->data['title']      = $this->language->get('title');
            $this->data['title_welcome']      = $this->language->get('title_welcome');

            $this->data['text_customer_info']     = $this->language->get('text_customer_info');
            $this->data['text_company_info']     = $this->language->get('text_company_info');

            $this->data['text_customer']     = $this->language->get('text_customer');
            $this->data['text_telephone']     = $this->language->get('text_telephone');
            $this->data['text_email']     = $this->language->get('text_email');
            $this->data['text_address']     = $this->language->get('text_address');
            $this->data['text_represent']     = $this->language->get('text_represent');
            $this->data['text_website']     = $this->language->get('text_website');
            $this->data['text_date']     = $this->language->get('text_date');
            $this->data['text_content']     = $this->language->get('text_content');
            $this->data['text_quality']     = $this->language->get('text_quality');
            $this->data['text_price']     = $this->language->get('text_price');
            $this->data['text_website_company']     = $this->language->get('text_website_company');

            $this->data['text_included']     = $this->language->get('text_included');
            $this->data['text_notincluded']  = $this->language->get('text_notincluded');

            $this->data['text_total']     = $this->language->get('text_total');
            $this->data['text_total_number']     = $this->language->get('text_total_number');
            $this->data['text_sub_total']     = $this->language->get('text_sub_total');
            $this->data['text_promotion_total']     = $this->language->get('text_promotion_total');
            $this->data['text_deposit']     = $this->language->get('text_deposit');
            $this->data['text_balance']     = $this->language->get('text_balance');
            $this->data['text_note']     = $this->language->get('text_note');

            $this->data['text_signature']     = $this->language->get('text_signature');
            $this->data['text_print']     = $this->language->get('text_print');
            $this->data['text_pdf']     = $this->language->get('text_pdf');
            $this->data['text_home']     = $this->language->get('text_home');

            //data
            $this->data['header']          = html_entity_decode($this->config->get('header_site'), ENT_QUOTES, 'UTF-8');
            $this->data['footer']          = html_entity_decode($this->config->get('footer_site'), ENT_QUOTES, 'UTF-8');

            $this->data['customer']	= array(
                'customer_id'	=>	$order_info['customer_id'],
                'customer_name'	=>	$order_info['lastname'].' '.$order_info['firstname'],
                'telephone'		=>	$order_info['telephone'],
                'email'			=>	$order_info['email'],
                'address'	    =>	$order_info['payment_address_1'].' - '.$order_info['payment_zone'].' - '.$order_info['payment_country']
            );

            $this->data['text_date_hcm'] = sprintf($this->language->get('text_date_hcm'),date('d', time()),date('m', time()),date('Y', time()));

            $this->data['payment_method'] = $order_info['payment_method'];
            $this->data['comment']      = $order_info['comment'];

            $this->data['products'] = array();

            $products = $this->model_account_order->getOrderProducts($order_id);
            foreach ($products as $product) {
                $option_data = array();

                $options = $this->model_account_order->getOrderOptions($order_id, $product['order_product_id']);

                foreach ($options as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }

                    $option_data[] = array(
                        'name'  => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
                        'type'  => $option['type']
                    );
                }
                $result = $this->model_catalog_product->getProduct($product['product_id']);
                if(isset($result['custom_link'])){
                    $custom_link = '&path=' . $result['custom_link'];
                }
                $this->data['products'][] = array(
                    'name'     => $product['name'],
                    'model'    => $product['model'],
                    'option'   => $option_data,
                    'quantity' => $product['quantity'],
                    'included' => $this->replace_tag(html_entity_decode($product['included'], ENT_QUOTES, 'UTF-8')),
                    'notincluded' => $this->replace_tag(html_entity_decode($product['notincluded'], ENT_QUOTES, 'UTF-8')),
                    'href'      => $this->url->link('product/product', $custom_link . '&product_id=' . $product['product_id']),
                    'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                    'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
                );
            }
            //Total
            $promotion_total = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . $order_id . "'")->rows;
            $total_promo = $sub_total = 0;
            foreach($promotion_total as $item){

                if($item['code'] == 'sub_person'){
                    $total_promo += $item['value'];
                }

                if($item['code'] == 'sub_child'){
                    $total_promo += $item['value'];
                }

                if($item['code'] == 'sub_total'){
                    $sub_total += $item['value'];
                }

            }

            $totalsaleoff = $this->model_account_order->getPriceOrderSaleOff($order_id);
            if($totalsaleoff){
                $this->data['promotion_total']      = $totalsaleoff['saleoff'];
                $this->data['format_promotion_total']      = $this->currency->format($totalsaleoff['saleoff']);
                $this->data['total']      = $this->currency->format($totalsaleoff['total_saleoff']);
                $this->data['total_text'] = floor($totalsaleoff['total_saleoff']);
            }else{
                $this->data['promotion_total']      = $total_promo; 
                $this->data['format_promotion_total']      = $this->currency->format($total_promo);
                $this->data['total']      = $this->currency->format($order_info['total']);
                $this->data['total_text'] = floor($order_info['total']);
            }
            $this->data['sub_total']      = $this->currency->format($sub_total);            

            //end
            $this->data['order_deposite'] = array();
            $order_deposite = $this->model_account_order->getOrderDeposit($order_id);
            if($order_deposite){
                $this->data['order_deposite'] = array(
                    'deposit'			=>	$order_deposite['deposit'],
                    'format_deposit'	=>	$this->currency->format($order_deposite['deposit']),
                    'balance'			=>	$order_deposite['balance'],
                    'format_balance'	=>	$this->currency->format($order_deposite['balance']),
                    'note'				=>	$order_deposite['note']
                );
                $this->data['total_order_deposite_deposit'] = floor($order_deposite['deposit']);
                $this->data['total_order_deposite_balance'] = floor($order_deposite['balance']);
            }
            $username = 'administrator';
            $not_get = array('admin','administrator');
            $order_log = $this->model_account_order->getOrderLogs($order_id);
            if($order_log){
                $order_log = array_shift($order_log);
                if(!in_array($order_log['user'],$not_get)){
                    $username = $order_log['user'];
                }
            }
            $this->data['user'] = array();
            $user_info = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE username = '" . $username . "'")->row;
            if($user_info){
                $this->data['user'] = array(
                    'id'		=>	$user_info['user_id'],
                    'name'		=>	$user_info['firstname'] . ' ' . $user_info['lastname'],
                    'email'		=>	$user_info['email'],
                    'phone'		=>	$user_info['phone'],
                    'image'		=>	$this->model_tool_image->resize($user_info['image'], 170, 100)
                );
            }
            $this->data['thumb_vf']   = $this->model_tool_image->resize('data/dulichvietvui.png', 170, 170);
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/order/invoice.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/order/invoice.tpl';
            } else {
                $this->template = 'default/template/product/invoice.tpl';
            }

            $this->response->setOutput($this->render());

        }else{
            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_error'),
                'href'      => $this->url->link('error/not_found'),
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

    public function confirm() {

        $this->load->model('catalog/product');

        $this->load->model('checkout/order');

        $this->load->model('account/order');

        $this->load->model('tool/image');

        $this->language->load('error/not_found');

        $this->language->load('order/confirm');

        if (isset($this->request->get['order_id'])) {
            $order_id = (int)$this->encryption->decrypt($this->request->get['order_id']);
        } else {
            $order_id = 0;
        }
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
        $array_allow_status_id = array(5);
        $order_info = $this->model_checkout_order->getOrder($order_id);
        //var_dump($order_info);
        if($order_info && in_array($order_info['order_status_id'],$array_allow_status_id)){
            //Text
            $this->data['heading_title'] = sprintf($this->language->get('heading_title'),$order_info['order_id']);

            $this->data['title']      	= $this->language->get('title');
            $this->data['title_welcome']      = $this->language->get('title_welcome');

            $this->data['text_customer_info']     = $this->language->get('text_customer_info');
            $this->data['text_booking_info']     = $this->language->get('text_booking_info');

            $this->data['text_customer']     = $this->language->get('text_customer');
            $this->data['text_telephone']     = $this->language->get('text_telephone');
            $this->data['text_email']     = $this->language->get('text_email');
            $this->data['text_address']     = $this->language->get('text_address');
            $this->data['text_represent']     = $this->language->get('text_represent');
            $this->data['text_website']     = $this->language->get('text_website');
            $this->data['text_booking_date']     = $this->language->get('text_booking_date');
            $this->data['text_payment_method']     = $this->language->get('text_payment_method');
            $this->data['text_website_company']     = $this->language->get('text_website_company');

            $this->data['text_duration']     = $this->language->get('text_duration');
            $this->data['text_start_time']     = $this->language->get('text_start_time');
            $this->data['text_meeting']     = $this->language->get('text_meeting');

            $this->data['text_included']     = $this->language->get('text_included');
            $this->data['text_notincluded']  = $this->language->get('text_notincluded');
            $this->data['text_terms']  = $this->language->get('text_terms');
            $this->data['text_notice']  = $this->language->get('text_notice');

            $this->data['text_print']     = $this->language->get('text_print');
            $this->data['text_pdf']     = $this->language->get('text_pdf');
            $this->data['text_home']     = $this->language->get('text_home');

            //data
            $this->data['header']          = html_entity_decode($this->config->get('header_site'), ENT_QUOTES, 'UTF-8');
            $this->data['footer']          = html_entity_decode($this->config->get('footer_site'), ENT_QUOTES, 'UTF-8');
            $this->data['notice']          = html_entity_decode($this->config->get('notice_site'), ENT_QUOTES, 'UTF-8');

            $this->data['customer']	= array(
                'customer_id'	=>	$order_info['customer_id'],
                'customer_name'	=>	$order_info['lastname'].' '.$order_info['firstname'],
                'telephone'		=>	$order_info['telephone'],
                'email'			=>	$order_info['email'],
                'address'			=>	$order_info['payment_address_1'].' - '.$order_info['payment_zone'].' - '.$order_info['payment_country']
            );

            $this->data['payment_method']      = $order_info['payment_method'];
            $this->data['date_added']      = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
            $this->data['comment']      = $order_info['comment'];

            $this->data['products'] = array();

            $products = $this->model_account_order->getOrderProducts($order_id);

            foreach ($products as $product) {
                $option_data = array();

                $options = $this->model_account_order->getOrderOptions($order_id, $product['order_product_id']);

                foreach ($options as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }

                    $option_data[] = array(
                        'name'  => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
                        'type'  => $option['type']
                    );
                }
                $result = $this->model_catalog_product->getProduct($product['product_id']);
                if(isset($result['custom_link'])){
                    $custom_link = '&path=' . $result['custom_link'];
                }
                $this->data['products'][] = array(
                    'name'     => $product['name'],
                    'model'    => $product['model'],
                    'option'   => $option_data,
                    'quantity' => $product['quantity'],
                    'duration' => $product['duration'],
                    'start_time' => $product['start_time'],
                    'meeting' => $product['meeting']?$product['meeting']:'28/13 Bùi Viện, P.Phạm Ngũ Lão, Q.1, Tp.HCM',
                    'included' => preg_replace('/(<[^>]+) style=".*?"/i', '$1', strip_tags(html_entity_decode($product['included'], ENT_QUOTES, 'UTF-8'), '<li><a><b><strong><i><u>')),
                    'notincluded' => preg_replace('/(<[^>]+) style=".*?"/i', '$1', strip_tags(html_entity_decode($product['notincluded'], ENT_QUOTES, 'UTF-8'), '<li><a><b><strong><i><u>')),
                    'terms' => preg_replace('/(<[^>]+) style=".*?"/i', '$1', strip_tags(html_entity_decode($product['terms'], ENT_QUOTES, 'UTF-8'), '<li><a><b><strong><i><u>')),
                    'href'      => $this->url->link('product/product', $custom_link . '&product_id=' . $product['product_id']),
                    'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                    'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
                );
            }

            $this->data['thumb_vf']   = $this->model_tool_image->resize('data/dulichvietvui.png', 170, 170);
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/order/confirm.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/order/confirm.tpl';
            } else {
                $this->template = 'default/template/product/confirm.tpl';
            }

            $this->response->setOutput($this->render());

        }else{

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_error'),
                'href'      => $this->url->link('error/not_found'),
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
    public function replace_tag($e)
    {
        $e = preg_replace('/[<]font [^>]*[>]/', '', $e);
        //$e = preg_replace('/[<]li style="*"[^>]*[>]/','', $e);
        $e = preg_replace('/[<]span style="font-size(.*?)"[^>]*[>]/', '', $e);
        $e = preg_replace('/[<]span style="font-family(.*?)"[^>]*[>]/', '', $e);
        $e = preg_replace('/[<]span style="outline: none; font-family(.*?)"[^>]*[>]/', '', $e);
        $e = preg_replace('/[<]br[^>]*[>]/', '', $e);
        $e = preg_replace('/<(p|div)>(\s|&nbsp;)*<\/\1>/', '', $e);
        //$e = preg_replace('/(<[span>]+) style=".*?"/i', '$1', $e);
        return $e;
    }
}
?>