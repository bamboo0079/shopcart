<?php
class ControllerModuleCommonMenu extends Controller {
    protected function index($setting) {
        $this->language->load('module/common_menu');
        $this->load->model('catalog/common_menu');
        $this->load->model('tool/image');
        $id = $setting['title'];
        $this->data['id'] = $id;
        $query = $this->model_catalog_common_menu->GetDescription($id);
        if(!empty($query)){
            $this->data['result'] = $query;
            $link = explode('/',$_SERVER['REQUEST_URI']);
            $keyword = $link[1];

            $check_category = $this->model_catalog_common_menu->checkAliasCat($keyword);
            if(isset($check_category['query'])){
                $key_word = explode('=',$check_category['query']);
                $category_id =  explode($key_word[0].'=',$check_category['query']);
                $get_menu = $this->model_catalog_common_menu->GetDisplayMenu($id, $category_id[1]);
                if(!empty($get_menu) && (int)$category_id[1] == $setting['id']) {
                    if (!empty($query)) {
                        $display = $query['display'];
                        if ($display == 1 && $query['type'] != 5) {
                            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/common_menu_static.tpl')) {
                                $this->template = $this->config->get('config_template') . '/template/module/common_menu_static.tpl';
                            } else {
                                $this->template = 'default/template/module/common_menu_static.tpl';
                            }
                        } elseif ($display == 2) {
                            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/common_menu_dropdown.tpl')) {
                                $this->template = $this->config->get('config_template') . '/template/module/common_menu_dropdown.tpl';
                            } else {
                                $this->template = 'default/template/module/common_menu_dropdown.tpl';
                            }
                        } elseif ($display == 3) {
                            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/common_menu_mega.tpl')) {
                                $this->template = $this->config->get('config_template') . '/template/module/common_menu_mega.tpl';
                            } else {
                                $this->template = 'default/template/module/common_menu_mega.tpl';
                            }
                        }elseif($display == 4){
                            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/common_menu_img.tpl')) {
                                $this->template = $this->config->get('config_template') . '/template/module/common_menu_img.tpl';
                            } else {
                                $this->template = 'default/template/module/common_menu_img.tpl';
                            }
                        } elseif ($query['type'] == 5) {
                            $this->data['menu_news_description'] = $this->model_catalog_common_menu->GetMenuNewsDescription($id);
                            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/common_menu_news.tpl')) {
                                $this->template = $this->config->get('config_template') . '/template/module/common_menu_news.tpl';
                            } else {
                                $this->template = 'default/template/module/common_menu_news.tpl';
                            }
                        }
                        $this->render();
                    }
                }
            }

        }

    }
}
?>