import { NgModule }                 from '@angular/core';
import { IonicApp, IonicModule }    from 'ionic-angular';
import { TorneoRioniStorici }       from './app.component';

import { HomePage }                 from '../pages/home/home';
import { Comunicati }               from '../pages/comunicati/comunicati';
import { ComunicatoModal }          from '../pages/comunicati/comunicato-modal';
import { RioniNews }                from '../pages/rioni-news/rioni-news';
import { RioniNewsModal }           from '../pages/rioni-news/rioni-news-modal';
import { Squadre }                  from '../pages/squadre/squadre';
import { GiocatoriModal }           from '../pages/squadre/giocatori-modal';
import { Incontri }                 from '../pages/incontri/incontri';
import { TabellinoModal }           from '../pages/incontri/tabellino-modal';
import { LiveModal }                from '../pages/incontri/live-modal';
import { Classifica }               from '../pages/classifica/classifica';
import { ClassificaDetail }         from '../pages/classifica/classifica-detail';
import { Statistiche }              from '../pages/statistiche/statistiche';
import { StatisticaModal }          from '../pages/statistiche/statistica-modal';

import { ConnectivityService }      from '../providers/connectivity-service';
import { DatabaseService }          from '../providers/database-service';
import { HttpService }              from '../providers/http-service';

import { FillPipe }                 from '../pipes/fill.pipe';

@NgModule({
  declarations: [
    TorneoRioniStorici,
    HomePage,
    Comunicati,
    ComunicatoModal,
    RioniNews,
    RioniNewsModal,
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
    IonicModule.forRoot(TorneoRioniStorici)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    TorneoRioniStorici,
    HomePage,
    Comunicati,
    ComunicatoModal,
    RioniNews,
    RioniNewsModal,
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
    ConnectivityService,
    DatabaseService,
    HttpService
  ]
})
export class AppModule {}
