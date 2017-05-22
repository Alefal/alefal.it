import { Component, ViewChild  } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController, Content, AlertController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { AddPage }          from '../add/add';
import { Ordine }           from '../../models/ordine';
import { OrdinePage }       from './ordini/ordine';

//import { LoginPage }        from '../login/login';
//import { AddPage }          from '../add/add'

@Component({
  selector: 'page-comande',
  templateUrl: 'comande.html',
})
export class ComandePage {

  orders: any;
  ordersAll: any;

  orderIdSaved: any;

  ordine: Ordine;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  @ViewChild(Content) content: Content;

  //private tabbarHeight: string;
  //private headerHeight: string;
  //private contentBox;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController,
    public connectivityService: ConnectivityService,
    public alertCtrl: AlertController
  ) {}

  ionViewDidLoad() {
    console.log("ionViewDidLoad");


    if(this.connectivityService.connectivityFound) {
      this.loadData('');
    } else {
      this.connectivityService.showConnectionInfo('Nessuna connessione di rete :-( ');
    }
  }

  /*** Hide HEADER
  ionViewDidEnter() {
    this.contentBox = document.querySelector(".scroll-content")['style'];
    this.tabbarHeight = this.contentBox.marginTop;

    let headerMarginTmp: number = parseInt(this.tabbarHeight.substring(0,this.tabbarHeight.length-2)) / 2;
    this.headerHeight = headerMarginTmp+'px'; //TODO: recuperare valore cioè la metà di tabbarHeight
    console.log('tabBarHeight: '+this.tabbarHeight+' | '+this.headerHeight);
  }

  scrollingFun(e) {
    //console.log("scrollingFun: "+e.scrollTop+' | '+this.content.getContentDimensions().contentTop);
    if (e.scrollTop > 25) {
      console.log('scrollingFun - IF');
      document.querySelector('.header')['style'].display = 'none';
      document.querySelector('.tabbar')['style'].top = '0';
      this.contentBox.marginTop = this.headerHeight;
    } else {
      console.log('scrollingFun - ELSE');
      document.querySelector('.header')['style'].display = 'block';
      document.querySelector('.tabbar')['style'].top = this.headerHeight;
      this.contentBox.marginTop = this.tabbarHeight;
    }
  }
  ***/

  doRefresh(refresher) {
    console.log("ionViewDidLoad");
    this.loadData('');
    refresher.complete();
  }

  loadData(orderIdSave) {
    this.orderIdSaved = orderIdSave;
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
        let alert = this.alertCtrl.create({
          title: 'Attenzione',
          subTitle: 'Problemi di connessione con il server...',
          buttons: ['OK']
        });
        alert.present();

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
        this.loadData(data.orderIdSave);
      }
    });
    /*
    this.navCtrl.push(OrdinePage, {
      ordine: ordine
    });
    */
  }

  addOrder() {
    let modal = this.modalCtrl.create(AddPage);
    modal.present();
    modal.onDidDismiss(data => {});
  }

}
