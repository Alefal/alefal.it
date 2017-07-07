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

  serviceOrCovered: string = '';

  itemIdChangeSortOrder: number = 0;
  itemOrderIdChangeSortOrder: number = 0;
  itemSortOrder: number = 0;

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

    if(localStorage.getItem('serviceenablepercent')) {
      this.serviceOrCovered = 'Servizio';
    } else if(localStorage.getItem('coveredenablevalue')) {
      this.serviceOrCovered = 'Coperti';
    }
  }

  ngOnInit(): void {
    this.route.params
      .subscribe(params => {
        if (params['order']) {
          let ordineId = params['order'];
          this.loadOrder(ordineId);
          //this.getNote(ordine.id);

          if (params['check'] && params['check'] == 'checkNotification') {
            let ordineId = params['order'];
            this.checkNotification(ordineId);
            //this.getNote(ordine.id);
          }
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

  checkNotification(orderId) {
    this.httpService
      .getCallHttp('checkNotification','','',orderId,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

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

  //Rimango nella pagina dell'ordine
  deleteProduct(productId,orderId) {
    this.loadingBarService.start();

    console.log('deleteProduct: ' + productId);

    this.httpService
      .getCallHttp('getOrderDeleteLineItem', '', '', productId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.refreshOrder(orderId);
        } else {
          this.alertService.error('PRODUCT: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('PRODUCT: Dati non disponibili! Si è verificato un errore.');
      });
  }

  //Rimango nella pagina dell'ordine
  deleteSpecial(specialId,orderId) {
    this.loadingBarService.start();

    console.log('deleteSpecial: ' + specialId);

    this.httpService
      .getCallHttp('getOrderDeleteSpecial', '', '', specialId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.refreshOrder(orderId);
        } else {
          this.alertService.error('SPECIALI: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('SPECIALI: Dati non disponibili! Si è verificato un errore.');
      });
  }

  //Rimango nella pagina dell'ordine
  deleteNote(noteId,orderId) {
    this.loadingBarService.start();

    console.log('deleteNote: ' + noteId);

    this.httpService
      .getCallHttp('getOrderNoteDelete', '', '', noteId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.refreshOrder(orderId);
        } else {
          this.alertService.error('NOTE: Non è stato possibile cancellare il piatto');
        }
      },
      error => {
        this.alertService.error('NOTE: Dati non disponibili! Si è verificato un errore.');
      });
  }

  refreshOrder(ordineId) {
    console.log('refreshOrder: '+ordineId);
    //this.location.back();
    //this.router.navigateByUrl('/ordine/'+ordineId, { skipLocationChange: false });
    //this.router.navigate(['/ordine/'+ordineId+'?refresh=1']);
    this.loadOrder(ordineId);
    
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

  //Rimango nella pagina dell'ordine
  changeItemState(prodId,orderId) {
    console.log('changeItemState: ' + prodId);
    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderChangeLineItemState', '', '', prodId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.refreshOrder(orderId);
        } else {
          this.alertService.error('ITEM: Non è stato possibile modificare lo stato');
        }
      },
      error => {
        this.alertService.error('ITEM: Dati non disponibili! Si è verificato un errore.');
      });
  }

  changeItemOrderModal(prodId,orderId) {
    console.log('changeItemOrderModal: '+ prodId + ' | ' + orderId);
    this.itemIdChangeSortOrder = prodId;
    this.itemOrderIdChangeSortOrder = orderId;
    jQuery('#changeItemOrderModal').modal();
  }
  changeItemOrder() {
    console.log('itemSortOrder: '+ this.itemIdChangeSortOrder + ' | ' + this.itemSortOrder);
    jQuery('#changeItemOrderModal').modal('hide');

    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderChangeLineItemSortOrder', '', '', this.itemIdChangeSortOrder, this.itemSortOrder)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.refreshOrder(this.itemOrderIdChangeSortOrder);
        } else {
          this.alertService.error('ITEM: Non è stato possibile modificare lo stato');
        }
      },
      error => {
        this.alertService.error('ITEM: Dati non disponibili! Si è verificato un errore.');
      });
  }

  //Rimango nella pagina dell'ordine
  changeSpecialState(specialId,orderId) {
    console.log('changeSpecialState: ' + specialId);
    this.loadingBarService.start();


    this.httpService
      .getCallHttp('getOrderChangeSpecialState', '', '', specialId, orderId)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res.results[0].operation == 'success') {
          this.refreshOrder(orderId);
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
          this.refreshOrder(orderId);
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

    let printtablecomandefont = '1.8em';
    let printtablericevutafont = '1.2em';

    if(localStorage.getItem('printtablecomandefont')) {
      printtablecomandefont = localStorage.getItem('printtablecomandefont');
    }

    if(localStorage.getItem('printtablericevutafont')) {
      printtablericevutafont = localStorage.getItem('printtablericevutafont');
    }

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
          <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.css" />
	        <link rel="stylesheet" type="text/css" href="../../easycomande/FE/assets/css/main.css" />
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
            max-width: 50%;
          }
          .printOrder .deleteItem {
            /*text-decoration: line-through;*/
            display: none;
          }
          .printOrder .notesList {
            padding: 15px;
          }
          .printOrder .tableComande {
            font-size: `+printtablecomandefont+`;
            width: 100%;
          }
          .printOrder .tableRicevuta {
            font-size: `+printtablericevutafont+`;
            width: 100%;
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

    let initialItemOrder:number = 1;

    for (let item of order.items) {
      let classItem = '';
      if(item.state == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }
      
      if(item.order > initialItemOrder) {
        initialItemOrder = item.order;
        template += ''+
      '      <tr>'+
      '      <td colspan="2" align="center"><em>-------- segue --------</em-></td>'+
      '      </tr>';
      }
      
      template += ''+
      '      <tr class="'+classItem+'">'+
      '        <td width="10%">'+item.quantity+'x </td>';
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
      '        <td width="10%">1x </td>';
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
        '     <br /><h3>';
      for (let note of order.notes) {
        template += ''+
        '     <em>'+note.note+'</em>; ';
      }
      template += ''+
        ' </h3></div>';
    }
    
    template += ''+
    '</div>';

    return template;
  }

  templateOrderCompleted(order) {
    //let template = '';
    //template += '<div align="center">'+order.id+'</div>';

    let serviceenable     = false;
    let coveredenable     = false;
    let printtitle        = '';
    let printmessageline1 = '';
    let printmessageline2 = '';

    if(localStorage.getItem('serviceenablepercent')) {
      serviceenable = true;
    } 
    if(localStorage.getItem('coveredenablevalue')) {
      coveredenable = true;
    }
    if(localStorage.getItem('printtitle')) {
      printtitle = '<h2>'+localStorage.getItem('printtitle')+'</h2>';
    } else {
       printtitle = '<img src="../../assets/img/logo-small-print.png" />';
    }
    if(localStorage.getItem('printmessageline1')) {
      printmessageline1 = localStorage.getItem('printmessageline1');
    } else {
      printmessageline1 = 'Arrivederci';
    } 
    if(localStorage.getItem('printmessageline2')) {
      printmessageline2 = localStorage.getItem('printmessageline2');
    } else {
      printmessageline2 = 'A presto...';
    }

    let template = ''+
    '<div class="container printOrder">'+
    '  <div class="logo">'+printtitle+'</div>'+
    '  <div class="orderInfo">'+     
    '     <h3>'+order.client+'</h3>'+
    '     <h4>Date: '+moment(order.date).format('MM DD, YYYY HH:mm A')+'</h4>'+
    '  </div>'+     
    '  <hr />'+     
    '  <table class="table table-hover tableRicevuta">'+
    '    <thead>'+
    '      <tr>'+
    '        <th width="10%">QTY</th>'+
    '        <th>ITEM</th>'+
    '        <th>PRICE</th>'+
    '        <th>TOTAL</th>'+
    '      </tr>'+
    '    </thead>'+
    '    <tbody>';

    for (let item of order.items) {
      template += ''+
      '      <tr>'+
      '        <td width="10%">'+item.quantity+'x </td>'+
      '        <td>'+item.name+'</td>'+
      '        <td>&euro; '+item.price+'</td>'+
      '        <td>&euro; '+item.total+'</td>'+
      '      </tr>';
    }

    for (let special of order.specials) {
      template += ''+
      '      <tr>'+
      '        <td>1x </td>'+
      '        <td>'+special.name+'</td>'+  
      '        <td></td>'+
      '        <td>&euro; '+special.price+'</td>'+
      '      </tr>';
    }

    template += '<tr>';

    if(serviceenable) {
        template += ''+
        '   <td></td>'+
        '   <td>Servizio (10%)</td>';
    }

    if(coveredenable) {
        template += ''+
        '   <td> '+order.covered+'x</td>'+
        '   <td>Coperti</td>';
    }

    template += ''+
      '        <td></td>'+
      '        <td>&euro; '+order.totalservice+'</td>'+
      '      </tr>';

    template += ''+
      '      <tr>'+
      '        <td></td>'+
      '        <td></td>'+
      '        <td><strong>Total</strong></td>'+
      '        <td><strong>&euro; '+(parseFloat(order.totalorder) + parseFloat(order.totalservice)).toFixed(2)+'</strong></td>'+
      '      </tr>';      

    template += ''+
    '    </tbody>'+
    '  </table>';

    template += ''+
    '  <hr />'+     
    '  <div class="orderInfo">'+     
    '     <h3>'+printmessageline1+'</h3>'+
    '     <h3>'+printmessageline2+'</h3>'+
    '  </div>'+ 
    '</div>';
    return template;
  }

}
