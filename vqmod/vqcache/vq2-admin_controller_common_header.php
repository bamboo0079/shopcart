<?php
class ControllerCommonHeader extends Controller {
    protected function index() {
        $this->data['title'] = $this->document->getTitle();

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }

        $this->data['description'] = $this->document->getDescription();
        $this->data['keywords'] = $this->document->getKeywords();
        $this->data['links'] = $this->document->getLinks();
        $this->data['styles'] = $this->document->getStyles();
        $this->data['scripts'] = $this->document->getScripts();
        $this->data['lang'] = $this->language->get('code');
        $this->data['direction'] = $this->language->get('direction');

        $this->language->load('common/header');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_affiliate'] = $this->language->get('text_affiliate');
        $this->data['text_attribute'] = $this->language->get('text_attribute');
        $this->data['text_attribute_group'] = $this->language->get('text_attribute_group');
        $this->data['text_attribute_type'] = $this->language->get('text_attribute_type');
        $this->data['text_attribute_meal'] = $this->language->get('text_attribute_meal');
        $this->data['text_backup'] = $this->language->get('text_backup');
		$this->data['text_export_import'] = $this->language->get('text_export_import');
        $this->data['text_banner'] = $this->language->get('text_banner');
        $this->data['text_catalog'] = $this->language->get('text_catalog');
        $this->data['text_category'] = $this->language->get('text_category');
        $this->data['text_confirm'] = $this->language->get('text_confirm');
        $this->data['text_country'] = $this->language->get('text_country');
        $this->data['text_coupon'] = $this->language->get('text_coupon');
        $this->data['text_currency'] = $this->language->get('text_currency');
        $this->data['text_customer'] = $this->language->get('text_customer');
        $this->data['text_customer_group'] = $this->language->get('text_customer_group');
        $this->data['text_customer_field'] = $this->language->get('text_customer_field');
        $this->data['text_customer_ban_ip'] = $this->language->get('text_customer_ban_ip');
        $this->data['text_custom_field'] = $this->language->get('text_custom_field');
        $this->data['text_sale'] = $this->language->get('text_sale');
        $this->data['text_design'] = $this->language->get('text_design');
        $this->data['text_documentation'] = $this->language->get('text_documentation');
        $this->data['text_download'] = $this->language->get('text_download');
        $this->data['text_error_log'] = $this->language->get('text_error_log');
        $this->data['text_extension'] = $this->language->get('text_extension');
        $this->data['text_feed'] = $this->language->get('text_feed');
        $this->data['text_filter'] = $this->language->get('text_filter');
        $this->data['text_front'] = $this->language->get('text_front');
        $this->data['text_geo_zone'] = $this->language->get('text_geo_zone');
        $this->data['text_dashboard'] = $this->language->get('text_dashboard');
        $this->data['text_help'] = $this->language->get('text_help');
        $this->data['text_information'] = $this->language->get('text_information');
        $this->data['text_menu'] = $this->language->get('text_menu');
        $this->data['text_common_img'] = $this->language->get('text_common_img');
        $this->data['text_common_news'] = $this->language->get('text_common_news');
        $this->data['text_language'] = $this->language->get('text_language');
        $this->data['text_random_news'] = $this->language->get('text_random_news');
        $this->data['text_layout'] = $this->language->get('text_layout');
        $this->data['text_localisation'] = $this->language->get('text_localisation');
        $this->data['text_logout'] = $this->language->get('text_logout');
        $this->data['text_contact'] = $this->language->get('text_contact');
        $this->data['text_manager'] = $this->language->get('text_manager');
        $this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $this->data['text_module'] = $this->language->get('text_module');
        $this->data['text_option'] = $this->language->get('text_option');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_order_status'] = $this->language->get('text_order_status');
        $this->data['text_opencart'] = $this->language->get('text_opencart');
        $this->data['text_payment'] = $this->language->get('text_payment');
        $this->data['text_product'] = $this->language->get('text_product');
$this->data['text_event2'] = $this->language->get('text_event2');

			$this->data['text_promotion'] = $this->language->get('text_promotion');
			$this->data['text_promotion_gioto'] = $this->language->get('text_promotion_gioto');
			$this->data['text_promotion_he'] = $this->language->get('text_promotion_he');
			$this->data['text_promotion_khtetamlich'] = $this->language->get('text_promotion_khtetamlich');
			$this->data['text_promotion_khtetduonglich'] = $this->language->get('text_promotion_khtetduonglich');
			$this->data['text_promotion_even29'] = $this->language->get('text_promotion_even29');
			

			$this->data['text_newsletter'] = $this->language->get('text_newsletter');
			$this->data['text_newsletter_category'] = $this->language->get('text_newsletter_category');
			$this->data['text_newsletter_sendmail'] = $this->language->get('text_newsletter_sendmail');
			$this->data['text_newsletter_detail'] = $this->language->get('text_newsletter_detail');
			
