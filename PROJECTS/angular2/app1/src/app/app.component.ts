import { Component } from '@angular/core';
import { Articolo } from './articolo/articolo';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  	title = 'app works!!!';

  	myArticolo;
     
    constructor() {
        this.myArticolo = {
            titolo: 'Creare componenti Angular 2',
            autore: 'Mario Rossi',
            testo: 'Creare componenti con Angular 2 è molto semplice.',
            numApprezzamenti: 0
        };
    }

    mostraMessaggioRingraziamento(numApprezzamenti) {
      	alert('Grazie per aver espresso il tuo apprezzamento! \n Il numero di apprezzamenti raggiunti è '+ numApprezzamenti); 
    } 
}
