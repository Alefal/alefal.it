<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require(APPPATH.'/libraries/REST_Controller.php');

class HelloREST extends REST_Controller
	{
		function item_get()
	    {
	        if(!$this->get('id'))
	        {
	            $this->response(NULL, 400);
	        }
	 		$this->load->model('helloModel');
	        $item = $this->helloModel->getById( $this->get('id') );
	         
	        if($item)
	        {
	            $this->response($item, 200); // 200 being the HTTP response code
	        }
	 
	        else
	        {
	            $this->response(NULL, 404);
	        }
	    }
	}