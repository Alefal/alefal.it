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
        $this->load->model('statemodel');

        $this->load->library('../models/itembean.php');
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

		//get all input
		$data = $this->input->post(NULL, TRUE);
		//echo '<pre>'; var_dump($data); echo '</pre>';

		//INSERT into ORDERS
		$idOrder = $this->input->post('idOrder');
		$idGuest = $this->input->post('idGuest');
		$idState = $this->input->post('idState');
		$total = 0; //aggiornare in base a orderline
		$numFattura = $this->input->post('numFattura');
		
		if($idOrder != '') {
			$this->ordersmodel->updateEntry($idOrder,$idGuest,$idState,$total,$numFattura);
		} else {
			$this->ordersmodel->insertEntry($idGuest,$idState,$total,$numFattura);
		}

		$listItemsForOrder = $this->input->post('listItemsForOrder');
		echo $listItemsForOrder;
		die;

		/*
		$orderlineArr = array();

		//INSERT into LINEORDER
		foreach ($data as $key => $value) {
    		if(substr( $key, 0, 2 ) === '__') {
    			$orderlineObj = new ItemBean();

    			if (strpos($key,'item') !== false) {
    				$orderlineObj->setitemid($value);
				}
				if (strpos($key,'quantity') !== false) {
    				$orderlineObj->setitemid($value);
				}
    			//Items
    			echo "Key: $key; Value: $value<br />\n";
    		}
		}
		
		die;
		*/

		
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