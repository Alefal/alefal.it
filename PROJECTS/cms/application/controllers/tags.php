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
		$tagsNameIt = $this->input->post('tagsName');
		$tagsNameEn = $this->input->post('tagsNameEn');

		/*
		echo $tagsId.' - '.$tagsNameIt.' - '.$tagsNameEn;

		print_r($_POST);
        echo '<hr />';
        print_r($this->input->post());
        echo '<hr />';
		die();
		*/

		if($tagsId != '') {
			$this->tagsmodel->updateEntry($tagsId,$tagsNameIt,$tagsNameEn);
		} else {
			$this->tagsmodel->insertEntry($tagsNameIt,$tagsNameEn);
		}
	
		redirect('tags','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idTag = $this->input->get('idTag');
		$this->tagsmodel->deleteEntry($idTag);

		redirect('tags','refresh');
		//$this->index();
	}
   
}	