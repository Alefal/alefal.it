import { Component, OnInit, Input } from '@angular/core';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms'; 

import { Articolo} from '../articolo/articolo'; 

@Component({
  selector: 'app-articolo-form-reactive',
  templateUrl: './articolo-form-reactive.component.html',
  styleUrls: ['./articolo-form-reactive.component.css']
})
export class ArticoloFormReactiveComponent implements OnInit {

  myForm: FormGroup; 
  @Input() model: Articolo;

	constructor(fb: FormBuilder) { 
    this.model = new Articolo();  
 
 
    this.myForm = fb.group({ 
      txtTitolo: ["", [ Validators.required, 
                Validators.maxLength(30)] 
            ], 
      txtAutore: ["", [ Validators.required, 
                Validators.maxLength(20)] 
            ], 
      txtTesto: ["", [  Validators.required, 
                Validators.minLength(2000),   
                Validators.maxLength(5000)] 
            ] 
    }); 

    this.myForm.valueChanges.subscribe(value => { 
      this.model.titolo = value.txtTitolo; 
      this.model.autore = value.txtAutore; 
      this.model.testo = value.txtTesto; 
    });

    this.myForm.controls["txtTitolo"].valueChanges.subscribe(value => { 
      console.log('stai modificando il titolo...');
    });
  }  

	  ngOnInit() {
	  }

    visualizzaArticolo() { 

      console.log(this.model.titolo);

    	console.log(this.myForm.value);

	   console.log(this.myForm.controls["txtTitolo"].value); 
	} 

}
