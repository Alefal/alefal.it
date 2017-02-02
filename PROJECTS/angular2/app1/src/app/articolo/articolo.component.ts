import { Component, OnInit, OnChanges, Input, Output, EventEmitter, SimpleChange } from '@angular/core';
import { Articolo }  from './articolo'

import { AngularFire, AuthProviders, AuthMethods, FirebaseListObservable } from 'angularfire2';

@Component({
  selector: 'app-articolo',
  templateUrl: './articolo.component.html',
  styleUrls: ['./articolo.component.css']
})
export class ArticoloComponent implements OnChanges /*OnInit*/ {

    items: FirebaseListObservable<any[]>;

	@Input() articolo: Articolo;
    @Output() like = new EventEmitter<number>();

  	constructor(public af: AngularFire) { 
        // Email and password
        af.auth.login({
            email: 'alefalwebmaster@gmail.com',
            password: '123456789',
        },
        {
            provider: AuthProviders.Password,
            method: AuthMethods.Password,
        }).then(function(success) {
            console.log(success);
            //alert(success);
        }).catch(function(error) {
            console.error(error);
            alert(error);
        });

        this.items = af.database.list('/items');
        console.log(this.items);
      }

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

    getDbData() {
        this.items = this.af.database.list('items');
        console.log(this.items);
    }

}
