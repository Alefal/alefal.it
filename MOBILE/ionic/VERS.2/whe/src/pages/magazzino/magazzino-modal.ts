import { Component } from '@angular/core';
import { Platform, NavParams, ViewController, LoadingController, AlertController, ToastController } from 'ionic-angular';

import { Prodotto }    from '../prodotti/prodotto';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'magazzino-modal',
  templateUrl: 'magazzino-modal.html'
})
export class MagazzinoModal {

  productSelected: Array<Prodotto> = [];

  id: number;
  product: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  messageResult: string = '';

  //Product items
  prodTitle: string;
  prodQuantity: number;
  prodAddQuantity: number;

  intervalId: any;

  constructor(
    params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public viewCtrl: ViewController,
    public alertCtrl: AlertController,
    public toastCtrl: ToastController,
    private platform: Platform
  ) {
    platform.registerBackButtonAction(() => {
      console.log("Back button action called");

      this.viewCtrl.dismiss({
        action: 'noRefresh'
      });
    }, 1);

    this.productSelected = params.get('productSelected');
    console.log('this.productSelected: '+this.productSelected);
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: 'noRefresh'
    });
  }

  saveAll() {

    let index = 0;

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();
    this.intervalId = setInterval(() => {
      console.log('intervalId: '+index+' | '+this.productSelected.length);
      if(index == this.productSelected.length) {
        console.log('FINE: '+this.messageResult);
        //this.showToastWithCloseButton(this.messageResult);
        clearInterval(this.intervalId);
        this.loading.dismiss();

        this.viewCtrl.dismiss({
          action: 'refresh'
        });
      }
    }, 1000);

    for (let prod of this.productSelected) {
      console.log(index+' | '+this.productSelected.length);
      console.log('%o',prod);

      let pId: number       = prod['prodId'];
      let PTitle: string    = prod['prodTitle'];
      let pQnt              = (Number(prod['prodQuantity']) + Number(prod['prodAddQuantity']));
      
      let prodotto = new Prodotto(pId,'','',0,'',true,pQnt,0,0,'');
      console.log(prodotto);  

      this.httpService
        .getCallHttp('getProductSaveQnt', '', '', '', prodotto)
        .then(res => {
          console.log('res: ' + JSON.stringify(res));
          index++;
          
          if (res[0].response[0].result == 'OK') {
            console.log('Prodotto '+pId+' salvato!');    
            this.messageResult += '\nProdotto "'+PTitle+'" (id: '+pId+') salvato!\n';
            //this.showToastWithCloseButton(pId,PTitle,'salvato!');  
          } else {
            console.log('Prodotto '+pId+' NON salvato!');      
            this.messageResult += '\nProdotto "'+PTitle+'" (id: '+pId+') NON salvato!\n';
            //this.showToastWithCloseButton(pId,PTitle,'NON salvato!');  
          }
        })
        .catch(err => {
          console.error(err);
          index++;
        });
      
      /*
      this.httpService
        .getCallHttp('getProductSave', '', '', '', prodotto)
        .subscribe(
          res => {
            console.log('finished http request, moving on to next http request')
            console.log('res: ' + JSON.stringify(res));
            
            if (res[0].response[0].result == 'OK') {
              console.log('Prodotto '+pId+' salvato!');      
              this.showToastWithCloseButton(pId,PTitle,'salvato!');  
            } else {
              console.log('Prodotto '+pId+' NON salvato!');      
              this.showToastWithCloseButton(pId,PTitle,'NON salvato!');  
            }
          },
          err => {
            console.error(err);
          },
          () => {
            console.log('all http requests have been finished');
          });
      */
    }
  }

  showToastWithCloseButton(message) {
    const toast = this.toastCtrl.create({
      message: message,
      showCloseButton: true,
      closeButtonText: 'Ok'
    });

    toast.onDidDismiss(() => {
      console.log('Dismissed toast');
    });
    
    toast.present();
  }
}