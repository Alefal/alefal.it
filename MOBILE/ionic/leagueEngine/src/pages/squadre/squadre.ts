import { Component } from '@angular/core';
import { NavParams, NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { GiocatoriModal }       from './giocatori-modal';


@Component({
  selector: 'page-squadre',
  templateUrl: 'squadre.html'
})
export class Squadre {

  squadre: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  tipologiaTorneo: string;

  networkFound: any;

  constructor(
    public params: NavParams,
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController, 
    public connectivityService: ConnectivityService
  ) { 
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
  }

  ionViewDidLoad() {
    this.networkFound = this.connectivityService.connectivityFound;

    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getSquadre') === null) {
        this.connectivityService.showInfoNoData('');
      } else {
        this.squadre = JSON.parse(localStorage.getItem('getSquadre'));
      this.connectivityService.showInfo();
      }
    }
  }
  getData(){
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getSquadre','','','','',this.tipologiaTorneo)
      .subscribe(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.squadre = res[0].teams;
          localStorage.setItem('getSquadre',JSON.stringify(this.squadre));
        } else {
          this.squadre = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  vediGiocatori(squadraId,squadraName,tipologiaTorneo) {
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(GiocatoriModal, { squadraId: squadraId, squadraName: squadraName, tipologiaTorneo: tipologiaTorneo });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
  }
}