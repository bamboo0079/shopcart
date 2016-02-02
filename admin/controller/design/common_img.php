<?php
class ControllerDesignCommonImg extends Controller {
    public function index(){
        $this->load->language('design/common_img');
        $this->load->model('design/common_img');

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['entry_home'] = $this->language->get('entry_home');
        $this->data['entry_image_list'] = $this->language->get('entry_image_list');
        $this->data['entry_image_name'] = $this->language->get('entry_image_name');
        $this->data['entry_add_position'] = $this->language->get('entry_add_position');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_image_action'] = $this->language->get('entry_image_action');
        $this->data['entry_content_top'] = $this->language->get('entry_content_top');
        $this->data['entry_content_bottom'] = $this->language->get('entry_content_bottom');
        $this->data['entry_content_left'] = $this->language->get('entry_content_left');
        $this->data['entry_content_right'] = $this->language->get('entry_content_right');
        $this->data['entry_bottom_delete'] = $this->language->get('entry_bottom_delete');
        $this->data['entry_bottom_add'] = $this->language->get('entry_bottom_add');
        $this->data['text_error_width'] = $this->language->get('text_error_width');
        $this->data['text_error_height'] = $this->language->get('text_error_height');

        $this->data['home_link'] = $this->url->link('common/home','token='.$this->session->data['token']);
        $this->data['category_link'] = $this->url->link('design/common_img','token='.$this->session->data['token']);

        $this->data['add_new'] = $this->url->link('design/common_img/add_new','token='.$this->session->data['token']);
        $this->data['list_img'] = $this->model_design_common_img->getList();
//        print_r($this->data['list_img']);exit;
        $this->data['action'] = $this->url->link("design/common_img/delete", 'token='.$this->session->data['token']);
        $this->template = "design/common_img_list.tpl";
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }
    public function delete(){
        $this->load->model('design/common_img');
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            $data = $this->request->post;
            for($i = 0; $i < count($data) ; $i++){
                if(!empty($data['id'][$i])){
                    $this->model_design_common_img->deleteImg($data['id'][$i]);
                }
            }
        }elseif(isset($this->request->get['id'])){
            $this->model_design_common_img->deleteImg($this->request->get['id']);
        }

