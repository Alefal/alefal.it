import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController } from 'ionic-angular';

import { Ordine } from './ordine';
import { OrdineModal } from './ordine-modal';

import { HttpService }          from '../../providers/http-service';

@Component({
  selector: 'page-ordini',
  templateUrl: 'ordini.html'
})
export class Ordini {

  orders: any;
  ordersAll: any;

  ordine: Ordine;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) {}

  ionViewDidLoad() {
    this.loadData();
  }

  loadData() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrders','','','','')
      .then(res => {
        //console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.orders = res[0].output;
          this.ordersAll = res[0].output;
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
      this.orders = this.orders.filter((item) => {
        console.log(JSON.stringify(item.order_number)+' | '+val);
        
        return (item.order_number == val);
      })
    }
  }
  onCancel(ev) {
    this.orders = this.ordersAll;
  }

  modalOrder(ordine) {
    console.log(ordine);
    let modal = this.modalCtrl.create(OrdineModal, { ordine: ordine });
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