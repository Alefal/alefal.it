<?php if (!defined('BASEPATH')) die();
class Category extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('categorymodel');

		$this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->categorymodel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('category', $data);
      	$this->load->view('include/footer');

      	//REST call: 
      	//	http://localhost/alefal.it/CodeIgniter-Bootstrap/index.php/CategoryREST/items
      	//	http://localhost/alefal.it/CodeIgniter-Bootstrap/index.php/CategoryREST/items/format/json
	}

	public function insertUpdate()
	{
		$categoryId = $this->input->post('categoryId');
		$categoryName = $this->input->post('categoryName');

		if($categoryId != '') {
			$this->categorymodel->updateEntry($categoryId,$categoryName);
		} else {
			$this->categorymodel->insertEntry($categoryName);
		}
	
		redirect('category','refresh');
		//$this->index();
	}

	public function delete()
	{
		$categoryId = $this->input->get('idCategory');
		$this->categorymodel->deleteEntry($categoryId);

		redirect('category','refresh');
		//$this->index();
	}
	
}