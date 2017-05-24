import { BrowserModule }    from '@angular/platform-browser';
import { NgModule }         from '@angular/core';
import { FormsModule }      from '@angular/forms';
import { HttpModule }       from '@angular/http';

import { routing }          from './app.routing';

import { AuthGuard }        from './_guards/index';
import { AlertService, AuthenticationService, HttpService } from './_services/index';

import {ConfirmationPopoverModule} from 'angular-confirmation-popover';

import { AlertComponent }   from './_directives/index';

import { AppComponent }     from './app.component';
import { LoginComponent }   from './login/login.component';
import { HomeComponent }    from './home/home.component';
import { OrdineComponent } from './ordine/ordine.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    AlertComponent,
    OrdineComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing,
    ConfirmationPopoverModule.forRoot({
      confirmButtonType: 'danger', // set defaults here
      focusButton: 'confirm'
    })
  ],
  providers: [
    AuthGuard,
    AlertService,
    AuthenticationService,
    HttpService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
