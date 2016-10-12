import { NgModule }                 from '@angular/core';
import { IonicApp, IonicModule }    from 'ionic-angular';
import { TorneoRioniStorici }       from './app.component';

import { HomePage }                 from '../pages/home/home';
import { Comunicati }               from '../pages/comunicati/comunicati';
import { ComunicatoModal }          from '../pages/comunicati/comunicato-modal';
import { RioniNews }                from '../pages/rioni-news/rioni-news';
import { Squadre }                  from '../pages/squadre/squadre';
import { Incontri }                 from '../pages/incontri/incontri';
import { Classifica }               from '../pages/classifica/classifica';
import { ClassificaDetail }         from '../pages/classifica/classifica-detail';
import { Statistiche }              from '../pages/statistiche/statistiche';

import { ConnectivityService }      from '../providers/connectivity-service';
import { DatabaseService }          from '../providers/database-service';
import { HttpService }              from '../providers/http-service';

@NgModule({
  declarations: [
    TorneoRioniStorici,
    HomePage,
    Comunicati,
    ComunicatoModal,
    RioniNews,
    Squadre,
    Incontri,
    Classifica,
    ClassificaDetail,
    Statistiche
  ],
  imports: [
    IonicModule.forRoot(TorneoRioniStorici)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    TorneoRioniStorici,
    HomePage,
    Comunicati,
    ComunicatoModal,
    RioniNews,
    Squadre,
    Incontri,
    Classifica,
    ClassificaDetail,
    Statistiche
  ],
  providers: [
    ConnectivityService,
    DatabaseService,
    HttpService
  ]
})
export class AppModule {}
