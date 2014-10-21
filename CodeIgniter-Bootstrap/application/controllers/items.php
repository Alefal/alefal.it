<?php if (!defined('BASEPATH')) die();
class Items extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('categoryModel');
		$this->load->model('itemsModel');

		$this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['categoryList'] = $this->categoryModel->getAll();
		$data['results'] = $this->itemsModel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('items', $data);
      	$this->load->view('include/footer');

 	}

	public function insert()
	{
		$itemName = $this->input->post('itemName');
		$itemPrice = $this->input->post('itemPrice');
		$itemQuantity = $this->input->post('itemQuantity');
		$itemCategoryId = $this->input->post('itemCategoryId');
		$this->itemsModel->insertEntry($itemName,$itemPrice,$itemQuantity,$itemCategoryId);

		redirect('items','refresh');
		//$this->index();
	}

	public function update()
	{
		$categoryId 	= $this->input->post('idCategory');
		$categoryName 	= $this->input->post('category');
		$this->itemsModel->updateEntry($categoryId,$categoryName);

		redirect('items','refresh');
		//$this->index();
	}

	public function delete()
	{
		$itemId = $this->input->get('idItem');
		$this->itemsModel->deleteEntry($itemId);

		redirect('items','refresh');
		//$this->index();
	} 
}	