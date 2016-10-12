import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

/*
  Generated class for the Statistiche page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-statistiche',
  templateUrl: 'statistiche.html'
})
export class Statistiche {

  constructor(public navCtrl: NavController) {}

  ionViewDidLoad() {
    console.log('Hello Statistiche Page');
  }

}
