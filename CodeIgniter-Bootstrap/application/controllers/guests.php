<?php if (!defined('BASEPATH')) die();
class Guests extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
		$this->load->model('guestsModel');
    }

   	public function index()
	{
		$data['results'] = $this->guestsModel->getAll();
		
		$this->load->view('include/header');
      	$this->load->view('guests', $data);
      	$this->load->view('include/footer');
	}

	public function insert()
	{
		$guestName = $this->input->post('guestName');
		$guestAddress = $this->input->post('guestAddress');
		$guestCity = $this->input->post('guestCity');
		$this->guestsModel->insertEntry($guestName,$guestAddress,$guestCity);

		redirect('guests','refresh');
		//$this->index();
	}

	public function update()
	{
		$categoryId 	= $this->input->post('idCategory');
		$categoryName 	= $this->input->post('category');
		$this->guestsModel->updateEntry($categoryId,$categoryName);

		redirect('guests','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idGuest = $this->input->get('idGuest');
		$this->guestsModel->deleteEntry($idGuest);

		redirect('guests','refresh');
		//$this->index();
	}
   
}	