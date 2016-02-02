<?php
class ModelDesignBanner extends Model {	
	public function getBanner($banner_id,$current_date) {
		$query = $this->db->query("
                                    SELECT * FROM " . DB_PREFIX . "banner_image bi
                                    LEFT JOIN " . DB_PREFIX . "banner_image_description bid
                                    ON (bi.banner_image_id  = bid.banner_image_id)
                                    WHERE bi.banner_id = '" . (int)$banner_id . "'
                                    AND  '".$current_date."' <= bi.end_date
                                    AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "'
                                    ORDER BY bi.oder ASC
                                    ");
        return $query->rows;
	}
    public function getBannerDefault($banner_id) {
        $query = $this->db->query("
                                    SELECT * FROM " . DB_PREFIX . "banner_image bi
                                    LEFT JOIN " . DB_PREFIX . "banner_image_description bid
                                    ON (bi.banner_image_id  = bid.banner_image_id)
                                    WHERE bi.banner_id = '" . (int)$banner_id . "'
                                    AND bi.start_date = '0000-00-00'
                                    AND bi.end_date = '0000-00-00'
                                    AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "'
                                    ORDER BY bi.oder ASC
                                    ");
        return $query->rows;
    }
    /* Khoa Add This*/
    public function getBannerMobile($banner_id,$current_date) {
        $query = $this->db->query("
                                    SELECT * FROM " . DB_PREFIX . "banner_image bi
                                    LEFT JOIN " . DB_PREFIX . "banner_image_description bid
                                    ON (bi.banner_image_id  = bid.banner_image_id)
                                    WHERE bi.banner_id = '" . (int)$banner_id . "'
                                    AND bi.start_date <= '".$current_date."' 
                                    AND bi.end_date >= '".$current_date."'
                                    AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "'
                                    ORDER BY bi.oder ASC
                                    ");
        return $query->rows;
    }
    /* Khoa End*/
}
?>