import { Component } from '@angular/core';
import { Platform, NavParams, ViewController, LoadingController, AlertController } from 'ionic-angular';
import { BarcodeScanner } from '@ionic-native/barcode-scanner';

import { Prodotto } from './prodotto';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'prodotto-modal',
  templateUrl: 'prodotto-modal.html'
})
export class ProdottoModal {

  prodotto: Prodotto;

  id: number;
  product: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  sectionCreate: boolean = false;
  sectionDetail: boolean = false;

  showButtonEditDelete = false;

  //Product items
  prodTitle: string;
  prodSku: string;
  prodPrice: number;
  prodDescription: string;
  prodManageStock: boolean = true;
  prodQuantity: number;
  prodCatId: number;
  prodCatName: string

  line_items: any;
  selectCatId: number;

  constructor(
    params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public viewCtrl: ViewController,
    public alertCtrl: AlertController,
    private platform: Platform,
    private barcodeScanner: BarcodeScanner
  ) {
    platform.registerBackButtonAction(() => {
      console.log("Back button action called");

      this.viewCtrl.dismiss({
        action: 'noRefresh'
      });
    }, 1);

    this.id = params.get('id');
    console.log(this.id+' - '+this.prodCatId);

    //CATEGORIE
    this.httpService
      .getCallHttp('getProductsCategory', '', '', '', '')
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

    //CREATE
    if (this.id == 0) {
      //
    }
    //DETAIL
    else {
      this.showButtonEditDelete = true;

      this.loading = this.loadingCtrl.create({
        spinner: 'crescent',
      });
      this.loading.present();

      this.httpService
        .getCallHttp('getProductDetail', '', '', this.id, '')
        .then(res => {
          console.log('res: ' + JSON.stringify(res));

          if (res[0].response[0].result == 'OK') {
            this.product = res[0].output[0];

            this.prodTitle = this.product.title;
            this.prodSku = this.product.sku;
            this.prodPrice = this.product.price;
            this.prodDescription = this.product.description;
            this.prodManageStock = true;
            this.prodQuantity = this.product.stock;
            this.prodCatName = this.product.category;

            for(let cat of this.line_items){
              console.log('cat -> '+cat.name);
              if(cat.name == this.product.category) {
                this.selectCatId = cat.id;
                this.prodCatId = cat.id;
              }
            }
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

  dismiss() {
    this.viewCtrl.dismiss({
      action: 'noRefresh'
    });
  }

  saveProduct(id) {
    //console.log(id);
    //console.log(this.prodTitle);
    //console.log(this.prodPrice);
    //console.log(this.prodDescription);
    //console.log(this.prodManageStock);
    //console.log(this.prodQuantity);
    console.log(this.prodCatId);
    console.log(this.prodCatName);
   
    console.log('this.selectCatId: '+this.selectCatId);  
    if(this.selectCatId != null) {
      this.prodCatId = this.selectCatId;
      console.log(this.prodCatId);   
    }
    if(!this.prodCatId || this.prodCatId == 0) {
      this.showAlert();
      return false;
    }

    this.prodotto = new Prodotto(id, this.prodTitle, this.prodSku, this.prodPrice, this.prodDescription, this.prodManageStock, this.prodQuantity, 0, this.prodCatId, this.prodCatName);

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

  deleteProduct(id) {
    console.log(id);

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare il prodotto selezionato ?',
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
              .getCallHttp('getProductDelete', '', '', id, '')
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

  showAlert() {
    let alert = this.alertCtrl.create({
      title: 'Attenzione!',
      subTitle: 'La categoria è obbligatoria',
      buttons: ['OK']
    });
    alert.present();
  }

  scanProductBarcode() {
    console.log('scanProductBarcode');
    this.barcodeScanner.scan().then((barcodeData) => {
      // Success! Barcode data is here
      console.log('barcodeData: '+barcodeData.text);
      this.prodSku = barcodeData.text;
    }, (err) => {
      // An error occurred
      console.log('ERROR: ' + err);
      this.errorMessage = 'Error: '+err;
      this.errorMessageView = true;
    });
  }
}