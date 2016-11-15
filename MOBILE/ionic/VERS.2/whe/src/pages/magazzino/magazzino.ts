import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { MagazzinoModal } from './magazzino-modal';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'page-magazzino',
  templateUrl: 'magazzino.html'
})
export class Magazzino {

  prodotto: Prodotto;

  products: any;
  productAll: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  productSelected: Array<Prodotto> = [];

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) { }

  ionViewDidLoad() {
    this.loadData();
  }

  loadData() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProducts', '', '', '', '')
      .then(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.products = res[0].output;
          this.productAll = res[0].output;
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

  getItems(ev) {
    var val = ev.target.value;
    //this.productFilter = this.products;

    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.products = this.products.filter((item) => {
        return (item.title.toLowerCase().indexOf(val.toLowerCase()) > -1);
      })
    }
  }
  onCancel(ev) {
    this.products = this.productAll;
  }

  setChecked(id,title,stock) {

    this.prodotto = new Prodotto(id,title,stock);
    let prodId = this.prodotto.getProdId();
    let addProduct: boolean = true;

    let index = 0;
    for (let prod of this.productSelected) {
      //console.log('-> '+JSON.stringify(prod)+' | '+prodId);

      if(prod.getProdId() == prodId) {
        console.log('Prodotto da eliminare: '+prodId);
        this.productSelected.splice(index, 1);
        addProduct = false;
        break;
      }
      index++;
    }

    if(addProduct) {
      console.log('Aggiungo Prodotto: '+prodId);      
      this.productSelected.push(this.prodotto);
    } 
    /** debug
    for (let prod of this.productSelected) {
      console.log(prod);  
    }
    **/
  }
  getAllChecked() {
    /** debug
    for (let prod of this.productSelected) {
      console.log(prod);  
    }
    **/
    let modal = this.modalCtrl.create(MagazzinoModal, { productSelected: this.productSelected });
    modal.present();
  }

  exists(id) {
    //return this.productSelected.indexOf(id) > -1;
  }

}
export class Prodotto {
  protected prodId: number;
  protected prodTitle: string;
  protected prodQuantity: number;

  constructor(prodId: number, prodTitle: string, prodQuantity: number) {
    this.prodId = prodId;
    this.prodTitle = prodTitle;
    this.prodQuantity = prodQuantity;
  }

  getProdId(): string {
    return this.prodId+'';
  }
}