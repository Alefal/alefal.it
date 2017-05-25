import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';

import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { Order } from '../_models/order';
import { Product } from '../_models/product';
import { Ship } from '../_models/ship';
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
  ships: Ship[] = new Array<Ship>();

  notaId: number = 1;
  shipId: number = 1;

  notaOrdine: string = '';

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
  //Nota generica
  notaGenerica: string = '';


  constructor(
    private httpService: HttpService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    private loadingBarService: LoadingBarService
  ) { }

  ngOnInit() {
    //Order edit: go from ordinePage
    this.route.params
      .subscribe(params => {
        if(params['order']) {
          this.ordine = JSON.parse(params['order']);
          console.log('%o',this.ordine);

          this.ordineEdit = true;
          this.ordineId = this.ordine.id;
          this.notaOrdine = this.ordine.note;
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

        if (res[0].response[0].result == 'OK') {
          this.categories = res[0].output;

          this.loadData(res[0].output[0].name);
        } else {
          this.alertService.error('Nessun dato! Riprovare più tardi.');
        }
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

            if (res[0].response[0].result == 'OK') {
              this.productsMenu = res[0].output;
              localStorage.setItem(categoriaNome, JSON.stringify(this.productsMenu));
            } else {
              this.alertService.error('Nessun dato! Riprovare più tardi.');
            }
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

  addProducts(cat, prod) {
    //console.log('cat -> ' + JSON.stringify(cat));
    //console.log('prod -> ' + JSON.stringify(prod));

    let isExtra: boolean = false;
    let hasExtra: boolean = false;
    if (cat.slug == 'extra') {
      isExtra = true;
    }
    if (cat.slug == 'i-panini' || cat.slug == 'panini') {
      hasExtra = true;
    }
    if (prod != '') {
      let pId = 0;
      let pProdId = prod.id;
      let pTitle = prod.title;
      let pPrice = prod.price ? prod.price : 0;
      let pExistExtra = false;
      let pPriceTotal = pPrice;
      let pDescr = prod.description;

      let product = new Product(pId, pProdId, pTitle, pPrice, pExistExtra, isExtra, hasExtra, pPriceTotal, pDescr, 1, '');

      this.products.push(product);
      this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

      console.log('%o', 'this.products -> ' + JSON.stringify(this.products));
    }
  }
  removeProduct(prod) {
    let cont: number = 0;
    for (let prodEl of this.products) {
      console.log('Title: ' + prodEl['title'] + ' | ' + prod.title);
      if (prodEl['title'] == prod.title && prodEl['quantity'] == prod.quantity && prodEl['meta'] == prod.meta) {
        console.log('Elimino: ' + prod.title);
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

    this.modalTitle = prod.title;
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
  openModalAddShip() {
    this.modalTitle = 'Speciale';
    this.modalSection = 'addSpecial';
    this.nomeSpeciale = '';
    this.prezzoSpeciale = '';
    jQuery('#genericAddModal').modal();
  }
  addShip() {
    console.log('Piatto speciale: ' + this.nomeSpeciale + ' | ' + this.prezzoSpeciale);
    let prezzoPiatto: any = this.prezzoSpeciale ? this.prezzoSpeciale : 0;
    let ship = new Ship(this.shipId, 'flat_rate', this.nomeSpeciale, prezzoPiatto);
    this.ships.push(ship);

    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + parseFloat(prezzoPiatto);

    this.shipId = this.shipId + 1;
    console.log('this.shipId: ' + this.shipId);
    jQuery('#genericAddModal').modal('hide');
  }
  removeShip(shipId, shipTotal) {
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
  //SPECIAL
  openModalAddNote() {
    this.modalTitle = 'Nota Generica';
    this.modalSection = 'addGenericNote';
    this.notaGenerica = '';
    jQuery('#genericAddModal').modal();
  }
  addNote() {
    console.log('Nota: ' + this.notaGenerica);
    let nota = new Note(this.notaId, this.notaGenerica, true);
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

  saveOrder() {
    console.log('PRODUCTS: ' + JSON.stringify(this.products));
    console.log(this.numTavolo + '|' + this.totCoperti + '|' + this.numCoperti + '|' + this.totaleOrdine);
    console.log('SHIPS: ' + JSON.stringify(this.ships));
    console.log('NOTES: ' + JSON.stringify(this.notes));

    //Controllo sui campi solo in fase di ADD
    if (!this.ordineEdit) {
      if (this.numTavolo == '' || this.numCoperti == 0 || this.totaleOrdine == 0) {
        this.alertService.error('Completa la tua ordinazione! Il numero del tavolo, i coperti e i piatti sono necessari per l\'ordinazione!');
        return false;
      }
    } else {
      //In EDIT controllo solo totale per evitare di modificare un ordine cancellando TUTTI i prodotti
      if (this.totaleOrdine == 0) {
        this.alertService.error('Completa la tua ordinazione! I piatti sono necessari per l\'ordinazione!');
        return false;
      }
    }

    if (!this.ordineEdit) {
      this.notaOrdine = 'Tavolo ' + this.numTavolo + ', numero di coperti ' + this.numCoperti;
    }

    let ordine = new Order(
      this.ordineId,          //this.id
      this.ordineId,          //this.order_number
      '',                     //this.created_at
      '',                     //this.updated_at
      '',                     //this.completed_at
      'pending',              //this.status -> deve essere 'pending' altrimenti non viene calcolato il totale,
      this.totaleOrdine,      //this.total
      0,                      //this.subtotal
      this.products.length,   //this.total_line_items_quantity
      0,                      //this.total_tax
      0,                      //this.total_shipping
      0,                      //this.cart_tax
      0,                      //this.shipping_tax
      this.notaOrdine,        //this.note
      this.products,          //this.line_items
      this.ships,             //this.shipping_lines
      0                       //this.tax_lines
    );

    console.log('ORDINE: ' + JSON.stringify(ordine));

    this.loadingBarService.start();

    this.httpService
      .getCallHttp('getOrderSave', '', '', '', ordine)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        let orderIdSave: any;
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
          this.router.navigate(['/home',{ordineId:orderIdSave}]);

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