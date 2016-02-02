<?php
class ControllerModuleCommonNews extends Controller {
    protected function index($setting) {
        $this->language->load('module/news_latest');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['button_cart'] = $this->language->get('button_cart');

        $this->load->model('catalog/news');

        $this->load->model('tool/image');
        $this->load->model('catalog/common_menu');

        $this->data['news'] = array();
        $attr = array('limit'=>5,'image_width'=>80,'image_height'=>80);
        $setting = array_merge($setting,$attr);

        $check_news = $this->model_catalog_news->checkDisplay($setting['id'],$setting['type']);

        $link = explode('/',$_SERVER['REQUEST_URI']);
        $keyword = $link[1];

        $check_category = $this->model_catalog_common_menu->checkAliasCat($keyword);
        if(isset($check_category['query'])){
            $key_word = explode('=',$check_category['query']);
            $category_id =  explode($key_word[0].'=',$check_category['query']);
            if(isset($check_news['category']) && $category_id[1] == $check_news['category']){
                $data = array(
                    'sort'  => 'n.date_added',
                    'order' => 'DESC',
                    'start' => 0,
                    'limit' => $setting['limit']
                );

                $results = $this->model_catalog_news->getNewss($data);


                foreach ($results as $result) {
                    $width = ''; $height = '';
                    if ($result['image']) {
                        $image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    } else {
                        $firstImgnews = catchFirstImage(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
                        if($firstImgnews == 'no_image.jpg'){
                            $image = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                        }else{
                            $image = $firstImgnews; $width = 'width="'.$this->config->get('config_image_product_width').'"'; $height = 'height="'.$this->config->get('config_image_product_height').'"';
                        }
                    }

                    $this->data['news'][] = array(
                        'news_id'  => $result['news_id'],
                        'thumb'       => $image,
                        'name'        => $result['name'],
                        'date_added'       => date('D, '.$this->language->get('date_format_short'), strtotime($result['date_added'])),
                        'width'      => $width,
                        'height'      => $height,
                        'viewed'      => sprintf($this->language->get('text_viewed'), (int)$result['viewed']),
                        'href'        => $this->url->link('news/news', 'news_id=' . $result['news_id'])
                    );
                }
                if(file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/module/common_news.tpl')){
                    $this->template = $this->config->get('config_template').'/template/module/common_news.tpl';
                }
                $this->render();
            }
        }

    }
}
?>