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
		$categoryNameIt = $this->input->post('categoryName');
		$categoryNameEn = $this->input->post('categoryNameEn');
		$descriptionIt = $this->input->post('descriptionIt');
		$descriptionEn = $this->input->post('descriptionEn');
		$categoryParent = $this->input->post('categoryParent');

		if($categoryId != '') {
			$this->categoriesmodel->updateEntry($categoryId,$categoryNameIt,$categoryNameEn,$descriptionIt,$descriptionEn,$categoryParent);
		} else {
			$this->categoriesmodel->insertEntry($categoryNameIt,$categoryNameEn,$descriptionIt,$descriptionEn,$categoryParent);
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