import { Component } from '@angular/core';

import { AuthenticationService } from './_services/index';
import { LoadingBar, LoadingBarService } from "ng2-loading-bar";

import { AlertService, HttpService } from './_services/index';

import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  height = 2;
  color = "#4092F1";
  runInterval = 250;

  orders: any;

  orderPendingLength: number = 0;
  orderSuccessLength: number = 0;

  constructor(
    public authenticationService: AuthenticationService,
    private loadingBarService: LoadingBarService,
    private httpService: HttpService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
  ) {
    //this.loadData('');
  }

  loadData(orderIdSave) {
    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        console.log('%ò',res);

        //if(res[0].response[0].result == 'OK') {
          this.orders = res.results;

          for (let order of this.orders) {
            console.log(order.client+' -> '+order.state);
            if(order.state == 'pending') {
              this.orderPendingLength += 1;
            } else if(order.state == 'completed') {
              this.orderSuccessLength += 1;
            } else {
              //nothing: case not defined
            }
          }

          //console.log('this.orderPendingLength -> '+this.orderPendingLength);
          //console.log('this.orderSuccessLength -> '+this.orderSuccessLength);
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

  orderDetail(order) {
    this.router.navigate(['/ordine', JSON.stringify(order)]);
  }
}
