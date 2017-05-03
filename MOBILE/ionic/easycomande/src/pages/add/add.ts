import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

import { ProdottiModal } from './prodotti/prodotti-modal';

import { Prodotto }         from '../../models/prodotto';

@Component({
  selector: 'page-add',
  templateUrl: 'add.html',
})
export class AddPage {

  products: Prodotto[] = new Array<Prodotto>();
  totaleOrdine: number = 0;

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
    public modalCtrl: ModalController
  ) { 
    this.categoryName = params.get('categoriaNome');

    this.loadCategories();
    //this.loadData(this.categoriaNome);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Add');
  }

  loadCategories() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProductsCategory', '', '', '', '')
      .then(res => {
        if (res[0].response[0].result == 'OK') {
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

  modalProducts(cat) {
    console.log(cat);
    let modal = this.modalCtrl.create(ProdottiModal, { categoryName: cat });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('-> '+JSON.stringify(data.action));
      if(data.action != '') {
        let pId     = data.action.id;
        let pTitle  = data.action.title;
        let pPrice  = data.action.price;
        let pDescr  = data.action.description;

        let prodotto = new Prodotto(pId,pTitle,pPrice,pDescr,1);

        this.products.push(prodotto);
        this.totaleOrdine = this.totaleOrdine + parseFloat(pPrice);

        console.log('-> '+JSON.stringify(this.products));
      }
    });
  }

  updateTotal(coperti:number) {
    console.log('coperti -> '+coperti);
    let totCoperti: number = coperti * 1.5;
    let totOrdine: any = 0;

    for (let prod of this.products) {
      let pPrice: any    = prod['price'];
      console.log('pPrice -> '+pPrice);
      totOrdine = parseFloat(pPrice) + parseFloat(totOrdine);
      console.log('totOrdine -> '+totOrdine);
    }
    console.log('totCoperti -> '+totCoperti);
    this.totaleOrdine = totOrdine + totCoperti;
  }

}
