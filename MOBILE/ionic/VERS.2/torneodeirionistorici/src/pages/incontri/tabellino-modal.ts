import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { LoopNumber } from '../../pipes/loopnumber.pipe.ts'

@Component({
  selector: 'page-tabellino-modal',
  templateUrl: 'tabellino-modal.html'
})
export class TabellinoModal {

  matchId: number;
  teamHome: string;
  teamAway: string;
  result: string;

  tabellinoHome: any;
  tabellinoAway: any;

  loading: any;
  errorMessage: String;
  errorMessageView: any;

  constructor(
    params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
  ) {
    this.matchId = params.get('id');
    this.teamHome = params.get('teamHome');
    this.teamAway = params.get('teamAway');
    this.result = params.get('result');

    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getTabellino', '', '',this.matchId)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.tabellinoHome = res[0].home;
          this.tabellinoAway = res[0].away;
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

  counter(num) {
    console.log(num);
    
  }

}
