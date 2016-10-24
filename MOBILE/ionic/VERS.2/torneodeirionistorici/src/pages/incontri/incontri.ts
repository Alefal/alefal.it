import { Component } from '@angular/core';
import { NavParams, NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { TabellinoModal }       from './tabellino-modal';
import { LiveModal }            from './live-modal';


@Component({
  selector: 'page-incontri',
  templateUrl: 'incontri.html'
})
export class Incontri {

  incontri: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  tipologiaTorneo: string;
  group: number;
  type: string;
  round: number;

  constructor(
    public params: NavParams,
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController, 
    public connectivityService: ConnectivityService
  ) { 
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
    this.group  = params.get('group');
    this.type   = params.get('type');
    this.round  = params.get('round');

    console.log('this.round: ' + this.round);
  }

  ionViewDidLoad() {
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getIncontri_'+this.round) === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.incontri = JSON.parse(localStorage.getItem('getIncontri_'+this.round));
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
      .getCallHttp('getIncontri','',this.round,this.type,this.group,this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.incontri = res[0].matchs;
          localStorage.setItem('getIncontri_'+this.round,JSON.stringify(this.incontri));
        } else {
          this.incontri = 'Nessun dato! Riprovare più tardi.';
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

  tabellino(id,teamHome,teamAway,result,home_team_id,away_team_id,home_team_logo,away_team_logo) {
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(TabellinoModal, { 
        id:id,
        teamHome:teamHome,
        teamAway:teamAway,
        result:result,
        home_team_id: home_team_id,
        away_team_id: away_team_id,
        tipologiaTorneo: this.tipologiaTorneo,
        home_team_logo: home_team_logo,
        away_team_logo: away_team_logo 
      });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
  }

  live(matchId,homeName,awayName,result,home_team_logo,away_team_logo) {
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(LiveModal, { 
        matchId: matchId ,
        homeName:homeName,
        awayName:awayName,
        result:result,
        tipologiaTorneo: this.tipologiaTorneo,
        home_team_logo: home_team_logo,
        away_team_logo: away_team_logo 
      });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
  }

}
