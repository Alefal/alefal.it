import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms'; 

@Component({
  selector: 'app-articolo-form-reactive',
  templateUrl: './articolo-form-reactive.component.html',
  styleUrls: ['./articolo-form-reactive.component.css']
})
export class ArticoloFormReactiveComponent implements OnInit {

	registerForm = new FormGroup({
    firstname: new FormControl(),
    lastname: new FormControl(),
    address: new FormGroup({
      street: new FormControl(),
      zip: new FormControl(),
      city: new FormControl()
    })
  });

	myForm = new FormGroup({ 
     
      txtTitolo: new FormControl(), 
      txtAutore: new FormControl(), 
      txtTesto: new FormControl() 
    });

	  constructor() { 
    /*
    this.myForm = new FormGroup({ 
     
      txtTitolo: new FormControl(), 
      txtAutore: new FormControl(), 
      txtTesto: new FormControl() 
    });
    */ 
  }  

	  ngOnInit() {
	  }



    visualizzaArticolo() { 
    	console.log(this.myForm.value);

	   console.log(this.myForm.controls["txtTitolo"].value); 
	} 

}