        $this->data['text_profile'] = $this->language->get('text_profile');
        $this->data['text_reports'] = $this->language->get('text_reports');
// dodano za order list - pocetak
			$this->data['text_orderlist'] = $this->language->get('text_orderlist');
			// dodano za order list - kraj
        $this->data['text_report_sale_order'] = $this->language->get('text_report_sale_order');
        $this->data['text_report_sale_tax'] = $this->language->get('text_report_sale_tax');
        $this->data['text_report_sale_shipping'] = $this->language->get('text_report_sale_shipping');
        $this->data['text_report_sale_return'] = $this->language->get('text_report_sale_return');
        $this->data['text_report_sale_coupon'] = $this->language->get('text_report_sale_coupon');
        $this->data['text_report_product_viewed'] = $this->language->get('text_report_product_viewed');
        $this->data['text_report_product_purchased'] = $this->language->get('text_report_product_purchased');
        $this->data['text_report_customer_online'] = $this->language->get('text_report_customer_online');
        $this->data['text_report_customer_order'] = $this->language->get('text_report_customer_order');
        $this->data['text_report_customer_reward'] = $this->language->get('text_report_customer_reward');
        $this->data['text_report_customer_credit'] = $this->language->get('text_report_customer_credit');
        $this->data['text_report_affiliate_commission'] = $this->language->get('text_report_affiliate_commission');
        $this->data['text_report_sale_return'] = $this->language->get('text_report_sale_return');
        $this->data['text_report_product_viewed'] = $this->language->get('text_report_product_viewed');
        $this->data['text_report_customer_order'] = $this->language->get('text_report_customer_order');
        $this->data['text_review'] = $this->language->get('text_review');
        $this->data['text_return'] = $this->language->get('text_return');
        $this->data['text_return_action'] = $this->language->get('text_return_action');
        $this->data['text_return_reason'] = $this->language->get('text_return_reason');
        $this->data['text_return_status'] = $this->language->get('text_return_status');
        $this->data['text_support'] = $this->language->get('text_support');
        $this->data['text_shipping'] = $this->language->get('text_shipping');
        $this->data['text_setting'] = $this->language->get('text_setting');
        $this->data['text_stock_status'] = $this->language->get('text_stock_status');
        $this->data['text_system'] = $this->language->get('text_system');
        $this->data['text_tax'] = $this->language->get('text_tax');
        $this->data['text_tax_class'] = $this->language->get('text_tax_class');
        $this->data['text_tax_rate'] = $this->language->get('text_tax_rate');
        $this->data['text_total'] = $this->language->get('text_total');
        $this->data['text_user'] = $this->language->get('text_user');
        $this->data['text_user_group'] = $this->language->get('text_user_group');
        $this->data['text_users'] = $this->language->get('text_users');
        $this->data['text_voucher'] = $this->language->get('text_voucher');
        $this->data['text_voucher_theme'] = $this->language->get('text_voucher_theme');
        $this->data['text_weight_class'] = $this->language->get('text_weight_class');
        $this->data['text_length_class'] = $this->language->get('text_length_class');
		$this->data['text_comment'] = $this->language->get('text_comment');
		$this->data['text_customer_type'] = $this->language->get('text_customer_type');
		$this->data['text_employee'] = $this->language->get('text_employee');
		$this->data['text_extra'] = $this->language->get('text_extra');
			$this->data['text_support_online'] = $this->language->get('text_support_online');
			$this->data['text_footer'] = $this->language->get('text_footer');
			$this->data['text_featured'] = $this->language->get('text_featured');
			$this->data['text_mod_banner'] = $this->language->get('text_mod_banner');
			$this->data['text_ads'] = $this->language->get('text_ads');
			
		$this->data['text_mail_template'] = $this->language->get('text_mail_template');
		$this->data['text_news'] = $this->language->get('text_news');
			$this->data['text_news_category'] = $this->language->get('text_news_category');
			$this->data['text_news_comment'] = $this->language->get('text_news_comment');

        $this->data['text_policy'] = $this->language->get('text_policy');
      
		$this->data['text_vqmod_manager'] = $this->language->get('text_vqmod_manager');
								$this->data['text_cache_manager'] = $this->language->get('text_cache_manager');
				
