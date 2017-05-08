import { Component } from '@angular/core';
import { NavController, NavParams, ModalController } from 'ionic-angular';

import { LoginPage }    from '../login/login';
import { ComandePage }  from '../comande/comande';
import { MenuPage }     from '../menu/menu';
import { AddPage }      from '../add/add'

@Component({
  selector: 'page-home',
  templateUrl: 'home.html',
})
export class HomePage {

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams,
    public modalCtrl: ModalController
  ) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Home');
  }

   navigate(page) {
    if(page == 'Comande'){
      this.navCtrl.push(ComandePage);
    } 
    else if(page == 'Menu') {
      this.navCtrl.push(MenuPage);
    }
    else if(page == 'Add') {
      //this.navCtrl.push(AddPage);
      let modal = this.modalCtrl.create(AddPage);
      modal.present();
      modal.onDidDismiss(data => {});
    }
  }

  logout() {
    console.log('logout');
    
    this.navCtrl.setRoot(LoginPage);
  }

}
