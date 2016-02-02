<?php
    class ControllerModuleEvent extends Controller{
        private $error = array();
        public function index(){
            $this->load->language('module/event');

            $this->load->model('design/layout');

            $this->load->model('catalog/event');

            $this->data['layouts'] = $this->model_design_layout->getLayouts();

            $this->data['link_add'] = $this->url->link('module/event/add_new','token='.$this->session->data['token'],'SSL');


            $this->data['breadcrumbs'] = array();

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_home'),
                'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => false
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_module'),
                'href'      => $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );


            $this->document->setTitle($this->language->get('title'));
            $this->data['text_module'] = $this->language->get('text_module');
            $this->data['heading_title'] = $this->language->get('heading_title');
            $this->data['button_add'] = $this->language->get('button_add');
            $this->data['button_delete'] = $this->language->get('button_delete');
            $this->data['event_name'] = $this->language->get('event_name');
            $this->data['status'] = $this->language->get('status');
            $this->data['action'] = $this->language->get('action');
            $this->data['event_edit'] = $this->language->get('event_edit');
            $this->data['event_code'] = $this->language->get('event_code');


            if (isset($this->session->data['error']) && !empty($this->session->data['error'])) {
                $this->data['error'] = $this->session->data['error'];
                unset($this->session->data['error']);
            } else {
                $this->data['error'] = '';
            }

            if (isset($this->session->data['success'])) {
                $this->data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $this->data['success'] = '';
            }


            $event_list = $this->model_catalog_event->getListEvent();
            if(!empty($event_list)){

                for($i = 0; $i < count($event_list); $i++){
                    if(isset($event_list[$i]['edit_link'])) {
                        $event_list[$i]['edit_link'] = $this->url->link('module/event/event_edit&id=' . $event_list[$i]['event_id'] . '', 'token=' . $this->session->data['token'], 'SSL');
                        $event_list[$i]['delete_link'] = $this->url->link('module/event/event_delete&id=' . $event_list[$i]['event_id'] . '', 'token=' . $this->session->data['token'], 'SSL');
                    }
                }
            }
            $this->data['event_list'] =  $event_list;
            $this->data['action_form'] = $this->url->link('module/event/delete_event','token='.$this->session->data['token'],'SSL');

//            print_r($data['action']);exit;

            $this->template = 'event/event.tpl';
            $this->children = array(
                'common/header',
                'common/footer'
            );

            $this->response->setOutput($this->render());
        }
        public function delete_items(){
            $this->load->model('catalog/event');
            $this->model_catalog_event->deleteEvent($_GET['id']);
            $this->session->data['success'] = $this->language->get('Success: Xóa sự kiện thành công !');
            $this->redirect($this->url->link('event/event', 'token=' . $this->session->data['token'], 'SSL'));
        }
        public function delete_event(){
            $this->load->model('catalog/event');
            $data = $this->request->post;
            for($i = 0; $i < count($data['selected']);$i++){
                $this->model_catalog_event->deleteEvent($data['selected'][$i]);
            }
            $this->session->data['success'] = $this->language->get('Success: Xóa sự kiện thành công !');
            $this->redirect($this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'));
        }
        public function edit_event(){
            $id = $_GET['id'];

            $this->load->language('module/event');

            $this->load->model('design/layout');

            $this->load->model('catalog/event');

            $this->data['layouts'] = $this->model_design_layout->getLayouts();

            $this->data['link_add'] = $this->url->link('module/event/add_new','token='.$this->session->data['token'],'SSL');


            $this->data['breadcrumbs'] = array();

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_home'),
                'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => false
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_module'),
                'href'      => $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );
            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_event_text'),
                'href'      => $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );
            $this->data['cancel'] = $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL');

            $this->data['action'] = $this->url->link('module/event/processevent','token='.$this->session->data['token'],'SSL');
            $this->data['token'] = $this->session->data['token'];

            $this->data['text_event_text'] = $this->language->get('text_event_text');
            $this->data['button_add'] = $this->language->get('button_add');
            $this->data['button_save'] = $this->language->get('button_save');
            $this->data['button_cancel'] = $this->language->get('button_cancel');
            $this->data['event_name_title'] = $this->language->get('event_name_title');
            $this->data['event_follow'] = $this->language->get('event_follow');
            $this->data['event_time'] = $this->language->get('event_time');
            $this->data['event_start'] = $this->language->get('event_start');
            $this->data['event_end'] = $this->language->get('event_end');
            $this->data['event_url_text'] = $this->language->get('event_url_text');

            if (isset($this->session->data['error'])) {
                $this->data['error'] = $this->session->data['error'];
                unset($this->session->data['error']);
            } else {
                $this->data['error'] = '';
            }

            if (isset($this->session->data['success'])) {
                $this->data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $this->data['success'] = '';
            }

            $this->data['location'] = $this->model_catalog_event->getLocation();

            $description = $this->model_catalog_event->getDescriptionEvent($id);
            $description[0]['location'] = $this->model_catalog_event->getDescriptionEventLocation($id);
