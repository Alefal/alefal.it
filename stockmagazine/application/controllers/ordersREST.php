<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require(APPPATH.'/libraries/REST_Controller.php');

class OrdersREST extends REST_Controller {
	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->model('ordersModel');
    }

    function items_get()
    {
        $items = $this->ordersModel->getAll();
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } else
        {
            $this->response(NULL, 404);
        }
    }
}