import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';

import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { Order }    from '../_models/order';
import { Product }  from '../_models/product';
import { Ship }     from '../_models/ship';
import { Note }     from '../_models/note';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  products: Product[] = new Array<Product>();
  categoryName: string = '';
  categories: any;

  constructor(
    private httpService: HttpService, 
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    private loadingBarService: LoadingBarService
  ) { }

  ngOnInit() {
  }

  loadData(categoriaNome) {
    this.categoryName = categoriaNome;

    if(localStorage.getItem(this.categoryName) === null) {
      if(categoriaNome && categoriaNome != ''){
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
            this.alertService.error('ERROR: '+error);
          });
      } else {
        console.log('Nessuna categoria passata');
      }
    } else {
      this.products = JSON.parse(localStorage.getItem(this.categoryName));
    }
  } 

  /**
   * Fa il refresh dei dati in memoria:
   * - getProductsCategory
   * - getProducts
   * - getProductsByCategory
   */
  dataRefresh() {
    this.loadingBarService.start();

    //Recupero tutte le CATEGORIE
    this.httpService.getCallHttp('getProductsCategory', '', '', 0, '')
      .subscribe(
        res => {
          console.log('res: ' + JSON.stringify(res));
          this.categories = res[0].output;
          console.log('this.categories: ' + this.categories);
          localStorage.setItem('categories', JSON.stringify(this.categories));

          //Recupero i PRODOTTI di ogni CATEGORIE
          let nameFirstCat: string = '';
          this.categories.forEach((cat, index) => {
            if(index == 0) {
              nameFirstCat = cat.name;
            }
            this.httpService
              .getCallHttp('getProductsByCategory', '', '', '', cat.name)
              .subscribe(res => {
                console.log(' -> res: ' + JSON.stringify(res));
                this.products = res[0].output;
                localStorage.setItem(cat.name, JSON.stringify(this.products));

                if(index == this.categories.length - 1) {
                  this.loadData(nameFirstCat);
                  this.loadingBarService.complete();
                }
              },
              error => {
                this.alertService.error('ERROR: '+error);
              });
          });
        },
        error => {
          console.log('res: ' + JSON.stringify(<any>error));
          this.alertService.error('ERROR: '+JSON.stringify(<any>error));
        }
      );
  }

}