import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController, AlertController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'page-giocatori-modal',
  templateUrl: 'giocatori-modal.html'
})
export class GiocatoriModal {

  squadraId: number;
  squadraName: string;
  giocatori: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  player: any;
  playerStats: boolean;

  tipologiaTorneo: string;
  loadingAtleti: boolean = true;

  constructor(
    params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public alertCtrl: AlertController
  ) {
    this.player = new Array();
    this.playerStats = false;

    this.squadraId = params.get('squadraId');
    this.squadraName = params.get('squadraName');
    this.tipologiaTorneo = params.get('tipologiaTorneo');

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getGiocatori',this.squadraId,'','','',this.tipologiaTorneo)
      .subscribe(res => {
        console.log('SUCCESS: ' + JSON.stringify(res));
        this.loadingAtleti = false;

        if(res[0].response[0].result == 'OK') {
          this.giocatori = res[0].atleti;
        } else {
          this.giocatori = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.loadingAtleti = false;
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  dismiss() {
    this.viewCtrl.dismiss();
  }

  statistiche(playerId) {
    this.player = new Array();

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getGiocatoriStatistiche','',playerId,'','','')
      .subscribe(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));
        //console.log('SUCCESS: ' + JSON.stringify(res[0].atleta));
        this.playerStats = false;
        
        if(res[0].response[0].result == 'OK') {
          if(res[0].atleta.length == 0) {
            this.showAlert();
          } else {
            this.playerStats = true;
            this.player = res[0].atleta;
          }
        } else {
          this.showAlert();
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

  showAlert() {
    let alert = this.alertCtrl.create({
      title: 'Nessun dato!',
      subTitle: 'Nessuna statistica presente per il giocatore scelto',
      buttons: ['OK']
    });
    alert.present();
  }

}
