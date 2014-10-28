<?php if (!defined('BASEPATH')) die();
class Orders extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('ordersmodel');

        $this->load->model('itemsmodel');
        $this->load->model('guestsmodel');
        $this->load->model('statemodel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['itemsList'] = $this->itemsmodel->getAll();
		$data['guestsList'] = $this->guestsmodel->getAll();
		$data['stateList'] = $this->statemodel->getAll();

		$data['results'] = $this->ordersmodel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('orders', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{
		$idOrder = $this->input->post('idOrder');
		$idItem = $this->input->post('idItem');
		$idGuest = $this->input->post('idGuest');
		$idState = $this->input->post('idState');
		$quantity = $this->input->post('quantity');
		
		$itemName 	= '';
		$itemPrice 	= 0;
		$itemQnt 	= 0;
		$itemCatId 	= 0;
		$item = $this->itemsmodel->getById($idItem);
		foreach($item as $row) {
			$itemName = $row->name;
			$itemPrice = $row->price;
			$itemQnt = $row->quantity;
			$itemCatId = $row->categoryId;
        }
        $updateQnt = intval($itemQnt)-intval($quantity);
		$total = $itemPrice * $quantity;

		$stateType 	= '';
		$state = $this->statemodel->getById($idState);
		foreach($state as $row) {
			$stateType = $row->type;
        }

        //Si deve fare solo se ordine è EVASO
        if($stateType == 'evaso') {
			$this->itemsmodel->updateEntry($idItem,$itemName,$itemPrice,$updateQnt,$itemCatId);
        }

        if($idOrder != '') {
			$this->ordersmodel->updateEntry($idOrder,$idItem,$idGuest,$idState,$quantity,$total);
		} else {
			$this->ordersmodel->insertEntry($idItem,$idGuest,$idState,$quantity,$total);
		}
	
		redirect('orders','refresh');
	}

	public function delete()
	{
		$idOrder = $this->input->get('idOrder');
		$this->ordersmodel->deleteEntry($idOrder);

		redirect('orders','refresh');
	}
   
}