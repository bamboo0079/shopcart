<?php
class ControllerModuleCommonImg extends Controller {
    protected function index($setting) {
        $this->language->load('module/common_img');
        $this->load->model('catalog/common_img');
        $this->load->model('tool/image');
        if(isset($setting['id'])){
            $id = $setting['id'];
            $this->data['description'] = $this->model_catalog_common_img->getDescription($id);

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/common_img.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/module/common_img.tpl';
            } else {
                $this->template = 'default/template/module/common_img.tpl';
            }
            $this->render(); //
        }
    }
}
?>