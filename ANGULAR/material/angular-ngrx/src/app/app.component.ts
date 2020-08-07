import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

import { Store, select } from '@ngrx/store';
import AppState from './store/state/app.state';
import { getApiURL } from './store/selectors/app.selectors';
import { Observable } from 'rxjs';

//import { NgcCookieConsentService } from 'ngx-cookieconsent';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  getApiURL$: Observable<string>;
  
  constructor(
    private translate: TranslateService,
    private storeApp: Store<{ appState: AppState }>,
    //private ccService: NgcCookieConsentService
  ) {}
  
  ngOnInit(): void {
    // this.initializeCookieConsent();
  }
  
  // initializeCookieConsent() {
  //   // Support for translated cookies messages
  //   this.translate.addLangs(['en', 'it']);
  //   this.translate.setDefaultLang('en');
  
  //   const browserLang = this.translate.getBrowserLang();
  //   this.translate.use(browserLang.match(/en|fr/) ? browserLang : 'en');
  
  //   this.translate//
  //     .get(['cookie.header', 'cookie.message', 'cookie.dismiss', 'cookie.allow', 'cookie.deny', 'cookie.link', 'cookie.policy'])
  //     .subscribe(data => {
  //       this.ccService.getConfig().content = this.ccService.getConfig().content || {};
  //       // Override default messages with the translated ones
  //       this.ccService.getConfig().content.header = data['cookie.header'];
  //       this.ccService.getConfig().content.message = data['cookie.message'];
  //       this.ccService.getConfig().content.dismiss = data['cookie.dismiss'];
  //       this.ccService.getConfig().content.allow = data['cookie.allow'];
  //       this.ccService.getConfig().content.deny = data['cookie.deny'];
  //       this.ccService.getConfig().content.link = data['cookie.link'];
  //       this.ccService.getConfig().content.policy = data['cookie.policy'];
  
  //       this.ccService.destroy();//remove previous cookie bar (with default messages)
  //       this.ccService.init(this.ccService.getConfig()); // update config with translated messages
  //     });
  // }
}
