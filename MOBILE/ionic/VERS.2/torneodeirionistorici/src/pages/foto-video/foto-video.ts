import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { FotoVideoModal }       from './foto-video-modal';


@Component({
  selector: 'page-foto-video',
  templateUrl: 'foto-video.html'
})
export class FotoVideo {

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
      if(localStorage.getItem('getFotoVideo') === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.news = JSON.parse(localStorage.getItem('getFotoVideo'));
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
      .getCallHttp('getFotoVideo','','','','','')
      .then(res => {
        console.log('SUCCESS: ' + JSON.stringify(res));
        this.news = res.posts;
        localStorage.setItem('getFotoVideo',JSON.stringify(this.news));
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
      let modal = this.modalCtrl.create(FotoVideoModal, { title: title, content: content });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
  }

}