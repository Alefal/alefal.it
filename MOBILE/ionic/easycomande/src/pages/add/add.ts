import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController, ViewController, AlertController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

import { TabsPage }             from '../tabs/tabs';
//import { HomePage }             from '../home/home';
//import { ComandePage }          from '../comande/comande';

import { ProdottiModal }      from './prodotti/prodotti-modal';

import { Order }              from '../../models/order';
import { Product }            from '../../models/product';
import { Note }               from '../../models/note';
import { Special }            from '../../models/special';

import * as moment from 'moment';

@Component({
  selector: 'page-add',
  templateUrl: 'add.html',
})
export class AddPage {

  ordine: Order;
  ordineId: number = 0;
  ordineEdit: boolean = false;

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

  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  categoryName: string = '';

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
      //this.notaOrdine = this.ordine.note;

      console.log('%o',this.products);
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
        //if (res[0].response[0].result == 'OK') {
          this.categories = res.results;
        //} else {
        //  this.nothing = 'Nessun dato! Riprovare più tardi.';
        //}
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  /**
   * Non usato per il calcolo in quanto viene calcolato il 10% di servizio sul TOTALE;
   * utilizzato per aggiornare il numero di coperti
   */
  updateTotal(coperti:number) {
    console.log('coperti -> '+coperti);
    this.numCoperti = coperti;
  }

