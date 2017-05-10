import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ViewController, ToastController, PopoverController } from 'ionic-angular';

import { HttpService }          from '../../../providers/http-service';

@Component({
  selector: 'prodotti-modal',
  templateUrl: 'prodotti-modal.html',
})
export class ProdottiModal {

  products: any;
  categories: any;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  categoryName: string = '';

  constructor(
    public navCtrl: NavController,
    public params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    private viewCtrl: ViewController,
    public toastCtrl: ToastController,
    public popoverCtrl: PopoverController
  ) { 
    this.categoryName = params.get('categoryName');
    this.loadData(this.categoryName);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ProdottiModal');
  }

  loadData(categoriaNome) {
    this.categoryName = categoriaNome;

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    if(categoriaNome && categoriaNome != ''){
      this.httpService
        .getCallHttp('getProductsByCategory', '', '', '', categoriaNome)
        .subscribe(res => {
          //console.log('res: '+JSON.stringify(res));

          if (res[0].response[0].result == 'OK') {
            this.products = res[0].output;
          } else {
            this.nothing = 'Nessun dato! Riprovare più tardi.';
          }
          this.loading.dismiss();
        },
        error => {
          console.log('ERROR: ' + error);
          this.errorMessage = 'Error!';
          this.errorMessageView = true;
          this.loading.dismiss();
        });
    } else {
      this.httpService
        .getCallHttp('getProducts', '', '', '', '')
        .subscribe(res => {
          //console.log('res: '+JSON.stringify(res));

          if (res[0].response[0].result == 'OK') {
            this.products = res[0].output;
          } else {
            this.nothing = 'Nessun dato! Riprovare più tardi.';
          }
          this.loading.dismiss();
        },
        error => {
          console.log('ERROR: ' + error);
          this.errorMessage = 'Error!';
          this.errorMessageView = true;
          this.loading.dismiss();
        });
    }
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: ''
    });
  }

  addProduct(prod) {
    this.dismissAfterProduct(prod);
  }

  dismissAfterProduct(prod) {
    this.viewCtrl.dismiss({
      action: prod
    });
  }

  infoProduct(prod) {
    let toast = this.toastCtrl.create({
      message: prod.description,
      duration: 3000
    });
    toast.present();
  }
}