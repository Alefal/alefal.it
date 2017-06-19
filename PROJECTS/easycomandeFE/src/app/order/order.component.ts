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

import * as moment from 'moment';
declare var jQuery: any;

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css']
})
export class OrderComponent implements OnInit {

  placements: string[] = ['top','bottom']; //not work
  title: string = 'Sei sicuro?';
  message: string = 'Sei sicuro di voler eliminare il piatto selezionato ?';
  messageOrder: string = 'Sei sicuro di voler eliminare l\'ordine selezionato ?';
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
  ) { 
    let now = moment().format('LLLL');
    console.log('now: ' + now);
  }

  ngOnInit(): void {
    this.route.params
      .subscribe(params => {
        if (params['order']) {
          let ordineId = params['order'];
          this.loadOrder(ordineId);
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

  //NON USATO
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

  deleteProduct(productId,orderId) {
    this.loadingBarService.start();

    console.log('deleteProduct: ' + productId);

    this.httpService
      .getCallHttp('getOrderDeleteLineItem', '', '', productId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.backToOrders(orderId);
        } else {
          this.alertService.error('PRODUCT: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('PRODUCT: Dati non disponibili! Si è verificato un errore.');
      });
  }

  deleteSpecial(specialId,orderId) {
    this.loadingBarService.start();

    console.log('deleteSpecial: ' + specialId);

    this.httpService
      .getCallHttp('getOrderDeleteSpecial', '', '', specialId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.backToOrders(orderId);
        } else {
          this.alertService.error('SPECIALI: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('SPECIALI: Dati non disponibili! Si è verificato un errore.');
      });
  }

  deleteNote(noteId,orderId) {
    this.loadingBarService.start();

    console.log('deleteNote: ' + noteId);

    this.httpService
      .getCallHttp('getOrderNoteDelete', '', '', noteId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.backToOrders(orderId);
        } else {
          this.alertService.error('NOTE: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('NOTE: Dati non disponibili! Si è verificato un errore.');
      });
  }

  refreshOrder(ordineId) {
    console.log('refreshOrder');
    //this.location.back();
    this.router.navigateByUrl('/ordine/'+ordineId, { skipLocationChange: false });
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

  changeItemState(prodId,orderId) {
    console.log('changeItemState: ' + prodId);
    this.loadingBarService.start();


    this.httpService
      .getCallHttp('getOrderChangeLineItemState', '', '', prodId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.backToOrders(orderId);
        } else {
          this.alertService.error('ITEM: Non è stato possibile modificare lo stato');
        }
      },
      error => {
        this.alertService.error('ITEM: Dati non disponibili! Si è verificato un errore.');
      });
  }

  changeSpecialState(specialId,orderId) {
    console.log('changeSpecialState: ' + specialId);
    this.loadingBarService.start();


    this.httpService
      .getCallHttp('getOrderChangeSpecialState', '', '', specialId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.backToOrders(orderId);
        } else {
          this.alertService.error('SPECIAL: Non è stato possibile modificare lo stato');
        }
      },
      error => {
        this.alertService.error('SPECIAL: Dati non disponibili! Si è verificato un errore.');
      });
  }

  changeOrderState(orderId) {
    console.log('changeOrderState: ' + orderId);
    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderChangeOrderState', '', '', orderId, '')
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.backToOrders(orderId);
        } else {
          this.alertService.error('ORDER: Non è stato possibile modificare lo stato');
        }
      },
      error => {
        this.alertService.error('ORDER: Dati non disponibili! Si è verificato un errore.');
      });
  }

  deleteOrder(id) {
    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderDelete', '', '', id, '')
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
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

  printOrder(order,what) {
    console.log('printOrder',JSON.stringify(order));
    let printContents, popupWin;
    if(what == 'ricevuta') {
      printContents = this.templateOrderCompleted(order);
    } else {
      printContents = this.templateOrder(order);
    }
    popupWin = window.open('', '_blank', 'top=0,left=0,height=auto,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
      <html>
        <head>
          <title>Ordinazione</title>
          <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />
	        <link rel="stylesheet" type="text/css" href="../assets/css/main.css" />
          <style>
          //........Customized style.......
          .printOrder {
            text-align:center;
            margin: 0 auto;
          }
          .printOrder .orderInfo {
            text-align:center;
          }
          .printOrder .logo {
            text-align:center;
          }
          .printOrder .logo img {
            margin: 0 auto;
            max-width: 150px;
          }
          .printOrder .deleteItem {
            /*text-decoration: line-through;*/
            display: none;
          }
          .printOrder .notesList {
            padding: 15px;
          }
          .printOrder .tableComande {
            font-size: 1.5em;
          }
          .printOrder .tableRicevuta {
            font-size: 1em;
          }
          </style>
        </head>
        <body onload="window.print();window.close()">${printContents}</body>
      </html>`
    );
    popupWin.document.close();
  }

  templateOrder(order) {
    //let template = '';
    //template += '<div align="center">'+order.id+'</div>';

    let template = ''+
    '<div class="container printOrder">'+
    '  <div class="orderInfo">'+     
    '     <h2>'+order.client+'</h2>'+
    '     <h4>Date: '+moment(order.date).format('MM DD, YYYY HH:mm A')+'</h4>'+
    '  </div>'+     
    //'  <hr />'+     
    '  <table class="table table-hover tableComande">'+
    //'    <thead>'+
    //'      <tr>'+
    //'        <th>QTY</th>'+
    //'        <th>ITEM</th>'+
    //'      </tr>'+
    //'    </thead>'+
    '    <tbody>';

    for (let item of order.items) {
      let classItem = '';
      if(item.state == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td>'+item.quantity+'x </td>';
      if(item.note != '') {
        template += '<td>'+item.name+'<br /><em>('+item.note+')</em></td>';
      } else {
        template += '<td>'+item.name+'</td>';        
      }
      template += ''+
      '      </tr>';
    }

    for (let special of order.specials) {
      let classItem = '';
      if(special.state == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td>1x </td>';
      if(special.note != '') {
        template += '<td>'+special.name+'<br /><em>('+special.note+')</em></td>';
      } else {
        template += '<td>'+special.name+'</td>';        
      }
      template += ''+
      '      </tr>';
    }

    template += ''+
    '    </tbody>'+
    '  </table>';

    if(order.notes.length > 0) {
      template += ''+
        ' <div class="notesList">'+
        '     <strong>NOTE:</strong>'+
        '     <br />';
      for (let note of order.notes) {
        template += ''+
        '     <em>'+note.note+'</em>; ';
      }
      template += ''+
        ' </div>';
    }
    
    template += ''+
    '</div>';

    return template;
  }

  templateOrderCompleted(order) {
    //let template = '';
    //template += '<div align="center">'+order.id+'</div>';

    let template = ''+
    '<div class="container printOrder">'+
    '  <div class="logo"><img src="../assets/img/logo-small-print.png" /></div>'+
    '  <div class="orderInfo">'+     
    '     <h2>'+order.client+'</h2>'+
    '     <h4>Date: '+moment(order.date).format('MM DD, YYYY HH:mm A')+'</h4>'+
    '  </div>'+     
    '  <hr />'+     
    '  <table class="table table-hover tableRicevuta">'+
    '    <thead>'+
    '      <tr>'+
    '        <th>QTY</th>'+
    '        <th>ITEM</th>'+
    '        <th>PRICE</th>'+
    '        <th>TOTAL</th>'+
    '      </tr>'+
    '    </thead>'+
    '    <tbody>';

    for (let item of order.items) {
      template += ''+
      '      <tr>'+
      '        <td>'+item.quantity+'x </td>'+
      '        <td>'+item.name+'</td>'+
      '        <td>&euro; '+item.price+'</td>'+
      '        <td>&euro; '+item.total+'</td>'+
      '      </tr>';
    }

    for (let special of order.specials) {
      template += ''+
      '      <tr>'+
      '        <td>1x </td>'+
     '         <td>'+special.name+'</td>'+  
      '        <td></td>'+
      '        <td>&euro; '+special.price+'</td>'+
      '      </tr>';
    }

    template += ''+
      '      <tr>'+
      '        <td></td>'+
      '        <td></td>'+
      '        <td><strong>Total</strong></td>'+
      '        <td><strong>&euro; '+order.totalorder+'</strong></td>'+
      '      </tr>'+
      '      <tr>'+
      '        <td></td>'+
      '        <td></td>'+
      '        <td><strong>Service (10%)</td></strong>'+
      '        <td><strong>&euro; '+order.totalservice+'</strong></td>'+
      '      </tr>';

    template += ''+
    '    </tbody>'+
    '  </table>';

    template += ''+
    '  <hr />'+     
    '  <div class="orderInfo">'+     
    '     <h3>Thank you</h3>'+
    '     <h3>Please come again!</h3>'+
    '  </div>'+ 
    '</div>';
    return template;
  }

}
