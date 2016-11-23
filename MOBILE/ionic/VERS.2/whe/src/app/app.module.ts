import { NgModule, ErrorHandler }                     from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler }   from 'ionic-angular';
import { WheApp }                                     from './app.component';

import { Login }                    from '../pages/login/login';
import { Homepage }                 from '../pages/homepage/homepage';
import { Prodotti }                 from '../pages/prodotti/prodotti';
import { ProdottoModal }            from '../pages/prodotti/prodotto-modal';
import { Ordini }                   from '../pages/ordini/ordini';
import { OrdineModal }              from '../pages/ordini/ordine-modal';
import { Clienti }                  from '../pages/clienti/clienti';
import { Fornitori }                from '../pages/fornitori/fornitori';
import { Categorie }                from '../pages/categorie/categorie';
import { Magazzino }                from '../pages/magazzino/magazzino';
import { MagazzinoModal }           from '../pages/magazzino/magazzino-modal';

import { HttpService }              from '../providers/http-service';

@NgModule({
  declarations: [
    WheApp,
    Login,
    Homepage,
    Prodotti,
    ProdottoModal,
    Ordini,
    OrdineModal,
    Clienti,
    Fornitori,
    Categorie,
    Magazzino,
    MagazzinoModal
  ],
  imports: [
    IonicModule.forRoot(WheApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    WheApp,
    Login,
    Homepage,
    Prodotti,
    ProdottoModal,
    Ordini,
    OrdineModal,
    Clienti,
    Fornitori,
    Categorie,
    Magazzino,
    MagazzinoModal
  ],
  providers: [
    {
      provide: ErrorHandler, 
      useClass: IonicErrorHandler
    },
    HttpService
  ]
})
export class AppModule {}
