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
  notifications: any;

  orderPendingLength: number = 0;
  orderSuccessLength: number = 0;

  notificationsCount: number = 0;

  constructor(
    public authenticationService: AuthenticationService,
    private loadingBarService: LoadingBarService,
    private httpService: HttpService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
  ) {
    this.loadData();
    setInterval(this.repeatLoadData.bind(this), 60000)
  }

  loadData() {
    //ORDERS
    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        //console.log('%ò',res);

        //if(res[0].response[0].result == 'OK') {
          this.orders = res.results;

          let orderPendingLengthTmp = 0;
          let orderSuccessLengthTmp = 0;

          for (let order of this.orders) {
            if(order.state == 'pending') {
              orderPendingLengthTmp += 1;
            } else if(order.state == 'completed') {
              orderSuccessLengthTmp += 1;
            } else {
              //nothing: case not defined
            }
          }

          this.orderPendingLength = orderPendingLengthTmp;
          this.orderSuccessLength = orderSuccessLengthTmp;

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

      //NOTIFICATIONS
      this.httpService
        .getCallHttp('getNotifications','','','','')
        .subscribe(res => {
          //console.log('%ò',res);
          //this.notifications = res.results;
          //this.notificationsCount = res.results.length;

          localStorage.setItem('notifications', JSON.stringify(res.results));
          localStorage.setItem('notificationsCount', res.results.length);
        },
        error => {
          this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
        });
  }

  repeatLoadData() {
    console.log('repeatLoadData');

    //ORDERS
    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        this.orders = res.results;

        let orderPendingLengthTmp = 0;
        let orderSuccessLengthTmp = 0;

        for (let order of this.orders) {
          if(order.state == 'pending') {
            orderPendingLengthTmp += 1;
          } else if(order.state == 'completed') {
            orderSuccessLengthTmp += 1;
          } else {
            //nothing: case not defined
          }
        }

        this.orderPendingLength = orderPendingLengthTmp;
        this.orderSuccessLength = orderSuccessLengthTmp;
        
        this.loadingBarService.complete();
      },
      error => {
        this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
        this.loadingBarService.complete();
      });

      //NOTIFICATIONS
      /***
      this.httpService
        .getCallHttp('getNotifications','','','','')
        .subscribe(res => {
          this.notifications = res.results;
          //this.notificationsCount = res.results.length;

          let notifHistory    = JSON.parse(localStorage.getItem('notifications'));
          let notifCountSaved = parseInt(localStorage.getItem('notificationsCount'));

          if(res.results.length > notifCountSaved) {
            this.notificationsCount = res.results.length - notifCountSaved;

            for (let newNotif of res.results) {
              for (let histNotif of notifHistory) {
                //console.log('%ò',histNotif);
                if(histNotif.order_id == newNotif.order_id) {
                  ///EXIST
                } else {
                  this.notifications.push(newNotif); 
                }
              }
            }
          }

        },
        error => {
          this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
        });
        ***/
  }

  orderDetail(orderId) {
    this.router.navigate(['/ordine', orderId]);
  }
}
