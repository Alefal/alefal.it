import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController, ViewController, AlertController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';

import { ProdottiModal }        from './prodotti/prodotti-modal';

import { Ordine }               from '../../models/ordine';
import { Prodotto }             from '../../models/prodotto';
import { Nota }                 from '../../models/nota';

@Component({
  selector: 'page-add',
  templateUrl: 'add.html',
})
export class AddPage {

  products: Prodotto[] = new Array<Prodotto>();
  notes: Nota[] = new Array<Nota>();

  notaId: number = 1;

  numTavolo: string = '';
  numCoperti: number = 0;
  totCoperti: number = 0;
  totaleOrdine: number = 0;

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
    this.categoryName = params.get('categoriaNome');

    this.loadCategories();
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
      .then(res => {
        if (res[0].response[0].result == 'OK') {
          this.categories = res[0].output;
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      })
      .catch(error => {
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
      console.log('-> '+JSON.stringify(data.action));
      if(data.action != '') {
        let pId     = data.action.id;
        let pTitle  = data.action.title;
        let pPrice  = data.action.price;
        let pDescr  = data.action.description;

        let prodotto = new Prodotto(pId,pTitle,pPrice,pDescr,1);

        this.products.push(prodotto);
        this.totaleOrdine = this.totaleOrdine + parseFloat(pPrice);

        console.log('-> '+JSON.stringify(this.products));
      }
    });
  }

  updateTotal(coperti:number) {
    console.log('coperti -> '+coperti);
    this.numCoperti = coperti;
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
  }

  removeProduct(prodId) {
    console.log(prodId);

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
          text: 'Cancella',
          handler: () => {
            console.log('Conferma');
            this.products.splice( this.products.indexOf(prodId), 1 );

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
            this.notes.splice( this.products.indexOf(notaId), 1 );

            this.notaId = this.notaId - 1;
            console.log('this.notaId: '+this.notaId);
          }
        }
      ]
    });
    confirm.present();
  }

  saveOrder() {
    console.log(JSON.stringify(this.products));
    console.log(this.numTavolo +'|'+ this.totCoperti +'|'+ this.numCoperti +'|'+ this.totaleOrdine);
    console.log(JSON.stringify(this.notes));

    let nota = 'Tavolo '+this.numTavolo+', numero di coperti '+this.numCoperti;

    let ordine = new Ordine(
      0,                                //this.id,
      0,                                //this.order_number,
      '',                               //this.created_at,
      '',                               //this.updated_at,
      '',                               //this.completed_at,
      'pending',                        //this.status,
      this.totaleOrdine,                //this.total,
      this.totCoperti,                  //this.total_tax,
      this.products.length,             //this.total_line_items_quantity,
      this.products,                    //this.line_items,
      '',                               //this.customer,
      nota,                             //this.note,
      this.totCoperti                   //shipping_lines
    );

    console.log('ORDINE: '+JSON.stringify(ordine));

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getOrderSave', '', '', '', ordine)
      .then(res => {
        console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          let orderIdSave = res[0].output[0].id;
          //this.saveNote(orderIdSave,JSON.stringify(this.notes));

          for (let note of this.notes) {
            this.saveNote(orderIdSave,note);
          }

          this.viewCtrl.dismiss({
            action: 'refresh'
          });
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }
  
  saveNote(orderIdSave,notes) {

    this.httpService
      .getCallHttp('getOrderNoteSave', '', '', orderIdSave, notes)
      .then(res => {
        //console.log('res: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          console.log('Nota creata');
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

}