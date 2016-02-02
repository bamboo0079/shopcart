<?php
class ControllerModuleImageManagerPlus extends Controller {
	public function index(){
		$this->load->language('module/image_manager_plus');	
		$this->document->setTitle($this->language->get('elFinder Image Manager Plus'));
			$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token']),
       		'text'      => $this->language->get('text_home'),
      		'separator' => false
   		);

		$this->data['breadcrumbs'][]=array(
			'href'      =>$this->url->link('extension/module','token='.$this->session->data['token'], 'SSL'),
			'text'      =>$this->language->get('text_module'),
			'separator' =>' :: '
		);
		$this->data['breadcrumbs'][]=array(
			'href'      =>$this->url->link('module/image_manager_plus','token='.$this->session->data['token'], 'SSL'),
			'text'      =>$this->language->get('elFinder Image Manager Plus'),
			'separator' =>' :: '
		);
		
 		$this->data['heading_title'] = $this->language->get('elFinder Image Manager Plus');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->data['button_save']=$this->language->get('button_save');
		$this->data['button_cancel']=$this->language->get('button_cancel');
		$this->template='module/image_manager_plus/main.tpl';
		//filemanager.tpl
		//$this->template='module/image_manager_plus/pexplorer.tpl';
		$this->children =array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}
	public function popup(){		
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderConnector.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinder.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderVolumeDriver.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderVolumeLocalFileSystem.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderVolumeFTP.class.php');
		$opts = array(
		'roots' => array(
					
				array(
					'driver'     => 'LocalFileSystem',
					'path'       => DIR_IMAGE.'/data', 
					'startPath'  => DIR_IMAGE.'/data', 
					'URL'        => HTTP_CATALOG.'image/data', 
					// 'alias'      => 'File system',
					'uploadOrder'  => 'deny,allow',
					'mimeDetect' => 'internal',
					'tmbPath'    => DIR_IMAGE.'/thumb',         // tmbPath to files (REQUIRED)
					'tmbURL'     => HTTP_CATALOG.'image/thumb',
					'utf8fix'    => true,
					'tmbCrop'    => false,
					'tmbBgColor' => 'transparent',
					'accessControl' => 'access',
					'copyOverwrite' => false,
					'uploadOverwrite' => false,
					// 'uploadDeny' => array('application', 'text/xml')
				),	
				
				array(
		            'driver' => 'FTP',
		            'host'          => FLINK,
					'user'          => FUSER,
					'pass'          => FPASS,
					'port'          => 21,
					'URL'        => FHTTP.'/data',
					'mode'        	=> 'passive',
					'path'			=> FPATH,
					'timeout'		=> 20,
					'owner'         => true,
					'dirMode'       => 0755,
					'fileMode'      => 0644,
					'startPath'  => FPATH.'/data', 
					'URL'        => FHTTP, 
					'uploadOrder'  => 'deny,allow',
					'mimeDetect' => 'internal',
					'tmbPath'    => FPATH.'/thumb',         // tmbPath to files (REQUIRED)
					'tmbURL'     => FHTTP.'/thumb',
					'utf8fix'    => true,
					'tmbCrop'    => false,
					'tmbBgColor' => 'transparent',
					'accessControl' => 'access',
					'copyOverwrite' => false,
					'uploadOverwrite' => false
		        )		

			)
		);
		// run elFinder
		$connector = new elFinderConnector(new elFinder($opts));
		$connector->run();
	}
	public function main(){		
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderConnector.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinder.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderVolumeDriver.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderVolumeLocalFileSystem.class.php');
		require_once(DIR_APPLICATION . 'view/template/module/image_manager_plus/php/elFinderVolumeFTP.class.php');
		$opts = array(
		'roots' => array(
				array(
					'driver'     => 'LocalFileSystem',
					'path'       => DIR_IMAGE.'/data', 
					'startPath'  => DIR_IMAGE.'/data', 
					'URL'        => HTTP_CATALOG.'image/data', 
					// 'alias'      => 'File system',
					'uploadOrder'  => 'deny,allow',
					'mimeDetect' => 'internal',
					'tmbPath'    => DIR_IMAGE.'/thumb',         // tmbPath to files (REQUIRED)
					'tmbURL'     => HTTP_CATALOG.'image/thumb',
					'utf8fix'    => true,
					'tmbCrop'    => false,
					'tmbBgColor' => 'transparent',
					'accessControl' => 'access',
					'copyOverwrite' => false,
					'uploadOverwrite' => false,
					// 'uploadDeny' => array('application', 'text/xml')
				),	
				
				array(
		            'driver' => 'FTP',
		            'host'          => FLINK,
					'user'          => FUSER,
					'pass'          => FPASS,
					'port'          => 21,
					'URL'        => FHTTP.'/data',
					'mode'        	=> 'passive',
					'path'			=> FPATH,
					'timeout'		=> 20,
					'owner'         => true,
					'dirMode'       => 0755,
					'fileMode'      => 0644,
					'startPath'  => FPATH.'/data', 
					'URL'        => FHTTP, 
					'uploadOrder'  => 'deny,allow',
					'mimeDetect' => 'internal',
					'tmbPath'    => FPATH.'/thumb',         // tmbPath to files (REQUIRED)
					'tmbURL'     => FHTTP.'/thumb',
					'utf8fix'    => true,
					'tmbCrop'    => false,
					'tmbBgColor' => 'transparent',
					'accessControl' => 'access',
					'copyOverwrite' => false,
					'uploadOverwrite' => false
		        )		
			)
		);
		// run elFinder
		$connector = new elFinderConnector(new elFinder($opts));
		$connector->run();
	}

}
?>
