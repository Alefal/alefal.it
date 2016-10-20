import { Component } from '@angular/core';
import { NavParams, NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { GiocatoriModal } from './giocatori-modal';

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

  constructor(
    public params: NavParams,
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) { 
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
  }

  ionViewDidLoad() {
    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getSquadre','','','','',this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.squadre = res[0].teams;
        } else {
          this.squadre = 'Nessun dato! Riprovare più tardi.';
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

  vediGiocatori(squadraId,squadraName,tipologiaTorneo) {
    let modal = this.modalCtrl.create(GiocatoriModal, { squadraId: squadraId, squadraName: squadraName, tipologiaTorneo: tipologiaTorneo });
    modal.present();
  }
}