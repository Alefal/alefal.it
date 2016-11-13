import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController } from 'ionic-angular';

import { ProdottoModal } from './prodotto-modal';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'page-prodotti',
  templateUrl: 'prodotti.html'
})
export class Prodotti {

  products: any;
  productAll: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  public tap: number = 0;
  showButtonAfterTap = false;

  constructor(
    public navCtrl: NavController,
    public params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) { }

  ionViewDidLoad() {
    this.showButtonAfterTap = true;
    this.loadData();
  }

  loadData() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProducts', '', '', '', '')
      .then(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.products = res[0].output;
          this.productAll = res[0].output;
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

  getItems(ev) {
    var val = ev.target.value;
    //this.productFilter = this.products;

    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.products = this.products.filter((item) => {
        return (item.title.toLowerCase().indexOf(val.toLowerCase()) > -1);
      })
    }
  }
  onCancel(ev) {
    this.products = this.productAll;
  }

  tapEvent(e) {
    /*this.tap++;
    if(this.tap == 10) {
      this.showButtonAfterTap = true;
    }*/
  }

  modalProduct(id) {
    console.log(id);
    let modal = this.modalCtrl.create(ProdottoModal, { id: id });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('-> '+data.action);
      if(data.action == 'refresh') {
        console.log('Ricarico la lista dei prodotti');
        this.loadData();
      } else {
        console.log('Chiudi finestra prodotto');
      }
    });
  }

}