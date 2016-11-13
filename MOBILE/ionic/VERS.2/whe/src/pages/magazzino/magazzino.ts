import { Component } from '@angular/core';
import { NavController, LoadingController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';

@Component({
  selector: 'page-magazzino',
  templateUrl: 'magazzino.html'
})
export class Magazzino {

  products: any;
  productAll: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
  ) {}

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

  updateProduct(id,stock) {
    console.log(id+' | '+stock);

    console.log(document.getElementById('newStockValue').val());
    
  }

}
