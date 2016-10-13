import { Component } from '@angular/core';
import { NavParams, ViewController } from 'ionic-angular';

@Component({
  selector: 'page-rioni-news-modal',
  templateUrl: 'rioni-news-modal.html'
})
export class RioniNewsModal {

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
