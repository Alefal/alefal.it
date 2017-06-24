import { Component } from '@angular/core';

import { AuthenticationService } from './_services/index';
import { LoadingBar, LoadingBarService } from "ng2-loading-bar";

import { AlertService, HttpService } from './_services/index';

import { Router, ActivatedRoute } from '@angular/router';

import { Notification } from './_models/notification';

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

  notifications: Notification[] = new Array<Notification>();
  notificationsCount: number = 0;

  orderPendingLength: number = 0;
  orderSuccessLength: number = 0;

  currentUser: string;

  labelTypeService = '';

  constructor(
    public authenticationService: AuthenticationService,
    private loadingBarService: LoadingBarService,
    private httpService: HttpService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
  ) {
    this.loadConfigurations();
    this.loadData();
    setInterval(this.loadData.bind(this), 60000);

    this.currentUser = localStorage.getItem('currentUser');
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
        //this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
        this.loadingBarService.complete();
      });

      //NOTIFICATIONS
      this.httpService
        .getCallHttp('getNotifications','','','','')
        .subscribe(res => {
          console.log('%ò',res);

          this.notifications = [];

          for (let notification of res.results) {
            if(notification.read == 0) {
              this.notifications.push(notification);
            }
          }

          this.notificationsCount = this.notifications.length;
        },
        error => {
          //this.alertService.error('NOTIFICATIONS: Dati non disponibili! Si è verificato un errore.');
        });
  }

  loadConfigurations() {
    this.httpService
      .getCallHttp('getConfigurations', '', '', '', '')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        localStorage.removeItem('serviceenablepercent');
        localStorage.removeItem('coveredenablevalue');
        for (let conf of res.results) {
          //console.log('%ò',conf)
          if(conf.key == 'serviceenable' && conf.enable == 1) {
            localStorage.setItem('serviceenablepercent',conf.value);
            this.labelTypeService = conf.label;
          } else if(conf.key == 'coveredenable' && conf.enable == 1) {
            localStorage.setItem('coveredenablevalue',conf.value);
            this.labelTypeService = conf.label;
          }
        }
      },
      error => {
        //this.alertService.error('CONFIGURATIONS: Dati non disponibili! Si è verificato un errore.');
      });
  }

  orderDetail(orderId) {
    this.router.navigate(['/ordine', orderId, 'checkNotification']);
  }
}