  //PRODUCT
  modalProducts(cat) {
    console.log(cat);
    let modal = this.modalCtrl.create(ProdottiModal, { categoryName: cat.name });
    modal.present();
    modal.onDidDismiss(data => {
      console.log('data.action -> '+JSON.stringify(data.action));

      let isExtra: boolean = false;
      let hasExtra: boolean = false;
      if(cat.slug == 'extra') {
        isExtra = true;
      }
      if(cat.slug == 'i-panini' || cat.slug == 'panini') {
        hasExtra = true;
      }
      if(data.action != '') {
        let pId             = 0;
        let pProdId         = data.action.id;
        let pTitle          = data.action.name;
        let pPrice          = data.action.price ? data.action.price : 0;
        let pExistExtra     = false;        
        let pPriceTotal     = pPrice;
        
        let pPriceService = Number.parseFloat(pPriceTotal) * 10 / 100;

        let prodotto = new Product(
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

        this.products.push(prodotto);
        this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

        console.log('%o','this.products -> '+JSON.stringify(this.products));
      }
    });
  }
  addQuantity(prod:any) {
    console.log('%ò',prod);
    let newQuantity = prod.quantity + 1;
    let newPrice:number = prod.price * newQuantity;
    console.log('newPrice -> ',newPrice);

    prod.setQuantity(newQuantity);
    prod.setPriceTotal(newPrice);
    prod.setPriceServiceTotal(newPrice * 10 / 100);

    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(prod.price);
  }
  removeQuantity(prod:any) {
    console.log('%ò',prod);
    let newQuantity = prod.quantity - 1;
    let newPrice = prod.price * newQuantity;

    prod.setPriceTotal(newPrice);
    prod.setPriceServiceTotal(newPrice * 10 / 100);

    if(newQuantity > 0) {
      this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
      prod.setQuantity(newQuantity);
    } else {
      this.removeProduct(prod);
    }
  }
  removeProduct(prod) {
    console.log('%ò',prod);

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
            for (let prodEl of this.products) {
              console.log('Title: '+prodEl['menuname']+' | '+prod.menuname);
              if(prodEl['menuname'] == prod.menuname && prodEl['quantity'] == prod.quantity && prodEl['note'] == prod.note) {
                console.log('Elimino: '+prod.menuname);
                this.products.splice(cont,1);
                break;
              }
              cont++;
            }

            //Ricalcolo totale
            console.log('Ricalcolo: '+this.totaleOrdine+' - '+prod.price);
            this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
          }
        }
      ]
    });
    confirm.present();
  }

  //META PRODUCT
  addMetaProduct(prod:Product) {
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
  removeMetaProduct(prod:any) {
    console.log('%ò',prod);
    prod.removeMeta('');
    prod.setExistExtra(false);
  }

  //SPECIAL
  addSpecial() {
    let prompt = this.alertCtrl.create({
      title: 'Speciale',
      message: 'Aggiungi un piatto fuori menu',
      inputs: [
        {
          name: 'nomeSpeciale',
          placeholder: 'Piatto',
          type: 'text'
        },
        {
          name: 'prezzoSpeciale',
          placeholder: 'Prezzo',
          type: 'number'
        },
        {
          name: 'notaSpeciale',
          placeholder: 'Nota',
          type: 'text'
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
            console.log('Piatto speciale: '+JSON.stringify(data));
            let prezzoSpeciale: any = data.prezzoSpeciale ? data.prezzoSpeciale : 0;
            let ship = new Special(this.shipId, data.nomeSpeciale, prezzoSpeciale,data.notaSpeciale,1,'pending');
            this.ships.push(ship);

            this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + parseFloat(prezzoSpeciale);

            this.shipId = this.shipId + 1;
            console.log('this.shipId: '+this.shipId);
          }
        }
      ]
    });
    prompt.present();
  }
  removeSpecial(shipId,shipTotal) {
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
                break;
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

  //NOTE
  addNote() {
    let prompt = this.alertCtrl.create({
      title: 'Nota',
      message: 'Aggiungi una nota all\'ordine',
      inputs: [
        {
          name: 'note',
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
            console.log('Saved clicked: '+data.note);
            let nota = new Note(this.notaId,data.note);
            this.notes.push(nota);

            this.notaId = this.notaId + 1;
            console.log('this.notaId: '+this.notaId);
          }
        }
      ]
    });
    prompt.present();
  }
  //NON USATO
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

  //ADD EXTRA
  addExtra(prod:Product) {
    let alert = this.alertCtrl.create();
    alert.setTitle('Extra');
    alert.setMessage('Aggiungi una extra al piatto');

    let extras: any = JSON.parse(localStorage.getItem('Extra'));
    console.log('%ò',extras);

    for (let extra of extras) {
      alert.addInput({
          type: 'radio',
          label: extra.name,
          value: extra.id+'|'+extra.name+'|'+extra.price
        });
    }

    alert.addButton('Annulla');
    alert.addButton({
      text: 'Aggiungi',
      handler: data => {
        console.log(data);
        prod.setExistExtra(true);

        let splitted = data.split('|'); 
        let eId     = splitted[0];
        let eTitle  = splitted[1];
        let ePrice  = splitted[2];

        let pId             = 0;
        let pProdId         = eId;
        let pTitle          = eTitle;
        let pPrice          = ePrice ? ePrice : 0;
        let pExistExtra     = false;        
        let pIsExtra        = true;
        let pHasExtra       = false;
        let pPriceTotal     = pPrice;

        let pPriceService = Number.parseFloat(pPriceTotal) * 10 / 100;

        let pDescr          = '';

        //let prodotto = new Prodotto(pId,pProdId,pTitle,pPrice,pExistExtra,pIsExtra,pHasExtra,pPriceTotal,pDescr,1,'');

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

        prod.setExtra(eTitle);
      }
    });

    alert.present();
    
  }

  //SAVE ORDER
  saveOrder() {
    console.log(this.numTavolo +'|'+ this.totCoperti +'|'+ this.numCoperti +'|'+ this.totaleOrdine);
    console.log('PRODUCTS: '+JSON.stringify(this.products));
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
      this.clienteOrdine = 'Tavolo '+this.numTavolo+', numero di coperti '+this.numCoperti;
    }

    let now = moment().format('YYYY-MM-DD HH:MM');
    console.log('now: ' + now);

    let ordine = new Order(
      this.ordineId,        //id: number,
      now,                  //date: string,
      this.clienteOrdine,   //client: string,
      0,                    //totalorder: number,
      0,                    //totalservice: number,
      'pending',            //state: string,
      this.products,        //items: any,
      this.ships,           //specials: any,
      this.notes,           //notes: string
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

        let orderIdSave: any;
        //if (res[0].response[0].result == 'OK') {
          if (res.results[0].operation == 'success') {
            orderIdSave = res.results[0].message;
          } else {
            let alert = this.alertCtrl.create({
              title: 'Attenzione',
              subTitle: 'L\'ordinazione non è stata salvata! Prova ad aggiornare i menu e rifai l\'ordinazione',
              buttons: ['OK']
            });
            alert.present();
            this.loading.dismiss();
            return false;
          }

          if(!this.ordineEdit) {
            this.navCtrl.setRoot(TabsPage);
          } else {
            this.dismiss(orderIdSave);
          }
        //} else {
        //  this.nothing = 'Nessun dato! Riprovare più tardi.';
        //}
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }
  
  dismiss(orderIdSave) {
    this.viewCtrl.dismiss({
      action: '', //closeAdd: per chiudere una sola modal ma non viene fatto il refresh degli ordini
      orderIdSave: orderIdSave
    });
  }

}