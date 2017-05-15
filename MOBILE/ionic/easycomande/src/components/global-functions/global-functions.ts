import { Component } from '@angular/core';
import { NavController, ModalController } from 'ionic-angular';

import { AddPage }          from '../../pages/add/add';
import { LoginPage }        from '../../pages/login/login';

export abstract class GlobalFunctions {

  constructor(
    public navCtrl: NavController,
    public modalCtrl: ModalController
  ) {}

  navigate(page) {
    let modal = this.modalCtrl.create(AddPage);
    modal.present();
    modal.onDidDismiss(data => {});
  }
  logout() {
    console.log('logout');
    this.navCtrl.setRoot(LoginPage);
  }

}
