import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

@Component({
  selector: 'page-menu',
  templateUrl: 'menu.html',
})
export class MenuPage {

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
    public loadingCtrl: LoadingController
  ) { 
    this.categoryName = params.get('categoriaNome');

    this.loadCategories();
    //this.loadData(this.categoriaNome);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Menu');
  }

  loadCategories() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProductsCategory', '', '', '', '')
      .subscribe(res => {
        this.loading.dismiss();
        
        if (res[0].response[0].result == 'OK') {
          this.categories = res[0].output;
          this.loadData(res[0].output[0].name);
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
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

}
