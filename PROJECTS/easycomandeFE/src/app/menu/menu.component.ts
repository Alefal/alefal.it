import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, HttpService } from '../_services/index';

import { LoadingBar, LoadingBarService } from 'ng2-loading-bar';

import { Order }    from '../_models/order';
import { Product }  from '../_models/product';
import { Special }  from '../_models/special';
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

  hostImage: string = '';

  constructor(
    private httpService: HttpService, 
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    private loadingBarService: LoadingBarService
  ) { }

  ngOnInit() {
    this.hostImage = localStorage.getItem('hostImage');
    //Dati NON presenti in memoria: li recupero dal server
    console.log('localStorage -> '+localStorage.getItem('categories').length);
    if(localStorage.getItem('categories') === null || localStorage.getItem('categories').length == 2) {

      if (localStorage.getItem('categories') === null) {
        this.loadCategories();
      } else {
        this.categories = JSON.parse(localStorage.getItem('categories'));
      }

    } else {
      this.categories = JSON.parse(localStorage.getItem('categories'));
      console.log('res -> '+this.categories[0].name);
      this.categoryName = this.categories[0].name;

      this.products = JSON.parse(localStorage.getItem(this.categories[0].name));
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

    if(localStorage.getItem(this.categoryName) === null) {
      if(categoriaNome && categoriaNome != ''){
        this.httpService
          .getCallHttp('getProductsByCategory', '', '', '', categoriaNome)
          .subscribe(res => {
            //console.log('res: '+JSON.stringify(res));

            //if (res[0].response[0].result == 'OK') {
              this.products = res.results;
              localStorage.setItem(categoriaNome, JSON.stringify(this.products));
            //} else {
            //  this.alertService.error('Nessun dato! Riprovare più tardi.');
            //}
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
          this.categories = res.results;
          console.log('this.categories: ' + this.categories);
          localStorage.setItem('categories', JSON.stringify(this.categories));

          //Recupero i PRODOTTI di ogni CATEGORIE
          let nameFirstCat: string = '';
          this.categories.forEach((cat, index) => {
            if(index == 0) {
              nameFirstCat = cat.name;
            }
            this.httpService
              .getCallHttp('getProductsByCategory', '', '', '', cat.id)
              .subscribe(res => {
                console.log(' -> res: ' + JSON.stringify(res));
                this.products = res.results;
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

    //Recupero di tutte le configurazioni
    this.httpService
      .getCallHttp('getConfigurations', '', '', '', '')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        localStorage.removeItem('serviceenablepercent');
        localStorage.removeItem('coveredenablevalue');
        localStorage.removeItem('printtitle');
        localStorage.removeItem('printmessageline1');
        localStorage.removeItem('printmessageline2');
        localStorage.removeItem('printtablecomandefont');
        localStorage.removeItem('printtablericevutafont');

        for (let conf of res.results) {
          //console.log('%ò',conf)
          
          //Servizio 10% del total
          if(conf.key == 'serviceenable' && conf.enable == 1) {
            localStorage.setItem('serviceenablepercent',conf.value);
          } 
          //Prezzo per coperto
          else if(conf.key == 'coveredenable' && conf.enable == 1) {
            localStorage.setItem('coveredenablevalue',conf.value);
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
        this.alertService.error('CONFIGURATIONS: Dati non disponibili! Si è verificato un errore.');
      });
  }

}