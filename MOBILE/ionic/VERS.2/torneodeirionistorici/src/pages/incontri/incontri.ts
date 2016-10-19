import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { TabellinoModal } from './tabellino-modal';
import { LiveModal } from './live-modal';

@Component({
  selector: 'page-incontri',
  templateUrl: 'incontri.html'
})
export class Incontri {

  incontri: any;
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
      .getCallHttp('getIncontri', '', '','','')
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.incontri = res[0].matchs;
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

  tabellino(id,teamHome,teamAway,result,home_team_id,away_team_id) {
    let modal = this.modalCtrl.create(TabellinoModal, { 
      id:id,
      teamHome:teamHome,
      teamAway:teamAway,
      result:result,
      home_team_id: home_team_id,
      away_team_id: away_team_id 
    });
    modal.present();
  }

  live(homeName,awayName,result,youtubeCode) {
    let modal = this.modalCtrl.create(LiveModal, { 
      homeName:homeName,
      awayName:awayName,
      result:result,
      youtubeCode: youtubeCode 
    });
    modal.present();
  }

}
