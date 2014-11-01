<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require(APPPATH.'/libraries/REST_Controller.php');

class CategoriesREST extends REST_Controller {
	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->model('categoriesmodel');
    }

    function items_get()
    {
        $items = $this->categoriesmodel->getAll();
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } else
        {
            $this->response(NULL, 404);
        }
    }

    function parentcategories_get()
    {
        $id = $this->input->get('id');
        $items = $this->categoriesmodel->getParentCategories($id);
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } 
        else
        {
            $this->response(NULL, 404);
        }
    }

    function subcategory_get()
    {
        $id = $this->input->get('id');
        $items = $this->categoriesmodel->getById($id);
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } 
        else
        {
            $this->response(NULL, 404);
        }
    }

    function subcategorylist_get()
    {
        $id = $this->input->get('id');
        $items = $this->categoriesmodel->getSubCategoryList($id);
         
        if($items) {
            $this->response($items, 200); // 200 being the HTTP response code
        } 
        else
        {
            $this->response(NULL, 404);
        }
    }
}