import { Component, ViewChild  } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController, Content, AlertController, App } from 'ionic-angular';

import { Printer, PrintOptions } from '@ionic-native/printer';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { LoginPage }        from '../login/login';
import { AddPage }          from '../add/add';
import { OrdinePage }       from './ordini/ordine';
import { NotSavedPage }     from './notsaved/notsaved';

import { Order }            from '../../models/order';

//import { LoginPage }        from '../login/login';
//import { AddPage }          from '../add/add'

@Component({
  selector: 'page-comande',
  templateUrl: 'comande.html',
})
export class ComandePage {

  orders: any;
  ordersAll: any;

  orderIdSaved: any;

  ordine: Order;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  //If SAVE not work: saved order
  ordersTemp: Order[] = new Array<Order>();
  ordersTempExist: boolean = false;

  @ViewChild(Content) content: Content;

  //private tabbarHeight: string;
  //private headerHeight: string;
  //private contentBox;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController,
    public connectivityService: ConnectivityService,
    public alertCtrl: AlertController,
    public app: App,
    private printer: Printer
  ) {}

  ionViewDidLoad() {
    console.log('ionViewDidLoad COMANDE');

    this.listOrdersNotSaved();

    if(this.connectivityService.connectivityFound) {
      this.loadData('');
    } else {
      this.connectivityService.showConnectionInfo('Nessuna connessione di rete :-( ');
    }
  }

  /*** Hide HEADER
  ionViewDidEnter() {
    this.contentBox = document.querySelector(".scroll-content")['style'];
    this.tabbarHeight = this.contentBox.marginTop;

    let headerMarginTmp: number = parseInt(this.tabbarHeight.substring(0,this.tabbarHeight.length-2)) / 2;
    this.headerHeight = headerMarginTmp+'px'; //TODO: recuperare valore cioè la metà di tabbarHeight
    console.log('tabBarHeight: '+this.tabbarHeight+' | '+this.headerHeight);
  }

  scrollingFun(e) {
    //console.log("scrollingFun: "+e.scrollTop+' | '+this.content.getContentDimensions().contentTop);
    if (e.scrollTop > 25) {
      console.log('scrollingFun - IF');
      document.querySelector('.header')['style'].display = 'none';
      document.querySelector('.tabbar')['style'].top = '0';
      this.contentBox.marginTop = this.headerHeight;
    } else {
      console.log('scrollingFun - ELSE');
      document.querySelector('.header')['style'].display = 'block';
      document.querySelector('.tabbar')['style'].top = this.headerHeight;
      this.contentBox.marginTop = this.tabbarHeight;
    }
  }
  ***/

  doRefresh(refresher) {
    this.listOrdersNotSaved();
    this.loadData('');
    refresher.complete();
  }

  loadData(orderIdSave) {
    this.listOrdersNotSaved();

    this.orderIdSaved = orderIdSave;
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrders','','',0,'')
      .subscribe(res => {
        this.orders = res.results;
        this.ordersAll = res.results;
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        let alert = this.alertCtrl.create({
          title: 'Lista Ordini',
          subTitle: 'Problemi di comunicazione con il server',
          buttons: ['OK']
        });
        alert.present();
        this.loading.dismiss();
      });
  }

  getItems(ev) {
    var val = ev.target.value;
    //this.productFilter = this.products;

    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.orders = this.orders.filter((item) => {
        //console.log(JSON.stringify(item.order_number)+' | '+val);
        
        //return (item.order_number == val);
        return item.note.toLowerCase().indexOf(val.toLowerCase()) > -1
      })
    }
  }
  onCancel(ev) {
    this.orders = this.ordersAll;
  }

  orderDetail(ordineId) {
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(OrdinePage, { ordineId: ordineId });
      modal.present();
      modal.onDidDismiss(data => {
        console.log('data.action -> '+JSON.stringify(data.action));
        if(data.action == 'reload') {
          //Ricaricare ordine
          console.log('Ricaricare ordine');
          this.loadData(data.orderIdSave);
        }
      });
    } else {
      this.connectivityService.showMessageInfo('Problemi di comunicazione con il server, verificare la connessione del device!');
    }

    /*
    this.navCtrl.push(OrdinePage, {
      ordine: ordine
    });
    */
  }

  addOrder() {
    let modal = this.modalCtrl.create(AddPage);
    modal.present();
    modal.onDidDismiss(data => {
      //this.loadData(0);
    });
  }

  logout() {
    localStorage.removeItem('currentUserEmail');        
    localStorage.removeItem('currentUserPass');        
    localStorage.removeItem('currentUserRemeberMe');        
    localStorage.removeItem('api_token');   

    //this.navCtrl.setRoot(LoginPage); //Mostra i TABS
    //window.location.reload();
    this.app.getRootNav().setRoot(LoginPage);
  }

  listOrdersNotSaved() {
    if(localStorage.getItem('listOrdersNotSaved')) {
      this.ordersTemp = JSON.parse(localStorage.getItem('listOrdersNotSaved'));
      if(this.ordersTemp.length > 0) {
        this.ordersTempExist = true;
      } else {
        this.ordersTempExist = false;
      }
    } else {
        this.ordersTempExist = false;      
    }
  }
  viewOrdersNotSaved() {
    let modal = this.modalCtrl.create(NotSavedPage);
    modal.present();
    modal.onDidDismiss(data => {
      console.log('data.action -> '+JSON.stringify(data.action));
      if(data.action == 'reload') {
        //Ricaricare ordine
        console.log('Ricaricare ordine');
        this.loadData(data.orderIdSave);
      }
    });
  }

  /*** PRINT ORDER ***/
  printOrder(orderId) {
    let options: PrintOptions = {
      /*
      name: 'MyDocument',
      printerId: 'printer007',
      duplex: true,
      landscape: true,
      grayscale: true
      */
    };

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrder','','',orderId,'')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        this.ordine = res.results[0];
        let template = this.templateOrder(this.ordine);

        this.printer.print(template, options).then(
          function(){
            console.log('isAvailable -> SUCCESS');
          }, 
          function(err) {
            console.log('isAvailable -> ERROR'+err);
          }
        );
        
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + JSON.stringify(<any>error));
        let alert = this.alertCtrl.create({
          title: 'Visualizza Ordine',
          subTitle: 'Problemi di comunicazione con il server',
          buttons: ['Ok']
        });
        alert.present();

        this.loading.dismiss();
      });

    
    
    /*
    this.printer.isAvailable().then(
      function(){
        console.log('isAvailable -> SUCCESS');
      }, 
      function(err) {
        console.log('isAvailable -> ERROR: '+err);
      }
    );
    */
  }

  templateOrder(order) {
    let printtablecomandefont = '1.8em';
    let printtablericevutafont = '1.2em';

    if(localStorage.getItem('printtablecomandefont')) {
      printtablecomandefont = localStorage.getItem('printtablecomandefont');
    }

    if(localStorage.getItem('printtablericevutafont')) {
      printtablericevutafont = localStorage.getItem('printtablericevutafont');
    }

    let template = ''+
    '<style>'+
    '//........Customized style.......'+
    '.printOrder {'+
    '  text-align:center;'+
    '  margin: 0 auto;'+
    '}'+
    '.printOrder .orderInfo {'+
    '  text-align:center;'+
    '}'+
    '.printOrder .logo {'+
    '  text-align:center;'+
    '}'+
    '.printOrder .logo img {'+
    '  margin: 0 auto;'+
    '  max-width: 50%;'+
    '}'+
    '.printOrder .deleteItem {'+
    '  /*text-decoration: line-through;*/'+
    '  display: none;'+
    '}'+
    '.printOrder .notesList {'+
    '  padding: 15px;'+
    '  font-size: 15px;'+
    '}'+
    '.printOrder .tableComande {'+
    '  font-size: '+printtablecomandefont+';'+
    '  width: 100%;'+
    '}'+
    '.printOrder .tableRicevuta {'+
    '  font-size: '+printtablericevutafont+';'+
    '  width: 100%;'+
    '}'+
    '.printOrder .isExtra {'+
    '    background: #e6e6e6;'+
    '    font-weight: bold;'+
    '}'+
    'td.dividerline {'+
    ' border-bottom:1pt solid #e6e6e6;'+
    '}'+
    '</style>'+
    '<div class="container printOrder">'+
    '  <div class="orderInfo">'+     
    '     <h5>'+order.client+'</h5>'+
    '  </div>'+       
    '  <table class="table table-hover tableComande">'+
    '    <tbody>';

    let initialItemOrder:number = 1;

    for (let item of order.items) {
      let classItem = '';
      if(item.state == 'pending') {
        classItem = '';
      } else {
        classItem = 'deleteItem';
      }

      let classItemExtra = '';
      if(item.isExtra) {
        classItemExtra += 'isExtra';
      }
      
      if(item.sort > initialItemOrder) {
        initialItemOrder = item.sort;
        template += ''+
      '      <tr>'+
      '      <td colspan="2" align="center"><em>---------- segue ----------</em-></td>'+
      '      </tr>';
      }
      
      template += ''+
      '      <tr class="'+classItem+' '+classItemExtra+'">'+
      '        <td width="25%" class="dividerline">['+item.sort+'°] '+item.quantity+'x</td>';
      if(item.note != '' && item.note != null) {
        template += '<td class="dividerline">'+item.name+'<br /><em>('+item.note+')</em></td>';
      } else {
        template += '<td class="dividerline">'+item.name+'</td>';        
      }

      template += ''+
      '      </tr>';
    }

    if(order.specials.length > 0) {
      template += ''+
        '      <tr>'+
        '      <td colspan="2" align="center"><em>----- SPECIALI -----</em-></td>'+
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
      '        <td width="25%" class="dividerline">['+special.sort+'°] 1x</td>';
      if(special.note != '' && special.note != null) {
        template += '<td class="dividerline">'+special.name+'<br /><em>('+special.note+')</em></td>';
      } else {
        template += '<td class="dividerline">'+special.name+'</td>';        
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
        '     <h5>';
      for (let note of order.notes) {
        template += ''+
        '     <em>'+note.note+'</em>; ';
      }
      template += ''+
        ' </h5></div>';
    }
    
    template += ''+
    '</div>';

    return template;
  }

}
