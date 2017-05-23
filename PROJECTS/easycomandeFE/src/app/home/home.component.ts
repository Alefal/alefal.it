import { Component, OnInit } from '@angular/core';

import { AlertService, HttpService } from '../_services/index';

import { Ordine } from '../_models/ordine';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  orders: any;
  ordersAll: any;

  orderIdSaved: any;
  ordine: any;
  nothing: string;

  constructor(private httpService: HttpService, private alertService: AlertService) {}

  ngOnInit() {
    this.loadData('');
  }

  ionViewDidLoad() {
    console.log("ionViewDidLoad");
    this.loadData('');
  }

  loadData(orderIdSave) {
    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.orders = res[0].output;
          this.ordersAll = res[0].output;
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
      },
      error => {
        this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
      });
  }

  onCancel(ev) {
    this.orders = this.ordersAll;
  }

  orderDetail(ordine) {
    
  }

  addOrder() {
    
  }

}
