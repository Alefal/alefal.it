import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';

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

  constructor(
    public params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
  ) {
    this.stat = params.get('stat');
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
  
    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getStatistiche','','','',this.stat,this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.stats = res[0].stats;
        } else {
          this.stats = 'Nessun dato! Riprovare più tardi.';
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

  dismiss() {
    this.viewCtrl.dismiss();
  }

}