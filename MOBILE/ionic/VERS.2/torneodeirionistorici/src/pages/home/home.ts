import { Component }      from '@angular/core';
import { NavController, NavParams, LoadingController }  from 'ionic-angular';

import { Comunicati }     from '../comunicati/comunicati';
import { RioniNews }      from '../rioni-news/rioni-news';
import { Squadre }        from '../squadre/squadre';
import { Incontri }       from '../incontri/incontri';
import { Classifica }     from '../classifica/classifica';
import { Statistiche }    from '../statistiche/statistiche';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  tournament: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public params: NavParams, 
    public connectivityService: ConnectivityService
  ) { }

  ionViewDidLoad() {
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getTipoTorneo') === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.tournament = localStorage.getItem('getTipoTorneo');
        this.connectivityService.showInfo();
      }
    }
  }
  getData(){
    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getTipoTorneo','','','','','')
      .then(res => {
        if(res[0].response[0].result == 'OK') {
          this.tournament = res[0].tournament[0].tour_type;
          localStorage.setItem('getTipoTorneo',this.tournament);
        } else {
          this.tournament = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  navigate(section,tipologia) {
    console.log('-> '+section);
    console.log('-> '+this.connectivityService.connectivityFound);

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
    } else if(section == 'ScontriDiretti'){
      this.navCtrl.push(Incontri, {
        tipologia: tipologia,
        type: 'knockout'
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