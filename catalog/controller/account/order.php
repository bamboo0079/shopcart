<?php
class ControllerAccountOrder extends Controller {
    private $error = array();

    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/order', '', 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->language->load('account/order');
        $this->language->load('account/account');

        $this->load->model('account/order');

        if (isset($this->request->get['order_id'])) {
            $order_info = $this->model_account_order->getOrder($this->request->get['order_id']);

            if ($order_info) {
                $order_products = $this->model_account_order->getOrderProducts($this->request->get['order_id']);

                foreach ($order_products as $order_product) {
                    $option_data = array();

                    $order_options = $this->model_account_order->getOrderOptions($this->request->get['order_id'], $order_product['order_product_id']);

                    foreach ($order_options as $order_option) {
                        if ($order_option['type'] == 'select' || $order_option['type'] == 'radio') {
                            $option_data[$order_option['product_option_id']] = $order_option['product_option_value_id'];
                        } elseif ($order_option['type'] == 'checkbox') {
                            $option_data[$order_option['product_option_id']][] = $order_option['product_option_value_id'];
                        } elseif ($order_option['type'] == 'text' || $order_option['type'] == 'textarea' || $order_option['type'] == 'date' || $order_option['type'] == 'datetime' || $order_option['type'] == 'time') {
                            $option_data[$order_option['product_option_id']] = $order_option['value'];
                        } elseif ($order_option['type'] == 'file') {
                            $option_data[$order_option['product_option_id']] = $this->encryption->encrypt($order_option['value']);
                        }
                    }

                    $this->session->data['success'] = sprintf($this->language->get('text_success'), $this->request->get['order_id']);

                    $this->cart->add($order_product['product_id'], $order_product['quantity'], $option_data);
                }

                $this->redirect($this->url->link('checkout/cart'));
            }
        }

        $this->document->setTitle($this->language->get('heading_title'));

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

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('account/order', $url, 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_order_id'] = $this->language->get('text_order_id');
        $this->data['text_status'] = $this->language->get('text_status');
        $this->data['text_date_added'] = $this->language->get('text_date_added');
        $this->data['text_customer'] = $this->language->get('text_customer');
        $this->data['text_quantity'] = $this->language->get('text_quantity');
        $this->data['text_products'] = $this->language->get('text_products');
        $this->data['text_total'] = $this->language->get('text_total');
        $this->data['text_empty'] = $this->language->get('text_empty');

        $this->data['button_view'] = $this->language->get('button_view');
        $this->data['button_reorder'] = $this->language->get('button_reorder');
        $this->data['button_back'] = $this->language->get('button_back');

        $this->data['text_my_account'] = $this->language->get('text_my_account');
        $this->data['text_my_orders'] = $this->language->get('text_my_orders');
        $this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
        $this->data['text_edit'] = $this->language->get('text_edit');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_address'] = $this->language->get('text_address');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');

