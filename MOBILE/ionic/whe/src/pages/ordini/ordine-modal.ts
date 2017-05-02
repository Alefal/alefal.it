import { Component } from '@angular/core';
import { Platform, NavParams, ViewController, LoadingController, AlertController, ModalController } from 'ionic-angular';

import { Ordine }       from './ordine';
import { Prodotto }     from '../prodotti/prodotto';

import { HttpService }  from '../../providers/http-service';

@Component({
  selector: 'ordine-modal',
  templateUrl: 'ordine-modal.html'
})
export class OrdineModal {

  ordineEdit: any;
  ordine: Ordine;

  product: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  //Save
  selectedUser: any;
  selectedProducts: Array<Prodotto> = [];
  selectedProductsQnt: Array<Prodotto> = [];
  prodotto: Prodotto;

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

  sectionCreate: boolean = false;
  sectionDetail: boolean = false;
  sectionSelectQuantity: boolean = false;
  sectionSummary: boolean = false;
  
  showButtonEditDelete = false;

  constructor(
    private params: NavParams,
    private httpService: HttpService,
    private loadingCtrl: LoadingController,
    private viewCtrl: ViewController,
    private alertCtrl: AlertController,
    public modalCtrl: ModalController,
    private platform: Platform
  ) {
    platform.registerBackButtonAction(() => {
      console.log("Back button action called");

      this.viewCtrl.dismiss({
        action: 'noRefresh'
      });
    }, 1);

    this.ordineEdit = params.get('ordine');
    //console.log('Modale: '+this.ordineEdit);

    //CREATE
    if (this.ordineEdit == '') {
      this.sectionCreate = true;
      this.showButtonEditDelete = false;

      //CLIENTI
      this.httpService
        .getCallHttp('getCustomer','','','','')
        .then(res => {
          //console.log('res: '+JSON.stringify(res));
          if(res[0].response[0].result == 'OK') {
            this.customer = res[0].users;
          } else {
            this.nothing = 'Nessun dato! Riprovare più tardi.';
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });

      //PRODOTTI
      this.httpService
        .getCallHttp('getProducts', '', '', '', '')
        .then(res => {
          console.log('res: '+JSON.stringify(res));

          if (res[0].response[0].result == 'OK') {
            this.line_items = res[0].output;
          } else {
            this.nothing = 'Nessun dato! Riprovare più tardi.';
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
    }
    //DETAIL
    else {
      //console.log('ELSE!');
      
      this.sectionDetail = true;
      this.showButtonEditDelete = true;

      this.id                         = this.ordineEdit.id;
      this.order_number               = this.ordineEdit.order_number;
      this.created_at                 = this.ordineEdit.created_at;
      this.updated_at                 = this.ordineEdit.updated_at;
      this.completed_at               = this.ordineEdit.completed_at;
      this.status                     = this.ordineEdit.status;
      this.total                      = this.ordineEdit.total;
      this.total_tax                  = this.ordineEdit.total_tax;
      this.total_line_items_quantity  = this.ordineEdit.total_line_items_quantity;
      this.line_items                 = this.ordineEdit.line_items;
      this.customer                   = this.ordineEdit.customer;
      this.note                       = this.ordineEdit.note;
      
      this.ordine = new Ordine(
        this.id,
        this.order_number,
        this.created_at,
        this.updated_at,
        this.completed_at,
        this.status,
        this.total,
        this.total_tax,
        this.total_line_items_quantity,
        this.line_items,
        this.customer,
        this.note
      );
      console.log(this.ordine);
    }
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: 'noRefresh'
    });
  }

  orderStepAddQuantity() {
    this.customer   = this.selectedUser;
    console.log(this.customer);
    console.log(this.selectedProducts);

    this.sectionCreate = false;
    this.sectionSelectQuantity = true;

    for (let prod of this.selectedProducts) {
      let pId: number       = prod['id'];
      let pTitle: string    = prod['title'];
      let pSku: string      = prod['sku'];
      let pPrice: number    = prod['price'];
      let pDescr: string    = prod['description'];
      let pInStock: boolean = true;
      let pQnt              = prod['stock'];
      let pCatId: number    = 0;
      let pCatName: string  = '';
      
      let prodotto = new Prodotto(pId,pTitle,pSku,pPrice,pDescr,pInStock,pQnt,0,pCatId,pCatName);
      //console.log(prodotto);  

      this.selectedProductsQnt.push(prodotto);
    }
    console.log(this.selectedProductsQnt);  
    
  }
  orderStepSummary() {
    console.log(this.selectedProducts);     
    console.log(this.selectedProductsQnt); 
    this.sectionSelectQuantity = false;
    this.sectionSummary = true;

    this.line_items = this.selectedProductsQnt;

    /*** Vengono calcolati direttamente al momento del salvataggio
    let totalProd: number = 0;
    let total: number = 0;
    let quantity: number = 0;
    for (let prod of this.selectedProductsQnt) {
      quantity = Number(quantity) + Number(prod.prodAddQuantity);
      totalProd = Number(totalProd) + ((Number(prod.prodAddQuantity) * Number(prod.prodPrice)));
      total = Number(total) + Number(totalProd);
    }
    ***/

    this.id = 0;
    this.status = 'completed';
    //this.total_line_items_quantity = quantity;
    //this.total = total;
    this.note = 'Ordine completato e salvato';
  }
  orderComplete() {
    this.ordine = new Ordine(
      this.id,
      this.order_number,
      this.created_at,
      this.updated_at,
      this.completed_at,
      this.status,
      this.total,
      this.total_tax,
      this.total_line_items_quantity,
      this.line_items,
      this.customer,
      this.note
    );

    console.log('ORDINE: '+JSON.stringify(this.ordine));

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderSave', '', '', '', this.ordine)
      .then(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.viewCtrl.dismiss({
            action: 'refresh'
          });
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
            var datestring = d.getDate()  + "/" + (d.getMonth()+1) + "/" + d.getFullYear() + " ore " + d.getHours() + ":" + d.getMinutes();

            let nData: string       = datestring;
            let nMessage: string    = prod['note'];

            noteComplete += nData+'<br />'+nMessage+'<br /><hr /><br />';
            
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
            console.log('Conferma: devono essere incrementati i prodotti in magazzino');
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
                  this.viewCtrl.dismiss({
                    action: 'refresh'
                  });
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

  changeStatus(ordine,status) {
    console.log(ordine+' -> '+status);
    /*
    let checkedPending: boolean = false;
    let checkedProcessing: boolean = false;
    let checkedOnHold: boolean = false;
    let checkedRefunded: boolean = false;
    */
    let checkedCompleted: boolean = false;
    let checkedCancelled: boolean = false;
    let checkedFailed: boolean = false;

    /* Vengono gestiti solo i casi CANCELLED e FAILED
    if(status == 'pending') {
      checkedPending = true;
    } else if(status == 'processing') {
      checkedProcessing = true;
    } else if(status == 'on-hold') {
      checkedOnHold = true;
    } else if(status == 'completed') {
      checkedCompleted = true;
    } else if(status == 'cancelled') {
      checkedCancelled = true;
    } else if(status == 'refunded') {
      checkedRefunded = true;
    } else if(status == 'failed') {
      checkedFailed = true;
    }
    */

    if(status == 'completed') {
      checkedCompleted = true;
    } else if(status == 'cancelled') {
      checkedCancelled = true;
    } else if(status == 'failed') {
      checkedFailed = true;
    }
    
    let alert = this.alertCtrl.create();
    alert.setTitle('Cambia stato');

    alert.addInput({
      type: 'radio',
      label: 'Completato',
      value: 'completed',
      checked: checkedCompleted
    });
    alert.addInput({
      type: 'radio',
      label: 'Cancellato',
      value: 'cancelled',
      checked: checkedCancelled
    });
    alert.addInput({
      type: 'radio',
      label: 'Fallito',
      value: 'failed',
      checked: checkedFailed
    });

    /*
    alert.addInput({
      type: 'radio',
      label: 'In attesa di pagamento',
      value: 'pending',
      checked: checkedPending
    });
    alert.addInput({
      type: 'radio',
      label: 'In lavorazione',
      value: 'processing',
      checked: checkedProcessing
    });
    alert.addInput({
      type: 'radio',
      label: 'In attesa',
      value: 'on-hold',
      checked: checkedOnHold
    });
    alert.addInput({
      type: 'radio',
      label: 'Completato',
      value: 'completed',
      checked: checkedCompleted
    });
    alert.addInput({
      type: 'radio',
      label: 'Cancellato',
      value: 'cancelled',
      checked: checkedCancelled
    });
    alert.addInput({
      type: 'radio',
      label: 'Rimborsato',
      value: 'refunded',
      checked: checkedRefunded
    });
    alert.addInput({
      type: 'radio',
      label: 'Fallito',
      value: 'failed',
      checked: checkedFailed
    });
    */

    alert.addButton('Annulla');
    alert.addButton({
      text: 'Salva',
      handler: data => {
        console.log(data);  

        this.loading = this.loadingCtrl.create({
          spinner: 'crescent',
          //content: 'Please wait...'
        });
        this.loading.present();

        this.httpService
          .getCallHttp('getOrderChangeStatus','','',ordine,data)
          .then(res => {
            console.log('res: '+JSON.stringify(res));

            if (res[0].response[0].result == 'OK') {
              this.viewCtrl.dismiss({
                action: 'refresh'
              });
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
    });
    alert.present();
  }

  sendMail(email) {
    location.href = 'mailto:'+email;
  }
}