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

  tipologiaTorneo: string;
  intervalId: any;

  home_team_logo: string;
  away_team_logo: string;

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
    this.tipologiaTorneo = params.get('tipologiaTorneo');
    
    this.home_team_logo   = params.get('home_team_logo');
    this.away_team_logo   = params.get('away_team_logo');

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getIncontroAttr','','',this.matchId,'',this.tipologiaTorneo)
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
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });

      this.intervalId = setInterval(() => {
        this.getTabellinoPolling(this.matchId);
      }, 10000);
    
  }

  dismiss() {
    clearInterval(this.intervalId);
    this.viewCtrl.dismiss();
  }

  updateVideoUrl(id: string) {
    this.dangerousVideoUrl = 'https://www.youtube.com/embed/' + id + '?autoplay=1&controls=1';
    this.videoUrl =
        this.sanitizer.bypassSecurityTrustResourceUrl(this.dangerousVideoUrl);
  }

  getTabellinoPolling(matchId) {
    this.httpService
      .getCallHttp('getTabellino','','',matchId,'',this.tipologiaTorneo)
      .then(res => {
        if (res[0].response[0].result == 'OK') {
          //this.match          = res[0].match;
          this.result           = res[0].match[0].home_team_score +' - '+ res[0].match[0].away_team_score;
          this.home_team_logo   = res[0].match[0].home_team_logo;
          this.away_team_logo   = res[0].match[0].away_team_logo;
        }
      })
      .catch(error => {
        console.log('ERROR: ' + error);
      });
  }

}