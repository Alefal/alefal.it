import { Component } from '@angular/core';
import { NavParams, NavController, LoadingController, PopoverController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { Incontri }             from '../incontri/incontri';
import { ClassificaDetail }     from '../classifica/classifica-detail';

@Component({
  selector: 'page-classifica',
  templateUrl: 'classifica.html'
})
export class Classifica {

  ranking: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  tipologiaTorneo: string;

  constructor(
    public params: NavParams,
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public popoverCtrl: PopoverController, 
    public connectivityService: ConnectivityService
  ) { 
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
  }

  ionViewDidLoad() {
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getClassifica') === null) {
        this.connectivityService.showInfoNoData('');
      } else {
        this.ranking = JSON.parse(localStorage.getItem('getClassifica'));
        this.connectivityService.showInfo();
      }
    }
  }
  getData(){
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getClassifica','','','','',this.tipologiaTorneo)
      .subscribe(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.ranking = res[0].ranking;
          localStorage.setItem('getClassifica',JSON.stringify(this.ranking));
        } else {
          this.ranking = 'Nessun dato! Riprovare più tardi.';
        }

        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  presentPopover(rank) {
    let popover = this.popoverCtrl.create(
      ClassificaDetail,
      {rank: rank}/*,
      {showBackdrop: false, enableBackdropDismiss: true}*/
    );
    popover.present();
  }

  tournamentMatchs(tipologia,sezione,group) {
    console.log('tournamentMatchs: '+tipologia+' | '+group);
    
    this.navCtrl.push(Incontri, {
      tipologia: tipologia,
      sezione: sezione,
      group: group
    });
  }

}
