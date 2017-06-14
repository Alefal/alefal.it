import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';

import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { Order } from '../_models/order';
import { Product } from '../_models/product';
import { Special } from '../_models/special';
import { Note } from '../_models/note';

declare var jQuery: any;

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.css']
})
export class AddComponent implements OnInit {

  placements: string[] = ['top']; //not work
  title: string = 'Sei sicuro?';
  message: string = 'Sei sicuro di voler eliminare il piatto selezionato ?';
  confirmText: string = 'SI <i class="glyphicon glyphicon-ok"></i>';
  cancelText: string = 'NO <i class="glyphicon glyphicon-remove"></i>';
  confirmClicked: boolean = false;
  cancelClicked: boolean = false;

  ordine: Order;
  ordineId: number = 0;
  ordineEdit: boolean = false;

  productsMenu: Product[] = new Array<Product>();
  products: Product[] = new Array<Product>();

  notes: Note[] = new Array<Note>();
  ships: Special[] = new Array<Special>();

  notaId: number = 1;
  shipId: number = 1;

  clienteOrdine: string = '';

  numTavolo: string = '';
  numCoperti: number = 0;
  totCoperti: number = 0;
  totaleOrdine: any = 0;

  categories: any;
  categoryName: string = '';

  //Modal
  modalTitle: string = '';
  modalSection: string = '';
  //Nota al piatto
  notaAlPiatto: string = '';
  nomeSpeciale: string = '';
  prodTmp: Product;
  //Speciale
  prezzoSpeciale: string = '';
  notaSpeciale: string = '';
  //Nota generica
  notaGenerica: string = '';
  //Extra
  extra: any;
  extras: any;

  constructor(
    private httpService: HttpService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    private loadingBarService: LoadingBarService
  ) {}

  ngOnInit() {
    //Order edit: go from ordinePage
    this.route.params
      .subscribe(params => {
        if (params['order']) {
          this.ordine = JSON.parse(params['order']);
          console.log('%o', this.ordine);

          this.ordineEdit = true;
          this.ordineId = this.ordine.id;
          //this.notes = this.ordine.notes;
        }
      });

    if (localStorage.getItem('categories') === null) {
      this.loadCategories();
    } else {
      this.categories = JSON.parse(localStorage.getItem('categories'));
    }
  }

