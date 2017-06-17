import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

//import { LoginPage }    from '../login/login';
//import { AddPage }      from '../add/add'

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
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController,
    public connectivityService: ConnectivityService
  ) { 
    this.categoryName = params.get('categoriaNome');

    //Dati NON presenti in memoria: li recupero dal server
    //console.log('localStorage -> '+localStorage.getItem('categories').length);
    if(localStorage.getItem('categories') === null || localStorage.getItem('categories').length == 2) {

      if(this.connectivityService.connectivityFound) {
        this.loadCategories();
      } else {
        this.connectivityService.showConnectionInfo('Nessuna connessione di rete :-( ');
      }

    } else {
      this.categories = JSON.parse(localStorage.getItem('categories'));
      console.log('res -> '+this.categories[0].name);
      this.categoryName = this.categories[0].name;

      this.products = JSON.parse(localStorage.getItem(this.categories[0].name));
    }
    //this.loadCategories();
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
        
       // if (res[0].response[0].result == 'OK') {
          this.categories = res.results;
          localStorage.setItem('categories', JSON.stringify(this.categories));

          this.loadData(res[0].output[0].name);
        //} else {
        //  this.nothing = 'Nessun dato! Riprovare più tardi.';
        //}
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
              localStorage.setItem(categoriaNome, JSON.stringify(this.products));
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
  
  /**
   * Fa il refresh dei dati in memoria:
   * - getProductsCategory
   * - getProducts
   * - getProductsByCategory
   */
  dataRefresh() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    //Recupero tutte le CATEGORIE
    this.httpService.getCallHttp('getProductsCategory', '', '', 0, '')
      .subscribe(
        res => {
          console.log('res: ' + JSON.stringify(res));
          this.categories = res.results;
          console.log('this.categories: ' + this.categories);
          localStorage.setItem('categories', JSON.stringify(this.categories));

          //Recupero i PRODOTTI di ogni CATEGORIE
          let nameFirstCat: string = '';
          this.categories.forEach((cat, index) => {
            if(index == 0) {
              nameFirstCat = cat.name;
            }
            this.httpService
              .getCallHttp('getProductsByCategory', '', '', '', cat.id)
              .subscribe(res => {
                console.log(' -> res: ' + JSON.stringify(res));
                this.products = res.results;
                localStorage.setItem(cat.name, JSON.stringify(this.products));

                if(index == this.categories.length - 1) {
                  this.loadData(nameFirstCat);
                  this.loading.dismiss();
                }
              },
              error => {
                console.log('ERROR: ' + error);
              });
          });
        },
        error => {
          console.log('res: ' + JSON.stringify(<any>error));
          this.loading.dismiss();
        }
      );
  }
}