import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController, ViewController, AlertController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

import { TabsPage }             from '../tabs/tabs';
//import { HomePage }             from '../home/home';
//import { ComandePage }          from '../comande/comande';

import { ProdottiModal }        from './prodotti/prodotti-modal';

import { Ordine }               from '../../models/ordine';
import { Prodotto }             from '../../models/prodotto';
import { Nota }                 from '../../models/nota';
import { Ship }                 from '../../models/ship';

@Component({
  selector: 'page-add',
  templateUrl: 'add.html',
})
export class AddPage {

  ordine: Ordine;
  ordineId: number = 0;
  ordineEdit: boolean = false;

  products: Prodotto[] = new Array<Prodotto>();
  notes: Nota[] = new Array<Nota>();
  ships: Ship[] = new Array<Ship>();

  notaId: number = 1;
  shipId: number = 1;
  
  notaOrdine: string = '';

  numTavolo: string = '';
  numCoperti: number = 0;
  totCoperti: number = 0;
  totaleOrdine: any = 0;

  categories: any;

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  categoryName: string = '';

  constructor(
    public navCtrl: NavController,
    public params: NavParams,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController,
    public viewCtrl: ViewController,
    public alertCtrl: AlertController,
  ) { 
    console.log('constructor Add');

    //Order edit: go from ordinePage
    if(params.get('ordine')) {
      this.ordine = params.get('ordine');
      console.log('%o',this.ordine);
      //console.log(this.ordine.shipping_lines.total);

      this.ordineEdit = true;
      this.ordineId = this.ordine.id;
      this.notaOrdine = this.ordine.note;
      //this.totaleOrdine = this.ordine.total;

      /*
      for (let prod of this.ordine.line_items) {
        let prodotto = new Prodotto(prod.id,prod.product_id,prod.name,prod.price,'',1);
        this.products.push(prodotto);
      }
      console.log('%o',this.products);
      */
    }

    //Dati NON presenti in memoria: li recupero dal server
    if(localStorage.getItem('categories') === null) {
      this.loadCategories();
    } else {
      this.categories = JSON.parse(localStorage.getItem('categories'));
    }
    //this.loadCategories();
    //this.loadData(this.categoriaNome);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Add');
  }

  loadCategories() {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getProductsCategory', '', '', '', '')
      .subscribe(res => {
        if (res[0].response[0].result == 'OK') {
          this.categories = res[0].output;
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  modalProducts(cat) {
    console.log(cat);
    let modal = this.modalCtrl.create(ProdottiModal, { categoryName: cat });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('data.action -> '+JSON.stringify(data.action));
      if(data.action != '') {
        let pId     = 0;
        let pProdId = data.action.id;
        let pTitle  = data.action.title;
        let pPrice  = data.action.price;
        let pDescr  = data.action.description;

        let prodotto = new Prodotto(pId,pProdId,pTitle,pPrice,pDescr,1,'');

        this.products.push(prodotto);
        this.totaleOrdine = parseFloat(this.totaleOrdine) + parseFloat(pPrice);

        console.log('%o','this.products -> '+JSON.stringify(this.products));
      }
    });
  }

  /**
   * Non usato per il calcolo in quanto viene calcolato il 10% di servizio sul TOTALE;
   * utilizzato per aggiornare il numero di coperti
   */
  updateTotal(coperti:number) {
    console.log('coperti -> '+coperti);
    this.numCoperti = coperti;
    /*
    this.totCoperti = coperti * 1.5;
    let totOrdine: any = 0;

    for (let prod of this.products) {
      let pPrice: any    = prod['price'];
      console.log('pPrice -> '+pPrice);
      totOrdine = parseFloat(pPrice) + parseFloat(totOrdine);
      console.log('totOrdine -> '+totOrdine);
    }
    console.log('totCoperti -> '+this.totCoperti);
    this.totaleOrdine = totOrdine + this.totCoperti;
    */
  }

  addMetaProduct(prod:Prodotto) {
    console.log('%ò',prod);

    let prompt = this.alertCtrl.create({
      title: 'Nota',
      message: 'Aggiungi una nota al piatto',
      inputs: [
        {
          name: 'notaPiatto',
          placeholder: 'Nota'
        },
      ],
      buttons: [
        {
          text: 'Cancella',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Salva',
          handler: data => {
            console.log('Saved clicked: '+data.notaPiatto);
            prod.setMeta(data.notaPiatto);

            console.log('%ò',prod);
          }
        }
      ]
    });
    prompt.present();
  }

  removeMetaProduct(prod:Prodotto) {
    console.log('%ò',prod);
    prod.setMeta('');
  }

  removeProduct(prodTitle) {
    console.log(prodTitle);

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare il prodotto ?',
      buttons: [
        {
          text: 'Annulla',
          handler: () => {
            console.log('Annulla');
          }
        },
        {
          text: 'Conferma',
          handler: () => {
            console.log('Conferma');
            console.log('%o',this.products);

            let cont: number = 0;
            for (let prod of this.products) {
              console.log('Title: '+prod['title']+' | '+prodTitle);
              if(prod['title'] == prodTitle) {
                console.log('Elimino: '+cont);
                this.products.splice(cont,1);
                return;
              }
              cont++;
            }

            //this.products.splice( this.products.indexOf(prodTitle), 1 );

            //Ricalcolo totale
            let totOrdine: any = 0;
            for (let prod of this.products) {
              let pPrice: any    = prod['price'];
              console.log('pPrice -> '+pPrice);
              totOrdine = parseFloat(pPrice) + parseFloat(totOrdine);
              console.log('totOrdine -> '+totOrdine);
            }
            console.log('totCoperti -> '+this.totCoperti);
            this.totaleOrdine = totOrdine + this.totCoperti;
          }
        }
      ]
    });
    confirm.present();
  }

