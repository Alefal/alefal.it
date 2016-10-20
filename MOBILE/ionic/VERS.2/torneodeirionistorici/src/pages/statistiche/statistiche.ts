import { Component } from '@angular/core';
import { NavParams, NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { StatisticaModal } from './statistica-modal';

@Component({
  selector: 'page-statistiche',
  templateUrl: 'statistiche.html'
})
export class Statistiche {

  ranking: any;
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

  ionViewDidLoad() {}

  leggiStatistica(stat) {
    let modal = this.modalCtrl.create(StatisticaModal, { stat: stat, tipologia: this.tipologiaTorneo });
    modal.present();
  }

}