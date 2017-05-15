import { NgModule, ErrorHandler }                     from '@angular/core';
import { BrowserModule }                              from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler }   from 'ionic-angular';
import { HttpModule }                                 from '@angular/http';
import { Network }                                    from '@ionic-native/network';

import { EasyComandeApp }   from './app.component';

import { HttpService }          from '../providers/http-service';
import { ConnectivityService }  from '../providers/connectivity-service';

import { TabsPage }         from '../pages/tabs/tabs';
import { LoginPage }        from '../pages/login/login';
import { HomePage }         from '../pages/home/home';
import { ComandePage }      from '../pages/comande/comande';
import { OrdinePage }       from '../pages/comande/ordini/ordine';
import { MenuPage }         from '../pages/menu/menu';
import { AddPage }          from '../pages/add/add';

import { ProdottiModal, PopoverPage }    from '../pages/add/prodotti/prodotti-modal';

import { StatusBar }        from '@ionic-native/status-bar';
import { SplashScreen }     from '@ionic-native/splash-screen';

@NgModule({
  declarations: [
    EasyComandeApp,
    LoginPage,
    TabsPage,
    HomePage,
    ComandePage,
    MenuPage,
    AddPage,
    OrdinePage,
    ProdottiModal,
    PopoverPage,
  ],
  imports: [
    BrowserModule,
    HttpModule,
    IonicModule.forRoot(EasyComandeApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    EasyComandeApp,
    LoginPage,
    TabsPage,
    HomePage,
    ComandePage,
    MenuPage,
    AddPage,
    OrdinePage,
    ProdottiModal,
    PopoverPage
  ],
  providers: [
    HttpService,
    ConnectivityService,
    StatusBar,
    SplashScreen,
    Network,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
