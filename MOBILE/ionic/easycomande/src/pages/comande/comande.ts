import { Component } from '@angular/core';
import { App, NavController, NavParams, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }    from '../../providers/http-service';

import { Ordine }         from '../../models/ordine';
import { OrdinePage }     from './ordini/ordine';

import { LoginPage }    from '../login/login';
import { AddPage }      from '../add/add'

@Component({
  selector: 'page-comande',
  templateUrl: 'comande.html',
})
export class ComandePage {

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
    console.log("ionViewDidLoad");
    this.loadData();
  }

  loadData() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.orders = res[0].output;
          this.ordersAll = res[0].output;
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

  getItems(ev) {
    var val = ev.target.value;
    //this.productFilter = this.products;

    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.orders = this.orders.filter((item) => {
        //console.log(JSON.stringify(item.order_number)+' | '+val);
        
        //return (item.order_number == val);
        return item.note.toLowerCase().indexOf(val.toLowerCase()) > -1
      })
    }
  }
  onCancel(ev) {
    this.orders = this.ordersAll;
  }

  orderDetail(ordine) {
    console.log(ordine);
    let modal = this.modalCtrl.create(OrdinePage, { ordine: ordine });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('data.action -> '+JSON.stringify(data.action));
      if(data.action == 'reload') {
        //Ricaricare ordine
        console.log('Ricaricare ordine');
        this.loadData();
      }
    });
    /*
    this.navCtrl.push(OrdinePage, {
      ordine: ordine
    });
    */
  }

  navigate(page) {
    let modal = this.modalCtrl.create(AddPage);
    modal.present();
    modal.onDidDismiss(data => {});
  }
  logout() {
    console.log('logout');
    this.navCtrl.setRoot(LoginPage);
  }

}
