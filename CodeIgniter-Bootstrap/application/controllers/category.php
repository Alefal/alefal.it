<?php if (!defined('BASEPATH')) die();
class Category extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('categoryModel');
    }

   	public function index()
	{
		//$data['results'] = $this->helloModel->getAll();
		$data['results'] = $this->categoryModel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('category', $data);
      	$this->load->view('include/footer');

      	//REST call: http://localhost/alefal.it/CodeIgniter-Bootstrap/index.php/CategoryREST/items
	}

	public function insert()
	{
		$categoryName = $this->input->post('category');
		$this->categoryModel->insertEntry($categoryName);

		$this->index();
	}

	public function update()
	{
		$categoryId 	= $this->input->post('idCategory');
		$categoryName 	= $this->input->post('category');
		$this->categoryModel->updateEntry($categoryId,$categoryName);

		$this->index();
	}

	public function delete()
	{
		$categoryId = $this->input->get('idCategory');
		$this->categoryModel->deleteEntry($categoryId);

		$this->index();
	}
   
}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */	