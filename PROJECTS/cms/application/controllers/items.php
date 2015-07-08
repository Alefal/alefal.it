<?php if (!defined('BASEPATH')) die();
class Items extends Main_Controller {

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
      	$this->load->view('items', $data);
      	$this->load->view('include/footer');
	}
   
}	