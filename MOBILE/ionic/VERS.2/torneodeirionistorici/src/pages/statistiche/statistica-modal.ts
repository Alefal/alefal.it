import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

@Component({
  selector: 'page-statistica-modal',
  templateUrl: 'statistica-modal.html'
})
export class StatisticaModal {

  stat: string;
  stats: string;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  tipologiaTorneo: string;
  loadingAtleti: boolean = true;

  constructor(
    public params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController, 
    public connectivityService: ConnectivityService
  ) {
    this.stat = params.get('stat');
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
  
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getStatistiche_'+this.stat) === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.stats = JSON.parse(localStorage.getItem('getStatistiche_'+this.stat));
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
      .getCallHttp('getStatistiche','','','',this.stat,this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));
        this.loadingAtleti = false;

        if(res[0].response[0].result == 'OK') {
          this.stats = res[0].stats;
          localStorage.setItem('getStatistiche_'+this.stat,JSON.stringify(this.stats));
        } else {
          this.stats = 'Nessun dato! Riprovare più tardi.';
        }

        this.loading.dismiss();
      })
      .catch(error => {
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

}