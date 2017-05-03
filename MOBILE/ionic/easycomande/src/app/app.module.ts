import { NgModule, ErrorHandler }                     from '@angular/core';
import { BrowserModule }                              from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler }   from 'ionic-angular';
import { HttpModule }                                 from '@angular/http';

import { EasyComandeApp }   from './app.component';
import { HttpService }      from '../providers/http-service';

import { LoginPage }        from '../pages/login/login';
import { HomePage }         from '../pages/home/home';
import { ComandePage }      from '../pages/comande/comande';
import { MenuPage }         from '../pages/menu/menu';
import { AddPage }          from '../pages/add/add';

import { OrdineModal }      from '../pages/comande/ordini/ordine-modal';
import { ProdottiModal }    from '../pages/add/prodotti/prodotti-modal';

import { StatusBar }        from '@ionic-native/status-bar';
import { SplashScreen }     from '@ionic-native/splash-screen';

@NgModule({
  declarations: [
    EasyComandeApp,
    LoginPage,
    HomePage,
    ComandePage,
    MenuPage,
    AddPage,
    OrdineModal,
    ProdottiModal
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
    HomePage,
    ComandePage,
    MenuPage,
    AddPage,
    OrdineModal,
    ProdottiModal
  ],
  providers: [
    HttpService,
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
