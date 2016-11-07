import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
//import { LoopNumber } from '../../pipes/loopnumber.pipe.ts'

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
  errorMessage: string;
  errorMessageView: any;

  match: any;
  matchesEvents: any;
  home_team_id: number;
  away_team_id: number;

  home_team_logo: string;
  away_team_logo: string;

  tipologiaTorneo: string;

  intervalId: any;

  constructor(
    public params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
  ) {
    this.matchId          = params.get('id');
    this.teamHome         = params.get('teamHome');
    this.teamAway         = params.get('teamAway');
    this.result           = params.get('result');
    this.home_team_id     = params.get('home_team_id');
    this.away_team_id     = params.get('away_team_id');
    this.home_team_logo   = params.get('home_team_logo');
    this.away_team_logo   = params.get('away_team_logo');

    console.log(this.home_team_logo);
    console.log(this.away_team_logo);

    this.tipologiaTorneo = params.get('tipologiaTorneo');

    this.getTabellino(this.matchId);

    this.intervalId = setInterval(() => {
      this.getTabellinoPolling(this.matchId);
    }, 10000);
    
  }

  dismiss() {
    clearInterval(this.intervalId);
    this.viewCtrl.dismiss();
  }

  counter(num) {
    console.log(num);
  }

  getTabellino(matchId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getTabellino','','',matchId,'',this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          //this.match          = res[0].match;
          this.matchesEvents  = res[0].matchesEvents;
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
  getTabellinoPolling(matchId) {
    this.httpService
      .getCallHttp('getTabellino','','',matchId,'',this.tipologiaTorneo)
      .then(res => {
        if (res[0].response[0].result == 'OK') {
          //this.match          = res[0].match;
          this.result           = res[0].match[0].home_team_score +' - '+ res[0].match[0].away_team_score;
          this.home_team_logo   = res[0].match[0].home_team_logo;
          this.away_team_logo   = res[0].match[0].away_team_logo;

          this.matchesEvents  = res[0].matchesEvents;
        }
      })
      .catch(error => {
        console.log('ERROR: ' + error);
      });
  }

}