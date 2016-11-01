import { NgModule }                 from '@angular/core';
import { IonicApp, IonicModule }    from 'ionic-angular';

import { WheApp }                   from './app.component';
import { Login }                    from '../pages/login/login';

import { HttpService }              from '../providers/http-service';

@NgModule({
  declarations: [
    WheApp,
    Login
  ],
  imports: [
    IonicModule.forRoot(WheApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    WheApp,
    Login
  ],
  providers: [
    HttpService
  ]
})
export class AppModule {}
