<?php
    class ControllerDesignRandomNews extends Controller{
        public function index(){
            $this->load->model('design/random_news');
            $this->data['token'] = $this->session->data['token'];
            $this->data['action'] = $this->url->link('design/random_news/process','token='.$this->session->data['token']);
            $this->data['home_link'] = $this->url->link('common/home','token='.$this->session->data['token']);
            $query = $this->model_design_random_news->getRandomNews();
            if(!empty($query)){
                $this->data['older_link'] = $this->url->link('design/random_news/process','token='.$this->session->data['token']);
            }

            $this->data['category_link'] = $this->url->link('design/random_news','token='.$this->session->data['token']);
            $this->template = "design/random_news.tpl";
            $this->children = array(
                "common/header",
                "common/footer"
            );
            $this->response->setOutput($this->render());
        }
        public function process(){
            $this->load->model('design/random_news');
            $this->data['home_link'] = $this->url->link('common/home','token='.$this->session->data['token']);
            $this->data['category_link'] = $this->url->link('design/random_news','token='.$this->session->data['token']);
            $this->data['category_delete'] = $this->url->link('design/random_news/delete_random','token='.$this->session->data['token']);
            $data = $this->request->post;
            if(!empty($data)){
                $val = $data['huge']['session'];
                $arr_session = array();
                for($i=0;$i<count($val);$i++){
                    $tmp = -1;
                    foreach($val as $key=>$row){
                        if($tmp<0){
                            $tmp = $key;
                        }
                        $arr_session[$i][] = $row;
                    }
                    array_push($val, $val[$tmp]);
                    unset($val[$tmp]);
                }
                $this->data['huge'] = $arr_session;
                unset($data['huge']['session']);
                $data = $data['huge'];
                $n=count($data);
                $rs = array();
                for($i=0;$i < $n ;$i++){
                    foreach($data as $arr_key=>$arr_val){
                        if($i>0){
                            if(isset($data[$arr_key+$i])){
                                $arr_val = $data[$arr_key+$i];
                            }elseif(isset($data[($arr_key+$i)%$n])){
                                $arr_val = $data[($arr_key+$i)%$n];
                            }
                        }
                            $t = count($arr_val);
                        foreach($arr_val as $k=>$v){
                            if($i > 0){
                                if(isset($arr_val[$k+$i])){
                                    $v = $arr_val[$k+$i];
                                }elseif(isset($arr_val[($k+$i)%$t])){
                                    $v = $arr_val[($k+$i)%$t];
                                }
                            }
                            $rs[$i][$arr_key][$k] = $v;

                        }
                    }
                }
                $huge = json_encode($arr_session);
                $small = json_encode($rs);
                $this->data['child'] = $rs;
                $this->model_design_random_news->insertRandom($huge,$small);
            }else{
                $query = $this->model_design_random_news->getRandomNews();
                $this->data['huge'] = (array)json_decode($query['large_session']);

                $data = (array)json_decode($query['small_session']);
                $str = array();
                $i = 0;
                foreach($data as $_value){
                    $v = 1;
                    foreach($_value as $_items){
                        $str[$i][$v] = (array)$_items;
                    $v++; }
                $i++; }
                $this->data['child'] = $str;
            }
            $this->data['token'] = $this->session->data['token'];
            $this->template = "design/process_random_news.tpl";
            $this->children = array(
                "common/header",
                "common/footer"
            );
            $this->response->setOutput($this->render());

        }
        public function delete_random(){
            $this->load->model('design/random_news');
            $this->model_design_random_news->deleteRandom();
            $this->redirect('index.php?route=design/random_news&token='.$this->session->data['token']);
        }
    }
?>



