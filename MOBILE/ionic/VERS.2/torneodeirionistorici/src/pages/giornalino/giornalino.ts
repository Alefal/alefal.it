import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

/*
  Generated class for the Giornalino page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-giornalino',
  templateUrl: 'giornalino.html'
})
export class Giornalino {

  constructor(public navCtrl: NavController) {}

  ionViewDidLoad() {
    console.log('Hello Giornalino Page');
  }

}
