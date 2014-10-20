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
    }

   	public function index()
	{
		//$data['results'] = $this->helloModel->getAll();
		$data['category'] = $this->categoryModel->getAll();
		$data['results'] = $this->itemsModel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('items', $data);
      	$this->load->view('include/footer');

      	//REST call: http://localhost/alefal.it/CodeIgniter-Bootstrap/index.php/CategoryREST/items
	}

	public function insert()
	{
		$itemName = $this->input->post('itemName');
		$itemPrice = $this->input->post('itemPrice');
		$itemQuantity = $this->input->post('itemQuantity');
		$itemCategoryId = $this->input->post('itemCategoryId');
		$this->itemsModel->insertEntry($itemName,$itemPrice,$itemQuantity,$itemCategoryId);

		$this->index();
	}

	public function update()
	{
		$categoryId 	= $this->input->post('idCategory');
		$categoryName 	= $this->input->post('category');
		$this->itemsModel->updateEntry($categoryId,$categoryName);

		$this->index();
	}

	public function delete()
	{
		$itemId = $this->input->get('idItem');
		$this->itemsModel->deleteEntry($itemId);

		$this->index();
	}
   
}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */	