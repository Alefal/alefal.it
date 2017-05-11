import { Component, ViewChild } from '@angular/core';
import { Nav, Platform } from 'ionic-angular';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { Login } from '../pages/login/login';


@Component({
  templateUrl: 'app.html'
})
export class WheApp {
  @ViewChild(Nav) nav: Nav;

  rootPage: any = Login;

  //MENU
  //pages: Array<{title: string, component: any}>;

  constructor(
    private statusBar: StatusBar,
    private _platform: Platform,
    private _splashScreen: SplashScreen
  ) {
    this._platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      statusBar.styleDefault();
      //splashScreen.hide();

      setTimeout(() => {
        this._splashScreen.hide();
      }, 100);
    });
  }

  openPage(page) {
    // Reset the content nav to have just this page
    // we wouldn't want the back button to show in this scenario
    this.nav.setRoot(page.component);
  }
}