        $this->redirect($this->url->link('design/common_img','token='.$this->session->data['token']));
    }
    public function add_new(){
        $this->load->language('design/common_img');
        $this->load->model('design/common_img');
        $this->load->model('setting/setting');
        $value = $this->config->get('common_img_module');
        $this->data['cancel'] = $this->url->link('design/common_img','token='.$this->session->data['token']);
        $this->data['action'] = $this->url->link('design/common_img/add_new','token='.$this->session->data['token']);
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            $data = $this->request->post;
            for($i=0;$i < count($data['img_name']); $i++ ){
                $id =  $this->model_design_common_img->InsertImg($data['img_name'][$i],$data['link'][$i],$data['image']['img'.$i],$data['position'][$i],$data['width'][$i],$data['height'][$i],$data['status']['atc'.$i]);
                $arr_display = array(12,3,11,8,14,16,2);
                for($j=0; $j <= count($arr_display); $j++){
                    if(isset($arr_display[$j]) && !empty($arr_display[$j]) && isset($id)){
                        $arr[] = array(
                            'layout_id' => $arr_display[$j],
                            'position' => $data['position'][$i],
                            'status' => $data['status']['atc'.$i],
                            'id' => $id,
                            'name'=>$data['img_name'][$i],
                            'link'=>$data['link'][$i],
                            'width'=>$data['width'][$i],
                            'height'=>$data['height'][$i],
                            'sort_order'=>'',
                        );
                    }
                }
            }
            if(isset($value) && !empty($value)){
                $arr_for = array_merge($arr,$value);
                $arr = array('common_img_module' => $arr_for);
                $this->model_setting_setting->editSetting('common_img', $arr);
            }else{
                $arr = array('common_img_module' => $arr);
                $this->model_setting_setting->editSetting('common_img', $arr);
            }
            $this->redirect($this->url->link('design/common_img','token='.$this->session->data['token']));
        }
        $this->getForm();
    }

    public function edit(){
        $this->load->model('tool/image');
        $this->load->model('design/common_img');
        $this->load->model('setting/setting');
        $id = $this->request->get['id'];
        if($this->request->server['REQUEST_METHOD'] == 'POST'){
            $data = $this->request->post;
            $query = $this->model_design_common_img->getSetting('common_img');
            if(empty($query)){
                $arr_display = array(12,3,11,8,14,16,2);
                for($j=0; $j <= count($arr_display); $j++){
                    if(isset($arr_display[$j]) && !empty($arr_display[$j]) && isset($id)){
                        $arr[] = array(
                            'layout_id' => $arr_display[$j],
                            'position' => $data['position'][0],
                            'status' => $data['status']['atc0'],
                            'id' => $this->request->get['id'],
                            'name'=>$data['img_name'][0],
                            'link'=>$data['link'][0],
                            'width'=>$data['width'][0],
                            'height'=>$data['height'][0],
                            'sort_order'=>'',
                        );
                    }
                }
                $str = array('common_img_module'=>$arr);
                $this->model_setting_setting->SettingAddnew('common_img', $str);
            }elseif(!empty($query)){
                $i = 0;
                $modules = $this->config->get('common_img_module');
                foreach($modules as $key =>$_items){
                    if($_items['id']==$this->request->get['id']){
                        $modules[$i]['name'] = $data['img_name'][0];
                        $modules[$i]['link'] = $data['link'][0];
                        $modules[$i]['position'] = $data['position'][0];
                        $modules[$i]['status'] = $data['status']['atc0'];
                        $modules[$i]['width'] = $data['width'][0];
                        $modules[$i]['height'] = $data['height'][0];
                    }
                    $i ++;}

                $str = array('common_img_module'=>$modules);
                $this->model_setting_setting->editSetting('common_img', $str);
            }

            $this->model_design_common_img->UpdateImg($this->request->get['id'], $data);
            $this->redirect($this->url->link('design/common_img/edit','id='.$id.'&token='.$this->session->data['token']));
        }
        $this->data['action'] = $this->url->link('design/common_img/edit','id='.$id.'&token='.$this->session->data['token']);
        $this->data['description'] = $this->model_design_common_img->getDescription($id);
        $this->getForm();
    }
    public function getForm(){
        $this->load->language('design/common_img');
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_error_img_name'] = $this->language->get('text_error_img_name');
        $this->data['entry_img_name'] = $this->language->get('entry_img_name');
        $this->data['entry_img_status'] = $this->language->get('entry_img_status');
        $this->data['entry_img_enable'] = $this->language->get('entry_img_enable');
        $this->data['entry_img_disable'] = $this->language->get('entry_img_disable');
        $this->data['entry_content_top'] = $this->language->get('entry_content_top');
        $this->data['entry_content_bottom'] = $this->language->get('entry_content_bottom');
        $this->data['entry_content_left'] = $this->language->get('entry_content_left');
        $this->data['entry_content_right'] = $this->language->get('entry_content_right');
        $this->data['entry_add_new'] = $this->language->get('entry_add_new');
        $this->data['entry_add_position'] = $this->language->get('entry_add_position');
        $this->data['entry_img_add_list'] = $this->language->get('entry_img_add_list');
        $this->data['entry_home'] = $this->language->get('entry_home');
        $this->data['entry_add_size'] = $this->language->get('entry_add_size');
        $this->data['entry_add_width'] = $this->language->get('entry_add_width');
        $this->data['entry_add_height'] = $this->language->get('entry_add_height');
        $this->data['text_error_width'] = $this->language->get('text_error_width');
        $this->data['text_error_height'] = $this->language->get('text_error_height');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['entry_name_menu'] = $this->language->get('entry_name_menu');
        $this->data['entry_header_title'] = $this->language->get('entry_header_title');
        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');
        $this->data['entry_img_link'] = $this->language->get('entry_img_link');
        $this->data['text_error_link'] = $this->language->get('text_error_link');

        $this->data['home_link'] = $this->url->link('common/home','token='.$this->session->data['token']);
        $this->data['category_link'] = $this->url->link('design/common_img','token='.$this->session->data['token']);

        $this->data['token'] = $this->session->data['token'];
        if (isset($this->request->post['category_module'])) {
            $this->data['modules'] = $this->request->post['category_module'];
        } elseif ($this->config->get('category_module')) {
            $this->data['modules'] = $this->config->get('category_module');
        }

        $this->template = "design/common_img_form.tpl";
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());

    }
}
?>