import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

@Component({
  selector: 'page-fornitori',
  templateUrl: 'fornitori.html'
})
export class Fornitori {

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
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getSupplier','','')
      .then(res => {
        console.log('res: '+JSON.stringify(res));

        
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
