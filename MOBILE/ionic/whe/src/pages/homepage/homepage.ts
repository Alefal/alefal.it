import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';

import { Login }      from '../login/login';

import { Prodotti }   from '../prodotti/prodotti';
import { Ordini }     from '../ordini/ordini';
import { Categorie }  from '../categorie/categorie';
import { Magazzino }  from '../magazzino/magazzino';
import { Clienti }    from '../clienti/clienti';
import { Fornitori }  from '../fornitori/fornitori';

@Component({
  selector: 'page-homepage',
  templateUrl: 'homepage.html'
})
export class Homepage {

  userLogged: string;
  appVersion: String = ''; //basic | pro

  constructor(
    public params: NavParams,
    public navCtrl: NavController
  ) {
    this.userLogged = params.get('userLogged');

    if(localStorage.getItem('version') == 'basic') {
      this.appVersion = 'basic';
    } else if(localStorage.getItem('version') == 'pro') {
      this.appVersion = 'pro';
    } else  {
      this.appVersion = 'basic';
    }
  }

  ionViewDidLoad() {
    console.log('Hello Homepage Page');
  }

  navigate(page) {
    if(page == 'Prodotti'){
      this.navCtrl.push(Prodotti);
    } 
    else if(page == 'Ordini'){
      this.navCtrl.push(Ordini);
    } 
    else if(page == 'Categorie'){
      this.navCtrl.push(Categorie);
    } 
    else if(page == 'Magazzino'){
      this.navCtrl.push(Magazzino);
    } 
    else if(page == 'Clienti'){
      this.navCtrl.push(Clienti);
    } 
    else if(page == 'Fornitori'){
      this.navCtrl.push(Fornitori);
    }
  }

  logout() {
    console.log('logout');
    
    this.navCtrl.setRoot(Login);
  }

}