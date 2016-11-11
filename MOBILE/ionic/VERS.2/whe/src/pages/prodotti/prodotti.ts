import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController } from 'ionic-angular';

import { ProdottoModal } from './prodotto-modal';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'page-prodotti',
  templateUrl: 'prodotti.html'
})
export class Prodotti {

  products: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  public tap: number = 0;
  showButtonAfterTap = false;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController
  ) {}

  ionViewDidLoad() {
    this.showButtonAfterTap = true;
    
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProducts','','','')
      .then(res => {
        console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.products = res[0].output;
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

  tapEvent(e) {
    /*this.tap++;
    if(this.tap == 10) {
      this.showButtonAfterTap = true;
    }*/
  }

  modalDetail(id) {
    console.log(id);
    
    //this.showButtonAfterTap = false;
    //this.tap = 0;
    let modal = this.modalCtrl.create(ProdottoModal, { id: id });
    modal.present();
  }

  modalCreate() {
    console.log('modalCreate');
  }

}
