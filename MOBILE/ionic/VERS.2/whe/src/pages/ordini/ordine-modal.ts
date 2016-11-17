import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController, AlertController } from 'ionic-angular';

import { Ordine } from './ordine';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'ordine-modal',
  templateUrl: 'ordine-modal.html'
})
export class OrdineModal {

  ordineEdit: any;
  ordine: Ordine;

  id: number;
  product: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  sectionCreate: boolean = false;
  sectionDetail: boolean = false;

  //Order
  orderId: number;
  orderNumber: number;
  orderTotal: number;
  orderCustomer: string;
  orderStatus: string;  

  showButtonEditDelete = false;

  constructor(
    private params: NavParams,
    private httpService: HttpService,
    private loadingCtrl: LoadingController,
    private viewCtrl: ViewController,
    private alertCtrl: AlertController
  ) {

    this.ordineEdit = params.get('ordine');
    console.log('Modale: '+this.ordineEdit);

    //CREATE
    if (this.ordineEdit == '') {
      this.showButtonEditDelete = false;
      console.log('IF!');
      this.ordine = new Ordine(this.orderId,this.orderNumber,this.orderTotal,this.orderCustomer,this.orderStatus);
    }
    //DETAIL
    else {
      console.log('ELSE!');
      
      this.showButtonEditDelete = true;
      
      this.orderId = this.ordineEdit.id;
      this.orderNumber = this.ordineEdit.id;
      this.orderTotal = this.ordineEdit.total;
      this.orderCustomer = this.ordineEdit.customer.billing_address.first_name +' '+ this.ordineEdit.customer.billing_address.last_name;
      this.orderStatus = this.ordineEdit.status;
      
      this.ordine = new Ordine(this.orderId,this.orderNumber,this.orderTotal,this.orderCustomer,this.orderStatus);
      console.log(this.ordine);
    }
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: 'noRefresh'
    });
  }

  saveOrder(id) {
    console.log('Devono essere decrementati i prodotti in magazzino');
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

            
          }
        }
      ]
    });
    confirm.present();

  }

  changeStatus(id,status) {
    console.log(id+' -> '+status);
    let checkedPending: boolean = false;
    let checkedProcessing: boolean = false;
    let checkedOnHold: boolean = false;
    let checkedCompleted: boolean = false;
    let checkedCancelled: boolean = false;
    let checkedRefunded: boolean = false;
    let checkedFailed: boolean = false;

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
    
    let alert = this.alertCtrl.create();
    alert.setTitle('Cambia stato');

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
          .getCallHttp('getOrdersChangeStatus','','',id,data)
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
}