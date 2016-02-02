<?php
class ModelCatalogTag extends Model {
    public function addTag($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "tag SET parent_id = '" . (int)$data['parent_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");

        $tag_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "tag SET image = '" . $this->db->escape($data['image']) . "' WHERE tag_id = '" . (int)$tag_id . "'");
        }

        foreach ($data['tag_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "tag_description SET tag_id = '" . (int)$tag_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', name_menu = '" . $this->db->escape($value['name_menu']) . "', custom_title = '" . $this->db->escape($value['custom_title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }

        if (isset($data['tag_product'])) {
            foreach ($data['tag_product'] as $tag_product) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "tag_product SET tag_id = '"  . (int)$tag_id  . "', product_id = '" . (int)$tag_product['product_id'] . "', sort_order = '" . (int)$tag_product['sort_order'] . "'");
            }
        }

        if (isset($data['tag_store'])) {
            foreach ($data['tag_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "tag_to_store SET tag_id = '" . (int)$tag_id . "', store_id = '" . (int)$store_id . "'");
            }
        }

        if (isset($data['cat_layout'])) {
            foreach ($data['cat_layout'] as $store_id => $layout) {
                if ($layout['layout_id']) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "tag_to_layout SET tag_id = '" . (int)$tag_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
                }
            }
        }

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'tag_id=" . (int)$tag_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('tag');
    }
    public function getTagShow($tag_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) LEFT JOIN " . DB_PREFIX . "tag_to_store c2s ON (c.tag_id = c2s.tag_id) WHERE c.tag_id = '" . (int)$tag_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

        return $query->row;
    }
    public function getTagProductShow($data) {
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
    public function editTag($tag_id, $data) {

        $this->db->query("UPDATE " . DB_PREFIX . "tag SET parent_id = '" . (int)$data['parent_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE tag_id = '" . (int)$tag_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "tag SET image = '" . $this->db->escape($data['image']) . "' WHERE tag_id = '" . (int)$tag_id . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_description WHERE tag_id = '" . (int)$tag_id . "'");

        foreach ($data['tag_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "tag_description SET tag_id = '" . (int)$tag_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', name_menu = '" . $this->db->escape($value['name_menu']) . "', custom_title = '" . $this->db->escape($value['custom_title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_product WHERE tag_id = '" . (int)$tag_id . "'");

        if (isset($data['tag_product'])) {
            foreach ($data['tag_product'] as $tag_product) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "tag_product SET tag_id = '"  . (int)$tag_id  . "', product_id = '" . (int)$tag_product['product_id'] . "', sort_order = '" . (int)$tag_product['sort_order'] . "'");
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_to_store WHERE tag_id = '" . (int)$tag_id . "'");

        if (isset($data['tag_store'])) {
            foreach ($data['tag_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "tag_to_store SET tag_id = '" . (int)$tag_id . "', store_id = '" . (int)$store_id . "'");
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_to_layout WHERE tag_id = '" . (int)$tag_id . "'");

        if (isset($data['cat_layout'])) {
            foreach ($data['cat_layout'] as $store_id => $layout) {
                if ($layout['layout_id']) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "tag_to_layout SET tag_id = '" . (int)$tag_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
                }
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int)$tag_id. "'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'tag_id=" . (int)$tag_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('tag');
    }

    public function deleteTag($tag_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int)$tag_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_description WHERE tag_id = '" . (int)$tag_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_to_store WHERE tag_id = '" . (int)$tag_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_to_layout WHERE tag_id = '" . (int)$tag_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "tag_product WHERE tag_id = '" . (int)$tag_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int)$tag_id . "'");

        $query = $this->db->query("SELECT tag_id FROM " . DB_PREFIX . "tag WHERE parent_id = '" . (int)$tag_id . "'");

        foreach ($query->rows as $result) {
            $this->deleteTag($result['tag_id']);
        }

        $this->cache->delete('tag');
    }
    public function getTagMenu($tag_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) LEFT JOIN " . DB_PREFIX . "tag_to_store c2s ON (c.tag_id = c2s.tag_id) WHERE c.tag_id = '" . (int)$tag_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

        return $query->row;
    }
    public function getTag($tag_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int)$tag_id . "') AS keyword FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int)$tag_id . "'");

        return $query->row;
    }

    public function getTags($parent_id) {
        $tag_data = $this->cache->get('tag.' . $this->config->get('config_language_id') . '.' . $parent_id);

        if (!$tag_data) {
            $tag_data = array();

            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");

            foreach ($query->rows as $result) {
                $tag_data[] = array(
                    'tag_id' => $result['tag_id'],
                    'name'        => $this->getPath($result['tag_id'], $this->config->get('config_language_id')),
                    'status'  	  => $result['status'],
                    'sort_order'  => $result['sort_order']
                );

                $tag_data = array_merge($tag_data, $this->getTags($result['tag_id']));
            }

            $this->cache->set('tag.' . $this->config->get('config_language_id') . '.' . $parent_id, $tag_data);
        }

        return $tag_data;
    }

    public function getPath($tag_id) {
        $query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id) WHERE c.tag_id = '" . (int)$tag_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");

        $tag_info = $query->row;

        if ($tag_info['parent_id']) {
            return $this->getPath($tag_info['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $tag_info['name'];
        } else {
            return $tag_info['name'];
        }
    }

    public function getTagDescriptions($tag_id) {
        $tag_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag_description WHERE tag_id = '" . (int)$tag_id . "'");

        foreach ($query->rows as $result) {
            $tag_description_data[$result['language_id']] = array(
                'name'             => $result['name'],
                'name_menu'             => $result['name_menu'],
                'custom_title'             => $result['custom_title'],
                'meta_keyword'     => $result['meta_keyword'],
                'meta_description' => $result['meta_description'],
                'description'      => $result['description']
            );
        }

        return $tag_description_data;
    }

    public function getTagProduct($tag_id) {
        $query = $this->db->query("SELECT pd.name, p.product_id, p.model, td.sort_order FROM " . DB_PREFIX . "tag_product td LEFT JOIN " . DB_PREFIX . "product_description pd ON (td.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = pd.product_id)  WHERE td.tag_id = '" . (int)$tag_id . "' ORDER BY td.sort_order");
        return $query->rows;
    }

    public function getTagStores($tag_id) {
        $tag_store_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag_to_store WHERE tag_id = '" . (int)$tag_id . "'");

        foreach ($query->rows as $result) {
            $tag_store_data[] = $result['store_id'];
        }

        return $tag_store_data;
    }

    public function getTagLayouts($tag_id) {
        $tag_layout_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag_to_layout WHERE tag_id = '" . (int)$tag_id . "'");

        foreach ($query->rows as $result) {
            $tag_layout_data[$result['store_id']] = $result['layout_id'];
        }

        return $tag_layout_data;
    }

    public function getTotalTags() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tag");

        return $query->row['total'];
    }

    public function getTotalTagsByImageId($image_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tag WHERE image_id = '" . (int)$image_id . "'");

        return $query->row['total'];
    }

    public function getTotalTagsByLayoutId($layout_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tag_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

        return $query->row['total'];
    }

}
?>