<?php 
function filterTour($this,$tour_id) {
	$tour3n = '90,97,122,135,139,144,156,159,223,235,240,248,290,334,345,346,353,356,357,359,360,365,388,411,441,449,475,486,491,503,50';

	$tour1n = $this->config->get('khmsg1nevendl_product').','.$this->config->get('khmmt1nevendl_product').','.$this->config->get('khmvt1nevendl_product').','.$this->config->get('khmpq1nevendl_product').','.$this->config->get('khmpt1nevendl_product').','.$this->config->get('khmdl1nevendl_product').','.$this->config->get('khmnt1nevendl_product').','.$this->config->get('khmdn1nevendl_product').','.$this->config->get('khmha1nevendl_product').','.$this->config->get('khmhue1nevendl_product').','.$this->config->get('khmhn1nevendl_product').','.$this->config->get('khmhl1nevendl_product').','.$this->config->get('khmsp1nevendl_product').','.$tour3n;
	
	$tour4up = $this->config->get('khmsg3nevendl_product').','.$this->config->get('khmsg6nevendl_product').','.$this->config->get('khmmt3nevendl_product').','.$this->config->get('khmmt6nevendl_product').','.$this->config->get('khmvt3nevendl_product').','.$this->config->get('khmvt6nevendl_product').','.$this->config->get('khmpq3nevendl_product').','.$this->config->get('khmpq6nevendl_product').','.$this->config->get('khmpt3nevendl_product').','.$this->config->get('khmpt6nevendl_product').','.$this->config->get('khmdl3nevendl_product').','.$this->config->get('khmdl6nevendl_product').','.$this->config->get('khmnt3nevendl_product').','.$this->config->get('khmnt6nevendl_product').','.$this->config->get('khmdn3nevendl_product').','.$this->config->get('khmdn6nevendl_product').','.$this->config->get('khmha3nevendl_product').','.$this->config->get('khmha6nevendl_product').','.$this->config->get('khmhue3nevendl_product').','.$this->config->get('khmhue6nevendl_product').','.$this->config->get('khmhn3nevendl_product').','.$this->config->get('khmhn6nevendl_product').','.$this->config->get('khmhl3nevendl_product').','.$this->config->get('khmhl6nevendl_product').','.$this->config->get('khmsp3nevendl_product').','.$this->config->get('khmsp6nevendl_product');

	$tour1nto3n = explode(',', $tour1n);
	$tour4n = explode(',', $tour4up);

	if(in_array($product_id,$tour1nto3n) == true){
		return 0;
	}elseif(in_array($product_id,$tour1nto3n) == false && in_array($product_id,$tour4n) == true){
		return 1;
	}
	return false;
}
?>