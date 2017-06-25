import { NgModule, ErrorHandler }                     from '@angular/core';
import { BrowserModule }                              from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler }   from 'ionic-angular';
import { HttpModule }                                 from '@angular/http';

import { Network }              from '@ionic-native/network';
import { StatusBar }            from '@ionic-native/status-bar';
import { SplashScreen }         from '@ionic-native/splash-screen';

import { HttpService }          from '../providers/http-service';
import { ConnectivityService }  from '../providers/connectivity-service';

import { EasyComandeApp }   from './app.component';
import { TabsPage }         from '../pages/tabs/tabs';
import { LoginPage }        from '../pages/login/login';
//import { HomePage }         from '../pages/home/home';
import { ComandePage }      from '../pages/comande/comande';
import { OrdinePage }       from '../pages/comande/ordini/ordine';
import { MenuPage }         from '../pages/menu/menu';
import { AddPage }          from '../pages/add/add';

import { ProdottiModal, PopoverPage }    from '../pages/add/prodotti/prodotti-modal';

//import { AppProviders }     from './app.providers';

import { OrderByPipe }      from '../pipes/order-by-pipe';

@NgModule({
  declarations: [
    EasyComandeApp,
    TabsPage,
    LoginPage,
    //HomePage,
    ComandePage,
    MenuPage,
    AddPage,
    OrdinePage,
    ProdottiModal,
    PopoverPage,
    OrderByPipe
  ],
  imports: [
    BrowserModule,
    HttpModule,
    IonicModule.forRoot(EasyComandeApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    EasyComandeApp,
    TabsPage,
    LoginPage,
    //HomePage,
    ComandePage,
    MenuPage,
    AddPage,
    OrdinePage,
    ProdottiModal,
    PopoverPage
  ],
  providers : [
    HttpService,
    ConnectivityService,
    StatusBar,
    SplashScreen,
    Network,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
  //providers: AppProviders.getProviders()
})
export class AppModule {}