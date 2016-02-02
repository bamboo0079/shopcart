<?php
class ModelDesignCommonNews extends Model{
    public function InsertCategory($type, $id){
        $this->db->query("INSERT INTO common_news SET type = '".$type."', category = '".$id."'");
    }
    public function getCategoriesNews(){
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ')
                AS name, c.parent_id, c.sort_order, c.status FROM " . DB_PREFIX . "category_path cp
                LEFT JOIN " . DB_PREFIX . "category c ON (cp.category_id = c.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id)
                JOIN common_news cid
                WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'
                AND cp.category_id = cid.category
                AND cid.type = 1
                AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $sql .= " GROUP BY cp.category_id ORDER BY name";
        $query = $this->db->query($sql);

        return $query->rows;
    }
    public function getCategoryDescription($id){
        $sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ')
                AS name, c.parent_id, c.sort_order, c.status FROM " . DB_PREFIX . "category_path cp
                LEFT JOIN " . DB_PREFIX . "category c ON (cp.category_id = c.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id)
                LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (cp.category_id = cd2.category_id)
                WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'
                AND cp.category_id = '".$id."'
                AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $sql .= " GROUP BY cp.category_id ORDER BY name";
        $query = $this->db->query($sql);
        return $query->row;
    }
    public function TagGet(){
        $query = $this->db->query("SELECT category FROM common_news WHERE type = 2");
        return $query->rows;
    }
    public function GetTagDescription($id){
        $tag_data = array();
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag c
                                   LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id)
                                   WHERE c.tag_id = '" . (int)$id. "'
                                   AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
                                   ORDER BY c.sort_order, cd.name ASC");
        $result = $query->row;
        $tag_data[] = array(
            'tag_id' => $result['tag_id'],
            'name'        => $this->getPath($id, $this->config->get('config_language_id')),
            'status'  	  => $result['status'],
            'sort_order'  => $result['sort_order']
        );

        $tag_data = array_merge($tag_data, $this->getTags($result['tag_id']));

        return $tag_data;
    }
    public function getTag($tag_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'tag_id=" . (int)$tag_id . "') AS keyword FROM " . DB_PREFIX . "tag WHERE tag_id = '" . (int)$tag_id . "'");
        return $query->row;
    }
    public function getTags($parent_id) {
        $tag_data = $this->cache->get('tag.' . $this->config->get('config_language_id') . '.' . $parent_id);
        if (!$tag_data) {
            $tag_data = array();
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tag c LEFT JOIN " . DB_PREFIX . "tag_description cd ON (c.tag_id = cd.tag_id)  WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
            foreach ($query->rows as $result) {
                $tag_data[] = array(
                    'tag_id' => $result['tag_id'],
                    'name'        => $this->getPath($result['tag_id']),
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
    public function getCategoryId(){
        $query = $this->db->query("SELECT * FROM common_news WHERE type = 1");
        return $query->rows;
    }
    public function getTagId(){
        $query = $this->db->query("SELECT * FROM common_news WHERE type = 2");
        return $query->rows;
    }
    public function DeleteCategory($type, $id){
        $this->db->query("DELETE FROM common_news WHERE type = '".$type."' AND category = '".$id."'");
    }
    public function getCatMenu(){
        $query = $this->db->query("SELECT * FROM menu_display WHERE type = 1");
        return $query->rows;
    }
    public function getTagMenu(){
        $query = $this->db->query("SELECT * FROM menu_display WHERE type = 2");
        return $query->rows;
    }
}
?>