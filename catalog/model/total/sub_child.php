<?php
class ModelTotalSubChild extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->language->load('total/sub_child');
		
		$sub_child ='';
		//am lich
		$time_start = strtotime($this->language->get('promotion1_date_start'));
		$time_end = strtotime($this->language->get('promotion1_date_end'));
		
		/*//duong lich
		$time_start_dl = strtotime($this->language->get('promotion_date_start'));
		$time_end_dl = strtotime($this->language->get('promotion_date_end'));*/
		
		//gio to
		$time_start_dl = strtotime($this->language->get('promotion_date_start'));
		$time_end_dl = strtotime($this->language->get('promotion_date_end'));
		
		$date_array = $person_array = $person_child_array = $person_child_dl_array = $duration_dl_array = array();
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
					if(strpos($option['name'],'trẻ em')){
						$person_child_dl_array = array_merge($person_child_dl_array,array($product['quantity']));
						$duration_dl_array = array_merge($duration_dl_array,array($product['duration']));
					}
				}else{
					if(strpos($option['name'],'trẻ em')){
						$person_child_dl_array = array_merge($person_child_dl_array,array(''));
						$duration_dl_array = array_merge($duration_dl_array,array(''));
					}
				}*/
				
				//gio to
				if($option['type'] == 'checkbox' && $option['category'] == '1' && $option['class'] == '0'){
					if(strpos($option['name'],'trẻ em')){
						$person_child_dl_array = array_merge($person_child_dl_array,array($product['quantity']));
						$duration_dl_array = array_merge($duration_dl_array,array($product['duration']));
					}
				}else{
					if(strpos($option['name'],'trẻ em')){
						$person_child_dl_array = array_merge($person_child_dl_array,array(''));
						$duration_dl_array = array_merge($duration_dl_array,array(''));
					}
				}
				
				//am lich
				if($option['type'] == 'checkbox' && $option['category'] == '2' && $option['class'] == '0'){
					if(strpos($option['name'],'người lớn')){
						$person_array = array_merge($person_array,array($product['quantity']));
					}
					
					if(strpos($option['name'],'trẻ em')){
						$person_child_array = array_merge($person_child_array,array($product['quantity']));
					}
				}else{
					if(strpos($option['name'],'người lớn')){
						$person_array = array_merge($person_array,array(''));
					}
					
					if(strpos($option['name'],'trẻ em')){
						$person_child_array = array_merge($person_child_array,array(''));
					}
				}
				
			}
		}
		foreach($date_array as $k=>$date){
			/*//duong lich
			if(isset($date) && isset($person_child_dl_array[$k]) && isset($duration_dl_array[$k])){
				$time = strtotime(date_to_time($date));
				if($time >= $time_start_dl && $time <= $time_end_dl){
					$duration = explode(' ',$duration_dl_array[$k]);
					$duration = $duration[0];
					$datetime_promo = floor(($time - time())/86400);
					if($datetime_promo >= 2 && $datetime_promo <= 4){
						if($duration <= 1){
							$sub_child += - $person_child_dl_array[$k] * 40000;
						}elseif($duration >= 2 && $duration <= 5){
							$sub_child += - $person_child_dl_array[$k] * 75000;
						}elseif($duration > 5){
							$sub_child += - $person_child_dl_array[$k] * 110000;
						}
					}elseif($datetime_promo >= 5 && $datetime_promo <= 7){
						if($duration <= 1){
							$sub_child += - $person_child_dl_array[$k] * 45000;
						}elseif($duration >= 2 && $duration <= 5){
							$sub_child += - $person_child_dl_array[$k] * 80000;
						}elseif($duration > 5){
							$sub_child += - $person_child_dl_array[$k] * 115000;
						}
					}elseif($datetime_promo >= 8){
						if($duration <= 1){
							$sub_child += - $person_child_dl_array[$k] * 50000;
						}elseif($duration >= 2 && $duration <= 5){
							$sub_child += - $person_child_dl_array[$k] * 85000;
						}elseif($duration > 5){
							$sub_child += - $person_child_dl_array[$k] * 120000;
						}
					}
				}
			}*/
			
			//gio to
			if(isset($date) && isset($person_child_dl_array[$k]) && isset($duration_dl_array[$k])){
				$time = strtotime(date_to_time($date));
				if($time >= $time_start_dl && $time <= $time_end_dl){
					$duration = explode(' ',$duration_dl_array[$k]);
					$duration = $duration[0];
					if($duration <= 1){
						$sub_child += - $person_child_dl_array[$k] * 40000;
					}
					elseif($duration >= 2 && $duration <= 3){
						$sub_child += - $person_child_dl_array[$k] * 90000;
					}
					elseif($duration >= 4 && $duration <= 6){
						$sub_child += - $person_child_dl_array[$k] * 140000;
					}
					elseif($duration > 5){
						$sub_child += - $person_child_dl_array[$k] * 190000;
					}
				}
			}
			
			//am lich
			if(isset($date) && isset($person_array[$k]) && isset($person_child_array[$k])){
				$time = strtotime(date_to_time($date));
				if($time >= $time_start && $time <= $time_end){
					if($person_array[$k] >= 2 && $person_array[$k] <= 4){
						$sub_child += - $person_child_array[$k] * 50000;
					}elseif($person_array[$k] >= 5 && $person_array[$k] <= 7){
						$sub_child += - $person_child_array[$k] * 75000;
					}elseif($person_array[$k] > 7){
						$sub_child += - $person_child_array[$k] * 100000;
					}
				}
			}
		}
		
		$total_data[] = array( 
			'code'       => 'sub_child',
			'title'      => $this->language->get('text_sub_child'),
			'text'       => $this->currency->format($sub_child),
			'value'      => $sub_child,
			'sort_order' => $this->config->get('sub_child_sort_order')
		);
		
		//$total += $sub_child;
	}
}
?>