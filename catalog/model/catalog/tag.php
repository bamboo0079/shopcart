<?php
class ModelCatalogTag extends Model {
	public function getTag($tag_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) LEFT JOIN " . DB_PREFIX . "tag_to_store c2s ON (c.tag_id = c2s.tag_id) WHERE c.tag_id = '" . (int)$tag_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row;
	}
	
	public function getTags($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) LEFT JOIN " . DB_PREFIX . "tag_to_store c2s ON (c.tag_id = c2s.tag_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

		return $query->rows;
	}
	
	public function getTagProduct($data) {
		$sql = "SELECT product_id FROM " . DB_PREFIX . "tag_product WHERE tag_id = '" . (int)$data['tag_id'] . "' ORDER BY sort_order";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getTotalProductByTagId($tag_id) {
		$sql = "SELECT COUNT(DISTINCT tp.product_id) as total,tp.product_id,p.product_id, p.status FROM " . DB_PREFIX . "tag_product tp LEFT JOIN " . DB_PREFIX . "product p ON (tp.product_id = p.product_id) WHERE tag_id = '" . (int)$tag_id . "'  AND p.status = 1 ORDER BY tp.sort_order";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
	
	public function getTagsByParentId($tag_id) {
		$tag_data = array();
		
		$tag_query = $this->db->query("SELECT tag_id FROM " . DB_PREFIX . "tag WHERE parent_id = '" . (int)$tag_id . "'");
		
		foreach ($tag_query->rows as $tag) {
			$tag_data[] = $tag['tag_id'];
			
			$children = $this->getTagsByParentId($tag['tag_id']);
			
			if ($children) {
				$tag_data = array_merge($children, $tag_data);
			}			
		}
		
		return $tag_data;
	}
	
	public function getParentByTagsId($tag_id) {
		$tag_data = array();
		
		$tag_query = $this->db->query("SELECT parent_id FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int)$tag_id . "'");
		
		foreach ($tag_query->rows as $tag) {
			$tag_data[] = $tag['parent_id'];
			
			$parent = $this->getParentByTagsId($tag['parent_id']);
			
			if ($parent) {
				$tag_data = array_merge($parent, $tag_data);
			}			
		}
		
		return $tag_data;
	}
	
	public function getTagFilters($tag_id) {
		$implode = array();
		
		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "tag_filter WHERE tag_id = '" . (int)$tag_id . "'");
		
		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}
		
		
		$filter_group_data = array();
		
		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");
			
			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();
				
				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");
				
				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id' => $filter['filter_id'],
						'name'      => $filter['name']			
					);
				}
				
				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $filter_data
					);	
				}
			}
		}
		
		return $filter_group_data;
	}
				
	public function getTagLayoutId($tag_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag_to_layout WHERE tag_id = '" . (int)$tag_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return false;
		}
	}
					
	public function getTotalTagsBytagId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_to_store c2s ON (c.tag_id = c2s.tag_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		
		return $query->row['total'];
	}
}
?>