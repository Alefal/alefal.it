import { Component, OnInit, ViewChild } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { ModalDirective } from 'ngx-bootstrap/modal';

import { AlertService, HttpService } from '../_services/index';

import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { Order } from '../_models/order';
import { Product } from '../_models/product';
import { Ship } from '../_models/ship';
import { Note } from '../_models/note';

declare var jQuery:any;

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

  products: Product[] = new Array<Product>();
  productsInCart: Product[] = new Array<Product>();

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

  closeResult: string;

  @ViewChild('bsModal') public bsModal: ModalDirective;
    isShowModal: boolean = true;
    model: any = { test: 'hey modal...' };

    show(){ this.bsModal.show }
    hide(){ this.bsModal.hide(); }
    onHidden(){ this.isShowModal = false; }


  constructor(
    private httpService: HttpService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    private loadingBarService: LoadingBarService
  ) { }

  ngOnInit() {
    if (localStorage.getItem('categories') === null) {
      this.loadCategories();
    } else {
      this.categories = JSON.parse(localStorage.getItem('categories'));
    }
  }

  loadCategories() {
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
              this.products = res[0].output;
              localStorage.setItem(categoriaNome, JSON.stringify(this.products));
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
      this.products = JSON.parse(localStorage.getItem(this.categoryName));
    }
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

      this.productsInCart.push(product);
      this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

      console.log('%o', 'this.products -> ' + JSON.stringify(this.products));
    }
  }
  removeProduct(prod) {
    let cont: number = 0;
    for (let prodEl of this.productsInCart) {
      console.log('Title: ' + prodEl['title'] + ' | ' + prod.title);
      if (prodEl['title'] == prod.title && prodEl['quantity'] == prod.quantity && prodEl['meta'] == prod.meta) {
        console.log('Elimino: ' + prod.title);
        this.productsInCart.splice(cont, 1);
        break;
      }
      cont++;
    }

    //Ricalcolo totale
    console.log('Ricalcolo: ' + this.totaleOrdine + ' - ' + prod.price);
    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
  }

  addMetaProduct(prod:Product) {
    console.log('%ò',prod);
      
  }

}