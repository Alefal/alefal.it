import { Component } from '@angular/core';
import { NavParams, ViewController } from 'ionic-angular';

@Component({
  selector: 'page-comunicato-modal',
  templateUrl: 'comunicato-modal.html'
})
export class ComunicatoModal {

  title: string;
  content: string;

  constructor(params: NavParams,public viewCtrl: ViewController) {
    this.title = params.get('title');
    this.content = params.get('content');
  }

  dismiss() {
    this.viewCtrl.dismiss();
  }

}