  loadCategories() {
    this.loadingBarService.start();
    this.httpService
      .getCallHttp('getProductsCategory', '', '', '', '')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        this.categories = res.results;
        this.loadData(this.categories[0].id);

        //this.alertService.error('Nessun dato! Riprovare più tardi.');
        this.loadingBarService.complete();
      },
      error => {
        this.alertService.error('ORDINI: Dati non disponibili! Si è verificato un errore.');
        this.loadingBarService.complete();
      });
  }

  loadData(categoriaNome) {
    this.categoryName = categoriaNome;

    if (localStorage.getItem(this.categoryName) === null) {
      if (categoriaNome && categoriaNome != '') {
        this.httpService
          .getCallHttp('getProductsByCategory', '', '', '', categoriaNome)
          .subscribe(res => {
            //console.log('res: '+JSON.stringify(res));

            //if (res[0].response[0].result == 'OK') {
              this.productsMenu = res.results;
              localStorage.setItem(categoriaNome, JSON.stringify(this.productsMenu));
            //} else {
            //  this.alertService.error('Nessun dato! Riprovare più tardi.');
            //}
          },
          error => {
            console.log('ERROR: ' + error);
            this.alertService.error('ERROR: ' + error);
          });
      } else {
        console.log('Nessuna categoria passata');
      }
    } else {
      this.productsMenu = JSON.parse(localStorage.getItem(this.categoryName));
    }
  }

  updateTotal(coperti: number) {
    //console.log('coperti -> '+coperti);
    this.numCoperti = coperti;
  }

  //PRODUCT
  addQuantity(prod: any) {
    console.log('%ò', prod);
    let newQuantity = prod.quantity + 1;
    let newPrice: number = prod.price * newQuantity;
    console.log('newPrice -> ', newPrice);

    prod.setQuantity(newQuantity);
    prod.setPriceTotal(newPrice);
    prod.setPriceServiceTotal(newPrice * 10 / 100);

    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(prod.price);
  }
  removeQuantity(prod: any) {
    console.log('%ò', prod);
    let newQuantity = prod.quantity - 1;
    let newPrice = prod.price * newQuantity;

    prod.setPriceTotal(newPrice);
    prod.setPriceServiceTotal(newPrice * 10 / 100);

    if (newQuantity > 0) {
      this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
      prod.setQuantity(newQuantity);
    } else {
      this.removeProduct(prod);
    }
  }
  addProducts(cat, prod) {
    console.log('cat -> ' + JSON.stringify(cat));
    console.log('prod -> ' + JSON.stringify(prod));
        
    let isExtra: boolean = false;
    let hasExtra: boolean = false;
    if (cat.slug == 'extra') {
      isExtra = true;
    }
    if (cat.slug == 'i-panini' || cat.slug == 'panini') {
      hasExtra = true;
    }
    if (prod != '') {
      let pId         = 0;
      let pProdId     = prod.id;
      let pTitle      = prod.name;
      let pPrice      = prod.price ? prod.price : 0;
      let pExistExtra = false;
      let pPriceTotal = pPrice;

      let pPriceService = Number.parseFloat(pPriceTotal) * 10 / 100;

      let product = new Product(
        pId,
        pProdId,          //menu_id
        1,
        pPriceTotal,
        pPriceService,
        '',
        pTitle,
        'pending',
        pPrice,
        pExistExtra,
        isExtra,
        hasExtra,
        0,                //order_id
        1                 //state_id -> pending
      );

      this.products.push(product);
      this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

      console.log('%o', 'this.products -> ' + JSON.stringify(this.products));
    }
  }
  removeProduct(prod) {
    let cont: number = 0;
    for (let prodEl of this.products) {
      console.log('Title: ' + prodEl['menuname'] + ' | ' + prod.menuname);
      if (prodEl['menuname'] == prod.menuname && prodEl['quantity'] == prod.quantity && prodEl['note'] == prod.note) {
        console.log('Elimino: ' + prod.menuname);
        this.products.splice(cont, 1);
        break;
      }
      cont++;
    }

    //Ricalcolo totale
    console.log('Ricalcolo: ' + this.totaleOrdine + ' - ' + prod.price);
    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
  }

  //META PRODUCT
  openModalAddMetaProduct(prod: Product) {
    console.log('%ò', prod);
    this.prodTmp = prod;

    this.modalTitle = prod.menuname;
    this.modalSection = 'notaPiatto';
    this.notaAlPiatto = '';
    jQuery('#genericAddModal').modal();
  }
  addMetaProduct() {
    console.log('%ò', this.prodTmp);
    this.prodTmp.setMeta(this.notaAlPiatto);

    console.log('%ò', this.prodTmp);
    jQuery('#genericAddModal').modal('hide');
  }
  removeMetaProduct(prod: any) {
    console.log('%ò', prod);
    prod.removeMeta('');
    prod.setExistExtra(false);
  }

  //SPECIAL
  openModalAddSpecial() {
    this.modalTitle = 'Speciale';
    this.modalSection = 'addSpecial';
    this.nomeSpeciale = '';
    this.prezzoSpeciale = '';
    this.notaSpeciale = '';
    jQuery('#genericAddModal').modal();
  }
  addSpecial() {
    console.log('Piatto speciale: ' + this.nomeSpeciale + ' | ' + this.prezzoSpeciale);
    let prezzoPiatto: any = this.prezzoSpeciale ? this.prezzoSpeciale : 0;
    let ship = new Special(this.shipId, this.nomeSpeciale, prezzoPiatto,this.notaSpeciale);
    this.ships.push(ship);

    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + parseFloat(prezzoPiatto);

    this.shipId = this.shipId + 1;
    console.log('this.shipId: ' + this.shipId);
    jQuery('#genericAddModal').modal('hide');
  }
  removeSpecial(shipId, shipTotal) {
    let cont: number = 0;
    for (let ship of this.ships) {
      console.log('Title: ' + ship['id'] + ' | ' + shipId);
      if (ship['id'] == shipId) {
        console.log('Elimino: ' + cont);
        this.ships.splice(cont, 1);
        break;
      }
      cont++;
    }
    this.totaleOrdine -= parseFloat(shipTotal);
    this.shipId = this.shipId - 1;
    console.log('this.shipId: ' + this.shipId);
  }

  //NOTE
  openModalAddNote() {
    this.modalTitle = 'Nota Generica';
    this.modalSection = 'addGenericNote';
    this.notaGenerica = '';
    jQuery('#genericAddModal').modal();
  }
  addNote() {
    console.log('Nota: ' + this.notaGenerica);
    let nota = new Note(this.notaId, this.notaGenerica);
    this.notes.push(nota);

    this.notaId = this.notaId + 1;
    console.log('this.notaId: ' + this.notaId);
    jQuery('#genericAddModal').modal('hide');
  }
  removeNote(notaId) {
    console.log('Conferma');

    let cont: number = 0;
    for (let note of this.notes) {
      console.log('Title: ' + note['id'] + ' | ' + notaId);
      if (note['id'] == notaId) {
        console.log('Elimino: ' + cont);
        this.notes.splice(cont, 1);
        return;
      }
      cont++;
    }

    //this.notes.splice( this.notes.indexOf(notaId), 1 );

    this.notaId = this.notaId - 1;
    console.log('this.notaId: ' + this.notaId);
  }

  //ADD EXTRA
  openModalAddExtra(prod: Product) {
    console.log('%ò', prod);
    this.prodTmp = prod;

    this.modalTitle = 'Extra';
    this.modalSection = 'addProductExtra';

    this.extras = JSON.parse(localStorage.getItem('Extra'));
    console.log('%ò', this.extras);

    jQuery('#genericAddModal').modal();
  }
  setExtra(extra: any) {
    this.extra = extra;
    console.log('EXTRA -> '+this.extra);
  }
  addExtra() {
    console.log('%ò',this.extra);
    this.prodTmp.setExistExtra(true);

    let splitted = this.extra.split('|');
    let eId = splitted[0];
    let eTitle = splitted[1];
    let ePrice = splitted[2];

    let pId = 0;
    let pProdId = eId;
    let pTitle = eTitle;
    let pPrice = ePrice ? ePrice : 0;
    let pExistExtra = false;
    let pIsExtra = true;
    let pHasExtra = false;
    let pPriceTotal = pPrice;

    let pPriceService = Number.parseFloat(pPriceTotal) * 10 / 100;

    let pDescr = '';

    let prodotto = new Product(
        pId,
        pProdId,
        1,
        pPriceTotal,
        pPriceService,
        '',
        pTitle,
        'pending',
        pPrice,
        pExistExtra,
        pIsExtra,
        pHasExtra,
        0,
        1
      );

    this.products.push(prodotto);
    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

    this.prodTmp.setExtra(eTitle);

    jQuery('#genericAddModal').modal('hide');
  }

  //SAVE ORDER
  saveOrder() {
    console.log(this.numTavolo + '|' + this.totCoperti + '|' + this.numCoperti + '|' + this.totaleOrdine);
    console.log('PRODUCTS: ' + JSON.stringify(this.products));
    console.log('SHIPS: ' + JSON.stringify(this.ships) + ' - '+this.ships.length);
    console.log('NOTES: ' + JSON.stringify(this.notes) + ' - '+this.notes.length); 

    //Controllo sui campi solo in fase di ADD
    if (!this.ordineEdit) {
      if (this.numTavolo == '' || this.numCoperti == 0 || this.totaleOrdine == 0) {
        this.alertService.error('Completa la tua ordinazione! Il numero del tavolo, i coperti e i piatti sono necessari per l\'ordinazione!');
        return false;
      }
    } else {
      //In EDIT controllo il totale, gli speciali e le note
      if (this.totaleOrdine == 0 && this.ships.length == 0 && this.notes.length == 0) {
        this.alertService.error('Completa la tua ordinazione! I piatti sono necessari per l\'ordinazione!');
        return false;
      }
    }

    if (!this.ordineEdit) {
      this.clienteOrdine = 'Tavolo ' + this.numTavolo + ', numero di coperti ' + this.numCoperti;
    }

    let today: string = Date.now().toLocaleString();

    let reTime = /(\d+\-\d+\-\d+)\D\:(\d+\:\d+\:\d+).+/;
    let originalTime = Date();
    let newTime = originalTime.replace(reTime, '$1 $2');
    console.log('newTime:', newTime);

    let date            = new Date(); // had to remove the colon (:) after the T in order to make it work
    let day             = date.getDate();
    let monthIndex      = date.getMonth()+1;
    let year            = date.getFullYear();
    let minutes         = date.getMinutes();
    let hours           = date.getHours();
    let seconds         = date.getSeconds();
    let todayFormatted  = year+'-'+monthIndex+'-'+day+' '+ hours+':'+minutes+':'+seconds;

    console.log('todayFormatted:', todayFormatted);


    console.log('-> '+today);

    let ordine = new Order(
      this.ordineId,        //id: number,
      todayFormatted,       //date: string,
      this.clienteOrdine,   //client: string,
      0,                    //totalorder: number,
      0,                    //totalservice: number,
      'pending',            //state: string,
      this.products,        //items: any,
      this.ships,           //specials: any,
      this.notes,           //notes: string
    );

    console.log('ORDINE: ' + JSON.stringify(ordine));

    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderSave', '', '', '', ordine)
      .subscribe(res => {
        //console.log('res: ' + JSON.stringify(res));
        console.log('ordineId: ' + res.results[0].message);

        let orderIdSave: any;
        if (res.results[0].operation == 'success') {
          orderIdSave = res.results[0].message;
          this.router.navigate(['/home', { ordineId: orderIdSave }]);
        } else {
          this.alertService.error('Attenzione: L\'ordinazione non è stata salvata! Prova ad aggiornare i menu e rifai l\'ordinazione');
          return false;
        }
        /*
        if (res[0].response[0].result == 'OK') {
          if (res[0].output[0]) {
            orderIdSave = res[0].output[0].id;
            //this.saveNote(orderIdSave,JSON.stringify(this.notes));

            for (let note of this.notes) {
              this.saveNote(orderIdSave, note);
            }
          } else {
            this.alertService.error('Attenzione: L\'ordinazione non è stata salvata! Prova ad aggiornare i menu e rifai l\'ordinazione');
            return false;
          }
          this.router.navigate(['/home', { ordineId: orderIdSave }]);

        } else {
          this.alertService.error('Nessun dato! Riprovare più tardi.');
        }
        */
        this.loadingBarService.complete();
      },
      error => {
        this.alertService.error('ERROR: ' + error);
        this.loadingBarService.complete();
      });
  }
  //NON USATO
  saveNote(orderIdSave, notes) {
    this.httpService
      .getCallHttp('getOrderNoteSave', '', '', orderIdSave, notes)
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          console.log('Nota creata');
        } else {
          this.alertService.error('Nessun dato! Riprovare più tardi.');
        }
      },
      error => {
        this.alertService.error('NOTE: Dati non disponibili! Si è verificato un errore.');
      });
  }

}