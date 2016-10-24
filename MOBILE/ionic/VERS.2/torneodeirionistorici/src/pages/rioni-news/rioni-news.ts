import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { RioniNewsModal }       from './rioni-news-modal';


@Component({
  selector: 'page-rioni-news',
  templateUrl: 'rioni-news.html'
})
export class RioniNews {

  news: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController, 
    public connectivityService: ConnectivityService
  ) { }

  ionViewDidLoad() {
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getRioniNews') === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.news = JSON.parse(localStorage.getItem('getRioniNews'));
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
      .getCallHttp('getRioniNews','','','','','')
      .then(res => {
        console.log('SUCCESS: ' + JSON.stringify(res));
        this.news = res.posts;
        localStorage.setItem('getRioniNews',JSON.stringify(this.news));
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
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(RioniNewsModal, { title: title, content: content });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
  }

}