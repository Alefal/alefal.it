import { Component } from '@angular/core';
import { Platform } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { LoginPage } from '../pages/login/login';
import { HomePage } from '../pages/home/home';

import { HttpService } from '../providers/http-service';

@Component({
  templateUrl: 'app.html'
})
export class EasyComandeApp {
  rootPage: any = HomePage;

  categories: any;
  products: any;

  constructor(
    platform: Platform,
    statusBar: StatusBar,
    splashScreen: SplashScreen,
    private httpService: HttpService
  ) {
    platform.ready().then(() => {
      console.log('EasyComandeApp');

      if(localStorage.getItem('categories') === null) {
        this.setDataToLocalStorage();
      } else {
        this.categories = JSON.parse(localStorage.getItem('categories'));
      }

      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      statusBar.styleDefault();
      splashScreen.hide();
    });
  }

  setDataToLocalStorage() {
    //Recupero tutte le CATEGORIE
    this.httpService.getCallHttp('getProductsCategory', '', '', 0, '')
      .subscribe(
        res => {
          console.log('res: ' + JSON.stringify(res));
          this.categories = res[0].output;
          console.log('this.categories: ' + this.categories);
          localStorage.setItem('categories', JSON.stringify(this.categories));

          //Recupero i PRODOTTI di ogni CATEGORIE
          for (let cat of this.categories) {
            this.httpService
              .getCallHttp('getProductsByCategory', '', '', '', cat.name)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));
                this.products = res[0].output;
                localStorage.setItem(cat.name, JSON.stringify(this.products));
              },
              error => {
                console.log('ERROR: ' + error);
              });
          }
        },
        error => {
          console.log('res: ' + JSON.stringify(<any>error));
        }
      );
  }
}
