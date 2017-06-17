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

    if(localStorage.getItem(this.categoryName) === null) {
      this.loading = this.loadingCtrl.create({
        spinner: 'crescent'
      });
      this.loading.present();

      if(categoriaNome && categoriaNome != ''){
        this.httpService
          .getCallHttp('getProductsByCategory', '', '', '', categoriaNome)
          .subscribe(res => {
            //console.log('res: '+JSON.stringify(res));

            //if (res[0].response[0].result == 'OK') {
              this.products = res.results;
            //} else {
            //  this.nothing = 'Nessun dato! Riprovare più tardi.';
            //}
            this.loading.dismiss();
          },
          error => {
            console.log('ERROR: ' + error);
            this.errorMessage = 'Error!';
            this.errorMessageView = true;
            this.loading.dismiss();
          });
      } else {
        console.log('Nessuna categoria passata');
      }
    } else {
      this.products = JSON.parse(localStorage.getItem(this.categoryName));
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
    /*
    let toast = this.toastCtrl.create({
      message: prod.description,
      duration: 3000
    });
    toast.present();
    */
    let popover = this.popoverCtrl.create(PopoverPage, { product: prod });
    popover.present({
      ev: prod
    });
  }
}

@Component({
  selector: 'popover',
  template: `
    <ion-card>
      <ion-card-header>
        <h2>{{prod.name}}</h2>
      </ion-card-header>
      <ion-card-content>
        <h3><i [innerHTML]="prod.description"></i></h3>
      </ion-card-content>
    </ion-card>
  `
})
export class PopoverPage {

  prod: any;
  constructor(
    public viewCtrl: ViewController,
    public params: NavParams,
  ) {
    this.prod = params.get('product');
    console.log('%o',this.prod);
  }

  close() {
    this.viewCtrl.dismiss();
  }
}