        $this->data['text_zone'] = $this->language->get('text_zone');
        $this->data['text_openbay_extension'] = $this->language->get('text_openbay_extension');
        $this->data['text_openbay_dashboard'] = $this->language->get('text_openbay_dashboard');
        $this->data['text_openbay_orders'] = $this->language->get('text_openbay_orders');
        $this->data['text_openbay_items'] = $this->language->get('text_openbay_items');
        $this->data['text_openbay_ebay'] = $this->language->get('text_openbay_ebay');
        $this->data['text_openbay_amazon'] = $this->language->get('text_openbay_amazon');
        $this->data['text_openbay_amazonus'] = $this->language->get('text_openbay_amazonus');
        $this->data['text_openbay_settings'] = $this->language->get('text_openbay_settings');
        $this->data['text_openbay_links'] = $this->language->get('text_openbay_links');
        $this->data['text_openbay_report_price'] = $this->language->get('text_openbay_report_price');
        $this->data['text_openbay_order_import'] = $this->language->get('text_openbay_order_import');

        $this->data['text_paypal_express'] = $this->language->get('text_paypal_manage');
        $this->data['text_paypal_express_search'] = $this->language->get('text_paypal_search');
        $this->data['text_recurring_profile'] = $this->language->get('text_recurring_profile');


        $this->data['text_tag'] = $this->language->get('text_tag');

