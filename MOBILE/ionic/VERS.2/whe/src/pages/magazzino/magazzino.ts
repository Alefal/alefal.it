import { Component } from '@angular/core';
import { NavController, LoadingController, ModalController } from 'ionic-angular';

import { MagazzinoModal } from './magazzino-modal';
import { Prodotto }       from '../prodotti/prodotto';

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
    this.productSelected = [];
    
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProducts', '', '', '', '')
      .then(res => {
        console.log('res: '+JSON.stringify(res));

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

  setChecked(id,title,price,description,qnt) {
    let instock: boolean = true;
    let addQnt: number = 0;
    let catId: number    = 0;
    let catName: string  = '';

    this.prodotto = new Prodotto(id,title,price,description,instock,qnt,addQnt,catId,catName);
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
    modal.onDidDismiss(data => {
      console.log('-> '+data.action);
      if(data.action == 'refresh') {
        console.log('Ricarico la lista dei prodotti');
        this.loadData();
      } else {
        console.log('Chiudi finestra prodotto');
      }
    });
  }

  exists(id) {
    //return this.productSelected.indexOf(id) > -1;
  }

}