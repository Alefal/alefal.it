import { Component }      from '@angular/core';
import { NavController, NavParams }  from 'ionic-angular';

import { Comunicati }     from '../comunicati/comunicati';
import { RioniNews }      from '../rioni-news/rioni-news';
import { Squadre }        from '../squadre/squadre';
import { Incontri }       from '../incontri/incontri';
import { Classifica }     from '../classifica/classifica';
import { Statistiche }    from '../statistiche/statistiche';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  constructor(public navCtrl: NavController, public params: NavParams) { }

  navigate(section,tipologia) {
    console.log('-> '+section);

    if(section == 'Comunicati'){
      this.navCtrl.push(Comunicati);
    } else if(section == 'RioniNews'){
      this.navCtrl.push(RioniNews);
    } else if(section == 'Squadre'){
      this.navCtrl.push(Squadre, {
        tipologia: tipologia
      });
    } else if(section == 'Incontri'){
      this.navCtrl.push(Incontri, {
        tipologia: tipologia
      });
    } else if(section == 'Classifica'){
      this.navCtrl.push(Classifica, {
        tipologia: tipologia
      });
    } else if(section == 'Statistiche'){
      this.navCtrl.push(Statistiche, {
        tipologia: tipologia
      });
    }
  }
  
}