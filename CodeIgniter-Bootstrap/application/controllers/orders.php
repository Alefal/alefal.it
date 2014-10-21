<?php if (!defined('BASEPATH')) die();
class Orders extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('ordersModel');

        $this->load->model('itemsModel');
        $this->load->model('guestsModel');
        $this->load->model('stateModel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['itemsList'] = $this->itemsModel->getAll();
		$data['guestsList'] = $this->guestsModel->getAll();
		$data['stateList'] = $this->stateModel->getAll();

		$data['results'] = $this->ordersModel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('orders', $data);
      	$this->load->view('include/footer');
	}

	public function insert()
	{
		$idItem = $this->input->post('idItem');
		$idGuest = $this->input->post('idGuest');
		$idState = $this->input->post('idState');
		$quantity = $this->input->post('quantity');
		$total = $this->input->post('total');
		
		$itemName 	= '';
		$itemPrice 	= 0;
		$itemQnt 	= 0;
		$itemCatId 	= 0;
		$item = $this->itemsModel->getById($idItem);
		foreach($item as $row) {
			$itemName = $row->name;
			$itemPrice = $row->price;
			$itemQnt = $row->quantity;
			$itemCatId = $row->categoryId;
        }
        $updateQnt = intval($itemQnt)-intval($quantity);

        $this->itemsModel->updateEntry($idItem,$itemName,$itemPrice,$updateQnt,$itemCatId);
		$this->ordersModel->insertEntry($idItem,$idGuest,$idState,$quantity,$total);

		redirect('orders','refresh');
	}

	public function update()
	{
		$categoryId 	= $this->input->post('idCategory');
		$categoryName 	= $this->input->post('category');
		$this->ordersModel->updateEntry($categoryId,$categoryName);

		redirect('orders','refresh');
		//$this->index();
	}

	public function delete()
	{
		$idOrder = $this->input->get('idOrder');
		$this->ordersModel->deleteEntry($idOrder);

		redirect('orders','refresh');
		//$this->index();
	}
   
}