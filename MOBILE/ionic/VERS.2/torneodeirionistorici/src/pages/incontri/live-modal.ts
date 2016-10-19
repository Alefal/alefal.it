import { Component } from '@angular/core';
import { NavParams, ViewController } from 'ionic-angular';

import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';

@Component({
  selector: 'page-live-modal',
  templateUrl: 'live-modal.html'
})
export class LiveModal {

  homeName:     string;
  awayName:     string;
  result:       string;

  youtubeCode:        string;
  dangerousVideoUrl:  string;
  videoUrl:           SafeResourceUrl;

  constructor(
    params: NavParams,
    public viewCtrl: ViewController,
    private sanitizer: DomSanitizer
  ) {
    this.homeName     = params.get('homeName');
    this.awayName     = params.get('awayName');
    this.result       = params.get('result');
    this.youtubeCode  = params.get('youtubeCode');

    this.updateVideoUrl(this.youtubeCode);
    
  }

  dismiss() {
    this.viewCtrl.dismiss();
  }

  updateVideoUrl(id: string) {
    this.dangerousVideoUrl = 'https://www.youtube.com/embed/' + id + '?autoplay=1&controls=1';
    this.videoUrl =
        this.sanitizer.bypassSecurityTrustResourceUrl(this.dangerousVideoUrl);
  }
}