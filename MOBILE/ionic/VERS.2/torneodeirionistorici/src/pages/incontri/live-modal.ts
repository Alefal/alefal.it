import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';

@Component({
  selector: 'page-live-modal',
  templateUrl: 'live-modal.html'
})
export class LiveModal {

  attrs: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  matchId:       number;
  homeName:     string;
  awayName:     string;
  result:       string;

  dangerousVideoUrl:  string;
  videoUrl:           SafeResourceUrl;

  constructor(
    params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    private sanitizer: DomSanitizer
  ) {
    this.homeName     = params.get('homeName');
    this.awayName     = params.get('awayName');
    this.result       = params.get('result');
    this.matchId      = params.get('matchId');

    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getIncontroAttr', '', '',this.matchId,'')
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.attrs = res[0].matchAttr;
          
          for (let attr of this.attrs) {
              console.log(attr);
              if(attr.attrName == 'YouTubeCode') {
                this.updateVideoUrl(attr.attrValue);
              }
          }
        } else {
          this.attrs = 'Nessun dato! Riprovare più tardi.';
        }

        
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });

    
    
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