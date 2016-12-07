import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { ComunicatoModal }      from './comunicato-modal';

@Component({
  selector: 'page-comunicati',
  templateUrl: 'comunicati.html'
})
export class Comunicati {

  comunicati: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  networkFound: any;

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController, 
    public connectivityService: ConnectivityService
  ) { }

  ionViewDidLoad() {
    this.networkFound = this.connectivityService.connectivityFound;

    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getComunicatiUfficiali') === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.comunicati = JSON.parse(localStorage.getItem('getComunicatiUfficiali'));
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
      .getCallHttp('getComunicatiUfficiali','','','','','')
      .then(res => {
        console.log('SUCCESS: ' + JSON.stringify(res));
        this.comunicati = res.posts;
        localStorage.setItem('getComunicatiUfficiali',JSON.stringify(this.comunicati));
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  leggiComunicato(title,content) {
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(ComunicatoModal, { title: title, content: content });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
    
  }
}