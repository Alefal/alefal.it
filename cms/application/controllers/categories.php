<?php if (!defined('BASEPATH')) die();
class Categories extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('categoriesmodel');

		$this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->categoriesmodel->getAll();
		//$data['results'] = $this->categoriesmodel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('categories', $data);
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
			$this->categoriesmodel->updateEntry($categoryId,$categoryName);
		} else {
			$this->categoriesmodel->insertEntry($categoryName);
		}
	
		redirect('categories','refresh');
		//$this->index();
	}

	public function delete()
	{
		$categoryId = $this->input->get('idCategory');
		$this->categoriesmodel->deleteEntry($categoryId);

		redirect('categories','refresh');
		//$this->index();
	}
	
}