<?php if (!defined('BASEPATH')) die();
class Orders extends Main_Controller {

	function __construct()
    {
        // Call the Model constructor
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('ordersmodel');
        $this->load->model('orderlinemodel');

        $this->load->model('itemsmodel');
        $this->load->model('guestsmodel');

        $this->load->library('../controllers/home');
    }

   	public function index()
	{
		$this->home->checkUserLogged();

		$data['itemsList'] = $this->itemsmodel->getAll();
		$data['guestsList'] = $this->guestsmodel->getAll();

		$data['resultOrders'] = $this->ordersmodel->getAllJoin();
		
		$this->load->view('include/header');
      	$this->load->view('orders', $data);
      	$this->load->view('include/footer');
	}

	public function insertUpdate()
	{

		//get all input
		//$data = $this->input->post(NULL, TRUE);
		//echo '<pre>'; var_dump($data); echo '</pre>';

		//INSERT into ORDERS
		$idOrder 		= $this->input->post('idOrder');
		$idGuest 		= $this->input->post('idGuest');
		$totalOrder 	= $this->input->post('totale');
		$numFattura 	= $this->input->post('numFattura');
		$pagato 		= $this->input->post('pagato');
		$datapagamento 	= $this->input->post('datapagamento');
		$tipopagamento 	= $this->input->post('tipopagamento');
		$note 			= $this->input->post('note');
		
		if($idOrder != '') {
			$this->ordersmodel->updateEntry($idOrder,$idGuest,$totalOrder,$numFattura,$pagato,$datapagamento,$tipopagamento,$note);
		} else {
			$this->ordersmodel->insertEntry($idGuest,$totalOrder,$numFattura,$pagato,$datapagamento,$tipopagamento,$note);
		
			/**********
			//INSERT into LINE ORDER
			$listItemsForOrder = $this->input->post('listItemsForOrder');
			//print_r($listItemsForOrder);
			$data = json_decode($listItemsForOrder);
			foreach ($data as $item) {
				//echo($numFattura.' | '.$item->id.' | '.$item->quantity.'<br />');

				// Per ogni linea d'ordine si deve:
				// - calcolare il TOTALE 						-> OK
				// - sommare il totale a quello dell'ordine 	-> si potrebbe togliere dall'ordine
				$itemName 	= '';
				$itemPrice 	= 0;
				$itemQnt 	= 0;
				$itemCatId 	= 0;
				$itemFound = $this->itemsmodel->getById($item->id);
				foreach($itemFound as $row) {
					$itemName = $row->name;
					$itemPrice = $row->price;
					$itemQnt = $row->quantity;
					$itemCatId = $row->categoryId;
		        }

		        $totalLineOrder = $itemPrice * $item->quantity;
				$this->orderlinemodel->insertEntry($numFattura,$item->id,$item->quantity,$totalLineOrder);

				$totalOrder += $totalLineOrder;
			}
			**********/
		}

		/*
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
		*/
		redirect('orders','refresh');
	}

	public function delete()
	{
		$idOrder = $this->input->get('idOrder');
		$this->ordersmodel->deleteEntry($idOrder);

		redirect('orders','refresh');
	}
	
   
}