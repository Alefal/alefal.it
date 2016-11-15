import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController, AlertController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'magazzino-modal',
  templateUrl: 'magazzino-modal.html'
})
export class MagazzinoModal {

  prodotto: Prodotto;

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
    public alertCtrl: AlertController
  ) {

    this.productSelected = params.get('productSelected');
    console.log('this.productSelected: '+this.productSelected);
  }

  dismiss() {
    this.viewCtrl.dismiss();
  }

  saveProduct(id) {
    console.log(id);
    console.log(this.prodQuantity);

    this.prodotto = new Prodotto(id, this.prodTitle, this.prodQuantity, this.prodAddQuantity);

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProductSave', '', '', '', this.prodotto)
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

  saveAll() {
    for (let prod of this.productSelected) {
      let pId: number     = prod['prodId'];
      let PTitle: string  = prod['prodTitle'];
      let pQnt            = prod['prodQuantity'] + prod['prodAddQuantity'];
      
      let prodotto = new Prodotto(pId, PTitle, pQnt, 0);
      console.log(prodotto);  
    }
  }
}

class Prodotto {
  protected prodId: number;
  protected prodTitle: string;
  protected prodQuantity: number;
  protected prodAddQuantity: number;
  

  constructor(prodId: number, prodTitle: string, prodQuantity: number, prodAddQuantity: number) {
    this.prodId = prodId;
    this.prodTitle = prodTitle;
    this.prodQuantity = prodQuantity;
    this.prodAddQuantity = prodAddQuantity;    
  }
}