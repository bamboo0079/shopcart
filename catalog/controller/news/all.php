<?php
class ControllerNewsAll extends Controller {
	public function index() {
		$this->load->model('catalog/news_category');
		
		$this->language->load('news/all');
		
		$this->language->load('news/news');
		
		$this->load->model('catalog/news');
		
		$this->load->model('catalog/news_comment');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
					
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);
   		
   		$data = array(
			'sort'  => 'n.date_added',
			'order' => 'DESC',
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);
				
		$news_total = $this->model_catalog_news->getTotalNewss($data); 
		if ($news_total > 0) {
			
	  	$this->document->setTitle($this->language->get('text_news'));
		$this->document->setDescription($this->language->get('text_description'));
		$this->document->setKeywords($this->language->get('text_keywords'));
		$this->document->addLink($this->url->link('news/all'), 'canonical');			
			
			$this->data['heading_title'] = $this->language->get('text_news');
			
			$this->data['text_news'] = $this->language->get('text_news');
			$this->data['text_h1'] = $this->language->get('text_h1');
			$this->data['text_sendnews'] = $this->language->get('text_sendnews');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_limit'] = $this->language->get('text_limit');					
			$this->data['text_post_on'] = $this->language->get('text_post_on');
			$this->data['text_viewed'] = $this->language->get('text_viewed');
			
			$this->data['sendnews'] = $this->url->link('news/send');
			
			$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->data['breadcrumbs'][] = array(
  				'text'      => $this->language->get('text_news'),
				'href'      => $this->url->link('news/all'),
  				'separator' => $this->language->get('text_separator')
  			);
			
			$url = '';
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}			
			
			$this->data['news'] = array();			
			
			$results = $this->model_catalog_news->getNewss($data);
			
			foreach ($results as $result) {
				$width = ''; $height = '';
				if ($result['image']) {
					$image = $this->model_tool_image->onesize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
				} else {
					$firstImgnews = catchFirstImage(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
					if($firstImgnews == 'no_image.jpg'){
						$image = $this->model_tool_image->onesize('no_image.jpg', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
					}else{
						
						$image = $firstImgnews;
						$width = 'width="'.$this->config->get('config_image_thumb_width').'"'; $height = 'height="'.$this->config->get('config_image_thumb_height').'"';
					}					
				}
				
				if (empty($result['short_description'])) {
					$short_description = cutString(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),90,true);
					//$short_description = substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 500).' ...';
				}else{
					$short_description = nl2br($result['short_description']);
				}
				
				$count_comment = $this->model_catalog_news_comment->getTotalCommentsByNewsId($result['news_id']); 
				$comment = sprintf($this->language->get('text_comment'), (int)$count_comment);
								
				$this->data['news'][] = array(
					'news_id'  => $result['news_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'short_description'       => $short_description,
					'date_added'       => date('D, '.$this->language->get('date_format_short'), strtotime($result['date_added'])),	
					'comment'       =>  $comment,				
					'width'      => $width, 
					'height'      => $height, 	
					'viewed'      => sprintf($this->language->get('text_viewed'), (int)$result['viewed']), 
					'href'        => $this->url->link('news/news', '&news_id=' . $result['news_id'])
				);
			}
			
			
			$url = '';
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			
			$url = '';		
			
			$this->data['limits'] = array();
			
			$this->data['limits'][] = array(
				'text'  => $this->config->get('config_catalog_limit'),
				'value' => $this->config->get('config_catalog_limit'),
				'href'  => $this->url->link('news/all', $url . '&limit=' . $this->config->get('config_catalog_limit'))
			);
						
			$this->data['limits'][] = array(
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('news/all', $url . '&limit=25')
			);
			
			$this->data['limits'][] = array(
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('news/all', $url . '&limit=50')
			);

			$this->data['limits'][] = array(
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('news/all', $url . '&limit=75')
			);
			
			$this->data['limits'][] = array(
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('news/all', $url . '&limit=100')
			);
						
			$url = '';			
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
				
			$pagination = new Pagination();
			$pagination->total = $news_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('news/all', $url . '&page={page}');
			$this->data['pagination'] = $pagination->render();		
			
			$this->data['limit'] = $limit;
		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/all.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/all.tpl';
			} else {
				$this->template = 'default/template/news/all.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
				
			$this->response->setOutput($this->render());										
    } else {
			$url = '';
			
			if (isset($this->request->get['news_category_id'])) {
				$url .= '&news_category_id=' . $this->request->get['news_category_id'];
			}			
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('news/all', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
			$this->response->setOutput($this->render());
		}
  }
}
?>