  addNote() {
    let prompt = this.alertCtrl.create({
      title: 'Nota',
      message: 'Aggiungi una nota all\'ordine',
      inputs: [
        {
          name: 'nota',
          placeholder: 'Nota'
        },
      ],
      buttons: [
        {
          text: 'Cancella',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Salva',
          handler: data => {
            console.log('Saved clicked: '+data.nota);
            let nota = new Nota(this.notaId,data.nota,true);
            this.notes.push(nota);

            this.notaId = this.notaId + 1;
            console.log('this.notaId: '+this.notaId);
          }
        }
      ]
    });
    prompt.present();
  }
  removeNote(notaId) {
    console.log(notaId);

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare la nota ?',
      buttons: [
        {
          text: 'Annulla',
          handler: () => {
            console.log('Annulla');
          }
        },
        {
          text: 'Cancella',
          handler: () => {
            console.log('Conferma');

            let cont: number = 0;
            for (let note of this.notes) {
              console.log('Title: '+note['id']+' | '+notaId);
              if(note['id'] == notaId) {
                console.log('Elimino: '+cont);
                this.notes.splice(cont,1);
                return;
              }
              cont++;
            }
            
            //this.notes.splice( this.notes.indexOf(notaId), 1 );

            this.notaId = this.notaId - 1;
            console.log('this.notaId: '+this.notaId);
          }
        }
      ]
    });
    confirm.present();
  }

  addShip() {
    let prompt = this.alertCtrl.create({
      title: 'Speciale',
      message: 'Aggiungi un piatto fuori menu',
      inputs: [
        {
          name: 'nomePiatto',
          placeholder: 'Piatto',
          type: 'text'
        },
        {
          name: 'prezzoPiatto',
          placeholder: 'Prezzo',
          type: 'number'
        },
      ],
      buttons: [
        {
          text: 'Cancella',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Salva',
          handler: data => {
            console.log('Saved clicked: '+data.nota);
            let ship = new Ship(this.shipId,'flat_rate',data.nomePiatto,data.prezzoPiatto);
            this.ships.push(ship);

            this.totaleOrdine += parseFloat(data.prezzoPiatto);

            this.shipId = this.shipId + 1;
            console.log('this.shipId: '+this.shipId);
          }
        }
      ]
    });
    prompt.present();
  }
  removeShip(shipId,shipTotal) {
    console.log(shipId);

    let confirm = this.alertCtrl.create({
      title: 'Cancellazione!',
      message: 'Sei sicuro di voler cancellare il piatto ?',
      buttons: [
        {
          text: 'Annulla',
          handler: () => {
            console.log('Annulla');
          }
        },
        {
          text: 'Cancella',
          handler: () => {
            console.log('Conferma');
            
            let cont: number = 0;
            for (let ship of this.ships) {
              console.log('Title: '+ship['id']+' | '+shipId);
              if(ship['id'] == shipId) {
                console.log('Elimino: '+cont);
                this.ships.splice(cont,1);
                return;
              }
              cont++;
            }
            
            this.totaleOrdine -= parseFloat(shipTotal);

            this.shipId = this.shipId - 1;
            console.log('this.shipId: '+this.shipId);
          }
        }
      ]
    });
    confirm.present();
  }

  saveOrder() {
    console.log('PRODUCTS: '+JSON.stringify(this.products));
    console.log(this.numTavolo +'|'+ this.totCoperti +'|'+ this.numCoperti +'|'+ this.totaleOrdine);
    console.log('SHIPS: '+JSON.stringify(this.ships));
    console.log('NOTES: '+JSON.stringify(this.notes));

    //Controllo sui campi solo in fase di ADD
    if(!this.ordineEdit) {
      if(this.numTavolo == '' || this.numCoperti == 0 || this.totaleOrdine == 0) {
        let alert = this.alertCtrl.create({
          title: 'Completa la tua ordinazione!',
          subTitle: 'Il numero del tavolo, i coperti e i piatti sono necessari per l\'ordinazione!',
          buttons: ['OK']
        });
        alert.present();
        return false;
      }
    } else {
      //In EDIT controllo solo totale per evitare di modificare un ordine cancellando TUTTI i prodotti
      if(this.totaleOrdine == 0) {
        let alert = this.alertCtrl.create({
          title: 'Completa la tua ordinazione!',
          subTitle: 'I piatti sono necessari per l\'ordinazione!',
          buttons: ['OK']
        });
        alert.present();
        return false;
      }
    }

    if(!this.ordineEdit) {
      this.notaOrdine = 'Tavolo '+this.numTavolo+', numero di coperti '+this.numCoperti;
    }

    let ordine = new Ordine(
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

    console.log('ORDINE: '+JSON.stringify(ordine));

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderSave', '', '', '', ordine)
      .subscribe(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          let orderIdSave = res[0].output[0].id;
          //this.saveNote(orderIdSave,JSON.stringify(this.notes));

          for (let note of this.notes) {
            this.saveNote(orderIdSave,note);
          }

          if(!this.ordineEdit) {
            this.navCtrl.setRoot(TabsPage);
          } else {
            this.dismiss();
          }
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }
  
  saveNote(orderIdSave,notes) {

    this.httpService
      .getCallHttp('getOrderNoteSave', '', '', orderIdSave, notes)
      .subscribe(res => {
        //console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          console.log('Nota creata');
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
      });
  }

  dismiss() {
    this.viewCtrl.dismiss({
      action: ''
    });
  }

}