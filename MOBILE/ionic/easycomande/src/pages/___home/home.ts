import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, LoadingController } from 'ionic-angular';

import { LoginPage }    from '../login/login';
import { ComandePage }  from '../comande/comande';
import { MenuPage }     from '../menu/menu';
import { AddPage }      from '../add/add'

import { HttpService }  from '../../providers/http-service';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html',
})
export class HomePage {

  categories: any;
  products: any;

  loading: any;

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams,
    public modalCtrl: ModalController,
    public loadingCtrl: LoadingController,
    private httpService: HttpService
  ) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Home');
  }

   navigate(page) {
    if(page == 'Comande'){
      this.navCtrl.push(ComandePage);
    } 
    else if(page == 'Menu') {
      this.navCtrl.push(MenuPage);
    }
    else if(page == 'Add') {
      //this.navCtrl.push(AddPage);
      let modal = this.modalCtrl.create(AddPage);
      modal.present();
      modal.onDidDismiss(data => {});
    }
  }

  logout() {
    console.log('logout');
    
    this.navCtrl.setRoot(LoginPage);
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
          this.categories = res[0].output;
          console.log('this.categories: ' + this.categories);
          localStorage.setItem('categories', JSON.stringify(this.categories));

          //Recupero i PRODOTTI di ogni CATEGORIE
          for (let cat of this.categories) {
            this.httpService
              .getCallHttp('getProductsByCategory', '', '', '', cat.name)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));
                this.products = res[0].output;
                localStorage.setItem(cat.name, JSON.stringify(this.products));
              },
              error => {
                console.log('ERROR: ' + error);
              });
          }
          this.loading.dismiss();
        },
        error => {
          console.log('res: ' + JSON.stringify(<any>error));
          this.loading.dismiss();
        }
      );
  }

}
