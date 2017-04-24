import { Component } from '@angular/core';
import { Platform, NavParams, ViewController, LoadingController, AlertController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'categoria-modal',
  templateUrl: 'categoria-modal.html'
})
export class CategoriaModal {

  id: number;
  
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  sectionCreate: boolean = false;
  sectionDetail: boolean = false;

  showButtonEditDelete = false;

  //Product items
  catTitle: string;

  constructor(
    params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public viewCtrl: ViewController,
    public alertCtrl: AlertController,
    private platform: Platform
  ) {
    platform.registerBackButtonAction(() => {
      console.log("Back button action called");

      this.viewCtrl.dismiss({
        action: 'noRefresh'
      });
    }, 1);
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: 'noRefresh'
    });
  }

  saveCategory() {
    console.log(this.catTitle);

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProductsCategorySave', '', '', '', this.catTitle)
      .then(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.viewCtrl.dismiss({
            action: 'refresh'
          });
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