//            print_r($description[0]['location']);exit;

            for($t = 0; $t < count($description[0]['location']); $t++){
                $value = $description[0]['location'][$t]['value'];
                $id = explode(',',$value);
                $v = 0;
                foreach($id as $_id){
                    $product = $this->model_catalog_event->getProductDescription($_id);
                    $description[0]['location'][$t]['product'][$v]['id'] = $_id;
                    $description[0]['location'][$t]['product'][$v]['model'] = $product['model'];
                    $description[0]['location'][$t]['product'][$v]['name'] = $product['name'];
                    $v++;
                }
            }
//            print_r($description);exit;
            $this->data['event_description'] = $description;

            $this->template = 'event/event_add.tpl';
            $this->children = array(
                'common/header',
                'common/footer'
            );
            $this->response->setOutput($this->render());

        }
        public function add_new(){

            $this->load->language('module/event');

            $this->load->model('design/layout');

            $this->load->model('catalog/event');

            $this->data['layouts'] = $this->model_design_layout->getLayouts();

            $this->data['link_add'] = $this->url->link('module/event/add_new','token='.$this->session->data['token'],'SSL');


            $this->data['breadcrumbs'] = array();

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_home'),
                'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => false
            );

            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_module'),
                'href'      => $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );

            $this->data['cancel'] = $this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL');

            $this->data['action'] = $this->url->link('module/event/processevent','token='.$this->session->data['token'],'SSL');
            $this->data['token'] = $this->session->data['token'];

            $this->data['text_event_text'] = $this->language->get('text_event_text');
            $this->data['button_add'] = $this->language->get('button_add');
            $this->data['button_save'] = $this->language->get('button_save');
            $this->data['button_cancel'] = $this->language->get('button_cancel');
            $this->data['event_name_title'] = $this->language->get('event_name_title');
            $this->data['event_follow'] = $this->language->get('event_follow');
            $this->data['event_time'] = $this->language->get('event_time');
            $this->data['event_start'] = $this->language->get('event_start');
            $this->data['event_end'] = $this->language->get('event_end');
            $this->data['event_url_text'] = $this->language->get('event_url_text');

            if (isset($this->session->data['error'])) {
                $this->data['error'] = $this->session->data['error'];
                unset($this->session->data['error']);
            } else {
                $this->data['error'] = '';
            }

            if (isset($this->session->data['success'])) {
                $this->data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $this->data['success'] = '';
            }

            $this->data['location'] = $this->model_catalog_event->getLocation();
//            print_r($data['location']);exit;


            $this->template = 'event/event_add.tpl';
            $this->children = array(
                'common/header',
                'common/footer'
            );
            $this->response->setOutput($this->render());
        }
        public function processevent(){
            $this->load->model('catalog/event');
            if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {

                $data = $this->request->post;

                for($i=0; $i < count($data['khmntal_product']); $i ++){
                    $data['khmntal_product'][$i] = str_replace(',,','.', $data['khmntal_product'][$i]);
                    $data['khmntal_product'][$i] = str_replace(',','', $data['khmntal_product'][$i]);
                    $data['khmntal_product'][$i] = str_replace('.',',', $data['khmntal_product'][$i]);

                }
                unset($data['mntal_product']);

                unset($data['numn']);

                if(isset($data['event_id']) && !empty($data['event_id'])){

                    $this->model_catalog_event->UpdateEvent($data['event_id'],$data['khtetamlich_customtitle'],$data['event_name'],$data['khtetamlich_title'],$data['khtetamlich_metakey'],$data['seo_url'],$data['khtetamlich_metadesc'],$data['khtetamlich_desc'],$data['event_code'],$data['date_show'],$data['start_date'],$data['end_date'],$data['status']);
                    $this->model_catalog_event->deleteEventGroup($data['event_id']);
                    for($v = 0; $v < count($data['event_attr']); $v++){
//                        echo $data['khmntal_product'][$v].'<br>';
                        $this->model_catalog_event->insertEventGroup($v,$data['event_id'],$data['location'],$data['event_attr'][$v],$data['khmntal_product'][$v]);
                    }
//                    exit;
                    $this->session->data['success'] = $this->language->get('Success: Thêm sự kiện thành công !');
                    $this->redirect($this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'));

                }else{
                    unset($data['event_id']);
                    $event_id = $this->model_catalog_event->insertNewEvent($data['khtetamlich_customtitle'],$data['event_name'],$data['khtetamlich_title'],$data['khtetamlich_metakey'],$data['seo_url'],$data['khtetamlich_metadesc'],$data['khtetamlich_desc'],$data['event_code'],$data['date_show'],$data['start_date'],$data['end_date'],$data['status']);
                    for($v = 0; $v < count($data['event_attr']); $v++){
                        $this->model_catalog_event->insertEventGroup($v,$event_id,$data['location'],$data['event_attr'][$v],$data['khmntal_product'][$v]);
                    }

                    $this->session->data['success'] = $this->language->get('Success: Thêm sự kiện thành công !');
                    $this->redirect($this->url->link('module/event', 'token=' . $this->session->data['token'], 'SSL'));
                }


            }else{
                $this->session->data['success'] = $this->language->get('Success: Vui lòng nhập sự kiện !');
                $this->redirect($this->url->link('module/event/add_new', 'token=' . $this->session->data['token'], 'SSL'));
            }

        }
        public function getlinkseo(){
            $this->load->helper('write_url');
            echo removesign($_POST['value']).'.html';
        }

    }
?>