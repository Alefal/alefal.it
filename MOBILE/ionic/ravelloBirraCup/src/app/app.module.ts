import { BrowserModule }                            from '@angular/platform-browser';
import { ErrorHandler, NgModule }                   from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { HttpModule }                               from '@angular/http';

import { StatusBar }                      from '@ionic-native/status-bar';
import { SplashScreen }                   from '@ionic-native/splash-screen';
import { Facebook }                       from '@ionic-native/facebook';
import { SocialSharing }                  from '@ionic-native/social-sharing';
import { Push, PushObject, PushOptions }  from '@ionic-native/push';
import { Network }                        from '@ionic-native/network';
import { Device }                         from '@ionic-native/device';
//import { HTTP }                           from '@ionic-native/http';
import { OneSignal }                      from '@ionic-native/onesignal';

import { RavelloBirraCup }          from './app.component';
import { PostsPage }                from '../pages/posts/posts';
import { HomePage }                 from '../pages/home/home';
import { Squadre }                  from '../pages/squadre/squadre';
import { GiocatoriModal }           from '../pages/squadre/giocatori-modal';
import { Incontri }                 from '../pages/incontri/incontri';
import { TabellinoModal }           from '../pages/incontri/tabellino-modal';
import { LiveModal }                from '../pages/incontri/live-modal';
import { Classifica }               from '../pages/classifica/classifica';
import { ClassificaDetail }         from '../pages/classifica/classifica-detail';
import { Statistiche }              from '../pages/statistiche/statistiche';
import { StatisticaModal }          from '../pages/statistiche/statistica-modal';

import { FacebookProvider }         from '../providers/facebook/facebook';
import { ConnectivityService }      from '../providers/connectivity-service';
import { HttpService }              from '../providers/http-service';

import { FillPipe }                 from '../pipes/fill.pipe';

@NgModule({
  declarations: [
    RavelloBirraCup,
    PostsPage,
    HomePage,
    Squadre,
    GiocatoriModal,
    Incontri,
    TabellinoModal,
    LiveModal,
    Classifica,
    ClassificaDetail,
    Statistiche,
    StatisticaModal,
    FillPipe //pipe
  ],
  imports: [
    BrowserModule,
    HttpModule,
    IonicModule.forRoot(RavelloBirraCup),
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    RavelloBirraCup,
    PostsPage,
    HomePage,
    Squadre,
    GiocatoriModal,
    Incontri,
    TabellinoModal,
    LiveModal,
    Classifica,
    ClassificaDetail,
    Statistiche,
    StatisticaModal
  ],
  providers: [
    StatusBar,
    SplashScreen,
    Facebook,
    SocialSharing,
    Push,
    Network,
    Device,
    OneSignal,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    FacebookProvider,
    ConnectivityService,
    HttpService
  ]
})
export class AppModule {}
