import { Component }      from '@angular/core';
import { NavController }  from 'ionic-angular';

import { Classifica }     from '../classifica/classifica';
import { Comunicati }     from '../comunicati/comunicati';
import { Giornalino }     from '../giornalino/giornalino';
import { Incontri }       from '../incontri/incontri';
import { Statistiche }    from '../statistiche/statistiche';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  constructor(public navCtrl: NavController) { }

  navigate(section) {
    console.log('-> '+section);

    if(section == 'Classifica'){
      this.navCtrl.push(Classifica);
    } else if(section == 'Comunicati'){
      this.navCtrl.push(Comunicati);
    } else if(section == 'Giornalino'){
      this.navCtrl.push(Giornalino);
    } else if(section == 'Incontri'){
      this.navCtrl.push(Incontri);
    } else if(section == 'Statistiche'){
      this.navCtrl.push(Statistiche);
    }
    
  }

}
