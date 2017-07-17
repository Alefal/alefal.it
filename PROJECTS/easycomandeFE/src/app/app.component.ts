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

  //Label CONFIGURATION
  labelTypeService = '';
  currentUser: string;

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

    localStorage.removeItem('currentUser');
  }

  loadData() {
    this.currentUser = localStorage.getItem('currentUser');

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

          //Servizio 10% del total
          if(conf.key == 'serviceenable' && conf.enable == 1) {
            localStorage.setItem('serviceenablepercent',conf.value);
            this.labelTypeService = conf.label;
          } 
          //Prezzo per coperto
          else if(conf.key == 'coveredenable' && conf.enable == 1) {
            localStorage.setItem('coveredenablevalue',conf.value);
            this.labelTypeService = conf.label;
          }
          //Titolo della stampa 
          else if(conf.key == 'printtitle' && conf.enable == 1) {
            localStorage.setItem('printtitle',conf.value);
          }
          //Primo messaggio nella stampa della ricevuta 
          else if(conf.key == 'printmessageline1' && conf.enable == 1) {
            localStorage.setItem('printmessageline1',conf.value);
          }
          //Secondo messaggio nella stampa della ricevuta
          else if(conf.key == 'printmessageline2' && conf.enable == 1) {
            localStorage.setItem('printmessageline2',conf.value);
          }
          //Font per la stampa della comanda per la cucina 
          else if(conf.key == 'printtablecomandefont' && conf.enable == 1) {
            localStorage.setItem('printtablecomandefont',conf.value);
          }
          //Font per la stampa della comanda per il cliente
          else if(conf.key == 'printtablericevutafont' && conf.enable == 1) {
            localStorage.setItem('printtablericevutafont',conf.value);
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
