import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

/*
  Generated class for the Comunicati page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-comunicati',
  templateUrl: 'comunicati.html'
})
export class Comunicati {

  constructor(public navCtrl: NavController) {}

  ionViewDidLoad() {
    console.log('Hello Comunicati Page');
  }

}
