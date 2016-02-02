<?php

class ModelCatalogProduct extends Model {

	public function updateViewed($product_id) {

		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = (viewed + 1) WHERE product_id = '" . (int)$product_id . "'");

	}



	public function getNewProductXML(){

		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."product order by product_id DESC limit 0,80");

		foreach ($query->rows as $value) {

		if($query->num_rows){

			$product_description = $this->db->query("SELECT * FROM ".DB_PREFIX."product_description WHERE product_id='".$value['product_id']."'");

			$product_detail = $this->db->query("SELECT * FROM ".DB_PREFIX."product_detail WHERE product_id='".$value['product_id']."' order by product_detail_id");

			foreach ($product_detail->rows as $key => $ptmeal) {

				$product_detail->rows[$key]['meal'] = $this->db->query("SELECT * FROM ".DB_PREFIX."product_detail_to_meal WHERE product_detail_id='".$ptmeal['product_detail_id']."'")->rows;

			}

			$product_store = $this->db->query("SELECT * FROM ".DB_PREFIX."product_to_store WHERE product_id='".$value['product_id']."'");

			$product_option = $this->db->query("SELECT * FROM ".DB_PREFIX."product_option WHERE product_id='".$value['product_id']."'");

			$product_option_value = $this->db->query("SELECT * FROM ".DB_PREFIX."product_option_value WHERE product_id='".$value['product_id']."'");

			$product_special = $this->db->query("SELECT * FROM ".DB_PREFIX."product_special WHERE product_id='".$value['product_id']."'");

			$product_image = $this->db->query("SELECT * FROM ".DB_PREFIX."product_image WHERE product_id='".$value['product_id']."'");

			$product_reward = $this->db->query("SELECT * FROM ".DB_PREFIX."product_reward WHERE product_id='".$value['product_id']."'");

			$product_keyword = $this->db->query("SELECT * FROM ".DB_PREFIX."url_alias WHERE query='product_id=".$value['product_id']."'")->row['keyword'];

			$product_attribute = $this->db->query("SELECT * FROM ".DB_PREFIX."product_attribute WHERE product_id='".$value['product_id']."'");

			$data[] = array(

				"policy"					=> $value['policy'],

				"product_description"		=> $product_description->row,

				"product_detail"			=> $product_detail->rows,

				"robot_index"				=> $value['robot_index'],

				"product_type"				=> $value['product_type'],

				"product_class"				=> $value['product_class'],

				"model"						=> $value['model'],

				"location"					=> $value['location'],

				"price"						=> $value['price'],

				"tax_class_id"				=> $value['tax_class_id'],

				"quantity"					=> $value['quantity'],

				"minimum"					=> $value['minimum'],

				"subtract"					=> $value['subtract'],

				"stock_status_id"			=> $value['stock_status_id'],

				"shipping"					=> $value['shipping'],

				"keyword"					=> $product_keyword,

				"schedule"					=> $value['schedule'],

				"duration"					=> $value['duration'],

				"sub_duration"				=> $value['sub_duration'],

				"delay_book"				=> $value['delay_book'],

				"image"						=> $value['image'],

				"date_available"			=> $value['date_available'],

				"length"					=> $value['length'],

				"width"						=> $value['width'],

				"date_added"				=> $value['date_added'],

				"height"					=> $value['height'],

				"length_class_id"			=> $value['length_class_id'],

				"weight"					=> $value['weight'],

				"weight_class_id"			=> $value['weight_class_id'],

				"status"					=> $value['status'],

				"sort_order"				=> $value['sort_order'],

				"viewed"					=> $value['viewed'],

				"duration_type"				=> $value['duration_type'],

				"person"					=> $value['person'],

				"promotion_date"			=> $value['promotion_date'],

				"manufacturer_id"			=> $value['manufacturer_id'],

				"product_store"				=> $product_store->row['store_id'],

				"option"					=> $product_option->rows,

				"option_value"				=> $product_option_value->rows,

				"product_special"			=> $product_special->row,

				"product_image"				=> $product_image->rows,

				"points"					=> $value['points'],

				"product_reward"			=> $product_reward->rows,

				"product_attribute"			=> $product_attribute->rows,

			);

			}

		}

