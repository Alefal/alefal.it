import { Component } from '@angular/core';
import { Platform, NavParams, LoadingController, AlertController, NavController } from 'ionic-angular';

import { Ordine }   from '../../../models/ordine';
import { Prodotto } from '../../../models/prodotto';
import { Nota }     from '../../../models/nota';

import { ComandePage }    from '../comande';
import { AddPage }    from '../../add/add';

import { HttpService } from '../../../providers/http-service';

@Component({
  selector: 'ordine',
  templateUrl: 'ordine.html'
})
export class OrdinePage {

  ordine: Ordine;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  //Order
  id: number;
  order_number: number;
  created_at: string;
  updated_at: string;
  completed_at: string;
  status: string;
  total: number = 0;
  total_tax: number = 0;
  total_line_items_quantity: number = 0;
  line_items: any;
  customer: any;
  note: any;
  shipping_lines: any;

  constructor(
    public navCtrl: NavController,
    private params: NavParams,
    private httpService: HttpService,
    private loadingCtrl: LoadingController,
    private alertCtrl: AlertController,
    private platform: Platform
  ) {
    platform.registerBackButtonAction(() => {
      console.log("Back button action called");
    }, 1);

    this.ordine = params.get('ordine');
    console.log(this.ordine);
  }

  editOrder(ordine) {
    this.navCtrl.push(AddPage, {
      ordine: ordine
    });
  }

  deleteOrder(id) {
    console.log(id);

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare l\'ordine selezionato ?',
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
            this.loading = this.loadingCtrl.create({
              spinner: 'crescent',
              //content: 'Please wait...'
            });
            this.loading.present();

            this.httpService
              .getCallHttp('getOrderDelete', '', '', id, '')
              .then(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  this.navCtrl.push(ComandePage);
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
        }
      ]
    });
    confirm.present();

  }

  showNote(id) {
    console.log(id);
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderNote', '', '', id, '')
      .then(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {

          let noteComplete: string = '';
          for (let prod of res[0].output) {

            var d = new Date(prod['created_at']);
            var datestring = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear() + " ore " + d.getHours() + ":" + d.getMinutes();

            let nData: string = datestring;
            let nMessage: string = prod['note'];

            //noteComplete += nData + '<br />' + nMessage + '<br /><hr /><br />';
            noteComplete += nMessage + '<br /><hr /><br />';

          }
          let alert = this.alertCtrl.create();
          alert.setTitle('Note');
          alert.setMessage(noteComplete);
          alert.addButton('Chiudi');
          alert.present();
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

  addNote(id) {
    let prompt = this.alertCtrl.create({
      title: 'Nota',
      message: 'Aggiungi una nota all\'ordine',
      inputs: [
        {
          name: 'nota',
          placeholder: 'Nota'
        },
      ],
      buttons: [
        {
          text: 'Cancella',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Salva',
          handler: data => {
            console.log('Saved clicked: '+data.nota);
            let nota = new Nota(0,data.nota,true);

            this.loading = this.loadingCtrl.create({
              spinner: 'crescent',
            });
            this.loading.present();
            
            this.httpService
              .getCallHttp('getOrderNoteSave', '', '', id, nota)
              .then(res => {
                //console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  console.log('Nota creata');
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
        }
      ]
    });
    prompt.present();
  }

  deleteProduct(ordineId,prod) {
    console.log('deleteProduct ordine: '+ordineId);
    console.log('%o',prod);

    let prodotto = new Prodotto(prod.id,null,'',prod.price,prod.description,1);

    let ordine = new Ordine(
      ordineId,                         //this.id,
      ordineId,                         //this.order_number,
      '',                               //this.created_at,
      '',                               //this.updated_at,
      '',                               //this.completed_at,
      '',                               //this.status,
      0,                                //this.total,
      0,                                //this.total_tax,
      0,                                //this.total_line_items_quantity,
      prodotto,                         //this.line_items,
      '',                               //this.customer,
      '',                               //this.note,
      0                                 //shipping_lines
    );

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare il prodotto ?',
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
            this.loading = this.loadingCtrl.create({
              spinner: 'crescent',
              //content: 'Please wait...'
            });
            this.loading.present();

            this.httpService
              .getCallHttp('getOrderDeleteLineItem', '', '', '', ordine)
              .then(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  this.navCtrl.getPrevious();
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
        }
      ]
    });
    confirm.present();
  }

}