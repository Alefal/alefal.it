import { Component } from '@angular/core';
import { Platform, NavParams, LoadingController, AlertController, NavController, ModalController, ViewController } from 'ionic-angular';

import { Order }    from '../../../models/order';
//import { Product }  from '../../../models/product';
//import { Special }  from '../../../models/special';
//import { Note }     from '../../../models/note';

//import { ComandePage }    from '../comande';
import { AddPage }    from '../../add/add';

import { HttpService } from '../../../providers/http-service';

@Component({
  selector: 'ordine-modal',
  templateUrl: 'ordine.html'
})
export class OrdinePage {

  ordine: Order;
  ordineId: number;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  serviceOrCovered: string = '';

  constructor(
    public navCtrl: NavController,
    private params: NavParams,
    private httpService: HttpService,
    private loadingCtrl: LoadingController,
    private alertCtrl: AlertController,
    private platform: Platform,
    public viewCtrl: ViewController,
    public modalCtrl: ModalController
  ) {}

  ionViewDidLoad() {
    console.log("ionViewDidLoad ORDINE");

    this.platform.registerBackButtonAction(() => {
      console.log("Back button action called");
    }, 1);

    this.ordineId = this.params.get('ordineId');
    console.log('%o', this.ordineId);
    this.loadOrder(this.ordineId);

    if(localStorage.getItem('serviceenablepercent')) {
      this.serviceOrCovered = 'Servizio';
    } else if(localStorage.getItem('coveredenablevalue')) {
      this.serviceOrCovered = 'Coperti';
    }
  }

  loadOrder(orderId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrder','','',orderId,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        this.ordine = res.results[0];
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  editOrder(ordine) {
    let modal = this.modalCtrl.create(AddPage, { ordine: ordine });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('data.action -> '+JSON.stringify(data.action));
      /* Non ricarica ordine
      if(data.action == 'closeAdd'){
        return false;
      }
      */
      //Ricaricare ordine
      this.showOrder(data.orderIdSave);
    });
    /*
    this.navCtrl.push(AddPage, {
      ordine: ordine
    });
    */
  }

  showOrder(orderIdSave) {
    this.viewCtrl.dismiss({
      action: 'reload',
      orderIdSave: orderIdSave
    });
  }

  changeItemState(prodId,orderId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderChangeLineItemState', '', '', prodId, orderId)
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.showOrder(orderId);
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

  changeSpecialState(specialId,orderId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderChangeSpecialState', '', '', specialId, orderId)
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.showOrder(orderId);
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

  changeOrderState(orderId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderChangeOrderState', '', '', orderId, '')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.showOrder(orderId);
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

                if (res.results[0].operation == 'success') {
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

  showNote(notes) {
    let noteComplete: string = '';

    if(notes.length == 0) {
      noteComplete = 'Nessuna nota per l\'ordine'; 
    } else {
      for (let note of notes) {
        let nMessage: string = note.note;
        noteComplete += nMessage + '<hr />';
      }
    }

    let alert = this.alertCtrl.create();
    alert.setTitle('Note');
    alert.setMessage(noteComplete);
    alert.addButton('Chiudi');
    alert.present();
  }
  
  //NON USATO
  /*
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
  */

  deleteProduct(productId,orderId) {
    console.log('deleteProduct ordine: '+productId+' | '+orderId);

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
              .getCallHttp('getOrderDeleteLineItem', '', '', productId, orderId)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res.results[0].operation == 'success') {
                  this.showOrder(orderId);
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

  deleteSpecial(specialId,orderId) {
    console.log('deleteSpecial ordine: '+specialId+' | '+orderId);

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
              .getCallHttp('getOrderDeleteSpecial', '', '', specialId, orderId)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res.results[0].operation == 'success') {
                  this.showOrder(orderId);
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

  deleteNote(noteId,orderId) {
    console.log('deleteNote ordine: '+noteId+' | '+orderId);

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare la nota ?',
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
              .getCallHttp('getOrderNoteDelete', '', '', noteId, orderId)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));

                if (res.results[0].operation == 'success') {
                  this.showOrder(orderId);
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

  //NOT WORK
  printOrder(orderId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderPrint', '', '', orderId, '')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          //this.showOrder(orderId);
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

  dismiss() {
    this.viewCtrl.dismiss({
      action: ''
    });
  }

}