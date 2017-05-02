import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, ModalController, AlertController } from 'ionic-angular';

import { Prodotti }     from '../prodotti/prodotti';
import { HttpService }  from '../../providers/http-service';

import { CategoriaModal } from './categoria-modal';

@Component({
  selector: 'page-categorie',
  templateUrl: 'categorie.html'
})
export class Categorie {

  categories: any;
  nothing: string;
  loading: any;
  errorMessage: string;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController,
    public alertCtrl: AlertController
  ) {}

  ionViewDidLoad() {
    this.loadData('');
  }

  loadData(loading) {
    console.log('Hello Categorie Page');

    if(loading == 'noLoading') {} else {
      this.loading = this.loadingCtrl.create({
        spinner: 'crescent',
        //content: 'Please wait...'
      });
      this.loading.present();
    }

    this.httpService
      .getCallHttp('getProductsCategory','','','','')
      .then(res => {
        console.log('res: '+JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.categories = res[0].output;
        } else {
          this.nothing = 'Nessun dato! Riprovare più tardi.';
        }

        if(loading == 'noLoading') {} else {
          this.loading.dismiss();
        }
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        if(loading == 'noLoading') {} else {
          this.loading.dismiss();
        }
      });
  }

  getProductsByCat(name,count) {
    console.log(name+' | '+count);
    if(count > 0) {
      this.navCtrl.push(Prodotti, {
        categoriaNome: name
      });
    }
  }

  modalCategory() {
    let modal = this.modalCtrl.create(CategoriaModal);
    modal.present();
    modal.onDidDismiss(data => {
      console.log('-> '+data.action);
      if(data.action == 'refresh') {
        console.log('Ricarico la lista delle categorie');
        this.loadData('');
      } else {
        console.log('Chiudi finestra categoria');
      }
    });
  }

  deleteCategory(id,count) {
    console.log(id,count);

    if(count == 0) {
      let confirm = this.alertCtrl.create({
        title: 'Cancellazione!',
        message: 'Sei sicuro di voler cancellare la categoria selezionato ?',
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

              this.loading = this.loadingCtrl.create({
                spinner: 'crescent',
                //content: 'Please wait...'
              });
              this.loading.present();

              this.httpService
                .getCallHttp('getProductsCategoryDelete', '', '', id, '')
                .then(res => {
                  console.log('res: ' + JSON.stringify(res));

                  if (res[0].response[0].result == 'OK') {
                    this.loadData('noLoading');
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
        ]
      });
      confirm.present();
    } else {
      let alert = this.alertCtrl.create({
        title: 'Attenzione!',
        subTitle: 'La categoria non può essere cancellata perchè ci sono dei prodotti associati!',
        buttons: ['OK']
      });
      alert.present();
    }

  }

}
