<?php if (!defined('BASEPATH')) die();
class Items extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('categorymodel');
		$this->load->model('itemsmodel');

		$this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['categoryList'] = $this->categorymodel->getAll();
		$data['results'] = $this->itemsmodel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('items', $data);
      	$this->load->view('include/footer');

 	}

	public function insertUpdate()
	{
		$itemId = $this->input->post('itemId');
		$itemName = $this->input->post('itemName');
		$itemQuantity = $this->input->post('itemQuantity');
		$itemCategoryId = $this->input->post('itemCategoryId');
		

		if($itemId != '') {
			$this->itemsmodel->updateEntry($itemId,$itemName,$itemQuantity,$itemCategoryId);
		} else {
			$this->itemsmodel->insertEntry($itemName,$itemQuantity,$itemCategoryId);
		}
	
		redirect('items','refresh');
		//$this->index();
	}

	public function delete()
	{
		$itemId = $this->input->get('idItem');
		$this->itemsmodel->deleteEntry($itemId);

		redirect('items','refresh');
		//$this->index();
	} 
}	