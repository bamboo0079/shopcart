<?php
class ModelTotalSubPerson extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->language->load('total/sub_person');
		//$this->cart->clear();
		$sub_person ='';
		//am lich
		$time_start = strtotime($this->language->get('promotion1_date_start'));
		$time_end = strtotime($this->language->get('promotion1_date_end'));
		
		/*//duong lich
		$time_start_dl = strtotime($this->language->get('promotion_date_start'));
		$time_end_dl = strtotime($this->language->get('promotion_date_end'));*/
		
		//gio to
		$time_start_dl = strtotime($this->language->get('promotion_date_start'));
		$time_end_dl = strtotime($this->language->get('promotion_date_end'));
		
		$date_array = $person_array = $person_dl_array = $duration_dl_array = array();
		$date_cur = '';
		foreach ($this->cart->getProducts() as $product) {
			foreach($product['option'] as $option){
				
				if($option['type'] == 'date'){
					if($option['option_value'] != $date_cur){
						$date_array = array_merge($date_array,array($option['option_value']));
					}
					$date_cur = $option['option_value'];
				}
				
				/*//duong lich
				if($option['type'] == 'checkbox' && $option['category'] == '1' && $option['class'] == '0'){
					if(strpos($option['name'],'người lớn')){
						$person_dl_array = array_merge($person_dl_array,array($product['quantity']));
						$duration_dl_array = array_merge($duration_dl_array,array($product['duration']));
					}
				}else{
					if(strpos($option['name'],'người lớn')){
						$person_dl_array = array_merge($person_dl_array,array(''));
						$duration_dl_array = array_merge($duration_dl_array,array(''));
					}
				}*/
				
				//gio to
				if($option['type'] == 'checkbox' && $option['category'] == '1' && $option['class'] == '0'){
					if(strpos($option['name'],'người lớn')){
						$person_dl_array = array_merge($person_dl_array,array($product['quantity']));
						$duration_dl_array = array_merge($duration_dl_array,array($product['duration']));
					}
				}else{
					if(strpos($option['name'],'người lớn')){
						$person_dl_array = array_merge($person_dl_array,array(''));
						$duration_dl_array = array_merge($duration_dl_array,array(''));
					}
				}
				
				//am lich
				if($option['type'] == 'checkbox' && $option['category'] == '2' && $option['class'] == '0'){
					if(strpos($option['name'],'người lớn')){
						$person_array = array_merge($person_array,array($product['quantity']));
					}
				}else{
					if(strpos($option['name'],'người lớn')){
						$person_array = array_merge($person_array,array(''));
					}
				}
			}
		}
	
		foreach($date_array as $k=>$date){
			/*//duong lich
			if(isset($date) && isset($person_dl_array[$k]) && isset($duration_dl_array[$k])){
				$time = strtotime(date_to_time($date));
				if($time >= $time_start_dl && $time <= $time_end_dl){
					$duration = explode(' ',$duration_dl_array[$k]);
					$duration = $duration[0];
					$datetime_promo = floor(($time - time())/86400);
					if($datetime_promo >= 2 && $datetime_promo <= 4){
						if($duration <= 1){
							$sub_person += - $person_dl_array[$k] * 80000;
						}elseif($duration >= 2 && $duration <= 5){
							$sub_person += - $person_dl_array[$k] * 150000;
						}elseif($duration > 5){
							$sub_person += - $person_dl_array[$k] * 220000;
						}
					}elseif($datetime_promo >= 5 && $datetime_promo <= 7){
						if($duration <= 1){
							$sub_person += - $person_dl_array[$k] * 90000;
						}elseif($duration >= 2 && $duration <= 5){
							$sub_person += - $person_dl_array[$k] * 160000;
						}elseif($duration > 5){
							$sub_person += - $person_dl_array[$k] * 230000;
						}
					}elseif($datetime_promo >= 8){
						if($duration <= 1){
							$sub_person += - $person_dl_array[$k] * 100000;
						}elseif($duration >= 2 && $duration <= 5){
							$sub_person += - $person_dl_array[$k] * 170000;
						}elseif($duration > 5){
							$sub_person += - $person_dl_array[$k] * 240000;
						}
					}
				}
			}*/
			
			//gio to
			if(isset($date) && isset($person_dl_array[$k]) && isset($duration_dl_array[$k])){
				$time = strtotime(date_to_time($date));
				if($time >= $time_start_dl && $time <= $time_end_dl){
					$duration = explode(' ',$duration_dl_array[$k]);
					$duration = $duration[0];
					//echo $duration;
					if($duration <= 1){
						$sub_person += - $person_dl_array[$k] * 80000;
					}
					elseif($duration >= 2 && $duration <= 3){
						$sub_person += - $person_dl_array[$k] * 180000;
					}
					elseif($duration >= 4 && $duration <= 6){
						$sub_person += - $person_dl_array[$k] * 280000;
					}
					elseif($duration >= 7){
						$sub_person += - $person_dl_array[$k] * 380000;
					}
				}
			}
			
			//am lich
			if(isset($date) && isset($person_array[$k])){
				$time = strtotime(date_to_time($date));
				if($time >= $time_start && $time <= $time_end){
					if($person_array[$k] >= 2 && $person_array[$k] <= 4){
						$sub_person += - $person_array[$k] * 100000;
					}elseif($person_array[$k] >= 5 && $person_array[$k] <= 7){
						$sub_person += - $person_array[$k] * 150000;
					}elseif($person_array[$k] > 7){
						$sub_person += - $person_array[$k] * 200000;
					}
				}
			}
		}
		$total_data[] = array( 
			'code'       => 'sub_person',
			'title'      => $this->language->get('text_sub_person'),
			'text'       => $this->currency->format($sub_person),
			'value'      => $sub_person,
			'sort_order' => $this->config->get('sub_person_sort_order')
		);
		
		//$total += $sub_person;
	}
}
?>