<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require(APPPATH.'/libraries/REST_Controller.php');

class ItemsREST extends REST_Controller {
	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->model('itemsmodel');
        $this->load->model('extrafieldsmodel');
    }

    function items_get()
    {
        $items = $this->itemsmodel->getAll();
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } else
        {
            $this->response(NULL, 404);
        }
    }

    function item_get($id)
    {
        $id = $this->input->get('id');

        $item = $this->itemsmodel->getById($id);
        $extra = $this->extrafieldsmodel->getByItemId($id);

        $itemComplete = array(
                'item' => $item,
                'extra' => $extra);

        if($itemComplete) {
            $this->response($itemComplete, 200); // 200 being the HTTP response code
        } else
        {
            $this->response(NULL, 404);
        }
    }

    function allCoords_get()
    {
        $items = $this->itemsmodel->getAllCoords();
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } else
        {
            $this->response(NULL, 404);
        }
    }
}