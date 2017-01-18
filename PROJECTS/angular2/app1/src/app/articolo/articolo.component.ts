import { Component, OnInit, OnChanges, Input, Output, EventEmitter, SimpleChange } from '@angular/core';
import { Articolo }  from './articolo'

@Component({
  selector: 'app-articolo',
  templateUrl: './articolo.component.html',
  styleUrls: ['./articolo.component.css']
})
export class ArticoloComponent implements OnChanges /*OnInit*/ {

	  @Input() articolo: Articolo;
    @Output() like = new EventEmitter<number>();

  	constructor() { }

    /*
  	ngOnInit() {
      console.log('Il componente è in fase di inizializzazione!');
  	}
    */

    ngOnChanges(changes: {[propertyName: string]: SimpleChange}) {
     
        if (changes["articolo"] && changes["articolo"].currentValue.testo) {
         
            let testoArticolo = changes["articolo"].currentValue.testo;
            changes["articolo"].currentValue.testo = testoArticolo.replace("è", "\xE9") ;
        }
    }

    incrementaApprezzamenti() {
        this.articolo.numApprezzamenti = this.articolo.numApprezzamenti + 1;
        //evento like metterà a disposizione il numero di apprezzamenti che l'articolo ha ricevuto
        this.like.emit(this.articolo.numApprezzamenti);
    }

}
