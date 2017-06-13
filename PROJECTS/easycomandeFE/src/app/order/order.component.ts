import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { Router, ActivatedRoute, Params } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';

import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { LoadingBar, LoadingBarService } from "ng2-loading-bar";

import { Order } from '../_models/order';
import { Product } from '../_models/product';
import { Special } from '../_models/special';
import { Note } from '../_models/note';

declare var jQuery: any;

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css']
})
export class OrderComponent implements OnInit {

  placements: string[] = ['top']; //not work
  title: string = 'Sei sicuro?';
  message: string = 'Sei sicuro di voler eliminare il piatto selezionato ?';
  confirmText: string = 'SI <i class="glyphicon glyphicon-ok"></i>';
  cancelText: string = 'NO <i class="glyphicon glyphicon-remove"></i>';
  confirmClicked: boolean = false;
  cancelClicked: boolean = false;

  ordine: Order;
  notes: Note[] = new Array<Note>();
  noteComplete: string;

  eliminaPiatto: boolean = true;

  height = 2;
  color = "#4092F1";
  runInterval = 300;

  constructor(
    private location: Location,
    private router: Router,
    private route: ActivatedRoute,
    private httpService: HttpService,
    private alertService: AlertService,
    private loadingBarService: LoadingBarService
  ) { }

  ngOnInit(): void {
    this.route.params
      .subscribe(params => {
        if (params['order']) {
          let ordineTmp = JSON.parse(params['order']);

          this.loadOrder(ordineTmp.id);
          //this.getNote(ordine.id);
        }
      });
  }

  loadOrder(orderId) {
    this.httpService
      .getCallHttp('getOrder','','',orderId,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        //if(res[0].response[0].result == 'OK') {
          this.ordine = res.results[0];
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

  getNote(id) {
    this.httpService
      .getCallHttp('getOrderNote', '', '', id, '')
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        //if (res[0].response[0].result == 'OK') {
          if (res.results== '') {
            this.noteComplete = 'Nessuna nota per l\'ordine';
          } else {
            for (let prod of res.results) {
              let nota = new Note(prod['id'], prod['note']);
              this.notes.push(nota);
            }
            console.log('%o', this.notes);
          }
        //}
      },
      error => {
        this.alertService.error('NOTE: Dati non disponibili! Si è verificato un errore.');
      });
  }

  deleteProduct(ordineId, prod: Product) {
    this.loadingBarService.start();

    console.log('deleteProduct ordine: ' + ordineId);
    console.log('%o', prod);

    let prodotto = new Product(
      prod.id,
      0,
      0,
      0,
      '',
      '',
      '',
      0,
      false,
      false,
      false
    );

    let ordine = new Order(
      ordineId,         //id: number,
      '',               //date: string,
      '',               //client: string,
      0,                //totalorder: number,
      0,                //totalservice: number,
      '',               //state: string,
      prodotto,         //items: any,
      '',               //specials: any,
      '',               //notes: string
    );

    this.httpService
      .getCallHttp('getOrderDeleteLineItem', '', '', '', ordine)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.backToOrders(ordineId);
        } else {
          this.alertService.error('PIATTI: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('PIATTI: Dati non disponibili! Si è verificato un errore.');
      });
  }

  deleteShip(ordineId, ship) {
    this.loadingBarService.start();

    console.log('deleteShip ordine: ' + ordineId);
    console.log('%o', ship);

    let shipping = new Special(ship.id, '', 0, '');

    let ordine = new Order(
      ordineId,         //id: number,
      '',               //date: string,
      '',               //client: string,
      0,                //totalorder: number,
      0,                //totalservice: number,
      '',               //state: string,
      '',               //items: any,
      shipping,         //specials: any,
      '',               //notes: string
    );

    this.httpService
      .getCallHttp('getOrderDeleteShipping', '', '', '', ordine)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.backToOrders(ordineId);
        } else {
          this.alertService.error('SPECIALI: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('SPECIALI: Dati non disponibili! Si è verificato un errore.');
      });
  }

  backToOrders(ordineId) {
    console.log('backToOrders');
    //this.location.back();
    this.router.navigate(['/home', { ordineId: ordineId }]);
  }

  editOrder(order) {
    console.log('editOrder');
    this.router.navigate(['/add', JSON.stringify(order)]);
  }

  deleteOrder(id) {
    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderDelete', '', '', id, '')
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          this.router.navigate(['/home']);
        } else {
          this.alertService.error('Nessun dato! Riprovare più tardi.');
        }
        this.loadingBarService.complete();
      },
      error => {
        this.alertService.error('ERROR: ' + error);
        this.loadingBarService.complete();
      });

  }

}
