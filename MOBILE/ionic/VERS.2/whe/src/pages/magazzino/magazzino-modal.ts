import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController, AlertController, ToastController } from 'ionic-angular';

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

  //Product items
  prodTitle: string;
  prodQuantity: number;
  prodAddQuantity: number;

  constructor(
    params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public viewCtrl: ViewController,
    public alertCtrl: AlertController,
    public toastCtrl: ToastController
  ) {

    this.productSelected = params.get('productSelected');
    console.log('this.productSelected: '+this.productSelected);
  }

  dismiss() {
    this.viewCtrl.dismiss();
  }

  saveAll() {
    for (let prod of this.productSelected) {
      let pId: number       = prod['prodId'];
      let PTitle: string    = prod['prodTitle'];
      let PPrice: number    = prod['prodPrice'];
      let PDescr: string    = prod['prodDescription'];
      let PInStock: boolean = true;
      let pQnt              = (Number(prod['prodQuantity']) + Number(prod['prodAddQuantity']));
      
      let prodotto = new Prodotto(pId,PTitle,PPrice,PDescr,PInStock,pQnt,0);
      console.log(prodotto);  

      this.httpService
        .getCallHttp('getProductSave', '', '', '', prodotto)
        .then(res => {
          console.log('res: ' + JSON.stringify(res));

          if (res[0].response[0].result == 'OK') {
            console.log('Prodotto '+pId+' salvato!');      
            this.showToastWithCloseButton(pId,PTitle,'salvato!')      
          } else {
            console.log('Prodotto '+pId+' NON salvato!');      
            this.showToastWithCloseButton(pId,PTitle,'NON salvato!')
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
    }
  }

  showToastWithCloseButton(id,title,message) {
    const toast = this.toastCtrl.create({
      message: 'Prodotto '+title+' (id: '+id+') '+message,
      showCloseButton: true,
      closeButtonText: 'Ok'
    });
    toast.present();
  }
}