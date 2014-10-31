<?php if (!defined('BASEPATH')) die();
class Tags extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('tagsmodel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['results'] = $this->tagsmodel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('tags', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{
		$tagsId = $this->input->post('tagsId');
		$tagsName = $this->input->post('tagsName');

		if($tagsId != '') {
			$this->tagsmodel->updateEntry($tagsId,$tagsName);
		} else {
			$this->tagsmodel->insertEntry($tagsName);
		}
	
		redirect('tags','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idTags = $this->input->get('idTags');
		$this->tagsmodel->deleteEntry($idTags);

		redirect('tags','refresh');
		//$this->index();
	}
   
}	