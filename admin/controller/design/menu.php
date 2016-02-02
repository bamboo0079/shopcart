<?php
class ControllerDesignMenu extends Controller{
    public function index(){
        $this->language->load('design/menu');
        $this->data['heading_title_menu'] = $this->language->get('heading_title_menu');
        $this->load->model('design/menu');
        $this->getList();
    }
    public function insert() {
        $this->language->load('design/menu');
        $this->document->setTitle($this->language->get('heading_title_menu'));
        $this->load->model('design/menu');
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            if(isset($this->request->post['type']) && !empty($this->request->post['type'])){
                if(!empty($this->request->post['cat_menu_choose'])){
                    $count = count($this->request->post['cat_menu_choose']);
                    if($this->request->post['type'] == 1){
                        for($i = 0; $i < $count ; $i ++){
                            $this->model_design_menu->InsertCatMenu($this->request->post['cat_menu_choose'][$i]);
                        }
                    }elseif($this->request->post['type'] == 2){
                        for($i = 0; $i <= $count ; $i ++) {
                            $this->model_design_menu->InsertTagMenu($this->request->post['cat_menu_choose'][$i]);
                        }
                    }
                    $this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL'));
                }else{
                    $this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL'));
                }

            }
        }

        $this->getForm();
    }

    public function update() {
        $this->language->load('design/menu');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('design/menu');
        $this->data['type_menu'] = $this->request->get['id'];

        if(isset($this->request->get['id']) && !empty($this->request->get['id'])){

            $this->data['text_home'] = $this->language->get('text_home');
            $this->data['text_category'] = $this->language->get('text_category');
            $this->data['entry_name_menu'] = $this->language->get('entry_name_menu');
            $this->data['text_category_menu'] = $this->language->get('text_category_menu');
            $this->data['text_category_scroll'] = $this->language->get('text_category_scroll');
            $this->data['entry_status'] = $this->language->get('entry_status');
            $this->data['text_action'] = $this->language->get('text_action');

            $this->data['home_link'] = $this->url->link('common/home','token='.$this->session->data['token']);
            $this->data['cat_link'] = $this->url->link('design/menu','token='.$this->session->data['token']);

            $this->data['type'] = $this->request->get['type'];
            $this->data['list_menu']= $this->model_design_menu->GetMenuDisplay($this->request->get['id'],$this->request->get['type']);
            $this->data['ad_new'] = $this->url->link('design/menu/add_menu','&id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token=' . $this->session->data['token'],'SSL');
            $this->data['action'] = $this->url->link('design/menu/update','id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token='.$this->session->data['token']);
            $this->getTitle($this->request->get['id']);

            $this->template = 'design/common_list_menu.tpl';
            $this->children = array(
                'common/header',
                'common/footer'
            );
        }
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            $data = $this->request->post['menu_item'];
            if(!empty($data)){
                if($this->request->get['type'] == 1){
                    for($i=0;$i <= count($data); $i++){
                        $this->model_design_menu->deleteCatMenu($data[$i]);
                        $this->model_design_menu->deleteDisplayMenu($data[$i],$this->request->get['type']);

                        $this->deleteSetting($data);
                    }
                }elseif($this->request->get['type'] == 2){
                    for($i=0;$i <= count($data); $i++){
                        $this->model_design_menu->deleteTagMenu($data[$i]);
                        $this->model_design_menu->deleteDisplayMenu($data[$i],$this->request->get['type']);

                        $this->deleteSetting($data);
                    }
                }
            }
            $this->redirect($this->url->link('design/menu/update','id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token='.$this->session->data['token']));

        }
        $this->response->setOutput($this->render());
    }
    public function getTitle($id){
        $query_cat = $this->model_design_menu->getCategoryMenuDescription($id);
        if(!empty($query_cat)){
            $this->data['cat_detail'] =  'Category:: '.$query_cat['name'];
        }else{
            $query_cat = $this->model_design_menu->GetTagDescription($id);
            if(!empty($query_cat)){
                $this->data['cat_detail'] =  'Tag:: '.$query_cat[0]['name'];
            }

        }
        return $this->data['cat_detail'];
    }

    public function add_menu(){
        $this->language->load('design/menu');
        $this->load->model('design/menu');
        $this->load->model('setting/setting');
        $modules = $this->config->get('common_menu_module');

        $this->data['text_category'] = $this->language->get('text_category');
        $this->data['text_add'] = $this->language->get('text_add');
        $this->data['text_delete'] = $this->language->get('text_delete');
        $this->data['text_menu_avail'] = $this->language->get('text_menu_avail');
        $this->data['text_menu_category'] = $this->language->get('text_menu_category');
        $this->data['text_select_all'] = $this->language->get('text_select_all');
        $this->data['text_destroy_all'] = $this->language->get('text_destroy_all');
        $this->data['text_category_choose'] = $this->language->get('text_category_choose');
        $this->data['text_destroy_all'] = $this->language->get('text_destroy_all');
        $this->data['text_category_none'] = $this->language->get('text_category_none');
        $this->data['entry_name_menu'] = $this->language->get('entry_name_menu');
        $this->data['entry_header_title'] = $this->language->get('entry_header_title');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['text_category_menu'] = $this->language->get('text_category_menu');
        $this->data['text_category_menu_one'] = $this->language->get('text_category_menu_one');
        $this->data['text_category_menu_two'] = $this->language->get('text_category_menu_two');
        $this->data['text_category_menu_three'] = $this->language->get('text_category_menu_three');
        $this->data['text_category_menu_img'] = $this->language->get('text_category_menu_img');
        $this->data['text_category_display'] = $this->language->get('text_category_display');
        $this->data['static_menu'] = $this->language->get('static_menu');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['text_category_scroll'] = $this->language->get('text_category_scroll');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_error_title'] = $this->language->get('text_error_title');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['text_menu_new'] = $this->language->get('text_menu_new');
        $this->data['text_error_oder'] = $this->language->get('text_error_oder');
        $this->data['text_error_link'] = $this->language->get('text_error_link');
        $this->data['text_error_oder'] = $this->language->get('text_error_oder');
        $this->data['dropdown_menu'] = $this->language->get('dropdown_menu');
        $this->data['mega_menu'] = $this->language->get('mega_menu');

        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');

        $this->data['action'] = $this->url->link('design/menu/add_menu','&id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token=' . $this->session->data['token'],'SSL');
        $this->data['cat_detail'] = $this->getTitle($this->request->get['id']);
        $this->data['link'] = $this->url->link('design/menu/update','&id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token='.$this->session->data['token']);
        $this->data['category_link'] = $this->url->link('design/menu','token='.$this->session->data['token']);
        $this->data['home'] = $this->url->link('common/home','token='.$this->session->data['token']);
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            $data = $this->request->post;
            if(isset($data['menu_id_choose']) && !empty($data['menu_id_choose'])){
                for($i = 0; $i < count($data['menu_id_choose']); $i++){
                    $this->model_design_menu->InsertIdChoose($data['menu_id_choose'][$i],$this->request->get['id'],$this->request->get['type']);
                }
                $this->settingDisplayMenuArray($data['menu_id_choose'],$this->request->get['id']);
            }
            unset($data['menu_id_choose']);
            if($data['menu_name']==''){
                $this->redirect($this->url->link('design/menu/update', '&id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token=' . $this->session->data['token'], 'SSL'));
            }
            // insert mew menu
            if(!empty($data) && !empty($data['menu_name'])){

                if($data['cat_menu'] == 4){
                    $menu = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'type'=> $data['cat_menu'],'scroll'=> $data['scroll'], 'display'=> '4', 'status'=>$data['status'],'oder'=>$data['oder']);
                    for($i = 0; $i <= (count($data)); $i++){
                        if(!empty($data['menu_image'][$i]['img'])) {
                            $arr[] = array('title' => $data['menu_image'][$i]['img'], 'link' => $data['menu_image'][$i]['link'], 'img' => $data['menu_image'][$i]['image'], 'oder' => $data['menu_image'][$i]['oder']);
                        }
                    }
                    $menu_id = $this->model_design_menu->AddMenuImage($menu,$arr, $this->request->get['id'],$this->request->get['type']);
                    $this->settingDisplayMenu($menu_id,$this->request->get['id']);

                }elseif($data['cat_menu'] == 5){
                    $menu = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'scroll'=> $data['scroll'], 'type'=> $data['cat_menu'], 'display'=>$data['display_menu'], 'status'=>$data['status'],'oder'=>$data['oder']);
//                    print_r($data);exit;
                    for($i = 0; $i <= count($data['image']); $i++){
                        if(isset($data['content'][$i]) && !empty($data['content'][$i])) {
                            $items[] = array('img' => $data['image']['img'.$i],'link' =>  $data['link'][$i],'content' => $data['content'][$i]);
                        }
                    }
//                    print_r($items);exit;
                    $menu_id = $this->model_design_menu->AddMenuNews($menu,$items,$this->request->get['id'],$this->request->get['type']);
                    $this->settingDisplayMenu($menu_id,$this->request->get['id']);
                }else{
                    // đếm số phần tử trong mãng
                    $count = count($data);
                    // tạo mãng danh mục menu
                    $menu = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'scroll'=> $data['scroll'], 'type'=> $data['cat_menu'], 'display'=>$data['display_menu'], 'status'=>$data['status'],'oder'=>$data['oder']);
                    for($i = 1; $i<=$count; $i++){
                        // kiểm tra menu cấp 1
                        $lv_2 = array();
                        if(!empty($data['title_parent_'.$i.''])){
                            for($j = 1 ; $j <= $count; $j++){
                                // Kiểm tra menu cấp 3
                                $lv_3 = array();
                                for($v = 1; $v <= $count; $v++){
                                    if(!empty($data['title_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''])){
                                        $lv_3[] = array('title'=>$data['title_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''], 'order'=>$data['oder_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''],'icon'=>$data['icon_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''],'link'=>$data['link_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''], 'oder'=>$data['oder_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.'']);
                                    }
                                }
                                // Kiểm tra menu cấp 2
                                if(!empty($data['title_child_lv_'.$j.'_parent_'.$i.''])) {
                                    $lv_2[] = array('title' => $data['title_child_lv_' . $j . '_parent_' . $i . ''], 'oder' => $data['oder_child_lv_' . $j . '_parent_' . $i . ''], 'icon' => $data['icon_child_lv_' . $j . '_parent_' . $i . ''], 'link' => $data['link_lv_' . $j . '_parent_' . $i . ''],'level_3'=>$lv_3);
//                                print_r($lv_2).'</br>';
                                }

                            }
                            // tạo mãng lưu dữ liệu nhập vào
                            $lv_1[] = array('title'=>$data['title_parent_'.$i.''], 'oder'=>$data['parent_order_'.$i.''],'icon'=>$data['parent_icon_'.$i.''],'link'=>$data['parent_link_'.$i.''],'level_2'=>$lv_2);
                        }
                    }
                    $menu_id = $this->model_design_menu->addMenu($menu,$lv_1,$this->request->get['id'],$this->request->get['type']);
                    $this->settingDisplayMenu($menu_id,$this->request->get['id']);
                }
            }

            $this->redirect($this->url->link('design/menu/update', '&id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&token=' . $this->session->data['token'], 'SSL'));
            // end insert
        }
        $this->load->model('design/menu');
        $this->template = 'design/add_new_menu.tpl';
        $this->data['all_menu'] = $this->model_design_menu->getItemsMenu($this->request->get['id']);
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }
    public function settingDisplayMenu($menu_id, $cat_id){
        $this->load->model('setting/setting');
        $value = $this->config->get('common_menu_module');
        $arr_display = array(12,3,11,8,14,16,2);
        for($i=0; $i < count($arr_display); $i++){
            $arr_for[] =  Array (
                'layout_id' => $arr_display[$i],
                'position' => 'column_left',
                'title' => $menu_id,
                'id' => $cat_id,
                'status' => 1,
                'sort_order' => '',
            );

        }

        if(isset($value) && !empty($value)){
            $arr_for = array_merge($arr_for,$value);
        }
        $arr = array('common_menu_module' => $arr_for);
        $this->model_setting_setting->editSetting('common_menu', $arr);

    }
    public function settingDisplayMenuArray($arr,$cat_id){
        $this->load->model('setting/setting');
        $value = $this->config->get('common_menu_module');
        $attr = array();
        $r = 0;
        foreach($arr as $_arr){
            $attr[$_arr[$r]] = $_arr[$r];
            $r++;
        }

        foreach($value as $key => $_value){
            if(isset($attr[$_value['title']]) && $_value['title'] == $attr[$_value['title']] && $_value['id'] == $cat_id){
                unset($value[$key]);
            }
        }
        for($j = 0; $j < count($arr); $j++){
            $arr_display = array(12,3,11,8,14,16,2);
            for($i=0; $i < count($arr_display); $i++){
                $arr_for[] =  Array (
                    'layout_id' => $arr_display[$i],
                    'position' => 'column_left',
                    'title' => $arr[$j],
                    'id' => $cat_id,
                    'status' => 1,
                    'sort_order' => '',
                );

            }
        }
        if(isset($value) && !empty($value)){
            $arr_for = array_merge($arr_for,$value);
        }
        $arr = array('common_menu_module' => $arr_for);
        $this->model_setting_setting->editSetting('common_menu', $arr);
    }
    public function deleteSetting($arr){
        $this->load->model('setting/setting');
        $value = $this->config->get('common_menu_module');

        $id_arr = array();
        for($y = 0; $y < count($arr); $y++){
            $id_arr[$arr[$y]] =$arr[$y];
        }

        foreach($value as $key=>$_value){
            if( isset($id_arr[$_value['title']]) && $_value['title'] == $id_arr[$_value['title']]){
                unset($value[$key]);
            }
        }

        $arr = array('common_menu_module' =>  $value);
        $this->model_setting_setting->editSetting('common_menu', $arr);
    }
    public function delete() {
        $this->language->load('design/menu');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('design/menu');
        if($this->request->get['cat']==1){
            $this->model_design_menu->deleteCatMenu($this->request->get['id']);
        }elseif($this->request->get['cat']==2){
            $this->model_design_menu->deleteTagMenu($this->request->get['id']);
        }
        $type = $this->request->post['type-add'];
        if (isset($this->request->post['selected'])) {
            $data = $this->request->post['selected'];
            $count = count($data);
            for($i = 0; $i <= $count; $i++){
                if(!empty($data[$i])){
                    $id = $data[$i];
                    $menu = $this->model_design_menu->GetMenuDes($id);
                    $this->model_design_menu->DeleteMenu($data[$i],$type);
                    if($menu['type'] != 4){
                        $this->model_design_menu->deleteChildMenu($data[$i]);
                    }else{
                        $this->model_design_menu->deleteChildMenuImage($data[$i]);
                    }

                }
            }

            $this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {
        $this->load->language('design/menu');
        // get list menu category

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

        $results = $this->model_design_menu->getCategoriesMenu();
        foreach ($results as $result) {
            $this->data['categories'][] = array(
                'category_id' => $result['category_id'],
                'name'        => $result['name'],
                'href'        => $this->url->link('design/menu/update', '&id='.$result['category_id'].'&type=1&token=' . $this->session->data['token'],'SSL')
            );
        }
        // get list tag menu

        $tags_get = $this->model_design_menu->TagGet();
        $tag_arr = array();
        foreach($tags_get as $_item_tags){
            $tag_arr[$_item_tags['tag_id']] = $_item_tags['tag_id'];
        }
        $this->data['tag_choose'] = $tag_arr;
        $this->data['home'] = $this->url->link('common/home','token='.$this->session->data['token']);
        $this->data['category_href'] = $this->url->link('design/menu','token='.$this->session->data['token']);

        $tags = $this->model_design_menu->getTags(0);
        foreach ($tags as $_result) {
            $keyword = $this->model_design_menu->getTag($_result['tag_id']);
            $this->data['tags'][] = array(
                'tag_id' => $_result['tag_id'],
                'name'        => $_result['name'],
                'keyword'	  => $keyword['keyword'],
                'href'        => $this->url->link('design/menu/update', '&id='.$_result['tag_id'].'&type=2&token=' . $this->session->data['token'],'SSL')
            );
        }
        $this->data['action'] = $this->url->link('design/menu/insert','token=' . $this->session->data['token'],'SSL');
        $this->template = 'design/menu_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function getForm() {
        $this->data['breadcrumbs'] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'text_category'      => $this->language->get('text_category'),
            'text_category_href'      => $this->url->link('design/menu','token='.$this->session->data['token']),
        );

        $this->data['text_add_category_menu'] = $this->language->get('text_add_category_menu');
        $this->data['text_destroy'] = $this->language->get('text_destroy');
        $this->data['text_menu_category'] = $this->language->get('text_menu_category');
        $this->data['text_select_all'] = $this->language->get('text_select_all');
        $this->data['text_destroy_all'] = $this->language->get('text_destroy_all');
        $this->data['text_category_choose'] = $this->language->get('text_category_choose');
        $this->data['button_save'] = $this->language->get('button_save');

        $this->data['destroy'] = $this->url->link('design/menu','token='.$this->session->data['token']);
        $this->data['action'] = $this->url->link('design/menu/insert', 'token=' . $this->session->data['token'], 'SSL');

        if(isset($this->request->post['type-add']) && $this->request->post['type-add'] == 1){
            $this->data['type'] = $this->request->post['type-add'];
            $results = $this->model_design_menu->getCategoriesMenuNone();
            $cat_choose =  $this->model_design_menu->getCatMenuChoose();
            $arr = array();
            foreach($cat_choose as $_items){
                $arr[$_items['cat_id']] = $_items['cat_id'];
            }
            $this->data['cat_choose'] = $arr;

            foreach ($results as $result) {
                $this->data['categories'][] = array(
                    'category_id' => $result['category_id'],
                    'name' => $result['name']
                );
            }
        }elseif(isset($this->request->post['type-add']) && $this->request->post['type-add'] == 2){
            $this->data['type'] = $this->request->post['type-add'];
            $tags_get = $this->model_design_menu->TagGet();

            $tag_arr = array();
            foreach($tags_get as $_item_tags){
                $tag_arr[$_item_tags['tag_id']] = $_item_tags['tag_id'];
            }
            $this->data['cat_choose'] = $tag_arr;

            $tags = $this->model_design_menu->getTags(0);
            foreach ($tags as $result) {
                $keyword = $this->model_design_menu->getTag($result['tag_id']);
                $this->data['categories'][] = array(
                    'category_id' => $result['tag_id'],
                    'name'        => $result['name'],
                    'keyword'	  => $keyword['keyword']
                );
            }
        }

        $this->template = 'design/menu_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'design/banner')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    public function update_menu(){

        $this->language->load('design/menu');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('design/menu');
        $this->data['menu_id'] = $this->request->get['id'];

        if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
            $data = $this->request->post;
            $menu_id = $this->request->get['id'];
            if($data['cat_menu'] == 4){
                $menu_id = $this->request->get['id'];
                $menu = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'type'=> $data['cat_menu'], 'scroll'=> $data['scroll'],'display'=>'4', 'status'=>$data['status'],'oder'=>$data['oder']);
                $this->model_design_menu->deleteMenuImage($menu_id);
                $this->model_design_menu->UpdateMenu($menu_id,$menu);
                for($i = 0; $i <= (count($data)); $i++){
                    if(isset($data['menu_image'][$i]['img']) && $data['menu_image'][$i]['img'] != ''){
                        $arr[] = array('title'=> $data['menu_image'][$i]['img'], 'link' => $data['menu_image'][$i]['link'],'img'=> $data['menu_image'][$i]['image'], 'oder' => $data['menu_image'][$i]['oder']);
                    }
                }
                $this->model_design_menu->UpdateMenuImage($menu_id,$arr);

            }elseif($data['cat_menu'] == 5){

                $menu_id = $this->request->get['id'];
                $menu = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'type'=> $data['cat_menu'], 'scroll'=> $data['scroll'],'display'=>'4', 'status'=>$data['status'],'oder'=>$data['oder']);
                $this->model_design_menu->UpdateMenu($menu_id,$menu);

                $items = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'scroll'=> $data['scroll'], 'type'=> $data['cat_menu'], 'display'=>'', 'status'=>$data['status'],'oder'=>$data['oder']);
                $this->model_design_menu->deleteMenuNews($menu_id);
                for($i = 0; $i < count($data['image']); $i++){
                    if(isset($data['content']) && !empty($data['content'])) {
                        $items[] = array('img' => $data['image']['img'.$i],'link' =>  $data['link'][$i], 'content' => $data['content'][$i]);
                    }
                }
                $this->model_design_menu->EditMenuNews($menu_id,$items);
            }else{
                $menu = array('name'=>$data['menu_name'],'title'=>$data['title_menu'],'type'=> $data['cat_menu'], 'scroll'=> $data['scroll'],'display'=>$data['display_menu'], 'status'=>$data['status'],'oder'=>$data['oder']);
                $this->model_design_menu->UpdateMenu($menu_id,$menu);

                $count = count($data);
                for($i = 1; $i<=$count; $i++){
                    // kiểm tra menu cấp 1
                    $lv_2 = array();
                    if(!empty($data['title_parent_'.$i.''])){
                        for($j = 1 ; $j <= $count; $j++){
                            // Kiểm tra menu cấp 3
                            $lv_3 = array();
                            for($v = 1; $v <= $count; $v++){
                                if(!empty($data['title_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''])){
                                    $lv_3[] = array('title'=>$data['title_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''], 'oder'=>$data['oder_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''],'icon'=>$data['icon_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''],'link'=>$data['link_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.''], 'oder'=>$data['oder_child_root_lv_'.$j.'_parent_'.$i.'_row_'.$v.'']);
                                }
                            }
                            // Kiểm tra menu cấp 2
                            if(!empty($data['title_child_lv_'.$j.'_parent_'.$i.''])) {
                                $lv_2[] = array('title' => $data['title_child_lv_' . $j . '_parent_' . $i . ''], 'oder' => $data['oder_child_lv_' . $j . '_parent_' . $i . ''], 'icon' => $data['icon_child_lv_' . $j . '_parent_' . $i . ''], 'link' => $data['link_child_lv_' . $j . '_parent_' . $i . ''],'level_3'=>$lv_3);
                            }

                        }
                        // tạo mãng lưu dữ liệu nhập vào
                        $lv_1[] = array('title'=>$data['title_parent_'.$i.''], 'oder'=>$data['parent_order_'.$i.''],'icon'=>$data['parent_icon_'.$i.''],'link'=>$data['parent_link_'.$i.''],'level_2'=>$lv_2);
                    }
                }
                $this->model_design_menu->deleteAllMenu($menu_id);
                $this->model_design_menu->UpdateChildMenu($lv_1,$menu_id);
            }
            $this->redirect($this->url->link('design/menu/update_menu', '&category_id='.$this->request->get['category_id'].'&type='.$this->request->get['type'].'&type_menu='.$this->request->get['type_menu'].'&id='.$menu_id.'&token=' . $this->session->data['token']));
        }
        $this->getFormEdit();
    }
    public function getFormEdit(){
        $this->load->model('tool/image');
        $this->data['heading_title_menu'] = $this->language->get('heading_title_menu');

        $this->data['entry_name_menu'] = $this->language->get('entry_name_menu');
        $this->data['entry_header_title'] = $this->language->get('entry_header_title');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['text_category_menu'] = $this->language->get('text_category_menu');
        $this->data['text_category_order'] = $this->language->get('text_category_order');
        $this->data['text_category_display'] = $this->language->get('text_category_display');
        $this->data['static_menu'] = $this->language->get('static_menu');
        $this->data['dropdown_menu'] = $this->language->get('dropdown_menu');
        $this->data['mega_menu'] = $this->language->get('mega_menu');
        $this->data['text_error_menu_oder'] = $this->language->get('text_error_menu_oder');
        $this->data['text_category_scroll'] = $this->language->get('text_category_scroll');

        $this->data['text_error_menu_name'] = $this->language->get('text_error_menu_name');
        $this->data['text_error_menu_main_title'] = $this->language->get('text_error_menu_main_title');
        $this->data['text_error_menu_status'] = $this->language->get('text_error_menu_status');
        $this->data['text_error_menu_cat'] = $this->language->get('text_error_menu_cat');
        $this->data['text_error_title'] = $this->language->get('text_error_title');
        $this->data['text_error_oder'] = $this->language->get('text_error_oder');
        $this->data['text_error_icon'] = $this->language->get('text_error_icon');
        $this->data['text_error_link'] = $this->language->get('text_error_link');

        $this->data['text_category_menu_one'] = $this->language->get('text_category_menu_one');
        $this->data['text_category_menu_two'] = $this->language->get('text_category_menu_two');
        $this->data['text_category_menu_three'] = $this->language->get('text_category_menu_three');
        $this->data['text_category_menu_img'] = $this->language->get('text_category_menu_img');
        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');
        if(isset($this->request->get['category_id'])){
            $this->data['cat_detail'] =  $this->getTitle($this->request->get['category_id']);
        }

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $this->data['error_name'] = $this->error['name'];
        } else {
            $this->data['error_name'] = '';
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

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_menu_category'),
            'href'      => $this->url->link('design/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (isset($this->request->get['id'])) {
            $this->data['action'] = $this->url->link('design/menu/update_menu', 'category_id='.$this->request->get['category_id'].'&id='.$this->request->get['id'].'&type='.$this->request->get['type'].'&type_menu='.$this->request->get['type_menu'].'&token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, 'SSL');
        }
        $this->data['cancel'] = $this->url->link('design/menu/update','&id='.(isset($this->request->get['type_menu']) ? $this->request->get['type_menu'] : '').'&type='.(isset($this->request->get['type']) ? $this->request->get['type'] : '').'&token='.$this->session->data['token']);
        if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $menu_info = $this->model_design_menu->getMenu($this->request->get['id']);
            $this->data['menu_info'] = $menu_info;
        }
//        print_r($menu_info);exit;
        $this->data['token'] = $this->session->data['token'];
        $this->template = 'design/menu_form_edit.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
}?>