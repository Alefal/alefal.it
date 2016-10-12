import { NgModule }                 from '@angular/core';
import { IonicApp, IonicModule }    from 'ionic-angular';
import { TorneoRioniStorici }       from './app.component';

import { HomePage }                 from '../pages/home/home';
import { Classifica }               from '../pages/classifica/classifica';
import { ClassificaDetail }         from '../pages/classifica/classificaDetail';
import { Comunicati }               from '../pages/comunicati/comunicati';
import { Giornalino }               from '../pages/giornalino/giornalino';
import { Incontri }                 from '../pages/incontri/incontri';
import { Statistiche }              from '../pages/statistiche/statistiche';

import { ConnectivityService }      from '../providers/connectivity-service';
import { DatabaseService }          from '../providers/database-service';
import { HttpService }              from '../providers/http-service';

@NgModule({
  declarations: [
    TorneoRioniStorici,
    HomePage,
    Classifica,
    ClassificaDetail,
    Comunicati,
    Giornalino,
    Incontri,
    Statistiche
  ],
  imports: [
    IonicModule.forRoot(TorneoRioniStorici)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    TorneoRioniStorici,
    HomePage,
    Classifica,
    ClassificaDetail,
    Comunicati,
    Giornalino,
    Incontri,
    Statistiche
  ],
  providers: [
    ConnectivityService,
    DatabaseService,
    HttpService
  ]
})
export class AppModule {}
