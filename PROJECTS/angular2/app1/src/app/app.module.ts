import { BrowserModule }                    from '@angular/platform-browser';
import { NgModule }                         from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule }                       from '@angular/http';

import { AppComponent }                     from './app.component';
import { ArticoloComponent }                from './articolo/articolo.component';
import { ArticoloFormReactiveComponent }    from './articolo-form-reactive/articolo-form-reactive.component';

import { TruncatePipe }                     from './pipes/truncate.pipe';

import { AngularFireModule }                from 'angularfire2';

// Must export the config
export const firebaseConfig = {
  apiKey: 'AIzaSyCtdCEuPNYetrB7zpKaL44dbNKv6su7R3U',
  authDomain: 'ionic2-a63e2.firebaseapp.com',
  databaseURL: 'https://ionic2-a63e2.firebaseio.com',
  storageBucket: 'ionic2-a63e2.appspot.com',
  messagingSenderId: '981915802905'
};

@NgModule({
  declarations: [
    AppComponent,
    ArticoloComponent,
    ArticoloFormReactiveComponent,
    TruncatePipe
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    ReactiveFormsModule,
    AngularFireModule.initializeApp(firebaseConfig)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
