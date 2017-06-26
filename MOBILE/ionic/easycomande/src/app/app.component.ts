import { Component } from '@angular/core';
import { Platform } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

//import { TabsPage } from '../pages/tabs/tabs';
//import { HomePage } from '../pages/home/home';
import { LoginPage } from '../pages/login/login';

import { HttpService } from '../providers/http-service';

@Component({
  templateUrl: 'app.html'
})
export class EasyComandeApp {
  rootPage: any = LoginPage;
  //rootPage:any = TabsPage;

  categories: any;
  products: any;

  labelTypeService = '';

  constructor(
    private statusBar: StatusBar,
    private _platform: Platform,
    private _splashScreen: SplashScreen,
    private httpService: HttpService
  ) {
    this._platform.ready().then(() => {
      console.log('EasyComandeApp');

      this.loadConfigurations();
    
      if(localStorage.getItem('categories') === null) {
        this.setDataToLocalStorage();
      } else {
        this.categories = JSON.parse(localStorage.getItem('categories'));
      }

      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      statusBar.styleDefault();
      //splashScreen.hide();

      setTimeout(() => {
        this._splashScreen.hide();
      }, 100);
    });
  }

  setDataToLocalStorage() {
    //Recupero tutte le CATEGORIE
    this.httpService.getCallHttp('getProductsCategory', '', '', 0, '')
      .subscribe(
        res => {
          console.log('res: ' + JSON.stringify(res));
          this.categories = res.results;
          console.log('this.categories: ' + this.categories);
          localStorage.setItem('categories', JSON.stringify(this.categories));

          //Recupero i PRODOTTI di ogni CATEGORIE
          for (let cat of this.categories) {
            this.httpService
              .getCallHttp('getProductsByCategory', '', '', '', cat.id)
              .subscribe(res => {
                console.log('res: ' + JSON.stringify(res));
                this.products = res.results;
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

  loadConfigurations() {
    this.httpService
      .getCallHttp('getConfigurations', '', '', '', '')
      .subscribe(res => {
        //console.log('res: '+JSON.stringify(res));

        localStorage.removeItem('serviceenablepercent');
        localStorage.removeItem('coveredenablevalue');
        for (let conf of res.results) {
          //console.log('%ò',conf)
          if(conf.key == 'serviceenable' && conf.enable == 1) {
            localStorage.setItem('serviceenablepercent',conf.value);
            this.labelTypeService = conf.label;
          } else if(conf.key == 'coveredenable' && conf.enable == 1) {
            localStorage.setItem('coveredenablevalue',conf.value);
            this.labelTypeService = conf.label;
          }
        }
      },
      error => {
        console.log('res: ' + JSON.stringify(<any>error));
      });
  }
}
