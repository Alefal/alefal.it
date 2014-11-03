<?php if (!defined('BASEPATH')) die();
class Stock extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('itemsmodel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->itemsmodel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('stock', $data);
      	$this->load->view('include/footer');
	}

	public function updateQuantity()
	{
		$itemId = $this->input->post('itemId');
		$itemName = $this->input->post('itemName');
		$itemPrice = $this->input->post('itemPrice');
		$itemQuantity = $this->input->post('itemQuantity');
		$itemCategoryId = $this->input->post('itemCategoryId');

		$itemQuantityUpdate = $this->input->post('itemQuantityUpdate');
		$itemNewQuantity = $itemQuantity + $itemQuantityUpdate;

		$this->itemsmodel->updateEntry($itemId,$itemName,$itemPrice,$itemNewQuantity,$itemCategoryId);

		redirect('stock','refresh');
		//$this->index();
	} 
   
}	