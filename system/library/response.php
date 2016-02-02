<?php
class Response {
	private $headers = array(); 
	private $level = 0;
	private $output;
	
	public function addHeader($header) {
		$this->headers[] = $header;
	}

	public function redirect($url) {
		header('Location: ' . $url);
		exit;
	}
	
	public function setCompression($level) {
		$this->level = $level;
	}
		
	public function setOutput($output) {
		$this->output = $output;
	}

	private function compress($data, $level = 0) {
		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false)) {
			$encoding = 'gzip';
		} 

		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false)) {
			$encoding = 'x-gzip';
		}

		if (!isset($encoding)) {
			return $data;
		}

		if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
			return $data;
		}

		if (headers_sent()) {
			return $data;
		}

		if (connection_status()) { 
			return $data;
		}
		
		$this->addHeader('Content-Encoding: ' . $encoding);

		return gzencode($data, (int)$level);
	}

	public function output() {
		if ($this->output) {
			if ($this->level) {
				$output = $this->compress($this->output, $this->level);
			} else {
				$output = $this->output;
			}	
				
			if (!headers_sent()) {
				foreach ($this->headers as $header) {
					header($header, true);
				}
			}
			
			echo $output;
			// echo cdn_output($output);
		}
	}
	
}
function cdn_output($result) {
		global $config;
		if (!empty(CDN_IMAGES)) {
		
		$cdn_domain = CDN_IMAGES;
			$result = str_replace(HTTP_IMAGE, $cdn_domain . '/image/', $result);
			$result = str_replace('src="catalog/view/theme/' . $config->get("config_template") . '/image/', 'src="' . $cdn_domain . '/catalog/view/theme/' . $config->get("config_template") . '/image/', $result);
			$result = str_replace('src="catalog/view/theme/default/image/', 'src="' . $cdn_domain . '/catalog/view/theme/default/image/', $result);
		

		$result = str_replace('src="catalog/view/javascript/', 'src="' . $cdn_domain . '/javascript/', $result);

		$result = str_replace('href="catalog/view/theme/' . $config->get("config_template") . '/stylesheet/', 'href="' . $cdn_domain . '/stylesheet/', $result);

	 	$result = str_replace('href="catalog/view/theme/default/stylesheet/', 'href="' . $cdn_domain . '/theme/default/stylesheet/', $result);
	 	}
	return $result;
}
?>