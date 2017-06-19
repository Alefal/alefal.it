import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';
import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { Order } from '../_models/order';

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

  constructor(
    private httpService: HttpService, 
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    private loadingBarService: LoadingBarService
  ) {}

  ngOnInit() {
    this.loadingBarService.start();

    this.route.params
      .subscribe(params => {
        if(params['ordineId']) {
          this.orderIdSaved = JSON.parse(params['ordineId']);
          console.log('%o', this.orderIdSaved);
        }
      });

      this.loadData();
      setInterval(this.loadData.bind(this), 60000)
  }

  ionViewDidLoad() {}

  loadData() {
    console.log('loadData');

    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        //if(res[0].response[0].result == 'OK') {
          this.orders = res.results;
          this.ordersAll = res.results;
        //} else {
        //  this.alertService.error('Nessun dato! Riprovare più tardi.');
        //}
        this.loadingBarService.complete();
      },
      error => {
        this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
        this.loadingBarService.complete();
      });
  }

  onCancel(ev) {
    this.orders = this.ordersAll;
  }

  orderDetail(orderId) {
    this.router.navigate(['/ordine', orderId, '']);
  }

}
