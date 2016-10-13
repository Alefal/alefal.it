import { Component } from '@angular/core';
import { NavController, LoadingController, PopoverController } from 'ionic-angular';
import {HttpService} from '../../providers/http-service';

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

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public popoverCtrl: PopoverController
  ) { }

  ionViewDidLoad() {
    console.log('Hello Classifica Page');
    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getClassifica', '', '','')
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.ranking = res[0].ranking;
        } else {
          this.ranking = 'Nessun dato! Riprovare più tardi.';
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

  presentPopover(rank) {
    let popover = this.popoverCtrl.create(
      ClassificaDetail,
      {rank: rank}/*,
      {showBackdrop: false, enableBackdropDismiss: true}*/
    );
    popover.present();
  }

}
