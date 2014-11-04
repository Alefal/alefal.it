<?php

class ItemBean {

	private $id;
	private $quantity;

	public function setitemid($id){
	    $this->id=$id;
	}
	public function getitemid(){
	    return $id;
	}

	public function setitemquantity($quantity){
	    $this->quantity=$quantity;
	}
	public function getitemquantity(){
	    return $quantity;
	}

}