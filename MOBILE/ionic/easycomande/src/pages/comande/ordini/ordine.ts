import { Component } from '@angular/core';
import { Platform, NavParams, LoadingController, AlertController, NavController, ModalController, ViewController } from 'ionic-angular';

import { Ordine }   from '../../../models/ordine';
import { Prodotto } from '../../../models/prodotto';
import { Ship }     from '../../../models/ship';
import { Nota }     from '../../../models/nota';

//import { ComandePage }    from '../comande';
import { AddPage }    from '../../add/add';

import { HttpService } from '../../../providers/http-service';

@Component({
  selector: 'ordine-modal',
  templateUrl: 'ordine.html'
})
export class OrdinePage {

  ordine: Ordine;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    private params: NavParams,
    private httpService: HttpService,
    private loadingCtrl: LoadingController,
    private alertCtrl: AlertController,
    private platform: Platform,
    public viewCtrl: ViewController,
    public modalCtrl: ModalController
  ) {
    platform.registerBackButtonAction(() => {
      console.log("Back button action called");
    }, 1);

    this.ordine = params.get('ordine');
    console.log('%o', this.ordine);
  }

  ionViewDidLoad() {
    console.log("ionViewDidLoad");
  }

  editOrder(ordine) {
    let modal = this.modalCtrl.create(AddPage, { ordine: ordine });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('data.action -> '+JSON.stringify(data.action));
      //Ricaricare ordine
      this.showOrder(this.ordine.id);
    });
    /*
    this.navCtrl.push(AddPage, {
      ordine: ordine
    });
    */
  }

  showOrder(id) {
    /* NON MI AGGIORNA L'ARRAY 'orders' NEL TEMPLATE
    this.httpService
      .getCallHttp('getOrders', '', '', id, '')
      .then(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          //Dati ricaricati
          this.ordine = res[0].output;
          console.log(this.ordine);
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
      });
    */
    this.viewCtrl.dismiss({
      action: 'reload'
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
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  this.viewCtrl.dismiss({
                    action: 'reload'
                  });
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
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          let noteComplete: string = '';

          if(res[0].output == '') {
            noteComplete = 'Nessuna nota per l\'ordine'; 
          } else {
            for (let prod of res[0].output) {
              //var d = new Date(prod['created_at']);
              //var datestring = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear() + " ore " + d.getHours() + ":" + d.getMinutes();
              //let nData: string = datestring;
              let nMessage: string = prod['note'];

              //noteComplete += nData + '<br />' + nMessage + '<br /><hr /><br />';
              noteComplete += nMessage + '<br /><hr /><br />';
            }
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
      },
      error => {
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
              .subscribe(res => {
                //console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  console.log('Nota creata');
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
      ]
    });
    prompt.present();
  }

  deleteProduct(ordineId,prod) {
    console.log('deleteProduct ordine: '+ordineId);
    console.log('%o',prod);

    let prodotto = new Prodotto(prod.id,null,'',prod.price,prod.price,prod.description,1,'');

    let ordine = new Ordine(
      ordineId,         //this.id
      ordineId,         //this.order_number
      '',               //this.created_at
      '',               //this.updated_at
      '',               //this.completed_at
      '',               //this.status
      0,                //this.total
      0,                //this.subtotal
      0,                //this.total_line_items_quantity
      0,                //this.total_tax
      0,                //this.total_shipping
      0,                //this.cart_tax
      0,                //this.shipping_tax
      '',               //this.note
      prodotto,         //this.line_items
      0,                //this.shipping_lines
      0                 //this.tax_lines
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
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  this.showOrder(ordineId);
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
      ]
    });
    confirm.present();
  }

  deleteShip(ordineId,ship) {
    console.log('deleteShip ordine: '+ordineId);
    console.log('%o',ship);

    let shipping = new Ship(ship.id,null,'',0);

    let ordine = new Ordine(
      ordineId,         //this.id
      ordineId,         //this.order_number
      '',               //this.created_at
      '',               //this.updated_at
      '',               //this.completed_at
      '',               //this.status
      0,                //this.total
      0,                //this.subtotal
      0,                //this.total_line_items_quantity
      0,                //this.total_tax
      0,                //this.total_shipping
      0,                //this.cart_tax
      0,                //this.shipping_tax
      '',               //this.note
      '',               //this.line_items
      shipping,         //this.shipping_lines
      0                 //this.tax_lines
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
              .getCallHttp('getOrderDeleteShipping', '', '', '', ordine)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res[0].response[0].result == 'OK') {
                  this.showOrder(ordineId);
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
      ]
    });
    confirm.present();
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: ''
    });
  }

}