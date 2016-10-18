import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { ComunicatoModal } from './comunicato-modal';

@Component({
  selector: 'page-comunicati',
  templateUrl: 'comunicati.html'
})
export class Comunicati {

  comunicati: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) { }

  ionViewDidLoad() {
    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getComunicatiUfficiali', '', '','','')
      .then(res => {
        console.log('SUCCESS: ' + JSON.stringify(res));
        this.comunicati = res.posts;
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  leggiComunicato(title,content) {
    let modal = this.modalCtrl.create(ComunicatoModal, { title: title, content: content });
    modal.present();
  }

}
