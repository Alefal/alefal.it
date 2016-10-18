import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

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

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) { }

  ionViewDidLoad() {}

  leggiStatistica(stat) {
    let modal = this.modalCtrl.create(StatisticaModal, { stat: stat });
    modal.present();
  }

}