		return $data;

	}



	public function getProduct($product_id) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special,(SELECT date_start FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS date_start,(SELECT date_end FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS date_end,(SELECT customer_group_id FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS customer_group_id,(SELECT priority FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS priority,(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1,2) AS special1, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			if($query->row['special1']){
				$special_date = $this->db->query('SELECT * FROM '.DB_PREFIX.'product_special WHERE price ='.$query->row['special1']);
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],
				'custom_title'      => $query->row['custom_title'],
				'description'      => $query->row['description'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'upc'              => $query->row['upc'],
				'ean'              => $query->row['ean'],
				'jan'              => $query->row['jan'],
				'isbn'             => $query->row['isbn'],
				'mpn'              => $query->row['mpn'],
				'location'         => $query->row['location'],
				'quantity'         => $query->row['quantity'],
				'stock_status'     => $query->row['stock_status'],
				'image'            => $query->row['image'],
				'manufacturer_id'  => $query->row['manufacturer_id'],
				'manufacturer'     => $query->row['manufacturer'],
				'price'            => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
				'special'          => $query->row['special'],
				'special1'          => $query->row['special1'],
				'date_start'	   => $query->row['date_start'],
				'date_end'		   => $query->row['date_end'],
				'date_start1'	   => $special_date->row['date_start'],
				'date_end1'		   => $special_date->row['date_end'],
				'customer_group_id'		   => $query->row['customer_group_id'],
				'priority'		   => $query->row['priority'],
				'reward'           => $query->row['reward'],
				'points'           => $query->row['points'],
				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
				'weight'           => $query->row['weight'],
				'weight_class_id'  => $query->row['weight_class_id'],
				'length'           => $query->row['length'],
				'width'            => $query->row['width'],
				'height'           => $query->row['height'],
				'length_class_id'  => $query->row['length_class_id'],
				'subtract'         => $query->row['subtract'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed'],
				'name_tour'           => $query->row['name_tour'],
				'start_time'           => $query->row['start_time'],
				'start_time_holiday'           => $query->row['start_time_holiday'],
				'start_time_tet'           => $query->row['start_time_tet'],
				'start_time_tet_before'           => $query->row['start_time_tet_before'],
				'start_time_tet_after'           => $query->row['start_time_tet_after'],
				'not_start_time'           => $query->row['not_start_time'],
				'departure'           => $query->row['departure'],
				'location_from'           => $query->row['location_from'],
				'location_to'           => $query->row['location_to'],
				'transport'           => $query->row['transport'],
				'shortdescription'           => $query->row['shortdescription'],
				'highlights'           => $query->row['highlights'],
				'included'           => $query->row['included'],
				'notincluded'           => $query->row['notincluded'],
				'info'           => $query->row['info'],
				'meeting'           => $query->row['meeting'],
				'terms'           => $query->row['terms'],
				'suggest'           => $query->row['suggest'],
				'duration'           => $query->row['duration'],
				'sub_duration'           => $query->row['sub_duration'],
				'schedule'           => $query->row['schedule'],
				'delay_book'           => $query->row['delay_book'],
				'robot_index'           => $query->row['robot_index'],
				'product_type'           => $query->row['product_type'],
				'product_class'           => $query->row['product_class'],
				'policy'           => $query->row['policy'],
				'custom_breadcrumb'           => $query->row['custom_breadcrumb'],
				'custom_link'           => $query->row['custom_link']
			);
		}else{
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],
				'custom_title'      => $query->row['custom_title'],
				'description'      => $query->row['description'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'upc'              => $query->row['upc'],
				'ean'              => $query->row['ean'],
				'jan'              => $query->row['jan'],
				'isbn'             => $query->row['isbn'],
				'mpn'              => $query->row['mpn'],
				'location'         => $query->row['location'],
				'quantity'         => $query->row['quantity'],
				'stock_status'     => $query->row['stock_status'],
				'image'            => $query->row['image'],
				'manufacturer_id'  => $query->row['manufacturer_id'],
				'manufacturer'     => $query->row['manufacturer'],
				'price'            => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
				'special'          => $query->row['special'],
				'special1'          => $query->row['special1'],
				'date_start'	   => $query->row['date_start'],
				'date_end'		   => $query->row['date_end'],
				'customer_group_id'		   => $query->row['customer_group_id'],
				'priority'		   => $query->row['priority'],
				'reward'           => $query->row['reward'],
				'points'           => $query->row['points'],
				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
				'weight'           => $query->row['weight'],
				'weight_class_id'  => $query->row['weight_class_id'],
				'length'           => $query->row['length'],
				'width'            => $query->row['width'],
				'height'           => $query->row['height'],
				'length_class_id'  => $query->row['length_class_id'],
				'subtract'         => $query->row['subtract'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed'],
				'name_tour'           => $query->row['name_tour'],
				'start_time'           => $query->row['start_time'],
				'start_time_holiday'           => $query->row['start_time_holiday'],
				'start_time_tet'           => $query->row['start_time_tet'],
				'start_time_tet_before'           => $query->row['start_time_tet_before'],
				'start_time_tet_after'           => $query->row['start_time_tet_after'],
				'not_start_time'           => $query->row['not_start_time'],
				'departure'           => $query->row['departure'],
				'location_from'           => $query->row['location_from'],
				'location_to'           => $query->row['location_to'],
				'transport'           => $query->row['transport'],
				'shortdescription'           => $query->row['shortdescription'],
				'highlights'           => $query->row['highlights'],
				'included'           => $query->row['included'],
				'notincluded'           => $query->row['notincluded'],
				'info'           => $query->row['info'],
				'meeting'           => $query->row['meeting'],
				'terms'           => $query->row['terms'],
				'suggest'           => $query->row['suggest'],
				'duration'           => $query->row['duration'],
				'sub_duration'           => $query->row['sub_duration'],
				'schedule'           => $query->row['schedule'],
				'delay_book'           => $query->row['delay_book'],
				'robot_index'           => $query->row['robot_index'],
				'product_type'           => $query->row['product_type'],
				'product_class'           => $query->row['product_class'],
				'policy'           => $query->row['policy'],
				'custom_breadcrumb'           => $query->row['custom_breadcrumb'],
				'custom_link'           => $query->row['custom_link']
			);
		}
		} else {

			return false;

		}

	}



	public function getProducts($data = array()) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special"; 



		if (!empty($data['filter_category_id'])) {

			if (!empty($data['filter_sub_category'])) {

				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";			

			} else {

				$sql .= " FROM " . DB_PREFIX . "product_to_category p2c";

			}



			if (!empty($data['filter_filter'])) {

				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";

			} else {

				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";

			}

		} else {

			$sql .= " FROM " . DB_PREFIX . "product p";

		}



		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";



		if (!empty($data['filter_category_id'])) {

			if (!empty($data['filter_sub_category'])) {

				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";	

			} else {

				$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";			

			}	



			if (!empty($data['filter_filter'])) {

				$implode = array();



				$filters = explode(',', $data['filter_filter']);



				foreach ($filters as $filter_id) {

					$implode[] = (int)$filter_id;

				}



				$sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";				

			}

		}	



		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {

			$sql .= " AND (";



			if (!empty($data['filter_name'])) {

				$implode = array();



				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));



				foreach ($words as $word) {

					$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";

				}



				if ($implode) {

					$sql .= " " . implode(" AND ", $implode) . "";

				}

				

				if (!empty($data['filter_description'])) {

					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";

				}

			}



			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {

				$sql .= " OR ";

			}



			if (!empty($data['filter_tag'])) {

				$sql .= "pd.tag LIKE '%" . $this->db->escape($data['filter_tag']) . "%'";

			}



			if (!empty($data['filter_name'])) {

				$sql .= " OR LCASE(p.model) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";

			}



			$sql .= ")";

		}



		if (!empty($data['filter_manufacturer_id'])) {

			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";

		}

		

		if (!empty($data['filter_price_on'])) {

			$sql .= " AND p.price != 0";

		}



		$sql .= " GROUP BY p.product_id";



		$sort_data = array(

			'pd.name',

			'p.model',

			'p.quantity',

			'p.price',

			'rating',

			'p.sort_order',

			'p.viewed',

			'p.date_added'

		);	



		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {

				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";

			} elseif ($data['sort'] == 'p.price') {

				$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";

			} else {

				$sql .= " ORDER BY " . $data['sort'];

			}

		} else {

			$sql .= " ORDER BY p.sort_order";	

		}



		if (isset($data['order']) && ($data['order'] == 'DESC')) {

			$sql .= " DESC, LCASE(pd.name) DESC";

		} else {

			$sql .= " ASC, LCASE(pd.name) ASC";

		}



		if (isset($data['start']) || isset($data['limit'])) {

			if ($data['start'] < 0) {

				$data['start'] = 0;

			}



			if ($data['limit'] < 1) {

				$data['limit'] = 20;

			}



			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		}

		$product_data = array();



		$query = $this->db->query($sql);



		foreach ($query->rows as $result) {

			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);

		}



		return $product_data;

	}



	public function getProductSpecials($data = array()) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";



		$sort_data = array(

			'pd.name',

			'p.model',

			'ps.price',

			'rating',

			'p.sort_order'

		);



		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {

				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";

			} else {

				$sql .= " ORDER BY " . $data['sort'];

			}

		} else {

			$sql .= " ORDER BY p.sort_order";	

		}



		if (isset($data['order']) && ($data['order'] == 'DESC')) {

			$sql .= " DESC, LCASE(pd.name) DESC";

		} else {

			$sql .= " ASC, LCASE(pd.name) ASC";

		}



		if (isset($data['start']) || isset($data['limit'])) {

			if ($data['start'] < 0) {

				$data['start'] = 0;

			}				



			if ($data['limit'] < 1) {

				$data['limit'] = 20;

			}	



			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		}



		$product_data = array();



		$query = $this->db->query($sql);



		foreach ($query->rows as $result) { 		

			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);

		}



		return $product_data;

	}



	public function getLatestProducts($limit) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$product_data = $this->cache->get('product.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $customer_group_id . '.' . (int)$limit);



		if (!$product_data) { 

			$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.date_added DESC LIMIT " . (int)$limit);



			foreach ($query->rows as $result) {

				$product_data[$result['product_id']] = $this->getProduct($result['product_id']);

			}



			$this->cache->set('product.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit, $product_data);

		}



		return $product_data;

	}



	public function getPopularProducts($limit) {

		$product_data = array();



		$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.viewed, p.date_added DESC LIMIT " . (int)$limit);



		foreach ($query->rows as $result) { 		

			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);

		}



		return $product_data;

	}



	public function getBestSellerProducts($limit) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$product_data = $this->cache->get('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit);



		if (!$product_data) { 

			$product_data = array();



			$query = $this->db->query("SELECT op.product_id, COUNT(*) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT " . (int)$limit);



			foreach ($query->rows as $result) { 		

				$product_data[$result['product_id']] = $this->getProduct($result['product_id']);

			}



			$this->cache->set('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . $customer_group_id . '.' . (int)$limit, $product_data);

		}



		return $product_data;

	}



	public function getProductAttributes($product_id) {

		$product_attribute_group_data = array();



		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.product_id = '" . (int)$product_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id");


		foreach ($product_attribute_group_query->rows as $product_attribute_group) {

			$product_attribute_data = array();



			$product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text,atd.attribute_type_id,atd.name as name_type FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_type at ON (pa.attribute_type_id = at.attribute_type_id) LEFT JOIN " . DB_PREFIX . "attribute_type_description atd ON (pa.attribute_type_id = atd.attribute_type_id) WHERE pa.product_id = '" . (int)$product_id . "' AND a.attribute_group_id = '" . (int)$product_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY at.sort_order, atd.name");



			foreach ($product_attribute_query->rows as $product_attribute) {

				$product_attribute_data[] = array(

					'attribute_id' => $product_attribute['attribute_id'],

					'name'         => $product_attribute['name'],

					'name_type'         => $product_attribute['name_type'],

					'text'         => $product_attribute['text']		 	

				);

			}

			$product_attribute_group_data[] = array(

				'attribute_group_id' => $product_attribute_group['attribute_group_id'],

				'name'               => $product_attribute_group['name'],

				'total'          =>  count($product_attribute_data),

				'attribute'          => $product_attribute_data

			);			

		}

		return $product_attribute_group_data;

	}

	public function getProductList(){
		$query = $this->db->query("SELECT product_id FROM  " . DB_PREFIX . "product");

		return $query->rows;
	}

	public function getIdByMore($limit){

		$sql = "SELECT op.name, op.product_id, op.model, SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";
		$sql .= " GROUP BY op.model ORDER BY total DESC";
		$sql .= " LIMIT " . (int)0 . "," . (int)$limit;

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getProductId($name,$limit){
		$sql = "SELECT DISTINCT pd.product_id FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "product` pd ON (op.product_id = pd.product_id) WHERE pd.location LIKE '%".$name."%' ORDER BY op.quantity DESC LIMIT 0,".$limit."";

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getProductOptionsXML($category) {

		$product_option_data = array();



		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) LEFT JOIN ".DB_PREFIX."product p ON (p.product_id=po.product_id) WHERE o.category='".(int)$category."' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");



		foreach ($product_option_query->rows as $product_option) {

			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {

				$product_option_value_data = array();



				$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");



				foreach ($product_option_value_query->rows as $product_option_value) {

					$product_option_value_data[] = array(

						'product_option_value_id' => $product_option_value['product_option_value_id'],

						'option_value_id'         => $product_option_value['option_value_id'],

						'name'                    => $product_option_value['name'],

						'image'                   => $product_option_value['image'],

						'quantity'                => $product_option_value['quantity'],

						'subtract'                => $product_option_value['subtract'],

						'price'                   => $product_option_value['price'],

						'price_prefix'            => $product_option_value['price_prefix'],

						'weight'                  => $product_option_value['weight'],

						'weight_prefix'           => $product_option_value['weight_prefix']

					);

				}



				$product_option_data[] = array(

					'product_option_id' => $product_option['product_option_id'],

					'model'			  => $product_option['model'],

					'product_option_id' => $product_option['product_option_id'],

					'option_id'         => $product_option['option_id'],

					'name'              => $product_option['name'],

					'type'              => $product_option['type'],

					'category'              => $product_option['category'],

					'class'              => $product_option['class'],

					'option_value'      => $product_option_value_data,

					'required'          => $product_option['required']

				);

			} else {

				$product_option_data[] = array(

					'product_option_id' => $product_option['product_option_id'],

					'model'			  => $product_option['model'],

					'product_option_id' => $product_option['product_option_id'],

					'option_id'         => $product_option['option_id'],

					'name'              => $product_option['name'],

					'type'              => $product_option['type'],

					'category'              => $product_option['category'],

					'class'              => $product_option['class'],

					'option_value'      => $product_option['option_value'],

					'required'          => $product_option['required']

				);				

			}

		}

		return $product_option_data;

	}



	public function getProductOptions($product_id) {

		$product_option_data = array();



		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");



		foreach ($product_option_query->rows as $product_option) {

			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {

				$product_option_value_data = array();



				$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");



				foreach ($product_option_value_query->rows as $product_option_value) {

					$product_option_value_data[] = array(

						'product_option_value_id' => $product_option_value['product_option_value_id'],

						'option_value_id'         => $product_option_value['option_value_id'],

						'name'                    => $product_option_value['name'],

						'image'                   => $product_option_value['image'],

						'quantity'                => $product_option_value['quantity'],

						'subtract'                => $product_option_value['subtract'],

						'price'                   => $product_option_value['price'],

						'price_prefix'            => $product_option_value['price_prefix'],

						'weight'                  => $product_option_value['weight'],

						'weight_prefix'           => $product_option_value['weight_prefix']

					);

				}



				$product_option_data[] = array(

					'product_option_id' => $product_option['product_option_id'],

					'option_id'         => $product_option['option_id'],

					'name'              => $product_option['name'],

					'type'              => $product_option['type'],

					'category'              => $product_option['category'],

					'class'              => $product_option['class'],

					'option_value'      => $product_option_value_data,

					'required'          => $product_option['required']

				);

			} else {

				$product_option_data[] = array(

					'product_option_id' => $product_option['product_option_id'],

					'option_id'         => $product_option['option_id'],

					'name'              => $product_option['name'],

					'type'              => $product_option['type'],

					'category'              => $product_option['category'],

					'class'              => $product_option['class'],

					'option_value'      => $product_option['option_value'],

					'required'          => $product_option['required']

				);				

			}

		}



		return $product_option_data;

	}


	public function getProductOptionsDL($product_id) {
		$product_option_data = array();
		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");
		foreach ($product_option_query->rows as $product_option) {
			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
				$product_option_value_data = array();
				$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY pov.price DESC");
				foreach ($product_option_value_query->rows as $product_option_value) {
					$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'name'                    => $product_option_value['name'],
						'image'                   => $product_option_value['image'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract'],
						'price'                   => $product_option_value['price'],
						'price_prefix'            => $product_option_value['price_prefix'],
						'weight'                  => $product_option_value['weight'],
						'weight_prefix'           => $product_option_value['weight_prefix']
					);
				}
				$product_option_data[] = array(
					'product_option_id' => $product_option['product_option_id'],
					'option_id'         => $product_option['option_id'],
					'name'              => $product_option['name'],
					'type'              => $product_option['type'],
					'category'              => $product_option['category'],
					'class'              => $product_option['class'],
					'option_value'      => $product_option_value_data,
					'required'          => $product_option['required']
				);
			} else {
				$product_option_data[] = array(
					'product_option_id' => $product_option['product_option_id'],
					'option_id'         => $product_option['option_id'],
					'name'              => $product_option['name'],
					'type'              => $product_option['type'],
					'category'              => $product_option['category'],
					'class'              => $product_option['class'],
					'option_value'      => $product_option['option_value'],
					'required'          => $product_option['required']
				);				
			}
		}
		return $product_option_data;
	}


	public function getProductDiscounts($product_id) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");



		return $query->rows;		

	}



	public function getProductImages($product_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");



		return $query->rows;

	}

	

	public function getProductDetails($product_id) {

		$query = $this->db->query("

                                    SELECT * FROM " . DB_PREFIX . "product_detail

                                    WHERE status = 1

                                    AND product_id = '" . (int)$product_id . "' ORDER BY sort_order");



		return $query->rows;

	}

	

	public function getProductDetailMeal($product_detail_id,$attribute_meal_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_detail_to_meal WHERE product_detail_id = '" . (int)$product_detail_id . "' AND attribute_meal_id = '" . (int)$attribute_meal_id . "'");



		return $query->row;

	}

	

	public function getProductRelated($product_id) {

		$product_data = array();



		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related pr LEFT JOIN " . DB_PREFIX . "product p ON (pr.related_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pr.product_id = '" . (int)$product_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");



		foreach ($query->rows as $result) { 

			$product_data[$result['related_id']] = $this->getProduct($result['related_id']);

		}



		return $product_data;

	}



	public function getProductLayoutId($product_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");



		if ($query->num_rows) {

			return $query->row['layout_id'];

		} else {

			return false;

		}

	}



	public function getCategories($product_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");



		return $query->rows;

	}	

	

	public function getTags($product_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag_product WHERE product_id = '" . (int)$product_id . "'");



		return $query->rows;

	}



	public function getTotalProducts($data = array()) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}	



		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total"; 



		if (!empty($data['filter_category_id'])) {

			if (!empty($data['filter_sub_category'])) {

				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";			

			} else {

				$sql .= " FROM " . DB_PREFIX . "product_to_category p2c";

			}



			if (!empty($data['filter_filter'])) {

				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";

			} else {

				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";

			}

		} else {

			$sql .= " FROM " . DB_PREFIX . "product p";

		}



		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";



		if (!empty($data['filter_category_id'])) {

			if (!empty($data['filter_sub_category'])) {

				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";	

			} else {

				$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";			

			}	



			if (!empty($data['filter_filter'])) {

				$implode = array();



				$filters = explode(',', $data['filter_filter']);



				foreach ($filters as $filter_id) {

					$implode[] = (int)$filter_id;

				}



				$sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";				

			}

		}



		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {

			$sql .= " AND (";



			if (!empty($data['filter_name'])) {

				$implode = array();



				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));



				foreach ($words as $word) {

					$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";

				}



				if ($implode) {

					$sql .= " " . implode(" AND ", $implode) . "";

				}



				if (!empty($data['filter_description'])) {

					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";

				}

			}



			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {

				$sql .= " OR ";

			}



			if (!empty($data['filter_tag'])) {

				$sql .= "pd.tag LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "%'";

			}



			if (!empty($data['filter_name'])) {

				$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";

			}



			$sql .= ")";				

		}



		if (!empty($data['filter_manufacturer_id'])) {

			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";

		}

		

		if (!empty($data['filter_price_on'])) {

			$sql .= " AND p.price != 0";

		}

		

		$query = $this->db->query($sql);



		return $query->row['total'];

	}



	public function getProfiles($product_id) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}		



		return $this->db->query("SELECT `pd`.* FROM `" . DB_PREFIX . "product_profile` `pp` JOIN `" . DB_PREFIX . "profile_description` `pd` ON `pd`.`language_id` = " . (int)$this->config->get('config_language_id') . " AND `pd`.`profile_id` = `pp`.`profile_id` JOIN `" . DB_PREFIX . "profile` `p` ON `p`.`profile_id` = `pd`.`profile_id` WHERE `product_id` = " . (int)$product_id . " AND `status` = 1 AND `customer_group_id` = " . (int)$customer_group_id . " ORDER BY `sort_order` ASC")->rows;



	}



	public function getProfile($product_id, $profile_id) {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}		



		return $this->db->query("SELECT * FROM `" . DB_PREFIX . "profile` `p` JOIN `" . DB_PREFIX . "product_profile` `pp` ON `pp`.`profile_id` = `p`.`profile_id` AND `pp`.`product_id` = " . (int)$product_id . " WHERE `pp`.`profile_id` = " . (int)$profile_id . " AND `status` = 1 AND `pp`.`customer_group_id` = " . (int)$customer_group_id)->row;

	}



	public function getTotalProductSpecials() {

		if ($this->customer->isLogged()) {

			$customer_group_id = $this->customer->getCustomerGroupId();

		} else {

			$customer_group_id = $this->config->get('config_customer_group_id');

		}		



		$query = $this->db->query("SELECT COUNT(DISTINCT ps.product_id) AS total FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");



		if (isset($query->row['total'])) {

			return $query->row['total'];

		} else {

			return 0;	

		}

	}

	//

	public function getOrtherProducts($data) {

		$product_data = array();

		$sql = "SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.product_id <> ".$data['product_id']." AND p.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		

		if (!empty($data['filter_duration'])) {

			$sql .= " AND p.duration = '" . $this->db->escape($data['filter_duration']) . "'";

		}

		

		if (!empty($data['filter_category'])) {

			$sql .= " AND p.custom_breadcrumb = '" . $this->db->escape($data['filter_category']) . "'";

		}

		

		$query = $this->db->query($sql);



		foreach ($query->rows as $result) { 		

			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);

		}



		return $product_data;

	}

	/*model get price product option value theo product_option_value_id by coder: tranminh*/
	public function getproductoptionvaluebyid($id){
		$sql = "SELECT price FROM ".DB_PREFIX."product_option_value WHERE product_option_value_id='".(int)$id."'";
		$query = $this->db->query($sql);
		return $query->row;
	}

	

}

?>