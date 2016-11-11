import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

@Component({
  selector: 'page-categorie',
  templateUrl: 'categorie.html'
})
export class Categorie {

  categories: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController
  ) {}

  ionViewDidLoad() {
    console.log('Hello Categorie Page');
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProductsCategory','','','')
      .then(res => {
        console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.categories = res[0].output;
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
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

}
