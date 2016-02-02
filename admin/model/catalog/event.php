<?php
    class ModelCatalogEvent extends Model{
        public function getListEvent(){
            $query = $this->db->query("SELECT * FROM ".DB_PREFIX."event");
            return $query->rows;
        }
        public function insertNewEvent($khtetamlich_customtitle,$event_name,$customtitle,$khtetamlich_metakey,$seo_url,$khtetamlich_metadesc,$khtetamlich_desc,$event_code,$date_show,$start_date,$end_date,$status){
            $query = $this->db->query("INSERT INTO `vf_event` (`id`, `event_title`, `event_name`,`customtitle`, `event_keywords`, `event_seo`, `event_description`, `event_contents`, `event_code`, `event_show`, `event_start`, `event_end`, `status`)
                                        VALUES (NULL, '".$khtetamlich_customtitle."', '".$event_name."', '".$customtitle."', '".$khtetamlich_metakey."', '".$seo_url."', '".$khtetamlich_metadesc."', '".$khtetamlich_desc."', '".$event_code."', '".$date_show."', '".$start_date."', '".$end_date."', '".$status."');");

           
            $last_id =$this->db->getLastId();
             /* Khoa bo xung SEO URL cho Event */
             $this->db->query("INSERT INTO `vf_url_alias` (`url_alias_id`,`query`, `keyword`) VALUES (NULL,'event_id=" .$last_id."', '".$seo_url."')");
            /* Khoa End */
            return   $last_id;
        }
        public function UpdateEvent($event_id,$khtetamlich_customtitle,$event_name,$customtitle,$khtetamlich_metakey,$seo_url,$khtetamlich_metadesc,$khtetamlich_desc,$event_code,$date_show,$start_date,$end_date,$status){
            $query = $this->db->query("UPDATE `vf_event`
                                        SET `event_title` = '".$khtetamlich_customtitle."', `event_name` = '".$event_name."', `customtitle` = '".$customtitle."', `event_keywords` = '".$khtetamlich_metakey."', `event_seo` = '".$seo_url."', `event_description` = '".$khtetamlich_metadesc."', `event_contents` = '".$khtetamlich_desc."', `event_code` = '".$event_code."',`event_show` = '".$date_show."',`event_start` = '".$start_date."',`event_end` = '".$end_date."',`status` = '".$status."' WHERE `vf_event`.`id` = '".$event_id."'");
            /* Khoa bo xung SEO URL cho Event */
            $this->db->query("UPDATE `vf_url_alias` SET `keyword` = '".$seo_url."' WHERE `vf_url_alias`.`query` ='event_id=".$event_id."'");
            /* Khoa End*/
        }
        public function getLocation(){
            $query = $this->db->query("SELECT * FROM ".DB_PREFIX."event_location");
            return $query->rows;
        }
        public function insertEventGroup($v,$event_id,$location,$name,$value){
            $this->db->query("INSERT INTO `vf_event_group` (`id`, `event_id`, `location`, `name`, `value`, `order`) VALUES (NULL, '".$event_id."', '".$location."', '".$name."', '".$value."','".$v."')");
        }
        public function deleteEventGroup($event_id){
            $this->db->query("DELETE FROM `".DB_PREFIX."event_group` WHERE `".DB_PREFIX."event_group`.`event_id` = '".$event_id."'");
        }
        public function deleteEvent($id){
             $this->db->query("DELETE FROM `".DB_PREFIX."event` WHERE `".DB_PREFIX."event`.`id` = '".$id."'");
            $this->db->query("DELETE FROM `".DB_PREFIX."event_group` WHERE `".DB_PREFIX."event_group`.`event_id` = '".$id."'");
            /* Khoa bo xung SEO URL cho Event */
            $this->db->query("DELETE FROM `".DB_PREFIX."url_alias` WHERE `".DB_PREFIX."url_alias`.`query` = 'event_id=".$id."'");
            /* Khoa End*/
        }
        public function getDescriptionEvent($id){
            $query = $this->db->query("SELECT * FROM ".DB_PREFIX."event WHERE id=".$id);
            return $query->rows;
        }
        public function getDescriptionEventLocation($id){
            $query = $this->db->query("SELECT * FROM ".DB_PREFIX."event_group WHERE event_id=".$id." ORDER BY `".DB_PREFIX."event_group`.`order` ASC");
            return $query->rows;
        }
        public function getProductDescription($_id){
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id=".(int)$_id);
            return $query->row;
        }
        /*Minh - get gia saleoff order tai dashbroad*/
        public function getOrderSaleOff($order_id) {
            $query = $this->db->query("SELECT * FROM ".DB_PREFIX."event_order_saleoff WHERE order_id='".(int)$order_id."'");
            return $query->row;
        }
    }
?>