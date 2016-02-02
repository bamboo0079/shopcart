<?php
class User {
	private $user_id;
	private $username;

            /* Nikita_SP MOD FOR AdminLog */
			private $config;
            
	private $permission = array();

	public function __construct($registry) {

			/* Nikita_SP MOD FOR AdminLog */
			$this->config = $registry->get('config');
            
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['user_id'])) {
			$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$this->session->data['user_id'] . "' AND status = '1'");

			if ($user_query->num_rows) {
				$this->user_id = $user_query->row['user_id'];
				$this->username = $user_query->row['username'];
				$this->user_group_id = $user_query->row['user_group_id'];

				$this->db->query("UPDATE " . DB_PREFIX . "user SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE user_id = '" . (int)$this->session->data['user_id'] . "'");

				$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

				$permissions = unserialize($user_group_query->row['permission']);

				if (is_array($permissions)) {
					foreach ($permissions as $key => $value) {
						$this->permission[$key] = $value;
					}
				}
			} else {
				$this->logout();
			}
		}
	}

	public function login($username, $password) {
		$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE username = '" . $this->db->escape($username) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");

		if ($user_query->num_rows) {
			$this->session->data['user_id'] = $user_query->row['user_id'];

			$this->user_id = $user_query->row['user_id'];
			$this->username = $user_query->row['username'];		
			$this->user_group_id = 	$user_query->row['user_group_id'];	

			$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

			$permissions = unserialize($user_group_query->row['permission']);

			if (is_array($permissions)) {
				foreach ($permissions as $key => $value) {
					$this->permission[$key] = $value;
				}
			}


			// Nikita_Sp mod for AdminLog
			if($this->config->get('adminlog_enable') && $this->config->get('adminlog_login')){
				$this->db->query("INSERT INTO " . DB_PREFIX . "adminlog SET user_id = '" . (int)$this->user_id . "', `user_name` = '" . $this->username . "', `action` = 'login', `allowed` = '1', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
			}
            
			return true;
		} else {

			// Nikita_Sp mod for AdminLog
			if($this->config->get('adminlog_enable') && $this->config->get('adminlog_hacklog')){
				$this->db->query("INSERT INTO " . DB_PREFIX . "adminlog SET user_id = '" . (int)$this->user_id . "', `user_name` = '" . $username . "', `action` = 'login', `allowed` = '0', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
			}
            
			return false;
		}
	}

	public function logout() {
		unset($this->session->data['user_id']);

			// Nikita_Sp mod for AdminLog
			if($this->config->get('adminlog_enable') && $this->config->get('adminlog_logout')){
				$this->db->query("INSERT INTO " . DB_PREFIX . "adminlog SET user_id = '" . (int)$this->user_id . "', `user_name` = '" . $this->username . "', `action` = 'logout', `allowed` = '1', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
			}
            

		$this->user_id = '';
		$this->username = '';

		session_destroy();
	}

	public function hasPermission($key, $value) {
		if (isset($this->permission[$key])) {

    		// Nikita_Sp mod for AdminLog
    		if($this->config->get('adminlog_enable')){
    			if( ( ($this->config->get('adminlog_allowed') == 1 || $this->config->get('adminlog_allowed') == 2) && (in_array($value, $this->permission[$key])) )  ||
	    			( ($this->config->get('adminlog_allowed') == 0 || $this->config->get('adminlog_allowed') == 2) && !(in_array($value, $this->permission[$key])) )  ){
	    			if(($this->config->get('adminlog_access') && $key == "access") || ($this->config->get('adminlog_modify') && $key == "modify") ){
						$this->db->query("INSERT INTO " . DB_PREFIX . "adminlog SET user_id = '" . (int)$this->user_id . "', `user_name` = '" . $this->username . "', `action` = '".$key."', `allowed` = '".in_array($value, $this->permission[$key])."', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
	    			}
    			}
			}
            
			return in_array($value, $this->permission[$key]);
		} else {

    		// Nikita_Sp mod for AdminLog
    		if($this->config->get('adminlog_enable') && ($this->config->get('adminlog_allowed') == 0 || $this->config->get('adminlog_allowed') == 2)){
				$this->db->query("INSERT INTO " . DB_PREFIX . "adminlog SET user_id = '" . (int)$this->user_id . "', `user_name` = '" . $this->username . "', `action` = '".$key."', `allowed` = '0', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
			}
            
			return false;
		}
	}

	public function isLogged() {
		return $this->user_id;
	}

	public function getId() {
		return $this->user_id;
	}

	public function getUserName() {
		return $this->username;
	}

	public function getUserGroupID(){
		return $this->user_group_id;
	}
	public function getUserLog($order_id)
	{
		if ($this->getUserGroupID() == 1) {
			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_log` WHERE `order_id` =".$order_id);
			if ($query->num_rows > 0) {
				return $query->row['user'];
			}
		}
		return false;
	}
	public function getUserNameByOrder($order_id) {
		if ($this->getUserGroupID() == 11) {
			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_log` WHERE `order_id` =".$order_id);
			if ($query->num_rows > 0) {
				return $query->row['user'];
			} 
			
			
		}
		return false;
	}
	
}
?>