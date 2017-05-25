import { BrowserModule }    from '@angular/platform-browser';
import { NgModule }         from '@angular/core';
import { FormsModule }      from '@angular/forms';
import { HttpModule }       from '@angular/http';

import { routing }          from './app.routing';

import { AuthGuard }        from './_guards/index';
import { AlertService, AuthenticationService, HttpService } from './_services/index';

import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { LoadingBar, LoadingBarService } from "ng2-loading-bar";

import { AlertComponent }   from './_directives/index';

import { OrderByPipe }      from './_pipes/order-by-pipe';

import { AppComponent }     from './app.component';
import { LoginComponent }   from './login/login.component';
import { HomeComponent }    from './home/home.component';
import { OrderComponent }   from './order/order.component';
import { AddComponent }     from './add/add.component';
import { MenuComponent }    from './menu/menu.component';

import { ModalModule }      from 'ngx-bootstrap/modal';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    AlertComponent,
    OrderComponent,
    LoadingBar,
    AddComponent,
    MenuComponent,
    OrderByPipe
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing,
    ConfirmationPopoverModule.forRoot({
      confirmButtonType: 'danger', // set defaults here
      focusButton: 'confirm'
    }),
    ModalModule.forRoot()
  ],
  providers: [
    AuthGuard,
    AlertService,
    AuthenticationService,
    HttpService,
    LoadingBarService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
