import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { Router, ActivatedRoute, Params } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';

import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { LoadingBar, LoadingBarService } from "ng2-loading-bar";

import { Ordine } from '../_models/ordine';
import { Prodotto } from '../_models/prodotto';
import { Ship } from '../_models/ship';
import { Nota } from '../_models/nota';

declare var jQuery:any;

@Component({
  selector: 'app-ordine',
  templateUrl: './ordine.component.html',
  styleUrls: ['./ordine.component.css']
})
export class OrdineComponent implements OnInit {

  placements: string[] = ['top']; //not work
  title: string = 'Sei sicuro?';
  message: string = 'Sei sicuro di voler eliminare il piatto selezionato ?';
  confirmText: string = 'SI <i class="glyphicon glyphicon-ok"></i>';
  cancelText: string = 'NO <i class="glyphicon glyphicon-remove"></i>';
  confirmClicked: boolean = false;
  cancelClicked: boolean = false;

  ordine: Ordine;
  notes: Nota[] = new Array<Nota>();
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
        this.ordine = JSON.parse(params['order']);
        this.getNote(this.ordine.id);
        //console.log('%o', this.ordine);
      });
  }

  getNote(id) {
    this.httpService
      .getCallHttp('getOrderNote', '', '', id, '')
      .subscribe(res => {
        console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          if(res[0].output == '') {
            this.noteComplete = 'Nessuna nota per l\'ordine'; 
          } else {
            for (let prod of res[0].output) {
              let nota = new Nota(prod['id'],prod['note'],true);
              this.notes.push(nota);
            }
            console.log('%o', this.notes);
          }
        }
      },
      error => {
        this.alertService.error('NOTE: Dati non disponibili! Si è verificato un errore.');
      });
  }

  deleteProduct(ordineId,prod:Prodotto) {
    this.loadingBarService.start();

    console.log('deleteProduct ordine: '+ordineId);
    console.log('%o',prod);

    let prodotto = new Prodotto(prod.id,prod.product_id,prod.title,prod.price,false,false,false,prod.price,prod.description,prod.quantity,'');

    let ordine = new Ordine(
      ordineId,         //this.id
      ordineId,         //this.order_number
      '',               //this.created_at
      '',               //this.updated_at
      '',               //this.completed_at
      '',               //this.status
      0,                //this.total
      0,                //this.subtotal
      0,                //this.total_line_items_quantity
      0,                //this.total_tax
      0,                //this.total_shipping
      0,                //this.cart_tax
      0,                //this.shipping_tax
      '',               //this.note
      prodotto,         //this.line_items
      0,                //this.shipping_lines
      0                 //this.tax_lines
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

  deleteShip(ordineId,ship) {
    console.log('deleteShip ordine: '+ordineId);
    console.log('%o',ship);

    let shipping = new Ship(ship.id,null,'',0);

    let ordine = new Ordine(
      ordineId,         //this.id
      ordineId,         //this.order_number
      '',               //this.created_at
      '',               //this.updated_at
      '',               //this.completed_at
      '',               //this.status
      0,                //this.total
      0,                //this.subtotal
      0,                //this.total_line_items_quantity
      0,                //this.total_tax
      0,                //this.total_shipping
      0,                //this.cart_tax
      0,                //this.shipping_tax
      '',               //this.note
      '',               //this.line_items
      shipping,         //this.shipping_lines
      0                 //this.tax_lines
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
    this.router.navigate(['/home',{ordineId:ordineId}]);
  }

}