        if (!$this->user->isLogged() || !isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
            $this->data['logged'] = '';

            $this->data['home'] = $this->url->link('common/login', '', 'SSL');
        } else {
            $this->data['logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
            $this->data['pp_express_status'] = $this->config->get('pp_express_status');

            $this->data['home'] = $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['affiliate'] = $this->url->link('sale/affiliate', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['attribute'] = $this->url->link('catalog/attribute', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['attribute_group'] = $this->url->link('catalog/attribute_group', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['attribute_type'] = $this->url->link('catalog/attribute_type', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['attribute_meal'] = $this->url->link('catalog/attribute_meal', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['backup'] = $this->url->link('tool/backup', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['export_import'] = $this->url->link('tool/export_import', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['banner'] = $this->url->link('design/banner', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['category'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['country'] = $this->url->link('localisation/country', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['coupon'] = $this->url->link('sale/coupon', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['currency'] = $this->url->link('localisation/currency', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['customer'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['customer_fields'] = $this->url->link('sale/customer_field', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['customer_group'] = $this->url->link('sale/customer_group', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['customer_ban_ip'] = $this->url->link('sale/customer_ban_ip', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['custom_field'] = $this->url->link('design/custom_field', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['download'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['error_log'] = $this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['feed'] = $this->url->link('extension/feed', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['filter'] = $this->url->link('catalog/filter', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['geo_zone'] = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['information'] = $this->url->link('catalog/information', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['language'] = $this->url->link('localisation/language', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['layout'] = $this->url->link('design/layout', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['contact'] = $this->url->link('sale/contact', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['manager'] = $this->url->link('extension/manager', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['manufacturer'] = $this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['module'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['option'] = $this->url->link('catalog/option', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['order'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['order_status'] = $this->url->link('localisation/order_status', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['payment'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL');
$this->data['event'] = $this->url->link('event/event', 'token=' . $this->session->data['token'], 'SSL');

			$this->data['promotion_gioto'] = $this->url->link('module/gioto', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['promotion_he'] = $this->url->link('module/he', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['promotion_khtetamlich'] = $this->url->link('module/khtetamlich', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['promotion_khtetduonglich'] = $this->url->link('module/khtetduonglich', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['promotion_even29'] = $this->url->link('module/even29', 'token=' . $this->session->data['token'], 'SSL');
			

			$this->data['newsletter'] = $this->url->link('catalog/newsletter', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['newsletter_category'] = $this->url->link('catalog/newsletter_category', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['newsletter_sendmail'] = $this->url->link('catalog/newsletter_sendmail', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['newsletter_detail'] = $this->url->link('catalog/newsletter/detail', 'token=' . $this->session->data['token'], 'SSL');
			
            $this->data['profile'] = $this->url->link('catalog/profile', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_sale_order'] = $this->url->link('report/sale_order', 'token=' . $this->session->data['token'], 'SSL');
// dodano za order list - pocetak
			$this->data['orderlist'] = $this->url->link('report/newreport', 'token=' . $this->session->data['token'], 'SSL');
			// dodano za order list - kraj
            $this->data['report_sale_tax'] = $this->url->link('report/sale_tax', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_sale_shipping'] = $this->url->link('report/sale_shipping', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_sale_return'] = $this->url->link('report/sale_return', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_sale_coupon'] = $this->url->link('report/sale_coupon', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_product_viewed'] = $this->url->link('report/product_viewed', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_product_purchased'] = $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_customer_online'] = $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_customer_order'] = $this->url->link('report/customer_order', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_customer_reward'] = $this->url->link('report/customer_reward', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_customer_credit'] = $this->url->link('report/customer_credit', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['report_affiliate_commission'] = $this->url->link('report/affiliate_commission', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['return'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['return_action'] = $this->url->link('localisation/return_action', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['return_reason'] = $this->url->link('localisation/return_reason', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['return_status'] = $this->url->link('localisation/return_status', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['shipping'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['setting'] = $this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['store'] = HTTP_CATALOG;
            $this->data['stock_status'] = $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['tax_class'] = $this->url->link('localisation/tax_class', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['tax_rate'] = $this->url->link('localisation/tax_rate', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['total'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['user'] = $this->url->link('user/user', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['user_group'] = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['voucher'] = $this->url->link('sale/voucher', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['voucher_theme'] = $this->url->link('sale/voucher_theme', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['weight_class'] = $this->url->link('localisation/weight_class', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['length_class'] = $this->url->link('localisation/length_class', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['comment'] = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'], 'SSL');
			$total = $this->db->query("SELECT COUNT(*) as count FROM `" . DB_PREFIX . "comment` WHERE status = 0") -> row;
			$this->data['total_comment'] = $total['count'];
			
			$this->data['customer_type'] = $this->url->link('sale/customer_type', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['employee'] = $this->url->link('catalog/employee', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['support_online'] = $this->url->link('catalog/support_online', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['featured'] = $this->url->link('module/featured', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['mod_banner'] = $this->url->link('module/banner', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['footer'] = $this->url->link('module/footer', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['ads'] = $this->url->link('module/ads', 'token=' . $this->session->data['token'], 'SSL');
			
			$this->data['mail_template'] = $this->url->link('sale/mail_template', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['news'] = $this->url->link('catalog/news', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['news_category'] = $this->url->link('catalog/news_category', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['news_comment'] = $this->url->link('catalog/news_comment', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['policy'] = $this->url->link('catalog/policy', 'token=' . $this->session->data['token'], 'SSL');
      
			
				$this->data['vqmod_manager'] = $this->url->link('module/vqmod_manager', 'token=' . $this->session->data['token'], 'SSL');
				$this->data['cache_manager'] = $this->url->link('cacheremove/cacheremove', 'token=' . $this->session->data['token'], 'SSL');
				
            $this->data['zone'] = $this->url->link('localisation/zone', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['menu'] = $this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['common_img'] = $this->url->link('design/common_img', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['common_news'] = $this->url->link('design/common_news', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['random_news'] = $this->url->link('design/random_news', 'token=' . $this->session->data['token'], 'SSL');

            $this->data['openbay_show_menu'] = $this->config->get('openbaymanager_show_menu');

            $this->data['openbay_link_extension'] = $this->url->link('extension/openbay', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_orders'] = $this->url->link('extension/openbay/orderList', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_items'] = $this->url->link('extension/openbay/itemList', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_ebay'] = $this->url->link('openbay/openbay', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_ebay_settings'] = $this->url->link('openbay/openbay/settings', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_ebay_links'] = $this->url->link('openbay/openbay/viewItemLinks', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_ebay_orderimport'] = $this->url->link('openbay/openbay/viewOrderImport', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_amazon'] = $this->url->link('openbay/amazon', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_amazon_settings'] = $this->url->link('openbay/amazon/settings', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_amazon_links'] = $this->url->link('openbay/amazon/itemLinks', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_amazonus'] = $this->url->link('openbay/amazonus', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_amazonus_settings'] = $this->url->link('openbay/amazonus/settings', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['openbay_link_amazonus_links'] = $this->url->link('openbay/amazonus/itemLinks', 'token=' . $this->session->data['token'], 'SSL');

            $this->data['openbay_markets'] = array(
                'ebay' => $this->config->get('openbay_status'),
                'amazon' => $this->config->get('amazon_status'),
                'amazonus' => $this->config->get('amazonus_status'),
            );

            $this->data['paypal_express'] = $this->url->link('payment/pp_express', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['paypal_express_search'] = $this->url->link('payment/pp_express/search', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['recurring_profile'] = $this->url->link('sale/recurring', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['tag'] = $this->url->link('catalog/tag', 'token=' . $this->session->data['token'], 'SSL');

//            $this->data['event_link'] = $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL');
            $this->data['text_event'] = 'Event';

            $this->data['stores'] = array();

            $this->load->model('setting/store');

            $results = $this->model_setting_store->getStores();

            foreach ($results as $result) {
                $this->data['stores'][] = array(
                    'name' => $result['name'],
                    'href' => $result['url']
                );
            }
        }

        $this->template = 'common/header.tpl';


        if ($this->config->get('admin_quick_edit_status') && $this->config->get('aqe_catalog_products_status') && isset($this->session->data['token'])) {
            $this->data['product'] = $this->url->link('catalog/product_ext', 'token=' . $this->session->data['token'], 'SSL');
        }
            
        $this->render();
    }
}
?>