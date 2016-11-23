import { Component } from '@angular/core';
import { NavParams, ViewController } from 'ionic-angular';

@Component({
  selector: 'page-foto-video-modal',
  templateUrl: 'foto-video-modal.html'
})
export class FotoVideoModal {

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
