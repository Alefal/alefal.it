<?php if (!defined('BASEPATH')) die();
class Frontpage extends Main_Controller {

   	public function index()
	{
		$this->load->model('helloModel');
		//$data['results'] = $this->helloModel->getAll();
		$data['results'] = $this->helloModel->getbyId('1');
		$this->load->view('hello', $data);

		/*
		$item = json_decode(
    		file_get_contents('http://localhost/alefal.it/CodeIgniter_2.2.0/index.php/HelloREST/item/id/1/format/json')
		);
		*/

    	$this->load->view('include/header');
      	$this->load->view('frontpage', $data);
      	$this->load->view('include/footer');
	}
   
}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */
