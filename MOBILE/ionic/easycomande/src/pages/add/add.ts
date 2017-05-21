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

      /***
      this.totaleOrdine = this.ordine.subtotal;

      for (let prod of this.ordine.line_items) {
        let priceTotal = prod.price * prod.quantity;
        let meta = '';
        if(prod.meta.length > 0) {
          meta = prod.meta[0].value;
        }
        //let meta = prod.meta[0].value ? prod.meta[0].value : '';
        let prodotto = new Prodotto(prod.id,prod.product_id,prod.name,prod.price,priceTotal,'',prod.quantity,meta);
        this.products.push(prodotto);

      }
      ***/
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

      let isExtra: boolean = false;
      if(cat == 'Extra') {
        isExtra = true;
      } else {
        isExtra = false;
      }
      if(data.action != '') {
        let pId             = 0;
        let pProdId         = data.action.id;
        let pTitle          = data.action.title;
        let pPrice          = data.action.price ? data.action.price : 0;
        let pExistExtra     = false;        
        let pPriceTotal     = pPrice;
        let pDescr          = data.action.description;

        let prodotto = new Prodotto(pId,pProdId,pTitle,pPrice,pExistExtra,isExtra,pPriceTotal,pDescr,1,'');

        this.products.push(prodotto);
        this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

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

  addExtra(prod:any) {

    let alert = this.alertCtrl.create();
    alert.setTitle('Extra');
    alert.setMessage('Aggiungi una extra al piatto');

    let extras: any = JSON.parse(localStorage.getItem('Extra'));
    console.log('%ò',extras);

    for (let extra of extras) {
      alert.addInput({
          type: 'radio',
          label: extra.title+' ('+extra.price+')',
          value: extra.title+'|'+extra.price
        });
    }

    alert.addButton('Annulla');
    alert.addButton({
      text: 'Aggiungi',
      handler: data => {
        console.log(data);
        let splitted = data.split('|'); 
        let title = splitted[0];
        let price = splitted[1];

        let pId             = 0;
        let pProdId         = 0;
        let pTitle          = title;
        let pPrice          = price ? price : 0;
        let pExistExtra     = true;        
        let pIsExtra        = true;
        let pPriceTotal     = pPrice;
        let pDescr          = '';

        let prodotto = new Prodotto(pId,pProdId,pTitle,pPrice,pExistExtra,pIsExtra,pPriceTotal,pDescr,1,'');

        this.products.push(prodotto);
        this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(pPrice);

        prod.setExtra(title);
        /*
        prod.setPriceExtra(price);

        let newPrice:any      = Number.parseFloat(prod.price) + Number.parseFloat(prod.priceExtra);
        let newPriceTotal:any = (Number.parseFloat(prod.price) + Number.parseFloat(prod.priceExtra)) * Number.parseFloat(prod.quantity);

        //prod.setSubtotal(newPriceTotal);
        prod.setPriceTotal(newPriceTotal);
        this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(prod.priceExtra);
        */
      }
    });

    alert.present();
    
  }

  removeMetaProduct(prod:any) {
    console.log('%ò',prod);

    /*
    let newPrice:any      = Number.parseFloat(prod.price) - Number.parseFloat(prod.priceExtra);
    let newPriceTotal:any = Number.parseFloat(prod.price) * Number.parseFloat(prod.quantity);

    prod.setPrice(newPrice);
    prod.setPriceTotal(newPriceTotal);
    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.priceExtra);
    */

    prod.removeMeta('');
    prod.setPriceExtra(0);
  }

  addQuantity(prod:any) {
    console.log('%ò',prod);
    let newQuantity = prod.quantity + 1;
    let newPrice:number = prod.price * newQuantity;
    console.log('newPrice -> ',newPrice);

    prod.setQuantity(newQuantity);
    prod.setPriceTotal(newPrice);
    this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + Number.parseFloat(prod.price);
  }
  removeQuantity(prod:any) {
    console.log('%ò',prod);
    let newQuantity = prod.quantity - 1;
    let newPrice = prod.price * newQuantity;

    prod.setPriceTotal(newPrice);

    if(newQuantity > 0) {
      prod.setQuantity(newQuantity);
      this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
    } else {
      this.totaleOrdine = 0;
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
              console.log('Title: '+prodEl['title']+' | '+prod.title);
              if(prodEl['title'] == prod.title && prodEl['quantity'] == prod.quantity && prodEl['meta'] == prod.meta) {
                console.log('Elimino: '+prod.title);
                this.products.splice(cont,1);
                break;
              }
              cont++;
            }

            //this.products.splice( this.products.indexOf(prodTitle), 1 );

            //Ricalcolo totale
            console.log('Ricalcolo: '+this.totaleOrdine+' - '+prod.price);
            this.totaleOrdine = Number.parseFloat(this.totaleOrdine) - Number.parseFloat(prod.price);
            /*
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
            console.log('Piatto speciale: '+JSON.stringify(data));
            let prezzoPiatto: any = data.prezzoPiatto ? data.prezzoPiatto : 0;
            let ship = new Ship(this.shipId,'flat_rate',data.nomePiatto,prezzoPiatto);
            this.ships.push(ship);

            this.totaleOrdine = Number.parseFloat(this.totaleOrdine) + parseFloat(prezzoPiatto);

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
          if(res[0].output[0]) {
            let orderIdSave = res[0].output[0].id;
            //this.saveNote(orderIdSave,JSON.stringify(this.notes));

            for (let note of this.notes) {
              this.saveNote(orderIdSave,note);
            }
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
      action: '' //closeAdd: per chiudere una sola modal ma non viene fatto il refresh degli ordini
    });
  }

}