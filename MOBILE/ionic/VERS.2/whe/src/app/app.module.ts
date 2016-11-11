import { NgModule }                 from '@angular/core';
import { IonicApp, IonicModule }    from 'ionic-angular';

import { WheApp }                   from './app.component';
import { Login }                    from '../pages/login/login';
import { Homepage }                 from '../pages/homepage/homepage';
import { Prodotti }                 from '../pages/prodotti/prodotti';
import { ProdottoModal }            from '../pages/prodotti/prodotto-modal';
import { Ordini }                   from '../pages/ordini/ordini';
import { Clienti }                  from '../pages/clienti/clienti';
import { Fornitori }                from '../pages/fornitori/fornitori';
import { Categorie }                from '../pages/categorie/categorie';
import { Magazzino }                from '../pages/magazzino/magazzino';

import { HttpService }              from '../providers/http-service';

@NgModule({
  declarations: [
    WheApp,
    Login,
    Homepage,
    Prodotti,
    ProdottoModal,
    Ordini,
    Clienti,
    Fornitori,
    Categorie,
    Magazzino
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
    Clienti,
    Fornitori,
    Categorie,
    Magazzino
  ],
  providers: [
    HttpService
  ]
})
export class AppModule {}