        $this->data['edit'] = $this->url->link('account/account', '', 'SSL');
        $this->data['password'] = $this->url->link('account/password', '', 'SSL');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['return'] = $this->url->link('account/return', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
        $this->data['active'] = 'order';

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $this->data['orders'] = array();

        $order_total = $this->model_account_order->getTotalOrders();

        $results = $this->model_account_order->getOrders(($page - 1) * 10, 10);
        $this->load->model('event/event');
        foreach ($results as $result) {
            $product_total = $this->model_account_order->getTotalOrderProductsByOrderId($result['order_id']);
            $voucher_total = $this->model_account_order->getTotalOrderVouchersByOrderId($result['order_id']);
            $saleoff       = $this->model_event_event->getEventSaleOff($result['order_id']);
            $this->data['totals'] = $this->model_account_order->getOrderTotals($result['order_id']); /*lay gia da giam coder by tranminh*/
            $this->data['orders'][] = array(
                'order_id'   => $result['order_id'],
                'name'       => $result['lastname'] . ' ' . $result['firstname'],
                'status_id'  => $result['order_status_id'],
                'status'     => $result['status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'products'   => ($product_total + $voucher_total),
                'total_event'=> $this->currency->format($saleoff['total_saleoff']),/*gia da giam trong event coder by tranminh*/
                'total'      => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
                'href'       => $this->url->link('account/order/info', 'order_id=' . $result['order_id'], 'SSL'),
                'reorder'    => $this->url->link('account/order', 'order_id=' . $result['order_id'], 'SSL')
            );
        }
        $pagination = new Pagination();
        $pagination->total = $order_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('account/order', 'page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['back'] = $this->url->link('account/account', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/order_list.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/order_list.tpl';
        } else {
            $this->template = 'default/template/account/order_list.tpl';
        }

        $this->children = array(
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

    public function info() {

        $this->data['active'] = 'order';
        $this->load->model('catalog/product');
        $this->language->load('account/order');
        $this->language->load('account/account');

        if (isset($this->request->get['order_id'])) {
            $order_id = $this->request->get['order_id'];
        } else {
            $order_id = 0;
        }

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/order/info', 'order_id=' . $order_id, 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->load->model('account/order');

        $order_info = $this->model_account_order->getOrder($order_id);

        if ($order_info) {
            $this->data['order_info'] = $order_info;

            $this->document->setTitle($this->language->get('text_order'));

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

            $url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('heading_title'),
                'href'      => $this->url->link('account/order', $url, 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_order'),
                'href'      => $this->url->link('account/order/info', 'order_id=' . $this->request->get['order_id'] . $url, 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['heading_title'] = $this->language->get('text_order');

            $this->data['text_order_detail'] = $this->language->get('text_order_detail');
            $this->data['text_invoice_no'] = $this->language->get('text_invoice_no');
            $this->data['text_order_id'] = $this->language->get('text_order_id');
            $this->data['text_date_added'] = $this->language->get('text_date_added');
            $this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
            $this->data['text_shipping_address'] = $this->language->get('text_shipping_address');
            $this->data['text_payment_method'] = $this->language->get('text_payment_method');
            $this->data['text_payment_address'] = $this->language->get('text_payment_address');
            $this->data['text_history'] = $this->language->get('text_history');
            $this->data['text_comment'] = $this->language->get('text_comment');

            $this->data['text_invoice'] = $this->language->get('text_invoice');
            $this->data['text_confirm'] = $this->language->get('text_confirm');
            $this->data['text_info_order'] = $this->language->get('text_info_order');
            $this->data['text_info_customer'] = $this->language->get('text_info_customer');
            $this->data['entry_name_customer'] = $this->language->get('entry_name_customer');
            $this->data['entry_email'] = $this->language->get('entry_email');
            $this->data['entry_telephone'] = $this->language->get('entry_telephone');

            $this->data['column_name'] = $this->language->get('column_name');
            $this->data['column_model'] = $this->language->get('column_model');
            $this->data['column_quantity'] = $this->language->get('column_quantity');
            $this->data['column_price'] = $this->language->get('column_price');
            $this->data['column_total'] = $this->language->get('column_total');
            $this->data['column_action'] = $this->language->get('column_action');
            $this->data['column_date_added'] = $this->language->get('column_date_added');
            $this->data['column_status'] = $this->language->get('column_status');
            $this->data['column_comment'] = $this->language->get('column_comment');

            $this->data['button_return'] = $this->language->get('button_return');
            $this->data['button_continue'] = $this->language->get('button_continue');

            $this->data['text_my_account'] = $this->language->get('text_my_account');
            $this->data['text_my_orders'] = $this->language->get('text_my_orders');
            $this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
            $this->data['text_edit'] = $this->language->get('text_edit');
            $this->data['text_password'] = $this->language->get('text_password');
            $this->data['text_address'] = $this->language->get('text_address');
            $this->data['text_order'] = $this->language->get('text_order');
            $this->data['text_newsletter'] = $this->language->get('text_newsletter');

            $this->data['edit'] = $this->url->link('account/account', '', 'SSL');
            $this->data['password'] = $this->url->link('account/password', '', 'SSL');
            $this->data['order'] = $this->url->link('account/order', '', 'SSL');
            $this->data['return'] = $this->url->link('account/return', '', 'SSL');
            $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

            if ($order_info['invoice_no']) {
                $this->data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
            } else {
                $this->data['invoice_no'] = '';
            }

            $this->data['order_id'] = $this->request->get['order_id'];
            $this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));

            if ($order_info['payment_address_format']) {
                $format = $order_info['payment_address_format'];
            } else {
                $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
            }

            $find = array(
                '{firstname}',
                '{lastname}',
                '{company}',
                '{address_1}',
                '{address_2}',
                '{city}',
                '{postcode}',
                '{zone}',
                '{zone_code}',
                '{country}'
            );

            $replace = array(
                'firstname' => $order_info['payment_firstname'],
                'lastname'  => $order_info['payment_lastname'],
                'company'   => $order_info['payment_company'],
                'address_1' => $order_info['payment_address_1'],
                'address_2' => $order_info['payment_address_2'],
                'city'      => $order_info['payment_city'],
                'postcode'  => $order_info['payment_postcode'],
                'zone'      => $order_info['payment_zone'],
                'zone_code' => $order_info['payment_zone_code'],
                'country'   => $order_info['payment_country']
            );

            $this->data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

            $this->data['payment_method'] = $order_info['payment_method'];

            if ($order_info['shipping_address_format']) {
                $format = $order_info['shipping_address_format'];
            } else {
                $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
            }

            $find = array(
                '{firstname}',
                '{lastname}',
                '{company}',
                '{address_1}',
                '{address_2}',
                '{city}',
                '{postcode}',
                '{zone}',
                '{zone_code}',
                '{country}'
            );

            $replace = array(
                'firstname' => $order_info['shipping_firstname'],
                'lastname'  => $order_info['shipping_lastname'],
                'company'   => $order_info['shipping_company'],
                'address_1' => $order_info['shipping_address_1'],
                'address_2' => $order_info['shipping_address_2'],
                'city'      => $order_info['shipping_city'],
                'postcode'  => $order_info['shipping_postcode'],
                'zone'      => $order_info['shipping_zone'],
                'zone_code' => $order_info['shipping_zone_code'],
                'country'   => $order_info['shipping_country']
            );

            $this->data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

            $this->data['shipping_method'] = $order_info['shipping_method'];

            //
            $this->data['name_customer'] = $order_info['lastname'].' '. $order_info['firstname'];
            $this->data['link_invoice'] = '/order/view/invoice'.'?order_id=' . $this->encryption->encrypt($order_info['order_id']);
            $this->data['link_confirm'] = '/order/view/confirm'.'?order_id=' . $this->encryption->encrypt($order_info['order_id']);

            //var_dump($order_info);

            $this->data['products'] = array();

            $products = $this->model_account_order->getOrderProducts($this->request->get['order_id']);
            /*start -- config lai bang gia cho order info by coder tranminh*/
           /* $price_thuong = 0;
            $price_sales = 0;
            $price_thuong_cu = '';
            $price_sales_cu = '';*/
            foreach ($products as $product) {
                $option_data = array();

                $options = $this->model_account_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);
                $product_option_value_id = 0;
                foreach ($options as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }
                    /*if (preg_match("/người(\s)lớn/i", $option['name'])) {
                        $adults = '1';
                        $product_option_value_id = $option['product_option_value_id'];
                        $price_chua_salesoff = $this->model_catalog_product->getproductoptionvaluebyid($product_option_value_id)['price'];
                    } else {
                        $adults = '0';
                    }*//* code cu xet option nguoi lon va lay gia goc*/
                    $option_data[] = array(
                        'name'  => $option['name'],
                       /* 'adults'=> $adults,*/
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

                $result = $this->model_catalog_product->getProduct($product['product_id']);
                if(isset($result['custom_link'])){
                    $custom_link = '&path=' . $result['custom_link'];
                }
                /*$total_chua_salesoff = 0;
                $date = explode('/',$option_data[0]['value']);
                if(($option_data[1]['adults'] == 1 && $this->cart->filtertour($product['product_id']) == 0 ) || ($option_data[1]['adults'] == 1 && $this->cart->filtertour($product['product_id']) == 1)){   
                    if(strtotime($date[1].'/'.$date[0].'/'.$date[2]) >= strtotime('12/23/2015') && strtotime($date[1].'/'.$date[0].'/'.$date[2]) <= strtotime('01/03/2016')){  
                        $price_sales += ($price_chua_salesoff - $product['price'])*$product['quantity'];
                        $price_thuong += $price_chua_salesoff*$product['quantity'];
                        $total_chua_salesoff = $price_chua_salesoff*$product['quantity'];
                    }else{
                        $price_thuong += $price_chua_salesoff*$product['quantity'];
                        $total_chua_salesoff = $price_chua_salesoff*$product['quantity'];
                    }
                }elseif(($option_data[1]['adults'] == 1 && $this->cart->filtertour($product['product_id']) != 0 ) || ($option_data[1]['adults'] == 1 && $this->cart->filtertour($product['product_id']) != 1)){
                    $price_thuong += $price_chua_salesoff*$product['quantity'];
                    $total_chua_salesoff = $price_chua_salesoff*$product['quantity'];
                }else{
                    $price_thuong += $product['price']*$product['quantity'];
                    $price_chua_salesoff = $product['price'];
                    $total_chua_salesoff = $product['total'];
                }*//*code cu tinh gia event*/
                $price_chua_salesoff = $product['price'];
                $total_chua_salesoff = $product['total'];
                $this->data['products'][] = array(
                    'name'     => $product['name'],
                    'model'    => $product['model'],
                    'option'   => $option_data,
                    'quantity' => $product['quantity'],
                    'href'     => $this->url->link('product/product', $custom_link . '&product_id=' . $product['product_id']),
                    'price'    => $this->currency->format($price_chua_salesoff + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                    'total'    => $this->currency->format($total_chua_salesoff + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
                    'return'   => $this->url->link('account/return/insert', 'order_id=' . $order_info['order_id'] . '&product_id=' . $product['product_id'], 'SSL')
                );
            }

            // Voucher
            $this->data['vouchers'] = array();

            $vouchers = $this->model_account_order->getOrderVouchers($this->request->get['order_id']);

            foreach ($vouchers as $voucher) {
                $this->data['vouchers'][] = array(
                    'description' => $voucher['description'],
                    'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
                );
            }
            $price_sale_off = $this->model_account_order->getPriceOrderSaleOff($this->request->get['order_id']);
//            print_r($price_sale_off);exit;
            $this->data['totals'] = $this->model_account_order->getOrderTotals($this->request->get['order_id']);
            $this->data['giagiam'] = $price_sale_off['saleoff'];
            if(isset($price_sale_off)) {
                $this->data['totals'][0]['salesoff'] = $this->currency->format($price_sale_off['saleoff'], $order_info['currency_code'], $order_info['currency_value']);  
                $this->data['totals'][1]['text'] = $this->currency->format($price_sale_off['total_saleoff'], $order_info['currency_code'], $order_info['currency_value']);
            } 
            /*end -- config lai bang gia cho order info by coder tranminh*/

            $this->data['comment'] = $order_info['comment'];

            $this->data['histories'] = array();

            $results = $this->model_account_order->getOrderHistories($this->request->get['order_id']);

            foreach ($results as $result) {
                $this->data['histories'][] = array(
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'status'     => $result['status'],
                    'comment'    => html_entity_decode($result['comment'], ENT_QUOTES, 'UTF-8')
                );
            }

            $this->data['continue'] = $this->url->link('account/order', '', 'SSL');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/order_info.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/account/order_info.tpl';
            } else {
                $this->template = 'default/template/account/order_info.tpl';
            }

            $this->children = array(
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );

            $this->response->setOutput($this->render());
        } else {
            $this->document->setTitle($this->language->get('text_order'));

            $this->data['heading_title'] = $this->language->get('text_order');

            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['button_continue'] = $this->language->get('button_continue');

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
                'href'      => $this->url->link('account/order', '', 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_order'),
                'href'      => $this->url->link('account/order/info', 'order_id=' . $order_id, 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['continue'] = $this->url->link('account/order', '', 'SSL');

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

    public function infoSMS() {
        $this->data['active'] = 'order';
        $this->load->model('catalog/product');
        $this->language->load('account/order');
        $this->language->load('account/account');

        if (isset($this->request->get['M'])) {
            $key = giaima($this->request->get['M'],"vietfuntravel");
            $order_id = $key;
        } else {
            $order_id = 0;
        }

        $this->load->model('account/order');

        $order_info = $this->model_account_order->getOrderSMS($order_id);

        if ($order_info) {
            $this->data['order_info'] = $order_info;

            $this->document->setTitle($this->language->get('text_order'));

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

            $url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('heading_title'),
                'href'      => $this->url->link('account/order', $url, 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_order'),
                'href'      => $this->url->link('account/order/info', 'order_id=' . $key . $url, 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['heading_title'] = $this->language->get('text_order');

            $this->data['text_order_detail'] = $this->language->get('text_order_detail');
            $this->data['text_invoice_no'] = $this->language->get('text_invoice_no');
            $this->data['text_order_id'] = $this->language->get('text_order_id');
            $this->data['text_date_added'] = $this->language->get('text_date_added');
            $this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
            $this->data['text_shipping_address'] = $this->language->get('text_shipping_address');
            $this->data['text_payment_method'] = $this->language->get('text_payment_method');
            $this->data['text_payment_address'] = $this->language->get('text_payment_address');
            $this->data['text_history'] = $this->language->get('text_history');
            $this->data['text_comment'] = $this->language->get('text_comment');

            $this->data['text_invoice'] = $this->language->get('text_invoice');
            $this->data['text_confirm'] = $this->language->get('text_confirm');
            $this->data['text_info_order'] = $this->language->get('text_info_order');
            $this->data['text_info_customer'] = $this->language->get('text_info_customer');
            $this->data['entry_name_customer'] = $this->language->get('entry_name_customer');
            $this->data['entry_email'] = $this->language->get('entry_email');
            $this->data['entry_telephone'] = $this->language->get('entry_telephone');

            $this->data['column_name'] = $this->language->get('column_name');
            $this->data['column_model'] = $this->language->get('column_model');
            $this->data['column_quantity'] = $this->language->get('column_quantity');
            $this->data['column_price'] = $this->language->get('column_price');
            $this->data['column_total'] = $this->language->get('column_total');
            $this->data['column_action'] = $this->language->get('column_action');
            $this->data['column_date_added'] = $this->language->get('column_date_added');
            $this->data['column_status'] = $this->language->get('column_status');
            $this->data['column_comment'] = $this->language->get('column_comment');

            $this->data['button_return'] = $this->language->get('button_return');
            $this->data['button_continue'] = $this->language->get('button_continue');

            $this->data['text_my_account'] = $this->language->get('text_my_account');
            $this->data['text_my_orders'] = $this->language->get('text_my_orders');
            $this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
            $this->data['text_edit'] = $this->language->get('text_edit');
            $this->data['text_password'] = $this->language->get('text_password');
            $this->data['text_address'] = $this->language->get('text_address');
            $this->data['text_order'] = $this->language->get('text_order');
            $this->data['text_newsletter'] = $this->language->get('text_newsletter');

            $this->data['edit'] = $this->url->link('account/account', '', 'SSL');
            $this->data['password'] = $this->url->link('account/password', '', 'SSL');
            $this->data['order'] = $this->url->link('account/order', '', 'SSL');
            $this->data['return'] = $this->url->link('account/return', '', 'SSL');
            $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

            if ($order_info['invoice_no']) {
                $this->data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
            } else {
                $this->data['invoice_no'] = '';
            }

            $this->data['order_id'] = $key;
            $this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));

            if ($order_info['payment_address_format']) {
                $format = $order_info['payment_address_format'];
            } else {
                $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
            }

            $find = array(
                '{firstname}',
                '{lastname}',
                '{company}',
                '{address_1}',
                '{address_2}',
                '{city}',
                '{postcode}',
                '{zone}',
                '{zone_code}',
                '{country}'
            );

            $replace = array(
                'firstname' => $order_info['payment_firstname'],
                'lastname'  => $order_info['payment_lastname'],
                'company'   => $order_info['payment_company'],
                'address_1' => $order_info['payment_address_1'],
                'address_2' => $order_info['payment_address_2'],
                'city'      => $order_info['payment_city'],
                'postcode'  => $order_info['payment_postcode'],
                'zone'      => $order_info['payment_zone'],
                'zone_code' => $order_info['payment_zone_code'],
                'country'   => $order_info['payment_country']
            );

            $this->data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

            $this->data['payment_method'] = $order_info['payment_method'];

            if ($order_info['shipping_address_format']) {
                $format = $order_info['shipping_address_format'];
            } else {
                $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
            }

            $find = array(
                '{firstname}',
                '{lastname}',
                '{company}',
                '{address_1}',
                '{address_2}',
                '{city}',
                '{postcode}',
                '{zone}',
                '{zone_code}',
                '{country}'
            );

            $replace = array(
                'firstname' => $order_info['shipping_firstname'],
                'lastname'  => $order_info['shipping_lastname'],
                'company'   => $order_info['shipping_company'],
                'address_1' => $order_info['shipping_address_1'],
                'address_2' => $order_info['shipping_address_2'],
                'city'      => $order_info['shipping_city'],
                'postcode'  => $order_info['shipping_postcode'],
                'zone'      => $order_info['shipping_zone'],
                'zone_code' => $order_info['shipping_zone_code'],
                'country'   => $order_info['shipping_country']
            );

            $this->data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

            $this->data['shipping_method'] = $order_info['shipping_method'];

            //
            $this->data['name_customer'] = $order_info['lastname'].' '. $order_info['firstname'];
            $this->data['link_invoice'] = '/order/view/invoice'.'?order_id=' . $this->encryption->encrypt($order_info['order_id']);
            $this->data['link_confirm'] = '/order/view/confirm'.'?order_id=' . $this->encryption->encrypt($order_info['order_id']);

            //var_dump($order_info);

            $this->data['products'] = array();

            $products = $this->model_account_order->getOrderProducts($key);

            foreach ($products as $product) {
                $option_data = array();

                $options = $this->model_account_order->getOrderOptions($key, $product['order_product_id']);

                foreach ($options as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }

                    $option_data[] = array(
                        'name'  => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
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
                    'href'      => $this->url->link('product/product', $custom_link . '&product_id=' . $product['product_id']),
                    'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                    'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
                    'return'   => $this->url->link('account/return/insert', 'order_id=' . $order_info['order_id'] . '&product_id=' . $product['product_id'], 'SSL')
                );
            }

            // Voucher
            $this->data['vouchers'] = array();

            $vouchers = $this->model_account_order->getOrderVouchers($key);

            foreach ($vouchers as $voucher) {
                $this->data['vouchers'][] = array(
                    'description' => $voucher['description'],
                    'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
                );
            }

            $this->data['totals'] = $this->model_account_order->getOrderTotals($key);

            $this->data['comment'] = $order_info['comment'];

            $this->data['histories'] = array();

            $results = $this->model_account_order->getOrderHistories($key);

            foreach ($results as $result) {
                $this->data['histories'][] = array(
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'status'     => $result['status'],
                    'comment'    => html_entity_decode($result['comment'], ENT_QUOTES, 'UTF-8')
                );
            }

            $this->data['continue'] = $this->url->link('account/order', '', 'SSL');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/order_info.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/account/order_info.tpl';
            } else {
                $this->template = 'default/template/account/order_info.tpl';
            }

            $this->children = array(
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );

            $this->response->setOutput($this->render());
        } else {
            $this->document->setTitle($this->language->get('text_order'));

            $this->data['heading_title'] = $this->language->get('text_order');

            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['button_continue'] = $this->language->get('button_continue');

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
                'href'      => $this->url->link('account/order', '', 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_order'),
                'href'      => $this->url->link('account/order/info', 'order_id=' . $order_id, 'SSL'),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['continue'] = $this->url->link('account/order', '', 'SSL');

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
}
?>