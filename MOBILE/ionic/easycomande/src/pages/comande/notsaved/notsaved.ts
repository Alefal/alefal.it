import { Component } from '@angular/core';
import { Platform, LoadingController, AlertController, NavController, ModalController, ViewController } from 'ionic-angular';

import { Order }    from '../../../models/order';

import { HttpService }          from '../../../providers/http-service';
import { ConnectivityService }  from '../../../providers/connectivity-service';

@Component({
  selector: 'notsaved-modal',
  templateUrl: 'notsaved.html'
})
export class NotSavedPage {

  ordine: Order;
  ordineId: number;

  nothing: string;
  loading: any;
  
   //If SAVE not work: saved order
  ordersTemp: Order[] = new Array<Order>();

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public connectivityService: ConnectivityService,
    private loadingCtrl: LoadingController,
    private alertCtrl: AlertController,
    private platform: Platform,
    public viewCtrl: ViewController,
    public modalCtrl: ModalController,
  ) {}

  ionViewDidLoad() {
    console.log("ionViewDidLoad NOT SAVED");

    this.platform.registerBackButtonAction(() => {
      console.log("Back button action called");
    }, 1);

    if(localStorage.getItem('listOrdersNotSaved')) {
      this.ordersTemp = JSON.parse(localStorage.getItem('listOrdersNotSaved'));
    }
  }

  //SAVE ORDER
  saveOrder(ordine) {
    console.log('ORDINE: '+JSON.stringify(ordine));

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderSave', '', '', '', ordine)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        let orderIdSave: any;
        
        if (res.results[0].operation == 'success') {
          orderIdSave = res.results[0].message;
        } else {
          let alert = this.alertCtrl.create({
            title: 'Attenzione',
            subTitle: 'L\'ordinazione non è stata salvata! Prova ad aggiornare i menu e rifai l\'ordinazione',
            buttons: ['OK']
          });
          alert.present();
          this.loading.dismiss();
          return false;
        }

        this.loading.dismiss();
        this.dismiss();
      },
      error => {
        console.log('ERROR: ' + JSON.stringify(<any>error));
        let alert = this.alertCtrl.create({
          title: 'Salvataggio Ordine',
          subTitle: 'Problemi di comunicazione con il server.',
          buttons: [{
            text: 'Ok',
            handler: () => {
              //this.dismiss(0);
            }
          }]
        });
        alert.present();
        this.loading.dismiss();
      });
  }

  deleteOrdersNotSaved() {
    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Vuoi cancellare gli ordini memorizzati ?',
      buttons: [
        {
          text: 'Annulla',
          handler: () => {
            console.log('Annulla');
          }
        },
        {
          text: 'Cancella',
          handler: () => {
            console.log('Conferma');
            localStorage.removeItem('listOrdersNotSaved');
            this.dismiss();
          }
        }
      ]
    });
    confirm.present();
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: 'reload'
    });
  }

}