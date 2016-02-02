<?php
class ControllerDesignCommonNews extends Controller{
    public function index(){
        $this->load->language('design/common_news');
        $this->getList();
    }
    public function add(){
        $this->language->load('design/menu');
        $this->load->model('design/menu');
        $this->load->model('design/common_news');
        $data = $this->request->post;
        if($data['buttom-cat'] == 1){
            $this->getNewsForm();
        }elseif($data['buttom-cat'] == 2){
            $data = $this->request->post;

            if(isset($data['cat_menu']) && !empty($data['cat_menu'])){
                for($i = 0; $i < count($data['cat_menu']); $i ++){
                    $this->model_design_common_news->DeleteCategory($data['type-add'],$data['cat_menu'][$i]);
                }
                $this->CommonNewSetting($data['cat_menu'],1);
            }elseif(isset($data['tag_menu']) && !empty($data['tag_menu'])){
                for($i = 0; $i < count($data['tag_menu']); $i ++){
                    $this->model_design_common_news->DeleteCategory($data['type-add'],$data['tag_menu'][$i]);
                }
                $this->CommonNewSetting($data['tag_menu'],1);
            }

            $this->redirect($this->url->link('design/common_news','token='.$this->session->data['token']));
        }


    }
    public function CommonNewSetting($arr,$type){
        $this->load->model("design/common_news");
        $this->load->model('setting/setting');
        $value = $this->config->get('common_news_module');
        $attr = array();
        for($r = 0; $r < count($arr); $r ++){
            $attr[$arr[$r]] = $arr[$r];
        }

        foreach($value as $key => $_value){
            if(isset($attr[$_value['id']]) && $attr[$_value['id']] == $_value['id'] && $_value['type'] == $type){
                unset($value[$key]);
            }
        }

        $arr = array('common_news_module' => $value);
        $this->model_setting_setting->editSetting('common_news', $arr);
    }
    public function process(){
        $this->load->model("design/common_news");
        $this->load->model('setting/setting');
        $value = $this->config->get('common_news_module');

        $data = $this->request->post;
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            $category = $data['cat_menu_choose'];
            for($v = 0;$v < count($category); $v ++){
                $this->model_design_common_news->InsertCategory($data['type'],$category[$v]);
                // insert setting
                $arr_display = array(12,3,11,8,14,16,2);
                for($i=0; $i <= count($arr_display); $i++){
                    if(isset($arr_display[$i]) && !empty($arr_display[$i])){
                        $arr_for[] =  Array (
                            'layout_id' => $arr_display[$i],
                            'position' => 'column_left',
                            'id' => $category[$v],
                            'type' => $data['type'],
                            'status' => 1,
                            'sort_order' => '',
                        );
                    }
                }

            }

        }

        if(isset($value) && !empty($value)){
            $arr_for = array_merge($arr_for,$value);
        }
        $arr = array('common_news_module' => $arr_for);
        $this->model_setting_setting->editSetting('common_news', $arr);

