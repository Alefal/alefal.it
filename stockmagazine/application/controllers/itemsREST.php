<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require(APPPATH.'/libraries/REST_Controller.php');

class ItemsREST extends REST_Controller {
	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->model('itemsModel');
    }

    function items_get()
    {
        $items = $this->itemsModel->getAll();
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } else
        {
            $this->response(NULL, 404);
        }
    }
}