<?php
    class ModelDesignRandomNews extends Model{
        public function insertRandom($huge,$child){
            $this->db->query("INSERT INTO random_news SET large_session='".$huge."', small_session='".$child."'");
        }
        public function getRandomNews(){
            $query = $this->db->query("SELECT * FROM random_news ORDER BY id DESC ");
            return $query->row;
        }
        public function deleteRandom(){
            $this->db->query("DELETE FROM random_news");
        }
    }
?>