        $this->redirect($this->url->link('design/common_news','token='.$this->session->data['token']));

    }
    public function getNewsForm(){
        $this->load->model('design/common_news');
        $this->load->model('design/menu');
        $this->load->language('design/common_news');

        $this->data['text_home'] = $this->language->get('text_home');
        $this->data['text_category'] = $this->language->get('text_category');
        $this->data['link_home'] = $this->url->link("common/home","token=".$this->session->data["token"]);
        $this->data['category_link'] = $this->url->link("design/common_news",'token='.$this->session->data["token"]);

        $this->data['text_add_category_menu'] = $this->language->get('text_add_category_menu');
        $this->data['text_destroy'] = $this->language->get('text_destroy');
        $this->data['text_menu_category'] = $this->language->get('text_menu_category');
        $this->data['text_select_all'] = $this->language->get('text_select_all');
        $this->data['text_destroy_all'] = $this->language->get('text_destroy_all');
        $this->data['text_category_choose'] = $this->language->get('text_category_choose');
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['text_add_category'] = $this->language->get('text_add_category');
        $this->data['text_category_none'] = $this->language->get('text_category_none');
        $this->data['text_action'] = $this->language->get('text_action');

        $this->data['destroy'] = $this->url->link('design/menu','token='.$this->session->data['token']);
        $this->data['action'] = $this->url->link('design/menu/insert', 'token=' . $this->session->data['token'], 'SSL');

        if(isset($this->request->post['type-add']) && $this->request->post['type-add'] == 1){
            $cat_result = $this->model_design_common_news->getCatMenu();
            $attr = array();
            foreach($cat_result as $_cat){
                $attr[$_cat['cat_menu']] = $_cat['cat_menu'];
            }
            $this->data['category_arr'] = $attr;
            $this->data['type'] = $this->request->post['type-add'];
            $results = $this->model_design_menu->getCategoriesMenuNone();
            $cat_choose =  $this->model_design_common_news->getCategoryId();

            $arr = array();
            foreach($cat_choose as $_items){
                $arr[$_items['category']] = $_items['category'];
            }
            $this->data['cat_choose'] = $arr;

            foreach ($results as $result) {
                $this->data['categories'][] = array(
                    'category_id' => $result['category_id'],
                    'name' => $result['name']
                );
            }

        }elseif(isset($this->request->post['type-add']) && $this->request->post['type-add'] == 2){
            $cat_result = $this->model_design_common_news->getTagMenu();
            $attr = array();
            foreach($cat_result as $_cat){
                $attr[$_cat['cat_menu']] = $_cat['cat_menu'];
            }
            $this->data['category_arr'] = $attr;
            $this->data['type'] = $this->request->post['type-add'];
            $tag =  $this->model_design_common_news->getTagId();

            $tag_arr = array();
            foreach($tag as $_tag){
                $tag_arr[$_tag['category']] = $_tag['category'];
            }
            $this->data['cat_choose'] = $tag_arr;
//                print_r($this->data['cat_choose']);exit;

            $tags = $this->model_design_menu->getTags(0);
            foreach ($tags as $result) {
                $keyword = $this->model_design_menu->getTag($result['tag_id']);
                $this->data['categories'][] = array(
                    'category_id' => $result['tag_id'],
                    'name'        => $result['name'],
                    'keyword'	  => $keyword['keyword']
                );
            }
//                print_r($this->data['categories']);exit;
        }

        $this->data['action'] = $this->url->link("design/common_news/process","token=".$this->session->data['token']);
        $this->template = "design/common_news_add.tpl";
        $this->children = array(
            "common/header",
            "common/footer"
        );
        $this->response->setOutput($this->render());

    }
    public function getList(){
        $this->load->model('design/common_news');
        $this->data['text_home'] = $this->language->get('text_home');
        $this->data['text_category'] = $this->language->get('text_category');
        $this->data['home'] = $this->url->link('common/home','token='.$this->session->data['token']);
        $this->data['category_href'] = $this->url->link('design/common_news','token='.$this->session->data['token']);

        $this->data['text_home'] = $this->language->get('text_home');
        $this->data['text_category'] = $this->language->get('text_category');
        $this->data['text_add'] = $this->language->get('text_add');
        $this->data['text_delete'] = $this->language->get('text_delete');
        $this->data['text_category_menu'] = $this->language->get('text_category_menu');
        $this->data['text_category_tag'] = $this->language->get('text_category_tag');
        $this->data['text_category_name'] = $this->language->get('text_category_name');
        $this->data['text_action'] = $this->language->get('text_action');
        $this->data['text_category_none'] = $this->language->get('text_category_none');
        $this->data['text_edit'] = $this->language->get('text_edit');
        $this->data['text_category_name'] = $this->language->get('text_category_name');
        $this->data['text_category_tag'] = $this->language->get('text_category_tag');
        $this->data['text_all'] = $this->language->get('text_all');

        // get list category
        $results = $this->model_design_common_news->getCategoriesNews();
        foreach ($results as $result) {
            $this->data['categories'][] = array(
                'category_id' => $result['category_id'],
                'name'        => $result['name'],
                'href'        => $this->url->link('design/menu/update', '&id='.$result['category_id'].'&type=1&token=' . $this->session->data['token'],'SSL')
            );
        }
        // end get list category

        // get list tag
        $tag_choose = $this->model_design_common_news->TagGet();
        $tags = $this->model_design_common_news->getTags(0);

        foreach ($tags as $_result) {
            if(isset($_result['name'])){
                for($i = 0; $i < count($tag_choose); $i ++){
                    if($tag_choose[$i]['category'] == $_result['tag_id']){
                        $keyword = $this->model_design_common_news->getTag($_result['tag_id']);
                        $this->data['tags'][] = array(
                            'tag_id' => $_result['tag_id'],
                            'name'        => $_result['name'],
                            'keyword'	  => $keyword['keyword'],
                            'href'        => $this->url->link('design/menu/update', '&id='.$_result['tag_id'].'&type=2&token=' . $this->session->data['token'],'SSL')
                        );
                    }
                }

            }

        }
        // end get list tag

        $this->data['action'] = $this->url->link('design/common_news/add','token='.$this->session->data['token']);
        $this->data['link_home'] = $this->url->link('common/home','token='.$this->session->data['token']);
        $this->template = "design/common_news_list.tpl";
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
}
?>